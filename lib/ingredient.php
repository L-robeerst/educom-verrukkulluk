<?php
class ingredient {

    private $connection;                        ///always private
    private $art;

    public function __construct($connection, $art) {  ///always public
        $this->connection = $connection;
        $this->artikel = $art;
    }
    public function selecteerIngredient($ingredient_id) { /// pas dit aan naar gerect_id wanneer de class wordt aangemaakt
        $sql = "SELECT * FROM ingredient WHERE gerecht_id = $ingredient_id";
        $sql_result = mysqli_query($this->connection, $sql);
        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            $result[] = $row + $this->retrieveArtikel($row["artikel_id"]);
            }
        return $result;
    }

    private function retrieveArtikel ($artikel_id) {
        return $this->artikel->selecteerArtikel($artikel_id);
    }


}