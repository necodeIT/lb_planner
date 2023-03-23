<?php

require_once(root.'/snippets/db.php');
	
$c = ['', '', ''];
$c[cursite - 1] = ' class="current"';
echo '<nav id="mainnav"><a href="/" class="logo">';
include(root.'/resources/wordmark.svg');
echo '</a>';
echo '<a class="navlink" href="'.urlroot.'/"'.$c[0].'>'.GDS('nav_dl').'</a>';
echo '<a class="navlink" href="'.urlroot.'/docs/"'.$c[1].'>'.GDS('nav_doc').'</a>';
// echo '<a href="'.urlroot.'/roadmap/"'.$c[2].'>'.GDS('nav_road').'</a>';
echo '</nav>';
