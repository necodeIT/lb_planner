<?php
	const supported_languages = array('en','de');
	
	function genExtRef($text,$href){
		echo "<a class='extref btn' href='$href'><span>$text </span>";
		include("./resources/extref.svg");
		echo '</a>';
	}
	function setContext(){
		global $contextURLParams;
		_setContext_helper('theme',array('light','dark','ocean','sakura'));
		_setLangContext();
		_setOSContext();
		$contextURLParams = genContextURLParams();
	}
	function _setContext_helper($varname,$varvals){
		$globalname = 'context_'.$varname;
		if(array_key_exists($globalname,$GLOBALS)){
			echo $globalname." already exists: ${GLOBALS[$globalname]}<br>";
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
	function _setLangContext(){
		//getting priorities of langs supported by the website within the browser
		$accepted = array();
		foreach(supported_languages as $lang){
			$pos = stripos($_SERVER['HTTP_ACCEPT_LANGUAGE'],$lang);
			if($pos != FALSE){
				$accepted[$pos] = $lang;
			}
		}
		//sorting by priority
		sort($accepted);
		//pushing other languages to the back of the array to mark them as valid for the helper
		foreach(supported_languages as $lang){
			if(!in_array($lang,$accepted)){
				array_push($accepted,$lang);
			}
		}
		//context helper 😊
		_setContext_helper('lang',$accepted);
	}
	/* generates URL parameters that correspond with the current context */
	function genContextURLParams(){
		global $context_theme,$context_lang,$context_os;
		return "theme=$context_theme&lang=$context_lang&os=$context_os";
	}
?>