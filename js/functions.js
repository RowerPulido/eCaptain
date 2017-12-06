const URL_GET_STATUS_CONTAINER = 'http://localhost:8080/eCaptain/api/getStatusByIsla.php';
const URL_GET_ACTUAL_STATUS_CONTAINER = 'http://localhost:8080/eCaptain/api/getActualStatusByIsla.php';
const GREEN_TEAL = '#009688';
const ORANGE = '#FF9800';
const RED = '#DD2C00';

const MAX_WEIGHT = 20;

//Values to graphs
var dataPoints = [];

// Widgets
var chart;
var stats;

function init() {
    chart = new CanvasJS.Chart("graph", {
        theme: "light2",
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

    stats = new SVG('actualStats').size('100%','100%');

    updateData();
}

function addData(data) {
    if(data.STATUS == 0 ){
        if(data.FOOD_STATUS.length > dataPoints.length) {
            for (let i = dataPoints.length; i < data.FOOD_STATUS.length; i++) {
                const value = data.FOOD_STATUS[i];
                dataPoints.push({x : new Date(value.DATETIME), y: value.FOOD_WEIGHT });
            }
        }
        chart.render();
    }
    setTimeout(updateData, 1000);
}

function updateStats(actualStats) {
    stats.rect('100%','100%').fill('#ECEFF1').radius('5%');
    if(actualStats.STATUS == 0 ){
        const STATS = actualStats.STATS;
        let percentage = STATS.FOOD_WEIGHT * 100 / MAX_WEIGHT;
        let ACTUAL_WEIGHT_COLOR = ORANGE;
        switch (true) {
            case (percentage>=0  && percentage<= 30):
                ACTUAL_WEIGHT_COLOR = RED;
                break;
            case (percentage>30  && percentage < 70):
                ACTUAL_WEIGHT_COLOR = ORANGE;
                break;
            case (percentage>=70):
                ACTUAL_WEIGHT_COLOR = GREEN_TEAL;
                break;
            default:
                alert("none" + percentage);
                break;
        }
        stats.rect('100%',percentage+'%').fill(ACTUAL_WEIGHT_COLOR).radius('5%').move(0,(100 - percentage)+'%').mouseover(
            function(){
                this.animate().rotate(360).skew(25, 5);
                //this.animate().rotate(-45).skew(25, 0);
            }
        );
        stats.text(percentage+'%').move('40%','80%').font({ fill: '#FFF', family: 'Arial',size :30 })
        document.getElementById('tdTittle').innerHTML = STATS.FOOD_NAME;
        document.getElementById('tdWeight').innerHTML = STATS.FOOD_WEIGHT;
        document.getElementById('tdPercentage').innerHTML = percentage + '%';
        document.getElementById('tdTime').innerHTML = getTimeFormat(STATS.DATETIME);
    }
}

function updateData() {
    $.getJSON(URL_GET_STATUS_CONTAINER+'?ID_ISLAND=1', addData);
    $.getJSON(URL_GET_ACTUAL_STATUS_CONTAINER+'?ID_ISLAND=1',updateStats);
}

function addZero(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}

function getTimeFormat(date) {
    var d = new Date(date);
    var h = addZero(d.getHours());
    var m = addZero(d.getMinutes());
    var s = addZero(d.getSeconds());
    return h + ":" + m + ":" + s;
}