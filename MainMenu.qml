import QtQuick 2.0

Rectangle {
    id: root

    signal conferences
    signal events
    signal recordings
    signal settings

    Grid {
        columns: 2
        anchors.centerIn: parent
        spacing: Math.min(tileWidth / 3, tileHeight / 3)

        TileButton {
            text: qsTr("Conferences")
            width: tileWidth
            height: tileHeight

            onClicked: root.conferences()
        }

        TileButton {
            text: qsTr("Events")
            width: tileWidth
            height: tileHeight

            onClicked: root.events()
        }

        TileButton {
            text: qsTr("Recordings")
            width: tileWidth
            height: tileHeight

            onClicked: root.recordings()
        }

        TileButton {
            text: qsTr("Settings")
            width: tileWidth
            height: tileHeight

            onClicked: root.settings()
        }
    }
}
