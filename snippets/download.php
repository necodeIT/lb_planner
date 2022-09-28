<?php
	require_once(root.'/snippets/db.php');
	function genThemeCard($theme){
		global $context_theme;
		if($theme==$context_theme){
			$current = ' current';
		}else{
			$current = '';
		}
		$_tmp = $context_theme;
		$context_theme = $theme;
		echo "<a class='card$current' href='./?";
			echo genContextURLParams();
			echo '\'>';
			include("./resources/theme-$theme.svg");
			EDS('theme_'.$theme);
		echo '</a>';
		$context_theme = $_tmp;
	}
	function genLearnCard($name,$i){
		echo '<a class="card learn" href="/docs/'.genContextURLParams().'#'.$name.'">';
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
		echo "<a class='card dl$current' id='${os}dlcard' href='/download?os=$os'>";
			echo '<h4 class="sectionheader">'.GDS('title_download').'</h4>';
			include(root."/resources/os_$os.svg");
			echo "<span>$os</span>";
		echo '</a>';
	}
	function genFeatureSection($title,$paragraph){
		echo '<section class="screenpage pagetype2">'.
			'<img class="card" src="/resources/example_cal.png" alt="example screenshot"/>'.
			"<h2>$title</h2>".
			"<p>$paragraph</p>".
		'</section>';
	}
?>