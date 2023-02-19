<?php
	const root = '..';
	const cursite = 2;
	
	require_once('../snippets/snips.php');
	require_once('../snippets/db.php');
	require_once('../snippets/docs.php');
	
	setContext();
	
	$stylesheets = array("main","docs");
	$scripts = array("docs");
	include('../snippets/head.php');
	
	if(key_exists('section',$_GET)){
		$wanted_section = $_GET['section'];
	}else{
		$wanted_section = 0;
	}
	if(key_exists('heading',$_GET)){
		$wanted_heading = $_GET['heading'];
	}else{
		$wanted_heading = -1;
	}
	
	$stuff = db_get_docs_stuff();
?>
	<body class="theme-<?php echo $context_theme; ?>">
		<?php
			include('../snippets/navbar.php');
		?>
		<div id="sidebar">
			<?php
				foreach($stuff as $title){
					echo "<label for=\"radio_title{$title->id}\">{$title->text}</label>";
				}
			?>
		</div>
		<?php
			foreach($stuff as $title){
				echo '<input type="radio" id="radio_title'.($title->id);
				if($wanted_section==$title->id){
					echo '" checked name="pageradios"/>';//page radios not pager adios
				}else{
					echo '" name="pageradios"/>';
				}
				echo '<div class="scrollwrap"><div class="allpage">';
				foreach($title->headings as $heading){
					?>
					<details<?=$wanted_heading==$heading->id?' open':''?>>
						<summary><?php
							echo $heading->text;
							include("../resources/dropdown_arrow.svg");
						?></summary>
						<div class="p">
							<?php docs_content_pp($heading->body);?>
						</div>
					</details>
					<?php
				}
				echo '</div></div>';
			}
			include('../snippets/foot.php');
		?>
	</body>
</html>