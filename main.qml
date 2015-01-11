import QtQuick 2.4
import QtQuick.Controls 1.3
import CCCMedia 1.0

ApplicationWindow {
    title: qsTr("CCC media")
    width: 640
    height: 480
    visible: true

    property int tileWidth: width / 3
    property int tileHeight: height / 3

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    Rectangle {
        id: mainView
        anchors.fill: parent
        color: "#2F2F2F"
        state: ViewState.Main

        MainMenu {
            id: mainMenu
            visible: false
            anchors.fill: parent
            color: "transparent"

            onConference: mainView.state = ViewState.Conferences
            onEvents:     mainView.state = ViewState.Events
            onRecordings: mainView.state = ViewState.Recordings
            onSettings:   mainView.state = ViewState.Settings
        }

        Conferences {
            id: conferences
            visible: false
            anchors.fill: parent
            color: "transparent"

            onBack: mainView.state = ViewState.Main
        }

        Events {
            id: events
            visible: false
            anchors.fill: parent

            onBack: mainView.state = ViewState.Main
        }

        Recordings {
            id: recordings
            visible: false
            anchors.fill: parent

            onBack: mainView.state = ViewState.Main
        }

        Settings {
            id: settings
            visible: false
            anchors.fill: parent

            onBack: mainView.state = ViewState.Main
        }

        onStateChanged: {
            mainMenu.visible    = state == ViewState.Main;
            conferences.visible = state == ViewState.Conferences;
            events.visible      = state == ViewState.Events;
            recordings.visible  = state == ViewState.Recordings;
            settings.visible    = state == ViewState.Settings;
        }

        states: [
            State { name: ViewState.Main },
            State { name: ViewState.Conferences },
            State { name: ViewState.Events },
            State { name: ViewState.Recordings },
            State { name: ViewState.Settings }
        ]
    }

}
