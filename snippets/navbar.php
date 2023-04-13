<?php

require_once(root.'/snippets/db.php');
	
$c = ['', ''];
$c[cursite - 1] = ' current';
echo '<nav id="mainnav"><a href="'.urlroot.'/" class="logo">';
include(root.'/resources/wordmark.svg');
echo '</a>';
echo "<a class=\"navlink {$c[0]}\" href=\"".urlroot."/#{$context_os}dlcard\">".GDS('nav_dl').'</a>';
echo "<a class=\"navlink {$c[1]}\" href=\"".urlroot."/docs/\">".GDS('nav_doc').'</a>';
// echo '<a href="'.urlroot.'/roadmap/"'.$c[2].'>'.GDS('nav_road').'</a>';
echo '</nav>';
