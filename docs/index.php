<?php
	const root = '..';
	const cursite = 2;
	
	require_once('../snippets/snips.php');
	require_once('../snippets/db.php');
	
	setContext();
	
	$stylesheets = array("main","docs");
	$scripts = array("docs");
	include('../snippets/head.php');
	
	$stuff = db_get_docs_stuff();
?>
	<body class="theme-<?php echo $context_theme; ?>">
		<?php
			include('../snippets/navbar.php');
		?>
		<div id="sidebar">
			<?php
				foreach($stuff as $title=>$tmp){
					echo '<label for="radio_'.rawurlencode($title)."\">$title</label>";
				}
			?>
		</div>
		<?php
			foreach($stuff as $title=>$tmp){
				echo '<input type="radio" id="radio_'.rawurlencode($title).'" name="pageradios"/>';
				echo '<div class="allpage">';
				foreach($tmp as $heading=>$texts){
					echo '<details>';
					echo '<summary>'.$heading.'</summary>';
					echo '<p>';
					foreach($texts as $text){
						echo $text;
					}
					echo '</p>';
					echo '</details>';
				}
				echo '</div>';
			}
			include('../snippets/foot.php');
		?>
	</body>
</html>