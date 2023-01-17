<?php
class zoeken{

    private $connection; ///always private
    private $ger;

    public function __construct($connection, $ger)
    { ///always public
        $this->connection = $connection;
        $this->ger = $ger;
    }
    public function zoekFunctie($keyword){
        $data = $this->retrieveGerecht();
        $gerecht_keuze = [];
        foreach ($data as $gerecht){
        $json_data = json_encode($gerecht);
        $test=strpos($json_data, $keyword, $offset = 0);
        array_push($gerecht_keuze, $test);  
        }
    return $gerecht_keuze;
    }


    private function retrieveGerecht(){
        return $this->ger->selecteerGerecht();
    }
    
}