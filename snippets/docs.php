<?php

require_once(root.'/snippets/snips.php');
	
/**
 * preprocessor function for doc texts
 * prints directly instead of returning a string
 * @param string $text source string
 * the general structure of a function here is !fun[arg1|arg2]
 * insert images via !img[alt text|dateiname in /resources/docs]
 * insert external links via !lnk[text|link]
 * insert special chars like ! (and | and ] inside functions) with a preceding \
 * anything else just gets echoed like usual - html entities have to be escaped in the source text!
 * @internal if your formatting is wack, this might crash!
 */
function docs_content_pp(string $text) : void{
	$len = strlen($text);
	for ($i = 0; $i < $len;) {
		$c = $text[$i];
		$i++;
		if ('!' == $c) {
			$type = substr($text, $i, 3);
			$i += 3;
			$is = _find_text_function_params($text, $i);
			if ('img' == $type) {
				echo '<div class="img"><img alt="';
				echo attrescape(substr($text, $i + 1, $is[0] - $i - 1));
				echo '" src="'.urlroot.'/resources/docs/';
				echo attrescape(substr($text, $is[0] + 1, $is[1] - $is[0] - 1));
				echo '.png"/></div>';
			// TODO: check if file exists & guess file extension
			// TODO: optionally translated images
			} else if ('lnk' == $type) {
				echo '<a class="extref" href="';
				$lnk = attrescape(substr($text, $i + 1, $is[0] - $i - 1));
				if ('/' == $lnk[0]) {// if link refers to root, prepend urlroot
					echo urlroot.$lnk;
				} else {
					echo $lnk;
				}
				echo '">';
				echo substr($text, $is[0] + 1, $is[1] - $is[0] - 1);
				echo '</a>';
			}
			$i = end($is) + 1;
		} else if ('\\' == $c) {
			echo $text[$i];
			$i++;
		} else {
			echo $c;
		}
	}
}
/**
 * Finds the indices of the parameters of a preprocessor function
 * @param string $text the string to search in
 * @param int $i where to start searching
 * @return int[] an array in the format [param1end,…,endindex]
 *            note that indices are placed on the control chars, so [a|bc] returns [2,5]
 * @internal if your formatting is wack, this might crash!
 */
function _find_text_function_params(string $text, int $i) : array{
	$args = [];
	while (true) {
		$i++;
		$c = $text[$i];
		if ('\\' == $c) {
			$i++;
		} else if ('|' == $c) {
			array_push($args, $i);
		} else if (']' == $c) {
			array_push($args, $i);
			return $args;
		}
	}
}
