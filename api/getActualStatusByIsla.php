<?php
    require_once __DIR__. '/models/food_detail.php';
    $response = array();
    if(isset($_GET['ID_ISLAND'])){
        $fd = FoodDetail::getActualStatusByIslandId($_GET['ID_ISLAND']);
        if(count($fd)>0){
            $response['STATUS'] = 0;
            $response['MESSAGE'] = 'SUCCESS';
            $response['STATS'] = $fd->toArray(); 
        }else{
            $response['STATUS'] = 2;
            $response['MESSAGE'] = 'ISLAND WAS NOT FOUND';    
        }
    }else{
        $response['STATUS'] = 1;
        $response['MESSAGE'] = 'MISSING PARAMETERS';
    }
    echo json_encode($response);
?>