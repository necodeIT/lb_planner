<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<title>LB Planner</title>
		<link rel="icon" type="image/svg" href="/resources/logo.svg"/>
		<style>
			<?php
				if(isset($stylesheets)){
					foreach($stylesheets as $stylesheet){
						echo "@import '/style/$stylesheet.css';";
					}
				}
			?>
		</style>
	</head>