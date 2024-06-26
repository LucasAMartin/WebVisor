<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/select2/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js" type=""></script>
    <script src="https://cdn.jsdelivr.net/npm/select2/dist/js/select2.min.js" type=""></script>
    <?php

    include_once("_html.php");
    include_once("_sql.php");
    global $YES;

    $user_info = get_user_info();

    if (!$user_info) {
        echo("<meta http-equiv='refresh' content='0; url=settings.php' />\n");
        echo("</head>\n");
        echo("</html>\n");
        die();
    }

    // Fetch the data
    $requirements = get_gen_ed_data();
    $user_id = $user_info['id'];
    $superuser = is_superuser($user_info);


    $program_id = extract_int($_POST, 'program_id', $user_info['program_id']);

    //! HANDLE SUBMIT ACTIONS

    //!- Add Student
    if (isset($_POST['add_student'])) {
        if ($superuser) {
            $cwu_id = extract_string($_POST, 'add_cwu_id');
            $email = extract_email($_POST, 'add_email');
            $first_name = extract_string($_POST, 'add_first');
            $last_name = extract_string($_POST, 'add_last');
            $student_id = add_student($user_id, $cwu_id, $email, $first_name, $last_name);
        } else {
            add_message("You do not have permission to add students.");
        }
    } else {
        $student_id = extract_int($_POST, 'student_id');
        if ($student_id == 0 && isset($_GET['id'])) {
            $student_id = cwu_id_to_student_id(extract_int($_GET, 'id'));
        }
    }

    $can_edit = ($superuser || user_can_update_student($user_id, $student_id));

    if ($student_id != 0 && !$can_edit) {
        add_message("You are not this student's advisor, nor are you a superuser. As a result, your changes will not be saved for this student.");
    }

    //!- Update Info
    if (isset($_POST['update_student']) && $can_edit) {
        $first = extract_string($_POST, 'update_first');
        $last = extract_string($_POST, 'update_last');
        $cwu_id = extract_int($_POST, 'update_cwu_id');
        $email = extract_email($_POST, 'update_email');
        $phone = extract_string($_POST, 'update_phone');
        $address = extract_string($_POST, 'update_address');

        $postbaccalaureate = extract_yesno($_POST, 'update_postbaccalaureate');
        $withdrawing = extract_yesno($_POST, 'update_withdrawing');
        $veterans_benefits = extract_yesno($_POST, 'update_veterans_benefits');
        $international_student = extract_yesno($_POST, 'update_international_student');
        $transfer_student = extract_yesno($_POST, 'update_transfer_student');

        $active = extract_yesno($_POST, 'update_active');

        update_student($user_id, $student_id, $first, $last, $cwu_id, $email, $phone, $address, $postbaccalaureate, $withdrawing, $veterans_benefits, $active, $international_student, $transfer_student);
    }

    //!- Update Program Info
    if (isset($_POST['update_program']) && is_superuser($user_info)) {
        $remove_program_ids = extract_ids('remove-program', $_POST);
        $confirm_remove_program_ids = extract_ids('remove-confirm-program', $_POST);
        $remove_program_ids = array_intersect($remove_program_ids, $confirm_remove_program_ids);
        $add_program_ids = extract_ids("add-program", $_POST);
        $add_program_id = 0; // Set a default value for $add_program_id
        // Check if $add_program_ids is not empty before accessing its elements
        if (!empty($add_program_ids)) {
            $add_program_id = $add_program_ids[0];
        }
        $add_advisor_id = extract_int($_POST, "add-advisor");
        $non_stem_majors = extract_string($_POST, "non-stem-programs");
        $advisor_list = extract_id_values('advisor-program', $_POST);
        foreach ($advisor_list as $program_update_program_id => $program_update_advisor_id) {
            update_student_advisor($user_id, $student_id, $program_update_program_id, $program_update_advisor_id);
        }
        update_student_programs($user_id, $student_id, $remove_program_ids, $add_program_id, $add_advisor_id, $non_stem_majors);
    }

    //!- Fill in with template
    if (isset($_POST['fill_template']) && $can_edit) {
        $template_id = $_POST['template_id'];
        $template_year = $_POST['template_year'];
        fill_template($user_id, $student_id, $template_id, $template_year);
    }

    //!- Update Plan
    if (isset($_POST['update_plan']) && $can_edit) {
        $classes = array();
        foreach ($_POST as $key => $value) {
            //slot-$slot_name
            //slot-20232-4
            $matches = array();
            if (preg_match('/slot-([0-9][0-9][0-9][0-9][0-9])-([0-9])/', $key, $matches)) {
                $class_id_pull = get_class_id($value);
                $class_id = 0;
                if (!is_null($class_id_pull)) {
                    $class_id = $class_id_pull['id'];
                }

                if ($class_id == 0) {
                    continue;
                }
                if ($class_id == 1) {
                    $new_name = $_POST['new_name'];
                    $new_credits = $_POST['new_credits'];
                    $class_id = add_class($user_id, $new_name, $new_credits);
                }

                $term = $matches[1];
                $slot = $matches[2];
                $elective = array_key_exists("elective-$term-$slot", $_POST);
                if (!isset($classes[$class_id])) {
                    $classes[$class_id] = array();
                }
                $classes[$class_id][] = array($term, $slot, $elective);
            }
        }

        update_plan($user_id, $student_id, $program_id, $classes);
    }

    //!- Clear Plan
    if (isset($_POST['nuke_plan']) && isset($_POST['launch_code']) && $can_edit) {
        clear_plan($user_id, $student_id);
    }

    //!- Update Checklist
    if (isset($_POST['update_checklist']) && $can_edit) {
        $checklist_ids = extract_ids('checklist', $_POST);
        update_checklist($user_id, $student_id, $program_id, $checklist_ids);
    }

    //!- Add Note
    if (isset($_POST['add_note']) && $can_edit) {
        $note = extract_string($_POST, 'note', '');
        $flagged = array_key_exists('flagged_note', $_POST);
        add_note($user_id, $student_id, $note, $flagged);
    }

    //!- Update Notes
    if (isset($_POST['update_notes']) && $can_edit) {
        $flagged_ids = extract_ids('flag', $_POST);
        update_notes($student_id, $flagged_ids);
    }

    //!- Update Requirements
    if (isset($_POST['update_requirements']) && $can_edit) {
        $requirements_taken = extract_ids('taken', $_POST);
        update_requirements($student_id, $requirements_taken);
    }

    if (isset($_POST['update_student_gen_ed']) && $can_edit) {
        $student_id = isset($_POST['student_id']) ? $_POST['student_id'] : 0; // Default value if not provided
        // Iterate through each requirement to extract the selected names
        foreach ($requirements as $requirement => $names) {
            $selected_name = isset($_POST[$requirement]) ? $_POST[$requirement] : ''; // Get the selected name for this requirement
            // Call the function to update student gen eds
            update_student_gen_ed($user_id, $student_id, $requirement, $selected_name);
        }
    }
    
    

    //! LOAD DATA
    $all_programs_blank = array('0' => '') + all_programs($user_id);

    $all_students_blank = array('0' => '');
    $inactiveStudents = isset($_POST['inactive_students']);
    if (!$inactiveStudents) {
        if ($user_id != 0) {
            $students_for_user = students_for_user($user_id);
            if (count($students_for_user) > 0) {
                $all_students_blank = $all_students_blank + array('00' => '');
                $all_students_blank = $all_students_blank + array('000' => '==YOUR ADVISEES==');
                $all_students_blank = $all_students_blank + $students_for_user;
            }
        }
        if ($program_id != 0) {
            $students_in_program = array();
            // $students_in_program = students_in_program($program_id);
            // echo("Students in program: $program_id");
            // print_r($students_in_program);
            if (count($students_in_program) > 0) {
                $all_students_blank = $all_students_blank + array('0000' => '');
                $all_students_blank = $all_students_blank + array('00000' => '==PROGRAM STUDENTS==');
                // we get here
                $all_students_blank = $all_students_blank + $students_in_program;
                // but we do not get here
            }
        }
        

        $all_students_blank = $all_students_blank + array('000000' => '');
        $all_students_blank = $all_students_blank + array('0000000' => '==OTHER STUDENTS==');
        $all_students_blank = $all_students_blank + all_students();
    } else {
        $all_students_blank = $all_students_blank + all_students(true);
    }

    $all_years = all_years();
    $all_years_blank = array('0' => '') + $all_years;
    $name = '';
    if ($student_id != 0) {
        $student_info = get_student_info($student_id);
        $cwu_id = $student_info['cwu_id'];
        $email = $student_info['email'];
        $name = $student_info['name'];
        $first = $student_info['first'];
        $last = $student_info['last'];
        $active = $student_info['active'];
        $phone = $student_info['phone'];
        $address = $student_info['address'];
        $total_credits = get_total_credits($student_id);

        $postbaccalaureate = $student_info['postbaccalaureate'];
        $withdrawing = $student_info['withdrawing'];
        $veterans_benefits = $student_info['veterans_benefits'];
        $transfer_student = $student_info['transfer_student'];
        $international_student = $student_info['international_student'];

        $non_stem_majors = $student_info['non_stem_majors'];

        $start_year = $end_year = date('Y');
        if (date('m') < 6) {
            --$start_year;
        } else {
            ++$end_year;
        }
        $start_year = extract_int($_POST, 'start_year', $start_year);
        $end_year = max($start_year + 1, extract_int($_POST, 'end_year', $end_year));

        $plan = get_plan($student_id, $start_year, $end_year);
        $classes = $plan['by term'];
        $class_ids = $plan['by id'];

        $notes = get_notes($student_id);

        $programs = programs_with_student($student_id);
        if ($program_id != 0) {
            $student_advisor = get_student_program_advisor($student_id, $program_id);
            if ($student_advisor) {
                $advisor_id = $student_advisor['id'];
                $advisor_name = $student_advisor['name'];
            }

            $electives_credits = get_electives_credits($student_id, $program_id);
            $electives = $electives_credits['electives'];
            $elective_credits = $electives_credits['credits'];
//			print_array($elective_credits);

            $program_info = get_program_info($program_id);
            $program_name = $program_info['name'];
            $program_elective_credits = $program_info['elective_credits'];

            $all_templates = array('0' => '') + get_named_templates($program_id);

            $required_classes = get_required_classes($program_id);
            $replacement_classes = get_replacement_classes($program_id);

            $checklist_items = get_checklist($program_id);
            $checked_items = get_checked_items($student_id, $program_id);

            /*
                        if ($student_id != 0 && !$can_edit)
                        {
                            echo("<meta http-equiv='refresh' content='0; url=student-print.php?cwu_id=$cwu_id&amp;program_id=$program_id' />\n");
                            echo("</head>\n");
                            echo("</html>\n");
                            die();
                        }
            */
        }

        $all_classes = array('0' => '', '1' => 'NEW') + all_classes($program_id);
        $all_users = array('0' => '') + all_users();

    }

    function prerequisites_scheduled_before_term($classes_by_term, $class_id_to_check, $year_of_class, $term_of_class, $all_classes): array
    {
        $prerequisites = get_prereqs($class_id_to_check);
        $missing_prereqs = [];

        // Iterate over each prerequisite to check if it was taken before the class term
        foreach ($prerequisites as $prereq) {
            $prereq_met = false;

            // Iterate through each year and term up to the year and term of the class
            foreach ($classes_by_term as $year => $terms) {
                // If we've reached the year of the class, only iterate up to the term before the class's term
                $last_term = $year == $year_of_class ? $term_of_class - 1 : 4;

                for ($term = 0; $term <= $last_term; ++$term) {
                    if (isset($terms[$term])) {
                        foreach ($terms[$term] as $class) {
                            if ($class['class_id'] == $prereq['prerequisite_id']) {
                                $prereq_met = true;
                                break 3; // Exit both loops
                            }
                        }
                    }
                }

                // Stop iterating through years once we reach the year of the class
                if ($year == $year_of_class) {
                    break;
                }
            }

            // If prerequisite was not met, add it to the missing prerequisites array
            if (!$prereq_met) {
                $missing_prereqs[] = $all_classes[$prereq['prerequisite_id']];
            }
        }

        // If there are missing prerequisites, return false and the list of missing prerequisites
        if (!empty($missing_prereqs)) {
            return [false, $missing_prereqs];
        }

        // All prerequisites met
        return [true, $missing_prereqs];
    }


    ?>
    <title>Student Plan<?php if ($name != '') echo(" - $name"); ?></title>
    <link rel="stylesheet" type="text/css" href="styles/test.css">
    <link rel="stylesheet" type="text/css" href="styles/navbar.css">
