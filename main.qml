import QtQuick 2.4
import QtQuick.Controls 1.3
import CCCMedia 1.0

import "Conference"

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

    toolBar: ToolBar {
        visible: mainView.state != ViewState.Main

        ToolButton {
            id: backButton
            height: parent.height
            text: qsTr("Back")
            onClicked: {
                if (mainView.state == ViewState.Conference) {
                    mainView.state = ViewState.Conferences ;
                } else {
                    mainView.state = ViewState.Main
                }
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

            onConferences: mainView.state = ViewState.Conferences
            onEvents:      mainView.state = ViewState.Events
            onRecordings:  mainView.state = ViewState.Recordings
            onSettings:    mainView.state = ViewState.Settings
        }

        Conference {
            id: conference
            visible: false
            anchors.fill: parent
            color: "transparent"
        }

        Conferences {
            id: conferences
            visible: false
            anchors.fill: parent
            color: "transparent"

            onConferenceSelected: {
                conference.conferenceUrl = url
                mainView.state = ViewState.Conference
            }
        }

        Events {
            id: events
            visible: false
            anchors.fill: parent
            color: "transparent"
        }

        Recordings {
            id: recordings
            visible: false
            anchors.fill: parent
            color: "transparent"
        }

        Settings {
            id: settings
            visible: false
            anchors.fill: parent
            color: "transparent"
        }

        onStateChanged: {
            mainMenu.visible    = state == ViewState.Main;
            conference.visible  = state == ViewState.Conference;
            conferences.visible = state == ViewState.Conferences;
            events.visible      = state == ViewState.Events;
            recordings.visible  = state == ViewState.Recordings;
            settings.visible    = state == ViewState.Settings;
        }

        states: [
            State { name: ViewState.Main },
            State { name: ViewState.Conference },
            State { name: ViewState.Conferences },
            State { name: ViewState.Events },
            State { name: ViewState.Recordings },
            State { name: ViewState.Settings }
        ]
    }
}
