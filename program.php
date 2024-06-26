<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="styles/test.css">
    <link rel="stylesheet" type="text/css" href="styles/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/select2/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2/dist/js/select2.min.js"></script>

    <?php
    global $YES;
    include_once("_html.php");
    include_once("_sql.php");

    $user_info = get_user_info();
    if (is_array($user_info)) {
        $user_id = $user_info['id'];
        $superuser = is_superuser($user_info);
    } else {
        // Handle the error or set default values
        $user_id = null; // or a default/fallback value
        $superuser = false; // Assuming false as a default if not a superuser
    }

    if (!$user_info || !$superuser) {
        echo("<meta http-equiv='refresh' content='0; url=settings.php' />\n");
        echo("</head>\n");
        echo("</html>\n");
        die();
    }

    $program_id = extract_int($_GET, 'program_id', extract_int($_POST, 'id', 0));

    if (isset($_POST['add_program'])) {
        $new_major_id = extract_int($_POST, 'new_major_id');
        $new_year = extract_int($_POST, 'new_year');
        $new_template_id = extract_int($_POST, 'new_template_id');

        $program_id = add_program($user_id, $new_major_id, $new_year, $new_template_id);
    }

    if (isset($_POST['update_program'])) {
        $major_id = $_POST['update_major_id'];
        $year = $_POST['update_year'];
        $credits = $_POST['update_credits'];
        $elective_credits = $_POST['update_elective_credits'];
        $active = extract_yesno($_POST, 'update_active');

        update_program($user_id, $program_id, $major_id, $year, $credits, $elective_credits, $active);

        $required_grades = extract_id_values('grade', $_POST); // classes in the system
        $added_ids = isset($_POST['update_program_classes']) ? $_POST['update_program_classes'] : array(); // classes we just added
        $deleted_ids = extract_ids('delete', $_POST); // classes we are removing
        $core_ids = array_keys($required_grades);
        $core_ids = array_merge($core_ids, $added_ids);
        $core_ids = array_diff($core_ids, $deleted_ids);
        $sequence_numbers = extract_id_values('seqno', $_POST);

        $required_ids = extract_ids('required', $_POST);

        update_program_classes($user_id, $program_id, $core_ids, $required_ids, $required_grades, $sequence_numbers);
    }

    if (isset($_POST['create_template'])) {
        $template_name = extract_string($_POST, 'new_template_name', 0);
        $mimic_id = extract_int($_POST, 'new_template_mimic', 0);
        if ($template_name == '') {
            add_message('Template must have a name.');
        } else {
            $template_id = create_template($user_id, $program_id, $template_name, $mimic_id);
            echo("<meta http-equiv='refresh' content='0; url=template.php?id=$template_id' />\n");
            echo("</head>\n");
            echo("</html>\n");
            die();
        }
    }

    if (isset($_POST['update_replacements'])) {
        foreach ($_POST as $key => $value) {
            if (preg_match("/remove-([0-9]*)-([0-9]*)/", $key, $matches)) {
                $required_id = $matches[1];
                $replacement_id = $matches[2];
                remove_replacement($user_id, $program_id, $required_id, $replacement_id);
            }
        }
        $replaced = $_POST['replaced'];
        $replacement = $_POST['replacement'];
        if ($replaced != 0 && $replacement != 0) {
            add_replacement($user_id, $program_id, $replaced, $replacement);
        }
    }

    if (isset($_POST['update_checklist'])) {
        $id_sequence = extract_id_values("checklist-sequence", $_POST);
        update_checklist_sequence($user_id, $program_id, $id_sequence);

        $new_checkitem = extract_string($_POST, 'checklist-new');
        if ($new_checkitem != '') {
            add_checklist_item($user_id, $program_id, $new_checkitem);
        }
    }

    $all_programs = all_programs();
    $all_programs_blank = array('0' => '') + $all_programs;
    $all_majors = all_majors();
    $all_years = all_years();
    $this_year = date("Y");


    if ($program_id != 0) {
        $program_info = get_program_info($program_id);
        $major_id = $program_info['major_id'];
        $major_name = $program_info['name'];
        $program_year = $program_info['year'];
        $credits = $program_info['credits'];
        $elective_credits = $program_info['elective_credits'];
        $active = ($program_info['active'] == $YES);
        $program_classes = get_program_classes($program_id);
        $all_grades = all_grades();
        $all_replacements = get_replacement_classes($program_id);
        $required_id_names = array(0 => '');
        foreach ($program_classes as $class_id => $class_info) {
            if ($class_info['required'] == $YES) {
                $required_id_names[$class_id] = $class_info['name'];
            }
        }

        $templates = get_templates($program_id);
        $all_templates_blank = array('0' => '') + $templates;

        $checklist_items = get_checklist($program_id);
        $checklist_count = count($checklist_items);
        $checklist_id_name = array();
        $checklist_sequences = array(0 => 0);
        $i = 1;
        foreach ($checklist_items as $checklist_item) {
            $checklist_id_name[$checklist_items['id']] = $checklist_items['name'];
            $checklist_sequences[$i] = $i;
            ++$i;
        }

        $all_classes = all_classes($program_id);
        $all_classes_blank = array('0' => '') + $all_classes;
        $all_seqnos = array();
        for ($i = 1; $i < 11; ++$i) {
            $all_seqnos[$i] = $i;
        }
    }

    ?>
    <title>Program<?php if ($program_id != 0) echo(" - $major_name ($program_year)"); ?></title>
