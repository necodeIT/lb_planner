<?php
	function genExtRef($text,$href){
		echo "<a class='extref btn' href='$href'><span>$text </span>";
		include("./resources/extref.svg");
		echo '</a>';
	}
	function setContext(){
		global $contextURLParams;
		_setContext_helper('theme',array('light','dark','ocean','sakura'));
		_setContext_helper('lang',array('EN','DE'));
		_setOSContext();
		$contextURLParams = genContextURLParams();
	}
	function _setContext_helper($varname,$varvals){
		$globalname = 'context_'.$varname;
		if(array_key_exists($globalname,$GLOBALS)){
			;
		}else if(!array_key_exists($varname,$_GET)){
			$GLOBALS[$globalname]=$varvals[0];
			return;
		}else{
			$GLOBALS[$globalname]=$_GET[$varname];
		}
		//checking if value is valid and setting to default if not
		if(!in_array($GLOBALS[$globalname],$varvals)){
			$GLOBALS[$globalname] = $varvals[0];
		}
	}
	function _setOSContext(){
		$user_agent = $_SERVER['HTTP_USER_AGENT'];
		
		$osarr = array();
		
		if(preg_match('/macintosh|mac os x/i',$user_agent)){
			array_push($osarr,'mac');
		}else if(preg_match('/linux|ubuntu/i',$user_agent)){
			array_push($osarr,'linux');
		}else{
			array_push($osarr,'windows');
		}
		
		_setContext_helper('os',$osarr);
	}
	/* generates URL parameters that correspond with the current context */
	function genContextURLParams(){
		global $context_theme,$context_lang,$context_os;
		return "theme=$context_theme&lang=$context_lang&os=$context_os";
	}
?>