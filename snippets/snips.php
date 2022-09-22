<?php
	function genExtRef($text,$href){
		echo "<a class='extref' href='$href'>$text ";
		include("./resources/extref.svg");
		echo '</a>';
	}
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
			echo $theme;
		echo '</a>';
		$context_theme = $_tmp;
	}
	function genLearnCard($title,$link){
		echo '<a class="card learn" href="/docs/'.genContextURLParams().$link.'">';
			include(root.'/resources/logo.svg');#TODO: image
			echo '<h4>Plan with your Friends</h4>';
			echo '<p>'.
				'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'.
				'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis'.
				'nostrud exercitation ullamco laboris nisi';
			echo '</p>';
			echo '<span>Learn More</span>';
		echo '</a>';
	}
	function genDownloadCard($os){
		global $context_os;
		if($os==$context_os){
			$current=' current';
		}else{
			$current='';
		}
		echo "<a class='card dl$current' href='/download?os=$os'>";
			echo '<h4 class="sectionheader">Download for</h4>';
			include(root.'/resources/theme-light.svg');#TODO: image
			echo "<span>$os</span>";
		echo '</a>';
	}
	function setContext(){
		global $contextURLParams;
		_setContext_helper('theme','light');
		_setContext_helper('lang','EN');
		_setContext_helper('os','windows');
		$contextURLParams = genContextURLParams();
	}
	function _setContext_helper($varname,$default){
		$globalname = 'context_'.$varname;
		if(array_key_exists($globalname,$GLOBALS)){
			return;//don't overwrite if already exists
		}else if(!array_key_exists($varname,$_GET)){
			$GLOBALS[$globalname]=$default;
		}else{
			$GLOBALS[$globalname]=$_GET[$varname];
		}
	}
	/* generates URL parameters that correspond with the current context */
	function genContextURLParams(){
		global $context_theme,$context_lang,$context_os;
		return "theme=$context_theme&lang=$context_lang&os=$context_os";
	}
?>