<?php
    require_once 'models/food_detail.php'; 
    //date_default_timezone_set('America/Tijuana');
    $response = array();
    if(isset($_GET['ID_ISLAND'])){
        $result = FoodDetail::get_food_status_by_island($_GET['ID_ISLAND']);
        if(count($result)==0){
            $response['STATUS'] = 2;
            $response['MESSAGE'] = 'NO VALUES FOUND';
                
        }else{
            $response['STATUS'] = 0;
            $response['MESSAGE'] = 'SUCCESSFULLY';
            $response['FOOD_STATUS'] = $result;        
        }
    }else{
        $response['STATUS'] = 1;
        $response['MESSAGE'] = 'MISSING PARAMETERS';
    }
    $response['DATETIME'] = date_create();
    echo json_encode($response);
?>