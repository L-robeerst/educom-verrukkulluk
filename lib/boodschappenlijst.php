<?php
class boodschappenlijst{
    private $connection;
    private $ing;
    private $art;
    public function __construct($connection, $ing, $art) {  ///always public
        $this->connection = $connection;
        $this->ing = $ing;
        $this->art = $art;
    }


    public function selecteerBoodschappenlijst($user_id) { /// depends on the class wether public or private (left or right asd)
        $sql = "SELECT * FROM boodschappenlijst WHERE user_id = $user_id";
        $sql_result = mysqli_query($this->connection, $sql);
        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            $result[] = $row + $this->retrieveArtikel($row["artikel_id"]);
            }
        return $result;

    }
   public function boodschappenToevoegen($user_id, $gerecht_id){
    
            $ingredienten = $this->retrieveIngredient($gerecht_id);

            foreach($ingredienten as $ingredient){
            $bestaat = $this->boodschappenCheck( $user_id, $ingredient["artikel_id"]);
                if ($bestaat){
                 $this->artikelBijwerken($bestaat, $ingredient);
                 } else {  
                $this->artikelToevoegen($user_id ,$ingredient);
                }
                }
             }


   public function boodschappenCheck ($user_id, $artikel_id) {            
    $boodschappen = $this-> boodschappenlijstOphalen($user_id);

        foreach ($boodschappen as $boodschap){
            if ($boodschap["artikel_id"] == $artikel_id){
                return $boodschap;
            }
        } 
        
        return false;
    }



   public function boodschappenlijstOphalen($user_id){
    $sql = "SELECT * FROM boodschappenlijst WHERE user_id = $user_id";
    
    $sql_result = mysqli_query($this->connection, $sql);
    $user_boodschappenlijst=[];
    while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            $user_boodschappenlijst[] = $row;
        }

    return($user_boodschappenlijst);
    
   }

   

   public function artikelBijwerken($bestaat, $ingredient){
    $artikel_id = $ingredient["artikel_id"];
    $nieuw_aantal = $bestaat['aantal']+1;
    $user_id = $bestaat['user_id'];            
    $sql= "UPDATE boodschappenlijst SET aantal = '$nieuw_aantal' WHERE user_id = '$user_id' AND artikel_id = '$artikel_id'";
    $sql_result = mysqli_query($this->connection, $sql); 
    return($sql_result);
   }


   
   public function artikelToevoegen($user_id, $ingredient){
    $artikel_id = $ingredient["artikel_id"];
    $sql = "INSERT INTO boodschappenlijst (user_id, artikel_id, aantal) VALUES ('$user_id', '$artikel_id', '1')";
    $sql_result = mysqli_query($this->connection, $sql);
    return($sql_result);
   }
   private function retrieveIngredient ($gerecht_id) {
    return $this->ing->selecteerIngredient($gerecht_id);
}

    private function retrieveArtikel ($artikel_id) {
        return $this->art->selecteerArtikel($artikel_id);
    }
}

