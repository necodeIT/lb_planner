<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<title>LB Planner</title>
		<link rel="icon" type="image/svg" href="<?=urlroot?>/resources/logo.svg"/>
		<?php
			if(isset($stylesheets)){
				foreach($stylesheets as $stylesheet){
					echo '<link rel="stylesheet" href="'.urlroot."/style/$stylesheet.css\">";
				}
			}
			if(isset($scripts)){
				foreach($scripts as $script){
					echo '<script async src="'.urlroot."/js/$script.js\"></script>";
				}
			}
		?>
	</head>