<?php

require_once(root.'/snippets/db.php');
require_once(root.'/snippets/dl_constants.php');
/**
 * prints a card for theme switching
 * @param string $theme name of the theme
 */
function genThemeCard(string $theme): void {
	global $context_theme;
	if ($theme == $context_theme) {
		$current = ' current';
	} else {
		$current = '';
	}
	echo "<a class='card{$current}' href='./?theme={$theme}'>";
	include(root."/resources/theme-{$theme}.svg");
	EDS('theme_'.$theme);
	echo '</a>';
}
/**
 * prints a learning card (has short title and links to a subsection in the docs)
 * @param string $name      name of the image ( /resources/feature_{$name}.svg )
 * @param int    $i         ID of the translation string ( title_learn_{$i} )
 * @param int    $sectionid ID of the doc section to link to
 * @param int    $headingid ID of the doc subsection to link to
 */
function genLearnCard(string $name, int $i, int $sectionid, int $headingid): void {
	echo '<a class="card learn" href="'.urlroot."/docs/?&section={$sectionid}&heading={$headingid}\">";
	include(root."/resources/feature_{$name}.svg");
	echo '<h4>'.GDS('title_learn'.$i).'</h4>'.
		'<p>'.GDS('p_learn'.$i).'</p>'.
		'<span>'.GDS('lnk_learn').'</span>'.
	'</a>';
}
/**
 * prints a card for downloading lbp builds
 * @param string $os name of the OS this card is for
 */
function genDownloadCard(string $os): void {
	global $context_os;
	if ($os == $context_os) {
		$current = ' current';
	} else {
		$current = '';
	}
	$dl_url = appversions['stable']['downloads'][$os];
	echo "<a class='card dl{$current}' id='{$os}dlcard' href='{$dl_url}'>";
	echo '<h4 class="sectionheader">'.GDS('title_download').'</h4>';
	include(root."/resources/os_{$os}.svg");
	echo "<span>{$os}</span>";
	echo '</a>';
}
/**
 * prints a download button for downloading lbp builds
 * @param string $os name of the OS this button is for
 */
function genDownloadButton(string $os): void {
	$dl_url = appversions['stable']['downloads'][$os];
	echo "<a id='downloadbtn' class='btn' href='{$dl_url}'>";
	if ('linux' == $os) {
		include('./resources/os_linux_small.svg');
	} else {
		include("./resources/os_{$os}.svg");
	}
	EDS('btn_download');
	echo '</a>';
}
/**
 * prints short section that showcases a feature
 * @param string $title     title to display above the paragraph
 * @param string $paragraph short text that explains the feature
 * @param string $imgname   name of the image ( /resources/docs/{$imgname}.png )
 */
function genFeatureSection(string $title, string $paragraph, string $imgname) {
	echo '<section class="screenpage pagetype2">'.
		'<img class="card" src="'.urlroot.'/resources/docs/'.$imgname.'.png" alt="example screenshot"/>'.
		"<h2>{$title}</h2>".
		"<p>{$paragraph}</p>".
	'</section>';
}
