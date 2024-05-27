<?php
ob_start(); // Start output buffering

include_once("_html.php");
include_once("_sql.php");

if (!get_user_info()) {
    header("Location: settings.php");
    exit();
}

$curr_year = date('Y');
$year = extract_int($_GET, 'year', $curr_year);
$years = [];
for ($i = $curr_year - 1; $i < $curr_year + 10; ++$i) {
    $years[$i] = "$i";
}

$all_programs_blank = [];
$all_programs_blank = array(0 => '') + all_programs();
$program_id = extract_int($_GET, 'program_id');

// Check if the "Export to CSV" button is clicked
$export_csv = isset($_GET['export_csv']);

if (!$export_csv) {
    // Output HTML content
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="styles/navbar.css">
    <title>Enrollments</title>
    <link rel='stylesheet' type='text/css' href='styles/test.css'/>
</head>
<body>

<?php echo(messages()); ?>
<?php echo(linkmenu("Enrollments")); ?>

<div class="content_container">
    <form action='' method='get' class="long">
        <h1>Enrollments</h1>
        <?php echo(array_menu('Year Starting Fall: ', $years, 'year', $year, true));?>
        <?php echo "<div style='margin-right: 10px;'></div>";?>
        <?php echo(array_menu('Program: ', $all_programs_blank, 'program_id',$program_id ,true)); ?>
        <input type="submit" name="export_csv" value="Export to CSV"/>

        <table>
            <tr>
                <td>Class Name</td>
                <td style='padding:0px 10px;'>Fall <?php echo($year); ?></td>
                <td style='padding:0px 10px;'>Winter <?php echo($year + 1); ?></td>
                <td style='padding:0px 10px;'>Spring <?php echo($year + 1); ?></td>
                <td style='padding:0px 10px;'>Summer <?php echo($year + 1); ?></td>
            </tr>
            <?php
            if ($program_id == 0) {
                $enrollments = get_enrollments($year);
            } else {
                $enrollments = get_enrollments_by_program($year, $program_id);
            }
            foreach ($enrollments as $class_id => $info) {
                $name = $info['name'];
                $enrollment = $info['enrollment'];
                $class = '';
                if ($class == 'even') {
                    $class = 'odd';
                } else {
                    $class = 'even';
                }
                ?>
                <tr class='<?php echo($class); ?>'>
                    <td><a href='class.php?id=<?php echo($class_id); ?>'><?php echo($name); ?></a></td>
                    <?php
                    for ($i = 1; $i < 5; ++$i) {
                        ?>
                        <td style='text-align:center;'><a
                                href='roster.php?class_id=<?php echo($class_id); ?>&amp;term=<?php echo($year . $i); ?>'>
                                <?php

                                if (isset($enrollment[$i])) {

                                    echo($enrollment[$i]);
                                } else {
                                    echo(" ");
                                }

                                ?></a></td>
                        <?php
                    }
                    ?>
                </tr>
                <?php

            }
            ?>


        </table>
    </form>
<?php
} else {
    // Output CSV data
    if ($program_id == 0) {
        $enrollments = get_enrollments($year);
    } else {
        $enrollments = get_enrollments_by_program($year, $program_id);
    }

    // Set headers for CSV download
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="Enrollments.csv"');

    // Open a file pointer for writing CSV data
    $output = fopen('php://output', 'w');

    // Write CSV header
    fputcsv($output, array('Class Name', 'Fall ' . $year, 'Winter ' . ($year + 1), 'Spring ' . ($year + 1), 'Summer ' . ($year + 1)));

    // Write enrollment data to CSV
    foreach ($enrollments as $class_id => $info) {
        $name = $info['name'];
        $enrollment = $info['enrollment'];
        $csv_row = array($name);
        for ($i = 1; $i < 5; ++$i) {
            $csv_row[] = isset($enrollment[$i]) ? $enrollment[$i] : '';
        }
        fputcsv($output, $csv_row);
    }

    // Close the file pointer
    fclose($output);

    // Exit script after CSV download
    exit();
}
?>
</div>
<script>
    // Disable Export to CSV button if table has no data
    window.onload = function() {
        var exportButton = document.getElementsByName("export_csv")[0];
        var tableRows = document.getElementsByTagName("tr");
        if (tableRows.length <= 1) {
            exportButton.disabled = true;
        }
    };
</script>
    <svg class="wave" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
        <path fill="#fdfdfd" fill-opacity="1"
              d="M0,192L60,170.7C120,149,240,107,360,112C480,117,600,171,720,186.7C840,203,960,181,1080,149.3C1200,117,1320,75,1380,53.3L1440,32L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"
              data-darkreader-inline-fill="" style="--darkreader-inline-fill: #007acc;"></path>
    </svg>
</body>
</html>

<?php
ob_end_flush(); // Flush output buffer
?>
