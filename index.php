<?php

require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/keuken_type.php");
require_once("lib/ingredient.php");
/// INIT
$db = new database();
$art = new artikel($db->getConnection());
$usr = new user($db->getConnection());
$kte = new keuken_type($db->getConnection());
$ing = new ingredient($db->getConnection(), $art);


/// VERWERK 
$testData = $ing->selecteerIngredient(1);

/// RETURN
var_dump($testData);