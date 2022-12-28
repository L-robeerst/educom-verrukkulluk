<?php

class user {

    private $connection;                        ///always private
    private $user; 

    public function __construct($connection) {  ///always public
        $this->connection = $connection;
    }
  
    public function selecteerUser($user_id) { /// depends on the class wether public or private (lef or rigth asd)
        $sql = "SELECT * FROM user WHERE id = $user_id";
    
        $result = mysqli_query($this->connection, $sql);
        $user = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($user);

    }


}