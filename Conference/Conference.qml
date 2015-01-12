import QtQuick 2.0

Rectangle {
    width: 10
    height: 10
    property alias conferenceUrl: conferenceModel.conferenceUrl

    ConferenceModel {
        id: conferenceModel
    }
    ConferenceDelegate {
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
