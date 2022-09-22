<?php
	global $contextURLParams;
	$c=array('','','');
	$c[cursite-1]=' class="current"';
	echo '<nav id="mainnav">';
		include(root."/resources/wordmark.svg");
		echo '<a href="/?'.$contextURLParams.'"'.$c[0].'>Download</a>';
		echo '<a href="/docs/?'.$contextURLParams.'"'.$c[1].'>Docs/FAQ</a>';
		echo '<a href="/roadmap/?'.$contextURLParams.'"'.$c[2].'>Roadmap</a>';
	echo '</nav>';
?>