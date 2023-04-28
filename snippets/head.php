<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<title>LB Planner</title>
		<link rel="icon" type="image/svg" href="<?= urlroot; ?>/resources/logo.svg"/>
		<?php
			if (isset($stylesheets)) {
				foreach ($stylesheets as $stylesheet) {
					echo '<link rel="stylesheet" href="'.urlroot."/style/compile.php?filename={$stylesheet}\">";
				}
			}
			if (isset($scripts)) {
				array_push($scripts,'main');
				foreach ($scripts as $script) {
					echo '<script async src="'.urlroot."/js/{$script}.js\" type=\"module\"></script>";
				}
			}
		?>
	</head>