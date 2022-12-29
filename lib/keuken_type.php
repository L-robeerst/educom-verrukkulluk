<?php

class keuken_type {

    private $connection;                        ///always private

    public function __construct($connection) {  ///always public
        $this->connection = $connection;
    }
  
    public function selecteerKeukenType($keuken_type_id) { /// depends on the class wether public or private (left or right asd)
        $sql = "SELECT * FROM keuken_type WHERE id = $keuken_type_id";
        $result = mysqli_query($this->connection, $sql);
        $keuken_type = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($keuken_type);

    }


}
