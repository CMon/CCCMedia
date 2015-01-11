import QtQuick 2.0

Rectangle {
    id: root
    border.width: 5
    border.color: "grey"
    radius: 10

    property alias text: label.text
    signal clicked

    Text {
        id: label
        text: qsTr("Tile")
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}

