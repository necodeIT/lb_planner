<?php

require_once(root.'/CONSTANTS.php');
	
ini_set('session.gc-maxlifetime', 31536000);
ini_set('session.cookie_lifetime', 31536000);
session_start();
	
function genExtRef($text, $href) {
	echo "<a class='extref btn' href='{$href}'><span>{$text} </span>";
	include('./resources/extref.svg');
	echo '</a>';
}
function setContext() {
	_setContext_helper('theme', ['light', 'dark', 'ocean', 'sakura']);
	_setLangContext();
	_setOSContext();
	foreach (['os', 'lang', 'theme'] as $pref) {
		$_SESSION['pref_'.$pref] = $GLOBALS['context_'.$pref];
	}
}
function _setContext_helper($varname, $varvals) {
	$globalname = 'context_'.$varname;
	$prefname = 'pref_'.$varname;
		
	if (array_key_exists($globalname, $GLOBALS)) {
	} else if (array_key_exists($varname, $_GET)) {
		$GLOBALS[$globalname] = $_GET[$varname];
	} else if (array_key_exists($prefname, $_SESSION)) {
		$GLOBALS[$globalname] = $_SESSION[$prefname];
		return;
	} else {
		$GLOBALS[$globalname] = $varvals[0];
		return;
	}
	// checking if value is valid and setting to default if not
	if (!in_array($GLOBALS[$globalname], $varvals)) {
		$GLOBALS[$globalname] = $varvals[0];
	}
}
function _setOSContext() {
	$user_agent = $_SERVER['HTTP_USER_AGENT'];
		
	$osarr = [];
		
	if (preg_match('/macintosh|mac os x/i', $user_agent)) {
		array_push($osarr, 'mac');
	} else if (preg_match('/linux|ubuntu/i', $user_agent)) {
		array_push($osarr, 'linux');
	} else {
		array_push($osarr, 'windows');
	}
		
	$osarr += supported_systems;
		
	_setContext_helper('os', $osarr);
}
function _setLangContext() {
	// getting priorities of langs supported by the website within the browser
	$accepted = [];
	foreach (supported_languages as $lang) {
		$pos = stripos($_SERVER['HTTP_ACCEPT_LANGUAGE'], $lang);
		if (false != $pos) {
			$accepted[$pos] = $lang;
		}
	}
	// sorting by priority
	sort($accepted);
	// pushing other languages to the back of the array to mark them as valid for the helper
	foreach (supported_languages as $lang) {
		if (!in_array($lang, $accepted)) {
			array_push($accepted, $lang);
		}
	}
	// context helper 😊
	_setContext_helper('lang', $accepted);
}
/**
 * Helper function to escape text for attributes
 * @param text the input text
 * @param  mixed $text
 * @return text  that's been escaped and is fit for HTML attributes
 */
function attrescape($text) {
	return htmlentities($text, ENT_QUOTES | ENT_SUBSTITUTE | ENT_HTML5);
}