</head>

<body>
<?php echo(linkmenu('Student Information')); ?>
<?php echo(messages()); ?>


<div class="content_container">

    <?php
    if ($student_id == 0) {
    ?>
    <h1 class="hidden">SpacerSpacerSpacerSpacer</h1>
    <h1 class="hidden">SpacerSpacerSpacerSpacer</h1>
    <form action='student.php#message_end' method='post' id='select_student' class="long">
        <?php
        } else {
        ?>
        <form action='student.php#message_end' method='post' id='select_student'><?php
            }
            ?>

            <h2>Student Plan</h2>

            <table class='input'>
                <tr>
                    <td>Student:</td>
                    <td>
                        <select id="student_id" name="student_id" class="select2-student">
                            <option value=""></option>

                            <?php foreach ($all_students_blank as $value => $label): ?>
                                <option value="<?php echo htmlspecialchars($value); ?>">
                                    <?php echo htmlspecialchars($label); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </td>
                    <td>Inactive Students:</td>
                    <?php
                    if ($student_id != 0) {
                        ?>
                        <td>
                            <p>
                                <input type="button" value="Download Student Plan"
                                       onclick="window.location.href='student-print.php?cwu_id=<?php echo $cwu_id; ?>&program_id=<?php echo $program_id; ?>&pdf=1';">
                            </p>
                        </td>

                        <?php
                    }
                    ?>

                    <?php
                    if ($student_id == 0) {
                        ?>
                        <td class='spacer'/>
                        <td>New Student First Name:</td>
                        <td><input type='text' class='nameid' name='add_first' value='' tabindex='3'/></td>
                        <?php
                    }
                    ?>
                </tr>
                <tr>
                    <td>Program:</td>
                    <td>
                        <?php
                        echo(array_menu("\t\t\t\t", $all_programs_blank, 'program_id', $program_id, true, '2'));
                        ?>
                    </td>
                    <td><?php echo(checkbox('', 'inactive_students', $inactiveStudents)); ?></td>
                    <?php
                    if ($student_id == 0) {
                        ?>
                        <td class='spacer'/>
                        <td>New Student Last Name:</td>
                        <td><input type='text' class='nameid' name='add_last' value='' tabindex='4'/></td>
                        <?php
                    }
                    ?>
                    <?php
                    if ($student_id != 0) {
                        ?>
                        <td><input type='submit' name='Load'/></td>
                        <?php
                    }
                    ?>
                </tr>
                <tr>
                    <td/>
                    <?php
                    if ($student_id == 0) {
                        ?>
                        <td><input type='submit' name='Load'/></td>
                        <?php
                    }
                    ?>
                    <td/>
                    <?php
                    if ($student_id == 0) {
                        ?>
                        <td class='spacer'/>
                        <td>New Student CWU ID:</td>
                        <td><input type='text' class='nameid' name='add_cwu_id' tabindex='5'/></td>
                        <?php
                    }
                    ?>
                </tr>
                <?php
                if ($student_id == 0) {
                    ?>
                    <tr>
                        <td colspan='4' class='spacer'/>
                        <td>New Student Email:</td>
                        <td><input type='text' class='nameid' name='add_email' value='' tabindex='6'/> @ cwu.edu</td>
                    </tr>
                    <tr>
                        <td colspan='4' class='spacer'/>
                        <td/>
                        <td><input type='submit' name='add_student' value='Add New Student'/></td>
                    </tr>
                    <?php
                }
                ?>
            </table>
        </form>

        <?php
        if ($student_id != 0) {
            ?>
            <form action='student.php#student_programs' method='post' id='student_programs'>
                <input type='hidden' name='student_id' value='<?php echo($student_id); ?>'/>
                <input type='hidden' name='program_id' value='<?php echo($program_id); ?>'/>


                <h2>Student Programs</h2>

                <table class='input'>
                    <tr class='header'>
                        <td>Program</td>
                        <td>Advisor</td>
                        <td style='text-align:center;'>Remove</td>
                        <td style='text-align:center;'>Confirm Removal</td>
                    </tr>
                    <?php
                    foreach ($programs as $program_data) {
                        ?>
                        <tr>
                            <td><?php echo($program_data['program_name']); ?></td>
                            <td>
                                <?php echo(array_menu("\t\t\t\t", $all_users, "advisor-program-" . $program_data['program_id'], $program_data['advisor_id'], false)); ?>
                            </td>
                            <td style='text-align:center;'>
                                <?php echo(checkbox("", 'remove-program-' . $program_data['program_id'], false)); ?>
                            </td>
                            <td style='text-align:center;'>
                                <?php echo(checkbox("", 'remove-confirm-program-' . $program_data['program_id'], false)); ?>
                            </td>
                        </tr>
                        <?php
                    }
                    ?>
                    <tr class='header'>
                        <td>Non-STEM Majors</td>
                        <td colspan='3'><input type='text' name='non-stem-programs' size='50'
                                               value='<?php echo($non_stem_majors); ?>'/></td>

                    </tr>
                    <?php
                    if (!array_key_exists($program_id, $programs)) {
                        ?>
                        <tr class='header'>
                            <td>Add Program</td>
                            <td/>
                            <td>Confirm</td>
                            <td/>
                        </tr>
                        <tr>
                            <td>
                                <?php echo($program_name); ?>
                            </td>
                            <td>
                                <?php echo(array_menu("\t\t\t\t", $all_users, "add-advisor", $user_id, false)); ?>
                            </td>
                            <td style='text-align:center;'>
                                <?php echo(checkbox("", "add-program-$program_id", false)); ?>
                            </td>
                            <td>
                        </tr>
                        <?php
                    }
                    ?>
                    <tr>
                        <td/>
                        <td colspan='3'><input type='submit' name='update_program' value='Update Program Information'>
                        </td>
                    </tr>
                </table>

            </form>
            <?php
        }
        ?>

        <?php
        if ($student_id != 0) {
        ?>
        <form action='student.php#student_information' method='post' id='student_information'>
            <input type='hidden' name='student_id' value='<?php echo($student_id); ?>'/>
            <input type='hidden' name='program_id' value='<?php echo($program_id); ?>'/>

            <h2>Student Information</h2>

            <table class='input'>
                <tr></tr>
                <tr>
                    <td>First:</td>
                    <td><input type='text' class='nameid' name='update_first' value='<?php echo($first); ?>'/></td>
                    <td/>
                    <td>Postbaccalaureate:</td>
                    <td><?php echo(checkbox('', 'update_postbaccalaureate', $postbaccalaureate == $YES)); ?></td>
                </tr>
                <tr>
                    <td>Last:</td>
                    <td><input type='text' class='nameid' name='update_last' value='<?php echo($last); ?>'/></td>
                    <td/>
                    <td>Withdrawing<br/>from another major:</td>
                    <td><?php echo(checkbox('', 'update_withdrawing', $withdrawing == $YES)); ?></td>
                </tr>
                <tr>
                    <td>CWU ID:</td>
                    <td><input type='text' class='nameid' name='update_cwu_id' value='<?php echo($cwu_id); ?>'/>
                    </td>
                    <td/>
                    <td>Veteran's Benefits:</td>
                    <td><?php echo(checkbox('', 'update_veterans_benefits', $veterans_benefits == $YES)); ?></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type='text' class='email' name='update_email' value='<?php echo($email); ?>'/>@cwu.edu
                    </td>
                    <td/>
                    <td>Active:</td>
                    <td><?php echo(checkbox('', 'update_active', $active == $YES)); ?></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type='text' class='phone' name='update_phone' value='<?php echo($phone); ?>'/></td>
                    <td/>
                    <td>International Student:</td>
                    <td><?php echo(checkbox('', 'update_international_student', $international_student == $YES)); ?></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td rowspan='4'><textarea class='address' rows='5'
                                              name='update_address'><?php echo($address); ?></textarea></td>
                    <td/>
                    <td>Transfer Student:</td>
                    <td><?php echo(checkbox('', 'update_transfer_student', $transfer_student == $YES)); ?></td>
                </tr>
                <tr>
                    <td colspan='5'/>
                </tr>
                <tr>
                    <td colspan='5'/>
                </tr>
                <tr>
                    <td colspan='5'/>
                </tr>
                <tr>
                    <td/>
                    <td><input type='submit' name='update_student' value='Update Student Info'/></td>
                    <td colspan='3'/>
                </tr>
            </table>

        </form>
        <?php
        }
        ?>

        <?php
        if ($student_id != 0) {
        ?>
        <form action='student.php#program_requirements' method='post' id='program_requirements'>
            <input type='hidden' name='student_id' value='<?php echo($student_id); ?>'/>
            <input type='hidden' name='program_id' value='<?php echo($program_id); ?>'/>

            <h2>Program Requirements
            </h2>

            <?php
            if ($program_id == 0) {
                ?>
                <table class='input'>
                    <tr>
                        <td>You must select a program from the top of the page to check graduation requirements.
                        </td>
                    </tr>
                </table>
                <?php
            } else {
                ?>
                <?php #print_array($electives);
                ?>
                <table class='input'>
                    <tr class='header'>
                        <td colspan='3'>Core Courses - <?php echo($total_credits)?> of 180 total credits</td>
                        <td class='spacer'/>
                        <td>Electives</td>
                    </tr>
                    <?php
                    $row = 0;
                    $col = 0;
                    ?>
                    <tr>
                        <?php
                        $elective_names = array();

                        foreach ($required_classes

                        as $required_id => $info)
                        {
                        $required_name = $info['name_credits'];
                        $class = '';
                        $title = '';
                        $checkbox = '';
                        if (array_key_exists($required_id, $class_ids)) {
                            // if term is 000, then give a checkbox to "untake" it
                            if ($class_ids[$required_id] == '000') {
                                $checkbox = "<input type='checkbox' name='taken-$required_id' checked='checked' /> ";
                            }
                        } else {
                            $satisfied = false;
                            // try to find it in replacements
                            if (isset($replacement_classes[$required_id]) && array_key_exists('replacements', $replacement_classes[$required_id])) {
                                $replacement_ids = $replacement_classes[$required_id]['replacements'];
                            } else {
                                $replacement_ids = array();
                            }

                            foreach ($replacement_ids as $replacement_info) {
                                $replacement_id = $replacement_info['id'];
                                $replacement_name = $replacement_info['name'];
                                $replacement_note = $replacement_info['note'];
                                if (array_key_exists($replacement_id, $class_ids)) {
                                    if ($replacement_note != '') {
                                        $class = " class='replaced'"; //! @todo POSSIBLY FLAG WITH DIFFERENT CLASS
                                        $title = " title='Replaced by $replacement_name. NOTE: $replacement_note'";
                                    } else {
                                        $class = " class='replaced'";
                                        $title = " title='Replaced by $replacement_name.'";
                                    }
                                    $satisfied = true;
                                }
                            }

                            if (!$satisfied) {
                                $class = " class='flagged'";
                                $checkbox = "<input type='checkbox' name='taken-$required_id' /> ";
                            }
                        }
                        ?>
                        <td<?php echo($class . $title); ?>>
                            <?php echo($checkbox); ?><?php echo($required_name); ?>
                        </td>
                        <?php
                        ++$col;

                        if ($col == 3)
                        {
                        ?>
                        <td class='spacer'/>
                        <?php
                        if ($row == 0) {
                            if ($elective_credits == '') {
                                $elective_credits = 0;
                            } // if ($elective_credits == '')
                            //! @todo should order electives by name or date
                            foreach ($electives as $elective_data) {
                                // fixed bug where unchecking class as elective on student information doesn't reflect change in electives section
                                if (array_key_exists($elective_data['class_id'], $required_classes)) {
                                    if ($elective_credits > 0) {
                                        $elective_credits -= $elective_data['credits'];
                                    }
                                    continue;
                                }
                                $elective_names[] = $elective_data['name'];
                            }
                            $class = "";
                            if ($elective_credits < $program_elective_credits) {
                                $class = " class='flagged'";
                            } // if ($elective_credits < $program_elective_credits)
                            ?>
                            <td<?php echo($class); ?>>
                                <?php echo($elective_credits) ?> of <?php echo($program_elective_credits); ?>credits
                            </td>
                            <?php
                        } else if ($row < count($elective_names) + 1) {
                            ?>
                            <td class='elective'><?php echo($elective_names[$row - 1]); ?></td>
                            <?php
                        }
                        ?>
                    </tr>
                    <tr>
                        <?php
                        ++$row;
                        $col = 0;
                        }
                        }
                        for ($i = $col; $i < 3; ++$i) {
                            ?>
                            <td/>
                            <?php
                        }
                        if ($row < count($elective_names) + 1) {
                            ?>
                            <td class='spacer'/>
                            <td class='elective'><?php if (!empty($elective_names)) {
                                    echo($elective_names[$row - 1]);
                                } ?></td>
                            <?php
                            ++$row;
                            $col = 1;
                        }
                        ?>
                    </tr>
                    <?php
                    while ($row < count($electives) + 1) {
                        ?>
                        <tr>
                            <td/>
                            <td/>
                            <td/>
                            <td class='spacer'/>
                            <td class='elective'><?php if (!empty($elective_names)) {
                                    echo($elective_names[$row - 1]);
                                    $row++;
                                } ?></td>
                        </tr>
                        <?php
                    }
                    ?>
                    <tr>
                        <td><input type='submit' name='update_requirements' value='Update Core'></td>
                        <td/>
                        <td/>
                        <td class='spacer'/>
                    </tr>
                </table>

                <h2>Program Checklist</h2>

                <table class='input'>
                    <?php
                    foreach ($checklist_items as $id => $checklist_item) {
                        $checklist_id = $checklist_item['id'];
                        $checklist_name = $checklist_item['name'];
                        $checked = in_array($checklist_id, $checked_items);
                        ?>
                        <tr>
                            <td><?php echo(checkbox("", "checklist-$checklist_id", $checked)); ?></td>
                            <td><?php echo($checklist_name); ?></td>
                        </tr>
                        <?php
                    }
                    ?>
                    <tr>
                        <td/>
                        <td>
                            <input type='submit' name='update_checklist' value='Update Checklist'/>
                        </td>
                    </tr>
                </table>

                <?php
            } // else ($program_id != 0)
            ?>

        </form>
        <?php
        }
        ?>

        <?php
        if ($student_id != 0) {
            ?>
            <form action='student.php#student_plan' method='post' id='student_plan'>
                <input type='hidden' name='student_id' value='<?php echo($student_id); ?>'/>
                <input type='hidden' name='program_id' value='<?php echo($program_id); ?>'/>

                <table class='schedule'>
                    <tr class='header'>
                        <td>
                            <h2>Student Plan</h2>
                        </td>

                        <td colspan='4'>
                            Fill Template
                            <?php echo(array_menu("\t\t\t\t", $all_templates, 'template_id', 0, false)); ?>
                            starting Fall
                            <?php echo(array_menu("\t\t\t\t", all_years(), 'template_year', $start_year, false)); ?>
                            <input type='submit' name='fill_template' value='Fill Classes'>

                        </td>

                    </tr>

                    <tr class='header'>
                        <td colspan='2'>
                            Fall
                            <?php echo(array_menu("\t\t\t\t", $all_years, 'start_year', $start_year, true)); ?>
                            &ndash;
                            Summer
                            <?php echo(array_menu("\t\t\t\t", $all_years, 'end_year', $end_year, true)); ?>
                        </td>
                        <td colspan='2'/>
                    </tr>
                    <?php
                    foreach ($classes as $year => $terms) {
                        if ($year == 0) {
                            continue;
                        }
                        $next_year = $year + 1;

                        for ($term_number = 1; $term_number < 5; ++$term_number) {
                            // Determine the term name based on the term_number
                            $term_name = match ($term_number) {
                                1 => 'fall',
                                2 => 'winter',
                                3 => 'spring',
                                4 => 'summer',
                                default => '',
                            };
                            $term_classes = $terms[$term_number];
                            $slots = max(count($term_classes) + 1, 6);

                            echo "<td valign='top'>";
                            /*
                                echo "<pre>";
                                print_r($classes);
                                print_r($terms);
                                print_r($term_classes);
                                echo "</pre>";
                            */

                            $term_credits = 0;
                            for ($j = 0; $j < $slots; ++$j) {
                                if (isset($term_classes[$j]) && array_key_exists('class_id', $term_classes[$j])) {
                                    $class_id = $term_classes[$j]['class_id'];
                                    $student_class_id = $term_classes[$j]['student_class_id'];
                                } else {
                                    $class_id = 0;
                                    $student_class_id = 0;
                                }
                                ?>
                                <tr class='header'>
                                    <td>Fall <?php echo($year); ?></td>
                                    <td>Winter <?php echo($next_year); ?></td>
                                    <td>Spring <?php echo($next_year); ?></td>
                                    <td>Summer <?php echo($next_year); ?></td>
                                </tr>
                                <tr>
                                    <?php

                                    for ($term_number = 1; $term_number < 5; ++$term_number) {
                                        if ($term_number == 1) {
                                            $term_name = 'fall';
                                        } else if ($term_number == 2) {
                                            $term_name = 'winter';
                                        } else if ($term_number == 3) {
                                            $term_name = 'spring';
                                        } else if ($term_number == 4) {
                                            $term_name = 'summer';
                                        }
                                        $term_classes = $terms[$term_number];
                                        $slots = max(count($term_classes) + 1, 6);
                                        ?>
                                        <td valign='top'>
                                            <?php
                                            /*
                                                echo "<pre>";
                                                print_r($classes);
                                                print_r($terms);
                                                print_r($term_classes);
                                                echo "</pre>";
                                            */
                                            $term_credits = 0;
                                            for ($j = 0; $j < $slots; ++$j) {
                                                if (isset($term_classes[$j]) && array_key_exists('class_id', $term_classes[$j])) {
                                                    $class_id = $term_classes[$j]['class_id'];
                                                    $student_class_id = $term_classes[$j]['student_class_id'];
                                                } else {
                                                    $class_id = 0;
                                                    $student_class_id = 0;
                                                }

                                                $class_info = get_class_info($class_id);
                                                $style = "";
                                                $title = "";
                                                if ($class_info !== null) {
                                                    //Check for Prereqs
                                                    [$prereqs_met, $missing_prereqs] = prerequisites_scheduled_before_term(/*$classes_by_term*/ $plan['by term'], $class_id, $year, $term_number, $all_classes);
                                                    if (!$prereqs_met) {
                                                        $missing_prereqs_list = implode(', ', $missing_prereqs); // Convert missing prereqs to a comma-separated list
                                                        $style = " class='prereq-error'";
                                                        $title = " title='Missing prerequisites: $missing_prereqs_list'";
                                                        $errors[] = [
                                                            'message' => "Missing prerequisites: <strong>$missing_prereqs_list</strong> for <strong>$all_classes[$class_id]</strong>",
                                                            'type' => 'missing-prereq'
                                                        ];

                                                    } elseif ($class_id != 0 && $class_info[$term_name] != $YES) {
                                                        $style = " class='error'";
                                                        $title = " title='Class not offered this term.'";
                                                        // When you detect a class not offered error
                                                        $errors[] = [
                                                            'message' => " <strong>$all_classes[$class_id]</strong> not offered in <strong>$term_name</strong>",
                                                            'type' => 'class-not-offered'
                                                        ];

                                                    } else {
                                                        $style = "";
                                                        $title = "";
                                                    }
                                                    $term_credits += $class_info['credits'];
                                                    $is_elective = $class_id != 0 && !array_key_exists($class_id, $required_classes) && $program_id != 0 && $program_elective_credits > 0 && $student_advisor && key_exists($class_id, get_program_classes($program_id));
                                                    $check_elective = key_exists($student_class_id, $electives);
                                                } else {
                                                    // Handle case when class_info is null, perhaps set default values or skip
                                                    $is_elective = false;
                                                }

                                                $slot_name = "$year$term_number-$j";
                                                $class_menu = "<span$style$title>" . auto_text("\t\t\t\t", $all_classes, "slot-$slot_name", $class_id) . "</span>";
                                                $elective_checkbox = $is_elective ? checkbox("\t\t\t\t", "elective-$slot_name", $check_elective) . "\n" : '';
                                                echo("<span style='white-space:nowrap;'>$class_menu$elective_checkbox</span>");
                                                ?>
                                                <br/>
                                                <?php
                                            }
                                            ?>
                                            Credits: <?php echo($term_credits); ?>
                                        </td>
                                        <?php
                                    }
                                    ?>
                                </tr>
                                <?php
                            }
                        }
                    }
                    ?>
                    <tr class='footer'>
                        <td><input type='submit' name='update_plan' value='Update Student Plan'/></td>
                        <td colspan='3'>
                            New Class Name:
                            <input type='text' name='new_name'/>
                            New Class Credits:
                            <?php echo(array_menu("\t\t\t\t", all_credits(), 'new_credits', '4')); ?>
                        </td>
                    </tr>
                    <tr class='footer'>
                        <td/>
                        <td colspan='2'><input type='submit' name='nuke_plan' value='Clear Student Plan'/> Confirmation
                            <input
                                type='checkbox' name='launch_code' value='launch_code'/></td>
                        <td/>
                    </tr>
                </table>

            </form>
            <?php
        }
        ?>


