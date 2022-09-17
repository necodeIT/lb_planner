<?php
	function genNavbar($cursite){
		$c=array('','','');
		$c[$cursite-1]=' class="cursite"';
		echo '<nav id="mainnav">';
			echo "<a href='/'${c[0]}>Download</a>";
			echo "<a href='/docs/'${c[1]}>Docs/FAQ</a>";
			echo "<a href='/roadmap/'${c[2]}>Roadmap</a>";
		echo '</nav>';
	}
?>