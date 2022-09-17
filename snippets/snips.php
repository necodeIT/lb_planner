<?php
	function genExtRef($text,$href){
		echo "<a class='extref' href='$href'>$text ";
		include("./resources/extref.svg");
		echo '</a>';
	}
?>