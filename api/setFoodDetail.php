<?php
    header('Access-Control-Allow-Origin:*');
	require_once("models/Connection.php");

     if(isset($_GET['id_isla']) && isset($_GET['food_name']) && isset($_GET['food_weight'])){
        $connection = getConnection();
        $query = "INSERT INTO food_detail(id_isla, food_name, food_weight, status, date_time) VALUES (?,?,?,'null',now());";;

        $stmt = $connection->prepare($query);
        $stmt->bind_param('isd',$_GET['id_isla'],$_GET['food_name'],$_GET['food_weight']);
        $success = $stmt->execute();
        if($success){
            echo json_encode(array("STATUS"=>0 , "MESSAGE"=>"Registro exitoso!"));
        }else{
            echo json_encode(array("STATUS"=>2 , "MESSAGE"=>"Fallo al registrar"));
        }
    }else{
        echo json_encode(array("STATUS"=>1 , "MESSAGE"=>"No se mandaron todos los parametros necesarios"));
    }
?>