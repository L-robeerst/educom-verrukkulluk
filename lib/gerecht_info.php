<?php
class gerecht_info {

    private $connection;                        ///always private
    private $usr;

    public function __construct($connection, $usr) {  ///always public
        $this->connection = $connection;
        $this->usr = $usr;
    }
    public function selecteerGerechtInfo($gerecht_id, $record_type) {
        $sql = "SELECT * FROM gerecht_info WHERE gerecht_id = $gerecht_id AND record_type = '$record_type'  ";
        $sql_result = mysqli_query($this->connection, $sql);
        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            if ($record_type == "o" || $record_type == "f") {
                $result[] = $row + $this->retrieveUser($row["user_id"]);
            } else {
                $result[] = $row;
            }
        }
        return $result;
    }

    private function retrieveUser ($user_id) {
        return $this->usr->selecteerUser($user_id);
    }

    public function addFavorite ($gerecht_id, $user_id) { ///false toevoegen
        $bestaat = $this -> favoriteCheck ($gerecht_id, $user_id);
        if ($bestaat){
            return;
        }
        $sql = "INSERT INTO gerecht_info (record_type, gerecht_id, user_id) VALUES ('f', '$gerecht_id', '$user_id')";
        $sql_result = mysqli_query($this->connection, $sql);
    }

    public function deleteFavorite ($gerecht_id, $user_id) {/// true wissen
        $sql = "DELETE FROM gerecht_info WHERE gerecht_id = $gerecht_id AND user_id = $user_id AND record_type = 'f'";
        $sql_result = mysqli_query($this->connection, $sql);
    }
    public function favoriteCheck ($gerecht_id, $user_id) {            /// returns true or false
        $sql = "SELECT * FROM gerecht_info WHERE record_type = 'f' and gerecht_id = $gerecht_id and user_id = $user_id";
        $sql_result = mysqli_query($this->connection, $sql);

        $fcheck = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);
        
        echo var_dump ($fcheck);
        if ($fcheck !== null) {
            return true;                        /// return stopt de code
        }
        return false; 
    
    }
    public function addWaardering ($gerecht_id, $waardering) {

        $sql = "INSERT INTO gerecht_info (record_type, gerecht_id, nummeriekveld) VALUES ('w', '$gerecht_id', '$waardering')";
        $sql_result = mysqli_query($this->connection, $sql);
    }
    
}