<?php
	const root = ".";
	include('./snippets/snips.php');
	$stylesheets = array("main","download");
	include('./snippets/head.php');
?>
	<body <?php genThemeClass() ?>>
		<?php 
			include('./snippets/navbar.php');
			genNavbar(1);
		?>
		<section class="screenpage" id="og1">
			<h1>Lorem ipsum dolor sit amet, consectetur</h2>
			<h3>Lorem ipsum dolor sit amet, consectetur</h3>
			<span>
				<a class="btn" href="https://soundcloud.com/riedler-musics/cupheads-title-screen-8-bit">😛 DOWNLOAD</a>
				<?php
					genExtRef('Docs','/docs/');
					genExtRef('Admin','/docs/#admin');
				?>
			</span>
			<img class="card" src="/resources/example_cal.png" alt="example screenshot"/>
			<h1 class="sectionheader">Fit your style</h1>
			<div id="themebox">
				<div>
					<a class="card" href="./?theme=light">LIGHT</a>
					<a class="card" href="./?theme=dark">DARK</a>
				</div>
				<div>
					<a class="card" href="./?theme=ocean">OCEAN</a>
					<a class="card" href="./?theme=sakura">SAKURA</a>
				</div>
			</div>
			<span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</span>
		</section>
		<section class="screenpage" id="pg2">
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
		<section class="screenpage" id="pg3">
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
	</body>
</html>