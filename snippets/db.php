<?php
	//TODO: config for production environment
	$GLOBALS['db'] = new PDO('mysql:host=localhost;dbname=lbpages','lbplanner');
	$GLOBALS['db']->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	//helper method to reduce code duplication
	function _db_get_pq($query,$args){
		global $db;
		$stmt = $db->prepare($query);
		$stmt->execute($args);
		return $stmt;
	}
	//helper method; same as above, but with explicit types
	function _db_get_tpq($query,$args,$types){
		global $db;
		$stmt = $db->prepare($query);
		for($i=0;$i<count($args);$i++){
			$stmt->bindparam($i+1,$args[$i],$types[$i]);
		}
		$stmt->execute();
		return $stmt;
	}
	//returns a translated string matching the key string from the database
	//short for Get DB String
	function GDS($key){
		global $context_lang,$db;
		return _db_get_pq(
			'SELECT str FROM Translation_'.strtolower($context_lang).' as trans INNER JOIN TranslationKeys as tkeys ON trans.id=tkeys.id WHERE tkeys.name=?',
			 [$key])->fetch()[0];
	}
	//shorthand for Echo DB String
	function EDS($key){
		echo GDS($key);
	}
	//shorthand for Multiple Get DB String and Multiple Echo DB String
	function MGDS($key,$postfixes){
		$result = '';
		foreach($postfixes as $pf){
			$result.=GDS($key.$pf);
		}
		return $result;
	}
	function MEDS($key,$postfixes){
		foreach($postfixes as $pf){
			EDS($key.$pf);
		}
	}
	//returns an array for docs which looks like this:
	//{'title':{'heading':['text',…],…},…}
	function db_get_docs_stuff(){
		global $context_lang;
		
		//getting titles
		$result = array();
		$titles = _db_get_pq("SELECT id,text FROM DocsTitles_$context_lang ORDER BY id ASC",[])->fetchAll();
		foreach($titles as list($tid,$title)){
			//getting corresponding headings
			$tmp = array();
			$headings = _db_get_pq("SELECT id,text FROM DocsHeadings_$context_lang WHERE title_id=? ORDER BY id ASC",[$tid],[PDO::PARAM_INT])->fetchAll();
			foreach($headings as list($hid,$heading)){
				//getting corresponding texts
				$tmp[$heading]=_db_get_pq("SELECT text FROM DocsTexts_$context_lang WHERE heading_id=? ORDER BY text_id",[$hid],[PDO::PARAM_INT])->fetchAll();
			}
			$result[$title]=$tmp;
		}
		
		return $result;
	}
?>