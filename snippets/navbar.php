<?php
	global $contextURLParams;
	require_once(root.'/snippets/db.php');
	
	$c=array('','','');
	$c[cursite-1]=' class="current"';
	echo '<nav id="mainnav">';
		include(root."/resources/wordmark.svg");
		echo '<a href="'.urlroot.'/?'.$contextURLParams.'"'.$c[0].'>'.GDS('nav_dl').'</a>';
		echo '<a href="'.urlroot.'/docs/?'.$contextURLParams.'"'.$c[1].'>'.GDS('nav_doc').'</a>';
		#echo '<a href="'.urlroot.'/roadmap/?'.$contextURLParams.'"'.$c[2].'>'.GDS('nav_road').'</a>';
	echo '</nav>';
?>