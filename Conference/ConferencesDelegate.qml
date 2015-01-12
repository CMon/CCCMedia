import QtQuick 2.0

import "../"

Component {
    id: conferenceDelegate

    Item {
        id: conference
        width: conferenceList.width
        height: 60

        // A simple rounded rectangle for the background
        Rectangle {
            x: 1
            y: 1
            width: parent.width - x*2;
            height: parent.height - y*2
            color: "black"
            border.color: "grey"
            radius: 5
            opacity: index % 2 ? 0.2 : 0.3
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Open Conference: ", url)
            }
        }

        Row {
            x: 10
            height: 50
            width: parent.width
            spacing: 5
            anchors.verticalCenter: parent.verticalCenter

            LoadingImageItem {
                id: image
                width: parent.height
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                source: logo_url
            }

            Text {
                id: txt
                x: 2
                text: title
                textFormat: Qt.RichText
                color: "white"
                style: Text.Raised
                styleColor: "grey"
                wrapMode: Text.WordWrap
            }
        }
    }
}
