<?php
const root = '..';
const cursite = 3;
	
require_once('../snippets/snips.php');
require_once('../snippets/db.php');

setContext();

$stylesheets = ['main','roadmap'];
$scripts = ['roadmap'];
include('../snippets/head.php');
?>
	<body class="theme-<?= $context_theme; ?>">
		<?php
			include('../snippets/navbar.php');
		?>
		<main>
			<section class="profiles">
				<div class="card">
					<img src=<?=urlroot?>"/resources/pfp_mceachnie.jpg"/>
					<h3>Benjamin McEachnie</h3>
					<b><?=GDS('job_mceachnie')?></b>
					<span><?=GDS('theme_mceachnie')?></span>
				</div>
				<div class="card">
					<img src=<?=urlroot?>"/resources/pfp_polat.jpg"/>
					<h3>Can Polat</h3>
					<b><?=GDS('job_polat')?></b>
					<span><?=GDS('theme_polat')?></span>
				</div>
				<div class="card">
					<img src=<?=urlroot?>"/resources/pfp_kocagoel.jpg"/>
					<h3>Muhammed Kocagöl</h3>
					<b><?=GDS('job_kocagoel')?></b>
					<span><?=GDS('theme_kocagoel')?></span>
				</div>
				<div class="card">
					<img src=<?=urlroot?>"/resources/pfp_riedler.jpg"/>
					<h3>Riedler David</h3>
					<b><?=GDS('job_riedler')?></b>
					<span><?=GDS('theme_riedler')?></span>
				</div>
			</section>
			<section class="milestones">
				<h1><?=GDS('title_goals')?></h1>
				<div class="roadmap" style="height:30em;width:80em">
					<div class="card goal" style="top:6em;left:4em">
						<h3>Refactor</h3>
						<ul>
							<!--
								when one of these is done, replace <svg></svg> with
								<?php include('../resources/check.svg');?>
							-->
							<li><span>18.11.23</span>Frontend Refactor<svg></svg></li>
							<li><span>18.11.23</span>Backend Refactor<svg></svg></li>
						</ul>
					</div>
					<div class="goal" style="top:1em;left:32em">
						<span>26.11.23</span>Course Overview<svg></svg>
					</div>
					<div class="goal" style="top:13em;left:50em">
						<span>14.01.24</span>Slot Booking Tool<svg></svg>
					</div>
					<div class="goal" style="top:23em;left:27em">
						<span>28.01.24</span>Quality Assurance<svg></svg>
					</div>
				</div>
			</section>
		</main>
		<?php
			include('../snippets/foot.php');
		?>
	</body>
</html>