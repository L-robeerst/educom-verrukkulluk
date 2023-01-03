<?php

class gerecht {
    private $connection;                        ///always private
    private $kte;
    private $ing;
    private $usr;
    private $inf;

    public function __construct($connection, $usr, $inf, $kte, $ing) {  ///always public
        $this->connection = $connection;
        $this->usr = $usr;
        $this->kte = $kte;
        $this->ing= $ing;
        $this->inf= $inf;

    }
    public function selecteerGerecht($gerecht_id) { 
        $sql = "SELECT * FROM gerecht WHERE id = $gerecht_id";
        $sql_result = mysqli_query($this->connection, $sql);
        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);

        $result["user"] = $this->retrieveUser($result["user_id"]);
        $result["ingredient"] = $this->retrieveIngredient($result["id"]);
        
        $result["keuken"] = $this->retrieveKeuken($result["keuken_id"]);
        $result["type"] = $this->retrieveKeuken($result["type_id"]);

        $result["bereiding"] = $this->retrieveBereiding($result["id"]);
        $result["opmerkingen"] = $this->retrieveOpmerkingen($result["id"]);
        $result["waardering"] = $this->retrieveWaardering($result["id"]);
        $result["favoriet"] = $this->retrieveFavoriet($result["id"]);

        $result["totaal_prijs"] = $this->calculatePrijs($result["id"]);
        $result["totaal_calorieen"] = $this->calculateCalorie($result["id"]);
        return $result;
    }

    private function retrieveIngredient ($gerecht_id) {
        return $this->ing->selecteerIngredient($gerecht_id);
    }

    private function retrieveKeuken ($keuken_id) {
        return $this->kte->selecteerKeukenType($keuken_id);
    }

    private function retrieveType ($type_id) {
        return $this->kte->selecteerKeukenType($type_id);
    }

    private function retrieveUser ($user_id) {
        return $this->usr->selecteerUser($user_id);
    }

    private function retrieveBereiding ($gerecht_id) {
        return $this->inf->selecteerGerechtInfo ($gerecht_id, "b");
    }

    private function retrieveOpmerkingen ($gerecht_id) {
        return $this->inf->selecteerGerechtInfo ($gerecht_id, "o");
    }
    
    private function retrieveWaardering ($gerecht_id) {
        return $this->inf->selecteerGerechtInfo ($gerecht_id, "w");
    }

    private function retrieveFavoriet ($gerecht_id) {
        return $this->inf->selecteerGerechtInfo ($gerecht_id, "f");
    }

    private function calculateCalorie ($gerecht_id) {
        $ingredients = $this->retrieveIngredient($gerecht_id);
        $totalcalories = 0;
        $i = 0;
        while ($i < count($ingredients)) {
            $artikel_calories = $ingredients[$i]["calorien"] * ($ingredients[$i]["aantal"] / $ingredients[$i]["verpakking"]);
            $totalcalories = $totalcalories + $artikel_calories;
            $i++;

            }
            return $totalcalories;
    }

    private function calculatePrijs ($gerecht_id) {
        $ingredients = $this->retrieveIngredient($gerecht_id);
        $totalprijs = 0;
        $i = 0;
        while ($i < count($ingredients)) {
                    $aantalverpakkingen = ceil($ingredients[$i]["aantal"]/$ingredients[$i]["verpakking"]);
                    $artikel_prijs = ($ingredients[$i]["prijs"] * $aantalverpakkingen);
                    $totalprijs = $totalprijs + $artikel_prijs;
                    $i++;
            }
        return $totalprijs;
    }
}