<?php
//// Allereerst zorgen dat de "Autoloader" uit vendor opgenomen wordt:
require_once("./vendor/autoload.php");

/// Twig koppelen:
$loader = new \Twig\Loader\FilesystemLoader("./templates");
/// VOOR PRODUCTIE:
/// $twig = new \Twig\Environment($loader), ["cache" => "./cache/cc"]);

/// VOOR DEVELOPMENT:
$twig = new \Twig\Environment($loader, ["debug" => true ]);
$twig->addExtension(new \Twig\Extension\DebugExtension());

/******************************/

/// Next step, iets met je data doen. Ophalen of zo
require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/keuken_type.php");
require_once("lib/ingredient.php");
require_once("lib/gerecht_info.php");
require_once("lib/gerecht.php");
require_once("lib/boodschappenlijst.php");
require_once("lib/zoeken.php");
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
$data = $ger->selecteerGerecht();

/*

URL:
http://localhost/index.php?gerecht_id=4&action=detail

*/

$gerecht_id = isset($_GET["gerecht_id"]) ? $_GET["gerecht_id"] : "";
$action = isset($_GET["action"]) ? $_GET["action"] : "homepage";

switch($action) {

        case "homepage": {
            $data = $ger->selecteerGerecht();
            $template = 'homepage.html.twig';
            $title = "homepage";
            break;
        }

        case "detail": {
            $data = $ger->selecteerGerecht($gerecht_id);
            $template = 'detail.html.twig';
            $title = "detail pagina";
            break;
        }

        case "waardering_toevoegen":{
            $waardering = isset($_GET["waardering"]) ? $_GET["waardering"] : 1;
            $inf->addWaardering($gerecht_id, $waardering);
            
            break;
        }

        case "addboodschappenlijst":{
            $bds->boodschappenToevoegen(1, $gerecht_id);
            $data = $bds->selecteerBoodschappenlijst(1);
            $template = 'boodschappenlijst.html.twig';
            $title = "boodschappenlijst";
            break;
        }
        
        case "boodschappenlijst":{
            $data = $bds->selecteerBoodschappenlijst(1);
            $template = 'boodschappenlijst.html.twig';
            $title = "boodschappenlijst";
            break;
        }

        case "zoeken":{
            $zoekterm = isset($_GET["zoekterm"]) ? $_GET["zoekterm"] : "";
            $zoek_functie_result = $zft->zoekFunctie($zoekterm);
            $i = 0;
            $gerecht_id = 0;
            $data = [];
            foreach ($zoek_functie_result as $zoek_stap) {
                $i++;
                if ($zoek_stap != false) {
                    $gerecht_id=$i;
                    $gerecht =$ger->selecteerGerecht($gerecht_id)[0];

                    $data[] = $gerecht;
                }
            }
            $template = 'homepage.html.twig';
            $title = "homepage";
            break;
        }

        /// etc

}


/// Onderstaande code schrijf je idealiter in een layout klasse of iets dergelijks
/// Juiste template laden, in dit geval "homepage"
$template = $twig->load($template);


/// En tonen die handel!
echo $template->render(["title" => $title, "data" => $data]);