<?php

// Retrieve student's general education requirements
$student_gen_eds = get_student_gen_eds($student_id);

if ($student_id != 0) {
    ?>
    <style>
        .gen-ed-select {
            width: 180px; /* Set your desired width */
            text-align: center; /* Align text inside the dropdown to the center */
        }
        .gen-ed-label {
            display: inline-block;
            text-align: left; /* Align label text to the left */
            margin-right: 10px; /* Add space between the label and the dropdown */
        }
        .gen-ed-container {
            margin-bottom: 10px; /* Space between each dropdown */
        }

        .k1-k8-container {
            margin-bottom: 5px; /* Space specifically for K1-K8 dropdowns */
        }
        .k1-k8-container .gen-ed-label {
            margin-right: 5px; /* Reduced space specifically for K1-K8 labels */
            width: 25px; /* Set a fixed width for labels to align with the selects */
        }
        .update-button {
            text-align: left; /* Center the update button */
            margin-top: 20px; /* Space between middle section and update button */
        }

        .middle-section {
            display: flex;
            margin-top: 20px; /* Adjusted margin-top */
        }

        .middle-column {
            flex: 1 1 auto; /* Adjusted flex property */
            margin-right: 20px;
        }

        .top-section .gen-ed-label{
            width: 200px; /* Set a fixed width for labels to align with the selects */
        }


    </style>
    <form action='student.php#general_education' method='post' id='general_education'>
        <input type='hidden' name='student_id' value='<?php echo($student_id); ?>'/>
        <input type='hidden' name='program_id' value='<?php echo($program_id); ?>'/>
        <h2>Gen Ed Requirements</h2>

      <div class="top-section">
        <!-- Top section with Quantitative Reasoning, Academic Writing I, and First Year Experience -->
        <table>
            <?php
            $top_requirements = ['First Year Experience', 'Academic Writing I', 'Quantitative Reasoning'];
            foreach ($top_requirements as $requirement) {
                ?>
                <tr class="gen-ed-container">
                    <td>
                        <label class="gen-ed-label" for="<?php echo htmlspecialchars($requirement); ?>"><?php echo htmlspecialchars($requirement); ?></label>
                    </td>
                    <td>
                        <select class="gen-ed-select" name="<?php echo htmlspecialchars($requirement); ?>" id="<?php echo htmlspecialchars($requirement); ?>">
                            <option value="">Select an option</option>
                            <?php foreach ($requirements[$requirement] as $name): ?>
                                <?php
                                // Check if there are previously selected values for this requirement
                                $selected = '';
                                foreach ($student_gen_eds as $gen_ed) {
                                    if ($gen_ed['requirement'] === $requirement && $gen_ed['name'] === $name) {
                                        $selected = 'selected';
                                        break;
                                    }
                                }
                                ?>
                                <option value="<?php echo htmlspecialchars($name); ?>" <?php echo $selected; ?>><?php echo htmlspecialchars($name); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </td>
                </tr>
                <?php
            }
            ?>
        </table>
        </div>
        
        <!-- Middle section with K1-K4 and K5-K8 in columns -->
        <div class="middle-section">
        <div class="middle-column">
                <?php
                $middle_requirements = ['K1', 'K2', 'K3', 'K4'];
                foreach ($middle_requirements as $requirement) {
                    ?>
                    <div class="gen-ed-container k1-k8-container">
                        <label class="gen-ed-label" for="<?php echo htmlspecialchars($requirement); ?>"><?php echo htmlspecialchars($requirement); ?></label>
                        <select class="gen-ed-select" name="<?php echo htmlspecialchars($requirement); ?>" id="<?php echo htmlspecialchars($requirement); ?>">
                            <option value="">Select an option</option>
                            <?php foreach ($requirements[$requirement] as $name): ?>
                                <?php
                                // Check if there are previously selected values for this requirement
                                $selected = '';
                                foreach ($student_gen_eds as $gen_ed) {
                                    if ($gen_ed['requirement'] === $requirement && $gen_ed['name'] === $name) {
                                        $selected = 'selected';
                                        break;
                                    }
                                }
                                ?>
                                <option value="<?php echo htmlspecialchars($name); ?>" <?php echo $selected; ?>><?php echo htmlspecialchars($name); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <?php
                }
                ?>
            </div>

            <div class="middle-column">
                <?php
                $bottom_requirements = ['K5', 'K6', 'K7', 'K8'];
                foreach ($bottom_requirements as $requirement) {
                    ?>
                    <div class="gen-ed-container k1-k8-container">
                        <label class="gen-ed-label" for="<?php echo htmlspecialchars($requirement); ?>"><?php echo htmlspecialchars($requirement); ?></label>
                        <select class="gen-ed-select" name="<?php echo htmlspecialchars($requirement); ?>" id="<?php echo htmlspecialchars($requirement); ?>">
                            <option value="">Select an option</option>
                            <?php foreach ($requirements[$requirement] as $name): ?>
                                <?php
                                // Check if there are previously selected values for this requirement
                                $selected = '';
                                foreach ($student_gen_eds as $gen_ed) {
                                    if ($gen_ed['requirement'] === $requirement && $gen_ed['name'] === $name) {
                                        $selected = 'selected';
                                        break;
                                    }
                                }
                                ?>
                                <option value="<?php echo htmlspecialchars($name); ?>" <?php echo $selected; ?>><?php echo htmlspecialchars($name); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>

        <!-- Add an Update button -->
        <div class="update-button">
            <input type="submit" name="update_student_gen_ed" value="Update Gen Eds">
        </div>
    </form>
    <?php
}
?>



        <?php
        if ($student_id != 0) {
        ?>
        <form action='student.php#notes' method='post' id='notes'>
            <input type='hidden' name='student_id' value='<?php echo($student_id); ?>'/>
            <input type='hidden' name='program_id' value='<?php echo($program_id); ?>'/>

            <h2>Notes</h2>

            <table class='input'>
                <tr class='header'>
                    <td><input type='checkbox' name='flagged_note'/></td>
                    <td><input type='submit' name='add_note' value='Add Note'/></td>
                </tr>
                <tr>
                    <td/>
                    <td><textarea name='note' cols='60' rows='10'></textarea></td>
                </tr>
            </table>


            <table class='input'>
                <?php
                foreach ($notes as $note_id => $tag_note) {
                    $tag = $tag_note['tag'];
                    $note = $tag_note['note'];
                    $flagged = ($tag_note['flagged'] == $YES);
                    $checked = "";
                    $class = "";
                    if ($flagged) {
                        $class = " class='flagged'";
                        $checked = " checked='checked'";
                    }
                    ?>
                    <tr>
                        <td<?php echo($class); ?>>
                            <input type='checkbox' name='flag-<?php echo($note_id); ?>'<?php echo($checked); ?> />
                        </td>
                        <td<?php echo($class); ?>><?php echo($tag); ?></td>
                    </tr>
                    <tr>
                        <td<?php echo($class); ?> />
                        <td<?php echo($class); ?>><?php echo($note); ?></td>
                    </tr>
                    <?php
                }

                if (count($notes) > 0) {
                    ?>
                    <tr>
                        <td/>
                        <td><input type='submit' name='update_notes' value='Update Flags'/></td>
                    </tr>
                    <?php
                }
                ?>
            </table>
        </form>
            <?php
        }
        ?>
        <script>
            $(document).ready(function () {
                // Initialize Select2 on your student dropdown
                $('#student_id').select2({
                    placeholder: "Select a student", // This is your placeholder text
                    allowClear: true // This allows a clear button to appear
                });

                // Set to null for no default selection
                $('#student_id').val(null).trigger('change');

                let transferStudent = document.querySelector('input[name="update_transfer_student"]').checked;
                let veteranBenefits = document.querySelector('input[name="update_veterans_benefits"]').checked;
                let internationalStudent = document.querySelector('input[name="update_international_student"]').checked;

                if (transferStudent) {
                    document.documentElement.style.setProperty('--secondaryLightest', 'lightblue');
                }
                if (internationalStudent) {
                    document.documentElement.style.setProperty('--secondaryLightest', 'yellow');
                }
                if (veteranBenefits) {
                    document.documentElement.style.setProperty('--secondaryLightest', 'lightgreen');
                }


            });
        </script>

        <?php
        if ($student_id == 0) {
            ?>
            <svg class="wave" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                <path fill="#fdfdfd" fill-opacity="1"
                      d="M0,192L60,170.7C120,149,240,107,360,112C480,117,600,171,720,186.7C840,203,960,181,1080,149.3C1200,117,1320,75,1380,53.3L1440,32L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"
                      data-darkreader-inline-fill="" style="--darkreader-inline-fill: #007acc;"></path>
            </svg>
            <?php
        }
        ?>
</body>
</html>
