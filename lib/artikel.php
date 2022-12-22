<?php

class artikel {

    private $connection;                        ///always private

    public function __construct($connection) {  ///always public
        $this->connection = $connection;
    }
  
    public function selecteerArtikel($artikel_id) { /// depends on the class wether public or private (left or right asd)
        $sql = "select * from artikel where id = $artikel_id";
        
    
        $result = mysqli_query($this->connection, $sql);
        $artikel = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($artikel);

    }


}
