<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="styles/test.css">
    <link rel="stylesheet" type="text/css" href="styles/navbar.css">
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

    $major_id = extract_int($_GET, 'major_id', extract_int($_POST, 'id', 0));

    if (isset($_POST['add_major'])) {
        $new_name = extract_string($_POST, 'new_name');

        $major_id = add_major($user_id, $new_name, $YES);
    }

    if (isset($_POST['update_major'])) {
        $name = $_POST['update_name'];
        $active = $_POST['update_active'];

        update_major($user_id, $major_id, $name, $active);
    }

    $all_majors = all_majors();
    $all_majors_blank = array('0' => '') + $all_majors;
    $name = '';
    if ($major_id != 0) {
        $major_info = get_major_info($major_id);
        $name = $major_info['name'];
        $active = $major_info['active'];
    }

    ?>

    <?php echo(messages()); ?>

    <title>Major<?php if ($name != '') echo(" - $name"); ?></title>
</head>
<body>

<div><?php echo(linkmenu('Major Information')); ?></div>
<div class="content_container">

    <?php
    if ($major_id == 0) {
    ?>
    <h1 class="hidden">SpacerSpacerSpacerSpacer</h1>
    <h1 class="hidden">SpacerSpacerSpacerSpacer</h1>
        <?php
        }
        ?>
    <form action='major.php' method='post' class="long">
        <table>
            <tr>
                <td>
                    <h2>Major Information<?php if ($name != '') {
                            echo(" &mdash; $name");
                        } ?></h2>
                </td>
                <td class="hidden">spacerspacerspacerspacer</td>
                <td>
                    <a href='./majors.php'>List of All Students in Major</a>
                </td>
            </tr>
        </table>
        <table class='input'>
            <tr>
                <td>Major:</td>
                <td>
                    <?php echo(array_menu("\t\t\t\t", $all_majors_blank, 'id', $major_id, true)); ?>
                </td>
                <?php
                if ($major_id == 0)
                {
                ?>
                <td class='spacer'/>
                <td>New Major Name:</td>
                <td><input type='textarea' class='nameid' name='new_name' value=''/>
                    <?php
                    }
                    ?>
            </tr>
            <?php
            if ($major_id == 0) {
                ?>
                <tr>
                    <td class='spacer'/>
                    <td class='spacer'/>
                    <td class='spacer'/>
                    <td/>
                    <td><input type='submit' name='add_major' value='Add Major'/></td>
                </tr>
                <?php
            }
            ?>
        </table>
        <?php
        if ($major_id != 0)
        {
        ?>

        <h2>Major Information</h2>

        <table class='input'>
            <tr>
                <td>Name:</td>
                <td colspan='7'><input type='textarea' class='nameid' name='update_name' value='<?php echo($name); ?>'/>
                </td>
            </tr>
            <tr>
                <td>Active:</td>
                <td colspan='7'>
                    <?php echo(array_menu("\t\t\t\t", all_yesno(), 'update_active', $YES, false)); ?></td>
            </tr>
            <tr>
                <td/>
                <td><input type='submit' name='update_major' value='Update Major'/></td>
            </tr>
        </table>

    </form>

    <?php
    }
    ?>
</div>
<?php
if ($major_id == 0) {
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