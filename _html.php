<?php

function linkmenu($currentPage) {
	$pages = [
		'Student Information' => './student.php',
		'Class Information' => './class.php',
		'Program Information' => './program.php',
		'Major Information' => './major.php',
		'Enrollments' => './term.php',
		'Majors' => './majors.php',
		'Lost Students' => './lost.php'
	];

	$html = <<<HTML
<header id="cs-navigation">
    <div class="cs-container">
        <!--Nav Logo-->
        <a href="" class="cs-logo" aria-label="back to home">
            <img src="assets/logo.png" alt="logo" width="224" height="65" aria-hidden="true" decoding="async">
        </a>
        <!--Navigation List-->
        <nav class="cs-nav" role="navigation">
            <!--Mobile Nav Toggle-->
            <button class="cs-toggle" aria-label="mobile menu toggle">
                <div class="cs-box" aria-hidden="true">
                    <span class="cs-line cs-line1" aria-hidden="true"></span>
                    <span class="cs-line cs-line2" aria-hidden="true"></span>
                    <span class="cs-line cs-line3" aria-hidden="true"></span>
                </div>
            </button>
            <div class="cs-ul-wrapper">
                <ul id="cs-expanded" class="cs-ul" aria-expanded="false">
HTML;

	foreach ($pages as $pageName => $pageLink) {
		$activeClass = ($currentPage === $pageName) ? 'cs-active' : '';
		$html .= <<<HTML
                    <li class="cs-li">
                        <a href="$pageLink" class="cs-li-link $activeClass">
                            $pageName
                        </a>
                    </li>
HTML;
	}

	// Add the Settings link with a different class
	$activeClass = ($currentPage === 'Settings') ? 'cs-active' : '';
	$html .= <<<HTML
                    <li class="cs-li">
                        <a href="settings.php" class="cs-button-solid cs-nav-button $activeClass">
                            Settings
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<script src="scripts/nav.js"></script>
HTML;

	return $html;
}




