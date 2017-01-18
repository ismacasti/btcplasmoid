import QtQuick 2.1
import QtQuick.Layouts 1.3
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras



Item{
    id: root
    //spacing: units.smallSpacing
    width: units.gridUnit * 10
    height: units.gridUnit * 4
    
    //Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation
    
    
    Image {
        source: "Bitcoin.svg"
        id: btcIcon
        //Layout.fillHeight: true
        fillMode: Image.PreserveAspectFit
        visible: true
        anchors{
            top: parent.top
            bottom: parent.bottom
        }
    }
    
    PlasmaComponents.Label {
        id: priceLabel;
        font {
            //weight: plasmoid.configuration.boldText ? Font.Bold : Font.Normal
            //italic: plasmoid.configuration.italicText
            pixelSize: 1024
            pointSize: 0 // we need to unset pointSize otherwise it breaks the Text.Fit size mode
        }

        
        text: "Loading...";
        minimumPixelSize: theme.mSize(theme.smallestFont).height
        fontSizeMode: Text.Fit
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        height: parent.height
        width: 0
        anchors {
            left: btcIcon.right
            right: parent.right
            verticalCenter: parent.verticalCenter
            //top: parent.top

        }
    }
    
//     PlasmaComponents.BusyIndicator {
//         anchors.centerIn: parent
//         //whilst the model is loading, stay visible
//         //we use opacity rather than visible to force an animation
//         id: busy
//         Behavior on opacity {
//             PropertyAnimation {
//                 //this comes from PlasmaCore
//                 duration: units.shortDuration
//             }
//         }
//     }
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
        priceLabel.text = "$" + data["last"];
        busy.opacity = 0;
    }
}
    

