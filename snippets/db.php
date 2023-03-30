<?php

require_once(root.'/CONSTANTS.php');
$GLOBALS['db'] = new PDO('mysql:host='.db_host.';dbname='.db_dbname.';charset=utf8mb4', db_username, db_password);
$GLOBALS['db']->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
/**
 * prepares and executes a query
 * @param  string       $query the SQL query to execute
 * @param  array        $args  the parameters to insert into the query
 * @return PDOStatement the resulting values
 */
function _db_get_pq(string $query, array $args): PDOStatement {
	/** @var PDO $db */
	global $db;
	$stmt = $db->prepare($query);
	$stmt->execute($args);
	return $stmt;
}
/**
 * prepares and executes a query with explicit types
 * @param  string       $query the SQL query to execute
 * @param  string[]     $args  the parameters to insert into the query
 * @param  string[]     $types the parameter types
 * @return PDOStatement the resulting values
 */
function _db_get_tpq(string $query, array $args, array $types): PDOStatement {
	/** @var PDO $db */
	global $db;
	$stmt = $db->prepare($query);
	for ($i = 0; $i < count($args); $i++) {
		$stmt->bindparam($i + 1, $args[$i], $types[$i]);
	}
	$stmt->execute();
	return $stmt;
}
/**
 * returns a translated string matching the key string from the database
 * short for Get DB String
 * @param  string $key the internal string key
 * @return string the matching translation string from the database
 */
function GDS(string $key): string {
	global $context_lang;
	return _db_get_pq(
		'SELECT str FROM Translation_'.strtolower($context_lang).' as trans INNER JOIN TranslationKeys as tkeys ON trans.id=tkeys.id WHERE tkeys.name=?',
		[$key]
	)->fetch()[0];
}
/**
 * prints a translated string matching the key string from the database
 * short for Echo DB String
 * @param string $key the internal string key
 */
function EDS(string $key): void {
	echo GDS($key);
}
/**
 * returns translated strings matching the key string from the database plus the appended postfixes
 * short for Multiple Get DB String
 * @param  string $key       the first part of the internal string keys
 * @param  array  $postfixes the second parts of the internal string keys
 * @return string the matching translation strings from the database, concatenated
 */
function MGDS(string $key, array $postfixes): string {
	$result = '';
	foreach ($postfixes as $pf) {
		$result .= GDS($key.$pf);
	}
	return $result;
}
/**
 * prints translated strings matching the key string from the database plus the appended postfixes
 * short for Multiple Echo DB String
 * @param string $key       the first part of the internal string keys
 * @param array  $postfixes the second parts of the internal string keys
 */
function MEDS(string $key, array $postfixes): void {
	foreach ($postfixes as $pf) {
		EDS($key.$pf);
	}
}
/**
 * gets doc titles, headings and texts (not preprocessed)
 * @return DocTitle[]
 */
function db_get_docs_stuff(): array {
	global $context_lang;
	
	// getting titles
	$result = [];
	$titles = _db_get_pq("SELECT id,text FROM DocsTitles_{$context_lang} ORDER BY id ASC", [])->fetchAll();
	foreach ($titles as [$tid, $ttext]) {
		// getting corresponding headings
		$tmp = [];
		$headings = _db_get_pq("SELECT id,text FROM DocsHeadings_{$context_lang} WHERE title_id=? ORDER BY id ASC", [$tid], [PDO::PARAM_INT])->fetchAll();
		foreach ($headings as [$hid, $htext]) {
			// getting corresponding texts
			$text = '';
			$texts = _db_get_pq("SELECT text FROM DocsTexts_{$context_lang} WHERE heading_id=? ORDER BY text_id", [$hid], [PDO::PARAM_INT])->fetchAll();
			foreach ($texts as $txt) {
				$text .= $txt[0];
			}
			$heading = new DocHeading($hid, $htext, $text);
			array_push($tmp, $heading);
		}
		array_push($result, new DocTitle($tid, $ttext, $tmp));
	}
	
	return $result;
}
/**
 * Represents a docs section
 */
class DocTitle {
	public $id;
	public $text;
	public $headings;
	/**
	 * @param int          $id       the section ID
	 * @param string       $text     the section title
	 * @param DocHeading[] $headings the headings contained within this section
	 */
	public function __construct(int $id, string $text, array $headings) {
		$this->id = $id;
		$this->text = $text;
		$this->headings = $headings;
	}
}
/**
 * Represents a docs subsection
 */
class DocHeading {
	public $id;
	public $text;
	public $body;
	/**
	 * @param int    $id   the subsection ID
	 * @param string $text the subsection title
	 * @param string $body the subsection text
	 */
	public function __construct(int $id, string $text, string $body) {
		$this->id = $id;
		$this->text = $text;
		$this->body = $body;
	}
}
