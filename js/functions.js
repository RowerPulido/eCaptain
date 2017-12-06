const URL_GET_STATUS_CONTAINER = 'http://localhost:8080/eCaptain/api/getStatusByIsla.php';

var dataPoints = [];
var chart;

function init() {
    //console.log("Hola Mundo")
    chart = new CanvasJS.Chart("graph", {
        theme: "light",
        title: {
            text: "Consumo"
        },
        axisX : {
            valueFormatString : "hh:mm TT",
            labelAngle : -50,
            crosshair : {
                enabled: true,
                color: "blue",
                labelFontColor: "#F8F8F8"
            }
        },
        axisY : {
            valueFormatString : "#,##0.00",
            crosshair : {
                enabled: true,
                color: "orange",
                labelFontColor: "#F8F8F8"
            }
        },
        data: [{
            type: "line",
            dataPoints: dataPoints
        }]
    });
    updateData();
}

// Initial Values
var xValue = 0;
var yValue = 10;

function addData(data) {
    if(data.STATUS == 0 ){
        
        if(data.FOOD_STATUS.length > dataPoints.length) {
            $.each(data.FOOD_STATUS, function(key, value) {
                // dataPoints.push({x: value[0], y: parseInt(value[1])});
                dataPoints.push({x : new Date(value.DATETIME), y: value.FOOD_WEIGHT });
                xValue++;
                yValue = parseInt(value.FOOD_WEIGHT);
            });
        } else {
            //dataPoints.shift();
            
            // dataPoints.push({x: new Date(data.FOOD_STATUS[0].DATETIME), y: parseInt(data.FOOD_STATUS[0].FOOD_WEIGHT)});
            // xValue++;
            // yValue = parseInt(data.FOOD_STATUS[0].FOOD_WEIGHT);
        }
        
        chart.render();
        setTimeout(updateData, 1500);
    }
}

function updateData() {
    //console.log('Entra');
	$.getJSON(URL_GET_STATUS_CONTAINER+'?ID_ISLAND=1', addData);
    //addData([[0,6],[1,11],[2,8],[3,12],[4,11],[5,14]]);
}