function catalog_year($date)
	{
		$year = date('Y', $date);
		if (date('n', $date) < 7)
		{
			$year -= 1;
		}
		
		return $year;	
	}
	
	function extract_value($keyvals, $key, $default)
	{
		if (isset($keyvals[$key]))
		{
			return $keyvals[$key];
		}
		else
		{
			return $default;
		}
	}
	
	function extract_email($keyvals, $key, $default='')
	{
		$string = extract_value($_POST, $key, $default);
		$matches = array();
		preg_match('/([^@]*)/', $string, $matches);
		
		return $matches[1];
	}
	
	$YES = 'Yes';
	$NO = 'No';
	
	function extract_yesno($keyvals, $key, $default = 'off')
	{
		global $YES;
		global $NO;
		
		$onoff = extract_value($_POST, $key, $default);
		return ( ($onoff == 'on') ? $YES : $NO);
		
	}
	
	function extract_string($keyvals, $key, $default = '')
	{
		return extract_value($keyvals, $key, $default);
	}
	
	function extract_int($keyvals, $key, $default = 0)
	{
		return intval(extract_value($keyvals, $key, $default));
	}
	
	function extract_ids($prefix, $keyvals)
	{
		$ids = array();
		foreach($keyvals as $key => $value)
		{
			$matches = array();
			if (preg_match("/$prefix-([0-9]*)/", $key, $matches))
			{
				$ids[] = $matches[1];
			}
		}
		
		return $ids;
	}
	
	function extract_id_values($prefix, $keyvals)
	{
		$ids = array();
		foreach($keyvals as $key => $value)
		{
			if (preg_match("/$prefix-([0-9]*)/", $key, $matches))
			{
				$ids[$matches[1]] = $value;
			}
		}
		
		return $ids;
	}
	
	function all_grades()
	{
		return array(
			40 => 'A',
			37 => 'A-',
			33 => 'B+',
			30 => 'B',
			27 => 'B-',
			23 => 'C+',
			20 => 'C',
			17 => 'C-',
			13 => 'D+',
			10 => 'D',
			7 => 'D-',
			0 => 'F'
		);
	}
	
	function all_yesno()
	{
		global $YES;
		global $NO;
		
		return array(
			$NO => $NO,
			$YES => $YES,
		);
	}
	
	function points_to_grade($points)
	{
		return all_grades()[$points];
	}
	
	function all_credits()
	{
		$result = array();
		for ($i = 1; $i < 17; ++$i)
		{
			$result[$i] = $i;
		}
		
		return $result;
	}
	
	function print_array($array, $name='')
	{
		echo("$name<br />\n");
		echo("<pre><code>\n");
		echo(htmlentities(print_r($array,true)));
		echo("</code></pre>\n");
	}
	
	function all_years()
	{
		$all_years = array();
		//! @to do, this should be more dynamic or should be easier to find
		for ($year = 2014; $year < 2030; ++$year)
		{
			$all_years[$year] = "$year";
		}
		
		return $all_years;
	}
	
	$term_as_text = array('1' => 'Fall', '2' => 'Winter', '3' => 'Spring', '4' => 'Summer');
	
	function term_text($term)
	{
		global $term_as_text;
		
		$year = substr($term, 0, 4);
		$term = substr($term, 4, 1);
		if ($term > 1)
		{
			++$year;
		}
		
		return array('term' => $term_as_text[$term], 'year' => "$year");
		
	}
	
	$MESSAGES = array();
	
	function add_message($message)
	{
		global $MESSAGES;
		
		$MESSAGES[] = $message;
	}
	
	function messages()
	{
		global $MESSAGES;
		$result = "";
		if (count($MESSAGES) > 0)
		{
			$result .= "<div id='message_start'><a href='#message_end'>Skip Messages</a></div>";
			$result .= "<h2>Messages</h2>\n";
			$result .= "<div class='messages'>\n";
			$result .= implode("<br />\n", $MESSAGES);
			$result .= "</div>\n";
			$result .= "<div id='message_end'><a href='#message_start'>View Messages</a></div>";
		}
		
		return $result;
	}
	
	function array_menu($prefix, $items, $name, $selected, $submit=false, $tabindex="")
	{
		$result = "$prefix<select name='$name'";
		if ($submit)
		{
			//! @todo need to implement this
			$result .= " onchange='this.form.submit()'";
		}
		else
		{
			$result .= " onchange='changed(this)'";
		}
		if ($tabindex != "")
		{
			$result .= "tabindex='$tabindex'";
		}
		$result .= ">\n";
		foreach($items as $value=>$text)
		{
			$selected_text = "";
			if (strcmp($value, $selected) == 0)
			{
				$selected_text = " selected='selected'";
			}
			$result .= "$prefix\t<option value='$value'$selected_text>$text</option>\n";
		}
		$result .= "$prefix</select>\n";
		
		return $result;
	}
	function auto_text($prefix, $items, $name, $selected, $id="", $submit=false, $tabindex=""){
		$dat_list ="$prefix<datalist id='list-$name'\n>";
		$class_name ="";
		foreach($items as $value=>$text){
			if (strcmp($value, $selected) == 0)
			{
				$class_name = $text;
			}
			$dat_list.= "$prefix\t<option value='$text'>$text</option>\n";
		}
		$dat_list .= "$prefix</datalist>\n";

		if ($class_name== ''){
			$result = "$prefix<input type = 'search' name='$name' id='$name' list= 'list-$name'\n";
		}else{
			$result = "$prefix<input type = 'search' name='$name' value='$class_name' id='$id' list= 'list-$name'\n";

		}
		if ($submit)
		{
			//! @todo need to implement this
			$result .= " onchange='this.form.submit()'";
		}
		else
		{
			$result .= " onchange='changed(this)'";
		}
		if ($tabindex != "")
		{
			$result .= "tabindex='$tabindex'";
		}
		$result .= ">\n";
		$result .= $dat_list;
		$result .= "</input>";
		return $result;
	}
	
	function checkbox($prefix, $name, $checked)
	{
		$result = "$prefix<input type='checkbox' name='$name'";
		if ($checked)
		{
			$result .= " checked='checked'";
		}
		$result .= " />";
		
		return $result;
	}

?>
