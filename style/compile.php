<?php

require_once("../less.php/lib/Less/Autoloader.php");

Less_Autoloader::register();

$parser = new Less_Parser();
$parser->SetOptions([
	'compress'=>true,
	'indentation'=>'	'
]);

header('Content-Type: text/css; charset=UTF-8');
echo $parser->parseFile("./{$_GET['filename']}.less")->getCSS();
