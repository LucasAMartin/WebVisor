<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="styles/_style.css"><link rel="stylesheet" type="text/css" href="styles/navbar.css">


    <?php
    require_once __DIR__ . '/vendor/autoload.php';

    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->load();

    include_once("_html.php");
    include_once("_sql.php");

    if (!get_user_info()) {
        header('Location: settings.php');
    } else {
        header('Location: student.php');
    }
    exit;
    ?>
</head>
<body>
	<ul>
		<li><a href='settings.php'>Review/Update Default Settings</a></li>
		<li><a href='student.php'>Review/Update Student Information</a></li>
		<li><a href='class.php'>Review/Update Class Information</a></li>
		<li><a href='program.php'>Review/Update Program Information</a></li>
		<li><a href='major.php'>Review/Update Major Information</a></li>
		<li><a href='majors.php'>List all Students in a Major</a></li>
		<li><a href='term.php'>Check Term Enrollments</a></li>
		<li><a href='lost.php'>Find Lost Students</a></li>
	</ul>
</body>
</html>