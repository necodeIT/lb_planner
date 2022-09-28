<footer id="mainfoot">
	<?php 
		include(root.'/resources/logo.svg');
		include(root.'/resources/tgm.svg');
	?>
	<span>© 2022 necodeIT | <a href="https://github.com/necodeIT/lb_planner/blob/pages/LICENSE.md"><?php EDS('foot_license') ?></a></span>
	<?php
		foreach(array('EN','DE') as $lang){
			if($lang==$context_lang){
				$class = ' class="current"';
			}else{
				$class = '';
			}
			$_tmp = $context_lang;
			$context_lang = $lang;
			echo "<a id='lang-$lang'$class href='./?".genContextURLParams()."'>$lang</a>";
			$context_lang = $_tmp;
		}
	?>
</footer>