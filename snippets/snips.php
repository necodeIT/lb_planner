<?php
	function genExtRef($text,$href){
		echo "<a class='extref' href='$href'>$text ";
		include("./resources/extref.svg");
		echo '</a>';
	}
	function genThemeClass(){
		if(!array_key_exists('theme',$_GET)){
			$_GET['theme']='light';
		}
		echo "class='theme-${_GET['theme']}'";
	}
?>