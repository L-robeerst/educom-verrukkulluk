<?php
class ingredient {

    private $connection;                        ///always private
    private $art;

    public function __construct($connection, $art) {  ///always public
        $this->connection = $connection;
        $this->art = $art;
    }
    public function selecteerIngredient($gerecht_id) { 
        $sql = "SELECT * FROM ingredient WHERE gerecht_id = $gerecht_id";
        $sql_result = mysqli_query($this->connection, $sql);
        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            $result[] = $row + $this->retrieveArtikel($row["artikel_id"]);
            }
        return $result;
    }

    private function retrieveArtikel ($artikel_id) {
        return $this->art->selecteerArtikel($artikel_id);
    }


}