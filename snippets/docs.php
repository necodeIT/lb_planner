<?php

require_once(root.'/snippets/snips.php');

class PreprocessorCommand {
	public string $type;
	public array $params;
	public int $lastindex;
	/**
	 * parses a preprocessor command like `!img[https://riedler.wien/|Riedler]`
	 * @param  string $text the string to search in
	 * @param  int    $i    index of the bang
	 * @internal if your formatting is wack, this might crash!
	 */
	public function __construct(string $text, int $i) {
		$this->params = [];
		$tmp = '';
		
		while (true) {
			$i++;
			$c = $text[$i];
			if ('\\' == $c) {
				$i++;
				$tmp.=$text[$i];
			} else if ('[' == $c) {
				$this->type = $tmp;
				$tmp = '';
			} else if ('|' == $c) {
				array_push($this->params,$tmp);
				$tmp = '';
			} else if (']' == $c) {
				array_push($this->params,$tmp);
				$this->lastindex = $i;
				return;
			} else {
				$tmp.=$c;
			}
		}
	}
}

/**
 * preprocessor function for doc texts
 * prints directly instead of returning a string
 * @param string $text source string
 *                     the general structure of a function here is !fun[arg1|arg2]
 *                     insert images via !img[alt text|dateiname in /resources/docs]
 *                     insert external links via !lnk[text|link]
 *                     insert special chars like ! (and | and ] inside functions) with a preceding \
 *                     anything else just gets echoed like usual - html entities have to be escaped in the source text!
 * @internal if your formatting is wack, this might crash!
 */
function docs_content_pp(string $text): void {
	$len = strlen($text);
	for ($i = 0; $i < $len;) {
		$c = $text[$i];
		if ('!' == $c) {
			$pp = new PreprocessorCommand($text, $i);
			if ('img' == $pp->type) {
				echo '<div class="img"><img alt="';
				echo attrescape($pp->params[0]);
				echo '" src="' . urlroot . '/resources/docs/';
				echo attrescape($pp->params[1]);
				echo '.png"/></div>';
				// TODO: check if file exists & guess file extension
				// TODO: optionally translated images
			} else if ('lnk' == $pp->type) {
				echo '<a class="extref" href="';
				$lnk = attrescape($pp->params[0]);
				if ('/' == $lnk[0]) { // if link refers to root, prepend urlroot
					echo urlroot . $lnk;
				} else {
					echo $lnk;
				}
				echo '">';
				echo $pp->params[1];
				echo '</a>';
			}
			$i = $pp->lastindex + 1;
		} else if ('\\' == $c) {
			echo $text[$i];
			$i++;
		} else {
			echo $c;
			$i++;
		}
	}
}
