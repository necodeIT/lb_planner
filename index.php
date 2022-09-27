<?php
	require_once('./snippets/snips.php');
	
	const root = '.';
	const cursite = 1;
	setContext();
	
	$stylesheets = array("main","download");
	include('./snippets/head.php');
?>
	<body class="theme-<?php echo $context_theme; ?>">
		<?php 
			include('./snippets/navbar.php');
		?>
		<section class="screenpage" id="og1">
			<h1>Lorem ipsum dolor sit amet, consectetur</h2>
			<h3>Lorem ipsum dolor sit amet, consectetur</h3>
			<span>
				<?php
					echo "<a id='downloadbtn' class='btn' href='/download/?os=$context_os'>";
					if($context_os=='linux')
						include("./resources/os_linux_small.svg");
					else
						include("./resources/os_$context_os.svg");
					echo 'DOWNLOAD</a>';
				?>
				<?php
					genExtRef('Docs','/docs/'.genContextURLParams());
					genExtRef('Admin','/docs/'.genContextURLParams().'#admin');
				?>
			</span>
			<img class="card" src="/resources/example_cal.png" alt="example screenshot"/>
			<h1 class="sectionheader">Fit your style</h1>
			<div id="themebox">
				<div>
					<?php
						genThemeCard('light','Light');
						genThemeCard('dark','Dark');
					?>
				</div>
				<div>
					<?php
						genThemeCard('ocean','Ocean');
						genThemeCard('sakura','桜');
					?>
				</div>
			</div>
			<span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</span>
		</section>
		<section class="screenpage pagetype2">
			<img class="card" src="/resources/example_cal.png" alt="example screenshot"/>
			<h2>Lorem ipsum dolor sit amet,</h2>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna
				aliqua. Ut enim ad minim veniam, quis nostrud exercitation
				ullamco laboris nisi ut aliquip ex ea commodo consequat.
				Duis aute irure dolor in reprehenderit in voluptate velit esse
				cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
				cupidatat non proident, sunt in culpa qui officia deserunt
				mollit anim id est laborum.
			</p>
		</section>
		<section class="screenpage pagetype2">
			<img class="card" src="/resources/example_cal.png" alt="example screenshot"/>
			<h2>Lorem ipsum dolor sit amet,</h2>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna
				aliqua. Ut enim ad minim veniam, quis nostrud exercitation
				ullamco laboris nisi ut aliquip ex ea commodo consequat.
				Duis aute irure dolor in reprehenderit in voluptate velit esse
				cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
				cupidatat non proident, sunt in culpa qui officia deserunt
				mollit anim id est laborum.
			</p>
		</section>
		<section class="screenpage pagetype2">
			<img class="card" src="/resources/example_cal.png" alt="example screenshot"/>
			<h2>Lorem ipsum dolor sit amet,</h2>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna
				aliqua. Ut enim ad minim veniam, quis nostrud exercitation
				ullamco laboris nisi ut aliquip ex ea commodo consequat.
				Duis aute irure dolor in reprehenderit in voluptate velit esse
				cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
				cupidatat non proident, sunt in culpa qui officia deserunt
				mollit anim id est laborum.
			</p>
		</section>
		<section class="screenpage" id="ofeat">
			<h1 class="sectionheader">Other features</h1>
			<?php
				genLearnCard('Plan with your Friends','plan');
				genLearnCard('Get an immediate overview','overview');
				genLearnCard('Sync data across devices','sync');
			?>
			<hr/>
			<?php
				genDownloadCard('linux');
				genDownloadCard('windows');
				genDownloadCard('mac');
			?>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
laborum.
			</p>
		</section>
		<?php
			include('./snippets/foot.php');
		?>
	</body>
</html>