<?php
	function genExtRef($text,$href){
		echo "<a class='extref' href='$href'>$text ";
		include("./resources/extref.svg");
		echo '</a>';
	}
	function setContext(){
		_setContext_helper('theme','light');
		_setContext_helper('lang','EN');
		_setContext_helper('os','win');
	}
	function _setContext_helper($varname,$default){
		$globalname = 'context_'.$varname;
		if(array_key_exists($globalname,$GLOBALS)){
			return;//don't overwrite if already exists
		}else if(!array_key_exists($varname,$_GET)){
			$GLOBALS[$globalname]=$default;
		}else{
			$GLOBALS[$globalname]=$_GET[$varname];
		}
	}
	/* generates URL parameters that correspond with the current context */
	function genContextURLParams(){
		global $context_theme,$context_lang,$context_os;
		return "theme=$context_theme&lang=$context_lang&os=$context_os";
	}
?>