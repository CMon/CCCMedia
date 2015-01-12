import QtQuick 2.0

Rectangle {
    id: conferencesComponent
    width: 10
    height: 10

    signal conferenceSelected(string url)

    ConferencesModel {
        id: conferencesModel
    }
    ConferencesDelegate {
        id: conferencesDelegate
    }
    ListView {
        id: conferencesList
        anchors.fill: parent

        model: conferencesModel.model
        delegate: conferencesDelegate
        cacheBuffer: 100

//        Scrollbar {
//            flickable: podcastList
//            color: "#FFE4C4"
//        }
    }
}
