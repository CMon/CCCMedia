import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    id: root

    signal back

    Rectangle {
        id: navigation
        height: root.height / 15
        width: parent.width
        color: "transparent"

        Row {
            anchors.fill: parent
            Button {
                id: backButton
                height: parent.height

                text: qsTr("Back")

                onClicked: root.back()
            }
        }
    }

    Rectangle {
        id: pageContent
        color: "transparent"
        anchors {
            top:    navigation.bottom
            bottom: parent.bottom
            left:   parent.left
            right:  parent.right
        }
    }
}
