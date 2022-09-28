<?php
	const root = '.';
	const cursite = 1;
	
	require_once('./snippets/snips.php');
	require_once('./snippets/db.php');
	
	setContext();
	
	$stylesheets = array("main","download");
	include('./snippets/head.php');
?>
	<body class="theme-<?php echo $context_theme; ?>">
		<?php 
			include('./snippets/navbar.php');
		?>
		<section class="screenpage" id="og1">
			<h1><?php EDS('title_main') ?></h2>
			<h3><?php EDS('span_main') ?></h3>
			<span>
				<?php
					echo "<a id='downloadbtn' class='btn' href='/download/?os=$context_os'>";
					if($context_os=='linux')
						include("./resources/os_linux_small.svg");
					else
						include("./resources/os_$context_os.svg");
					EDS('btn_download');
					echo '</a>';
				?>
				<?php
					genExtRef(GDS('lnk_docs'),'/docs/?'.genContextURLParams());
					genExtRef(GDS('lnk_admin'),'/docs/?'.genContextURLParams().'#admin');
				?>
			</span>
			<img class="card" src="/resources/example_cal.png" alt="example screenshot"/>
			<h1 class="sectionheader"><?php EDS('title_theme') ?></h1>
			<div id="themebox">
				<div>
					<?php
						genThemeCard('light');
						genThemeCard('dark');
					?>
				</div>
				<div>
					<?php
						genThemeCard('ocean');
						genThemeCard('sakura');
					?>
				</div>
			</div>
			<span><?php EDS('p_themes1');EDS('p_themes2') ?></span>
		</section>
		<?php
			foreach(array(1,2,3) as $i){
				genFeatureSection(
					GDS('title_demo'.$i),
					MGDS("p_demo${i}",[1,2]));
			}
		?>
		<section class="screenpage" id="ofeat">
			<h1 class="sectionheader"><?php EDS('title_features') ?></h1>
			<?php
				genLearnCard('plan',1);
				genLearnCard('overview',2);
				genLearnCard('sync',3);
			?>
			<hr/>
			<?php
				genDownloadCard('linux');
				genDownloadCard('windows');
				genDownloadCard('mac');
			?>
			<p><?php MEDS('p_download',[1,2]) ?></p>
		</section>
		<?php
			include('./snippets/foot.php');
		?>
	</body>
</html>