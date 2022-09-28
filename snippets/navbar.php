<?php
	global $contextURLParams;
	$c=array('','','');
	$c[cursite-1]=' class="current"';
	echo '<nav id="mainnav">';
		include(root."/resources/wordmark.svg");
		echo '<a href="/?'.$contextURLParams.'"'.$c[0].'>'.GDS('nav_dl').'</a>';
		echo '<a href="/docs/?'.$contextURLParams.'"'.$c[1].'>'.GDS('nav_doc').'</a>';
		echo '<a href="/roadmap/?'.$contextURLParams.'"'.$c[2].'>'.GDS('nav_road').'</a>';
	echo '</nav>';
?>