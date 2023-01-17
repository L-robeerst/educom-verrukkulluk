<?php

require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/keuken_type.php");
require_once("lib/ingredient.php");
require_once("lib/gerecht_info.php");
require_once("lib/gerecht.php");
require_once("lib/boodschappenlijst.php");
require_once("lib/zoeken.php");


/// INIT
$db = new database();
$connect = $db->getConnection();
$art = new artikel($connect);
$usr = new user($connect);
$kte = new keuken_type($connect);
$ing = new ingredient($connect, $art);
$inf = new gerecht_info($connect, $usr);
$ger = new gerecht($connect, $usr, $inf, $kte, $ing);
$bds = new boodschappenlijst($connect, $ing, $art);
$zft = new zoeken($connect, $ger);


/// VERWERK 
$testData = $zft->zoekFunctie("Vegan");
/// RETURN
echo "<pre>";
var_dump($testData);
echo "</pre>";