</head>
<body>
<?php
if ($program_id == 0) {
?>
<svg class="wave" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
    <path fill="#fdfdfd" fill-opacity="1"
          d="M0,192L60,170.7C120,149,240,107,360,112C480,117,600,171,720,186.7C840,203,960,181,1080,149.3C1200,117,1320,75,1380,53.3L1440,32L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"
          data-darkreader-inline-fill="" style="--darkreader-inline-fill: #007acc;"></path>
</svg>
<?php
}
?>

<?php echo(messages()); ?>

<?php echo(linkmenu("Program Information")); ?>

<div class="content_container">
    <h1 class="hidden">SpacerSpacerSpacerSpacer</h1>

    <?php
    if ($program_id == 0) {
    ?>
    <h1 class="hidden">SpacerSpacerSpacerSpacer</h1>
    <form action='program.php' method='post' class="long">
        <?php
        } else {
        ?>
        <form action='program.php' method='post'><?php
            }
            ?>
            <h2 id='top'>Program Information<?php if ($program_id != 0) {
                    echo(" &mdash; $major_name ($program_year)");
                } ?></h2>
            <table class='input'>
                <tr>
                    <td>Program:</td>
                    <td>
                        <?php echo(array_menu("\t\t\t\t", $all_programs_blank, 'id', $program_id, true)); ?>
                    </td>
                    <?php
                    if ($program_id == 0) {
                        ?>
                        <td class='spacer'/>
                        <td>New Program Major:</td>
                        <td>
                            <?php echo(array_menu("\t\t\t\t", $all_majors, 'new_major_id', '0', false)); ?>
                        </td>
                        <?php
                    }
                    ?>
                </tr>
                <?php
                if ($program_id == 0) {
                    ?>
                    <tr>
                        <td class='spacer'/>
                        <td class='spacer'/>
                        <td class='spacer'/>
                        <td>New Program Year:</td>
                        <td>
                            <?php echo(array_menu("\t\t\t\t", $all_years, 'new_year', $this_year, false)); ?>
                        </td>
                    </tr>
                    <tr>
                        <td class='spacer'/>
                        <td class='spacer'/>
                        <td class='spacer'/>
                        <td>Mimic Existing Program:</td>
                        <td>
                            <?php echo(array_menu("\t\t\t\t", $all_programs_blank, 'new_template_id', '0', false)); ?>
                        </td>
                    </tr>
                    <tr>
                        <td class='spacer'/>
                        <td class='spacer'/>
                        <td class='spacer'/>
                        <td/>
                        <td><input type='submit' name='add_program' value='Add Program'/></td>
                    </tr>
                    <?php
                }
                ?>
            </table>
            <?php
            if ($program_id != 0)
            {
            ?>
            <div>
                <div>
                    <h2>Program Information</h2>
                    <table class='input'>
                        <tr>
                            <td>Major &amp; Year:</td>
                            <td colspan='6'>
                                <?php
                                echo(array_menu("\t\t\t\t", $all_majors, 'update_major_id', $major_id, false));
                                echo(array_menu("\t\t\t\t", $all_years, 'update_year', $program_year, false));
                                ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Credits:</td>
                            <td colspan='6'><input type='textarea' name='update_credits'
                                                   value='<?php echo($credits); ?>'/></td>
                        </tr>
                        <tr>
                            <td>Elective Credits:</td>
                            <td colspan='6'><input type='textarea' name='update_elective_credits'
                                                   value='<?php echo($elective_credits); ?>'/></td>
                        </tr>
                        <tr>
                            <td colspan='7'>Program Classes:</td>
                        </tr>
                        <tr>
                            <td/>
                            <td>Name</td>
                            <td>Sequencing</td>
                            <td>Minimum Grade</td>
                            <td>Required</td>
                            <td>Delete</td>
                            <td/>
                        </tr>
                        <?php

                        $row_num = 1;
                        foreach ($program_classes as $id => $info) {
                            $name = $info['name_credits'];
                            $min = $info['minimum_grade'];
                            $seqno = $info['sequence_no'];
                            $required = $info['required'];
                            $class = '';
                            if (($row_num % 2) == 1) {
                                $class = "class='alt'";
                            }
                            $row_num++;
                            ?>
                            <tr>
                                <td/>
                                <td <?php echo($class); ?>><?php echo($name); ?></td>
                                <td <?php echo($class); ?> align='center'>
                                    <?php echo(array_menu("\t\t\t\t", $all_seqnos, "seqno-$id", $seqno)); ?>
                                </td>
                                <td <?php echo($class); ?> align='center'>
                                    <?php echo(array_menu("\t\t\t\t", $all_grades, "grade-$id", $min)); ?>
                                </td>
                                <td <?php echo($class); ?> align='center'>
                                    <?php echo(checkbox("\t\t\t\t", "required-$id", $required == $YES)); ?>
                                </td>
                                <td <?php echo($class); ?> align='center'>
                                    <?php echo(checkbox("\t\t\t\t", "delete-$id", false)); ?>
                                </td>
                                <td/>
                            </tr>
                            <?php
                        }
                        ?>
                        <tr>
                            <td colspan='7'>Add Program Class(es):</td>
                        </tr>
                        <tr>
                            <td/>
                            <td colspan='6'>
                                <div class="dropdown">
                                    <button onclick="toggleDropdown()" class="dropbtn">Selection of Classes</button>
                                    <div id="classDropdown" class="dropdown-content">
                                        <select multiple='multiple' size='10' name='update_program_classes[]'>
                                            <?php
                                            foreach ($all_classes as $id => $name) {
                                                if (!array_key_exists($id, $program_classes)) {
                                                    ?>
                                                    <option value='<?php echo($id); ?>'><?php echo($name); ?></option>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Active:</td>
                            <td colspan='8'><input type='checkbox' name='update_active' <?php if ($active) {
                                    echo("checked='checked'");
                                } ?>>
                        <tr>
                            <td/>
                            <td colspan='8'><input type='submit' name='update_program' value='Update Program Info'/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin-left: auto; margin-right: auto">
                    <h2>Electives</h2>
                    <table class='input'>


                        <tr>
                            <td/>
                            <td>Name</td>
                            <td>Sequencing</td>
                            <td>Minimum Grade</td>
                            <td/>
                        </tr>
                        <?php

                        $row_num = 1;
                        foreach ($program_classes as $id => $info) {
                            $name = $info['name_credits'];
                            $min = $info['minimum_grade'];
                            $seqno = $info['sequence_no'];
                            $required = $info['required'];
                            $class = '';

                            if ($required == $YES) {
                                continue;
                            }

                            if (($row_num % 2) == 1) {
                                $class = "class='alt'";
                            }
                            $row_num++;
                            ?>
                            <tr>
                                <td></td>
                                <td <?php echo($class); ?>><?php echo($name); ?></td>
                                <td <?php echo($class); ?> align='center'>
                                    <?php echo(array_menu("\t\t\t\t", $all_seqnos, "seqno-$id", $seqno)); ?>
                                </td>
                                <td <?php echo($class); ?> align='center'>
                                    <?php echo(array_menu("\t\t\t\t", $all_grades, "grade-$id", $min)); ?>
                                </td>
                                <td></td>
                            </tr>
                            <?php
                        }
                        ?>
                    </table>
                </div>
            </div>

            <div>
                <h2>Templates</h2>
                <table class='input'>
                    <tr>
                        <td><input type='submit' name='create_template' value='Create:'/></td>
                        <td><input type='text' name='new_template_name' value=''/></td>
                        <td>mimicking</td>
                        <td>
                            <?php echo(array_menu("\t\t\t\t", $all_templates_blank, 'new_template_mimic', '', false)); ?>
                        </td>
                    </tr>
                    <?php
                    if (count($templates) > 0) {
                        ?>
                        <tr>
                            <td colspan='4'>Edit Templates:</td>
                        </tr>

                        <?php
                        foreach ($templates as $template_id => $template_name) {
                            ?>
                            <tr>
                                <td/>
                                <td colspan='3'><a
                                        href='template.php?id=<?php echo($template_id); ?>'><?php echo($template_name); ?></a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                        <?php
                    }
                    ?>
                </table>

                <h2>Substitutions</h2>

                <table class='input'>
                    <?php
                    if (count($all_replacements) > 0) {
                        ?>
                        <tr>
                            <td>Substitutions:</td>
                            <td colspan='3'/>
                            <td>Delete</td>
                        </tr>
                        <?php
                        foreach ($all_replacements as $required_id => $replacement_info) {
                            $class_name = $replacement_info['name'];
                            $replacements = $replacement_info['replacements'];
                            foreach ($replacements as $replacement) {
                                $replacement_id = $replacement['id'];
                                ?>
                                <tr>
                                    <td/>
                                    <td>Requirement <?php echo($class_name); ?></td>
                                    <td> may be replaced by</td>
                                    <td><?php echo($replacement['name']); ?></td>
                                    <td align='center'><?php echo(checkbox("", "remove-$required_id-$replacement_id", false)); ?></td>
                                </tr>
                                <?php
                            }
                        }
                    }
                    ?>
                    <tr>
                        <td colspan='5'>Add Substitution:</td>
                    </tr>
                    <tr>
                        <td/>
                        <td colspan='3'>
                            Requirement <?php echo(array_menu("\t\t\t\t", $required_id_names, "replaced", "")); ?> may
                            be replaced by <?php echo(array_menu("\t\t\t\t", $all_classes_blank, "replacement", "")); ?>
                        </td>
                        <td/>
                    </tr>
                    <tr>
                        <td/>
                        <td colspan='4'><input type='submit' name='update_replacements' value='Update Substitutions'/>
                        </td>
                    </tr>
                </table>

                <h2>Checklist</h2>

                <p>To remove a checklist item, set the sequence number to 0.</p>

                <table class='input'>
                    <?php
                    foreach ($checklist_items as $checklist_item) {
                        $id = $checklist_item['id'];
                        $name = $checklist_item['name'];
                        $sequence = $checklist_item['sequence'];
                        ?>
                        <tr>
                            <td><?php echo($name); ?></td>
                            <td>
                                <?php echo(array_menu("\t\t\t\t", $checklist_sequences, "checklist-sequence-$id", $sequence, false)); ?>
                            </td>
                        </tr>
                        <?php
                    }
                    ?>
                    <tr>
                        <td>Add Checklist Item</td>
                        <td><input type='text' name='checklist-new'
                    </tr>
                    <tr>
                        <td/>
                        <td>
                            <input type='submit' name='update_checklist' value='Update Checklist'/>
                        </td>
                    </tr>
                </table>
            </div>

        </form>
</div>
<?php
}
?>

<style>
    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        max-height: 500px; /* Set maximum height for the dropdown */
        overflow-y: auto; /* Enable vertical scrollbar */
        border: 1px solid #ddd;
        z-index: 1;
    }

    .dropdown-content select {
        width: 100%;
        border: none;
    }

    .dropdown-content select option {
        padding: 5px;
    }

    .dropdown-content select option:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>


<script>
    function toggleDropdown() {
        var dropdown = document.getElementById("classDropdown");
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }
</script>
</body>
</html>
