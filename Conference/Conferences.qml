import QtQuick 2.0

Rectangle {
    width: 10
    height: 10

    ConferencesModel {
        id: conferenceModel
    }
    ConferencesDelegate {
        id: conferenceDelegate
    }
    ListView {
        id: conferenceList
        anchors.fill: parent

        model: conferenceModel.model
        delegate: conferenceDelegate
        cacheBuffer: 100

//        Scrollbar {
//            flickable: podcastList
//            color: "#FFE4C4"
//        }
    }
}
