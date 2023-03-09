<?php
require_once(root.'/snippets/db.php');
require_once(root.'/snippets/snips.php');
?>
<footer id="mainfoot">
	<?php
		include(root.'/resources/logo.svg');
include(root.'/resources/tgm.svg');
?>
	<span>© 2023 necodeIT | <a href="https://github.com/necodeIT/lb_planner/blob/pages/LICENSE.md"><?php EDS('foot_license'); ?></a></span>
	<?php
	foreach (supported_languages as $lang) {
		if ($lang == $context_lang) {
			$class = ' class="current"';
		} else {
			$class = '';
		}
		$upperlang = strtoupper($lang);
		echo "<a id='lang-{$lang}'{$class} href='./?lang={$lang}'>{$upperlang}</a>";
	}
?>
</footer>