<?php
	require_once(root.'/snippets/db.php');
	require_once(root.'/snippets/dl_constants.php');
	function genThemeCard($theme){
		global $context_theme;
		if($theme==$context_theme){
			$current = ' current';
		}else{
			$current = '';
		}
		echo "<a class='card$current' href='./?theme=$theme'>";
			include(root."/resources/theme-$theme.svg");
			EDS('theme_'.$theme);
		echo '</a>';
	}
	function genLearnCard($name,$i,$sectionid,$headingid){
		echo '<a class="card learn" href="'.urlroot."/docs/?&section=$sectionid&heading=$headingid\">";
			include(root."/resources/feature_$name.svg");
			echo '<h4>'.GDS('title_learn'.$i).'</h4>'.
				'<p>'.GDS('p_learn'.$i).'</p>'.
				'<span>'.GDS('lnk_learn').'</span>'.
		'</a>';
	}
	function genDownloadCard($os){
		global $context_os;
		if($os==$context_os){
			$current=' current';
		}else{
			$current='';
		}
		$dl_url = constant('dl_'.$os);
		echo "<a class='card dl$current' id='${os}dlcard' href='{$dl_url}'>";
			echo '<h4 class="sectionheader">'.GDS('title_download').'</h4>';
			include(root."/resources/os_$os.svg");
			echo "<span>$os</span>";
		echo '</a>';
	}
	function genDownloadButton($os){
		$dl_url = constant('dl_'.$os);
		echo "<a id='downloadbtn' class='btn' href='$dl_url'>";
		if($os=='linux')
			include("./resources/os_linux_small.svg");
		else
			include("./resources/os_$os.svg");
		EDS('btn_download');
		echo '</a>';
	}
	function genFeatureSection($title,$paragraph,$imgname){
		echo '<section class="screenpage pagetype2">'.
			'<img class="card" src="'.urlroot.'/resources/docs/'.$imgname.'.png" alt="example screenshot"/>'.
			"<h2>$title</h2>".
			"<p>$paragraph</p>".
		'</section>';
	}
?>