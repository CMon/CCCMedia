import QtQuick 2.0

Rectangle {
    id: root
    width: 50
    height: 50

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

