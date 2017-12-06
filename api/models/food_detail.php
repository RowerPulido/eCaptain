<?php
    require_once("Connection.php");
    class FoodDetail
    {
        private $idIsla;
        private $foodName;
        private $foodWeight;
        private $status;
        private $datetime;

        public function get_id_isla() {return $this->idIsla;}
        public function set_id_isla($value) {$this->idIsla = $value;}
        public function get_food_name() { return $this->foodName; }
        public function set_food_name($values) {$this->foodName = $value; }
        public function get_food_weight() {return $this->foodWeight; }
        public function set_food_weight($value) { $this->foodWeight = $value; }
        public function get_status() { return $this->status; }
        public function set_status($value) { $this->status = $value; }
        public function set_datetime($datetime){$this->datetime = $datetime;}
        public function get_datetime(){return $this->datetime;}
        
        public function __construct()
        {
            $arguments = func_get_args();
            if(func_num_args() == 0){
                $this->idIsla = '';
                $this->foodName = '';
                $this->foodWeight = '';
                $this->status = '';
                $this->datetime = date_create();
            }
            if (func_num_args() == 5){
                $this->idIsla = $arguments[0];
                $this->foodName = $arguments[1];
                $this->foodWeight = $arguments[2];
                $this->status = $arguments[3];
                $this->datetime = $arguments[4];
            }
        }

        public function toArray(){
            return array('ID_ISLA' => $this->get_id_isla(),'FOOD_NAME'=>$this->get_food_name(),
            'FOOD_WEIGHT'=>$this->get_food_weight(),'STATUS'=>$this->get_status(),'DATETIME'=>$this->get_datetime());
        }

        //Da error 500 hare el mio
        public static function get_food_by_idIsla($idIsla){
            $list = array();
            $connection = getConnection();
            $query = 'SELECT idfood_detail,id_isla,food_name,food_weight,status,date_time FROM ecaptain.food_detail WHERE id_isla = ?';
            $command = $connection->bind_param($idIsla);
            $command = $connection->preapare($query);
            if($command == false){
                echo "Error in Query";die;
            }
            $command->execute();
            $command->bind_result($id_isla, $food_name, $food_weight, $status,$datetime);
            while($command->fetch()){
                array_push($list, new FoodDetail($id_isla, $food_name, $food_weight, $status,$datetime));
            }
            return $list;
        }

        public static function get_food_status_by_island($idIsland){
            $results = array();
            $connection = getConnection();
            $query = 'SELECT idfood_detail,id_isla,food_name,food_weight,status,date_time FROM ecaptain.food_detail WHERE id_isla = ?';
            $stmt = $connection->prepare($query);
            $stmt->bind_param('i',$idIsland);
            $stmt->execute();
            $stmt->bind_result($idFoodDetail,$id_isla,$food_name,$food_weight,$status,$datetime);
            while ($stmt->fetch()) {
                $fd = new FoodDetail($id_isla, $food_name, $food_weight, $status,$datetime);
                array_push($results, $fd->toArray());                
            }
            return $results;
        }

    }

?>