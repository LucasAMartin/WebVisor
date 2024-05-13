<?php
ob_start(); // Start output buffering

include_once("_html.php");
include_once("_sql.php");

if (!get_user_info()) {
    header("Location: settings.php");
    exit();
}

$program_id = extract_int($_GET, 'program_id');
$roster = [];

if ($program_id != 0) {
    $roster = get_program_roster($program_id);
}

$all_programs_blank = array(0 => '') + all_programs();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2/dist/js/select2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="styles/navbar.css">
    <title>Program Roster</title>
    <link rel='stylesheet' type='text/css' href='styles/_style.css'/>
</head>
<body>
<style>


    table {
        margin-top: 20px;
        width: 100%;
    }

    th, td {
        text-align: left;
        padding: 8px;
        margin-top: 10px;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
        margin-top: 10px;
    }

    .select2-container {
        margin-bottom: 10px;
        margin-top: 10px;
        width: 20% !important;
    }

    #exportButton {
        margin-top: 10px;
    }
</style>

<?php
echo(messages());
echo(linkmenu('Majors'));
?>
<div class="content_container">
    <form action='majors.php' method='get'>
        <td>
            <select id="program_id" name="program_id" class="select2-class">
                <option value=""></option>
                <?php foreach ($all_programs_blank as $value => $label): ?>
                    <option value="<?php echo htmlspecialchars($value); ?>">
                        <?php echo htmlspecialchars($label); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </td>
        <br />
        <input type='submit' />
    </form>
    <button id="exportButton" disabled>Export to CSV</button> <!-- Disabled Export to CSV button -->
    <table id="rosterTable">
        <tr><th>Name</th><th>CWU ID</th><th>Email</th><th>Advisor</th></tr>
        <?php foreach ($roster as $id => $student_info): ?>
            <tr>
                <td style='padding:0px 10px;'><a href='student.php?id=<?php echo $student_info['cwu_id']; ?>'><?php echo $student_info['name']; ?></a></td>
                <td style='padding:0px 10px;'><?php echo $student_info['cwu_id']; ?></td>
                <td style='padding:0px 10px;'><a href='mailto:<?php echo $student_info['email']; ?>@cwu.edu'><?php echo $student_info['email']; ?>@cwu.edu</a></td>
                <td><?php echo $student_info['advisor']; ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
</div>
</body>
</html>

<script>
    $(document).ready(function() {
        // Initialize the Select2 dropdown
        $('#program_id').select2({
            placeholder: "Select a program",
            allowClear: true
        });

        // Check if a previously selected value is stored and set it
        var selectedProgram = localStorage.getItem('selectedProgram');
        if (selectedProgram) {
            $('#program_id').val(selectedProgram).trigger('change');
        }

        // Save the selected value when it changes
        $('#program_id').on('change', function() {
            var selectedValue = $(this).val();
            localStorage.setItem('selectedProgram', selectedValue);
        });

        // Enable or disable Export to CSV button based on table data availability
        $('#exportButton').prop('disabled', $('#rosterTable tr').length <= 1);

        // Export to CSV functionality
        $('#exportButton').click(function() {
            var csvContent = "data:text/csv;charset=utf-8,";
            csvContent += "Last Name, First Name, CWU ID,Email,Advisor\n";
            <?php foreach ($roster as $id => $student_info): ?>
                csvContent += "<?php echo $student_info['name']; ?>,<?php echo $student_info['cwu_id']; ?>,<?php echo $student_info['email']; ?>,<?php echo $student_info['advisor']; ?>\n";
            <?php endforeach; ?>

            var encodedUri = encodeURI(csvContent);
            var link = document.createElement("a");
            link.setAttribute("href", encodedUri);
            link.setAttribute("download", "Program_Roster.csv");
            document.body.appendChild(link);
            link.click();
        });
    });
</script>

