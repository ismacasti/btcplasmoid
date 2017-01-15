import QtQuick 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    PlasmaComponents.Label {
        text: "Loading...";
        id: label;
        anchors.centerIn: parent
    }
    
    Component.onCompleted: {
        getData();
    }
    
    function getData() {
        var xmlhttp = new XMLHttpRequest();
        var url = "https://www.bitstamp.net/api/v2/ticker/btcusd/";
        
        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                parseData(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }
    
    function parseData(response){
        var data = JSON.parse(response);
        label.text = data["last"]
    }
}
