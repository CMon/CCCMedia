import QtQuick 2.0
import "RequestFunctions.js" as RF

Item {
    id: conferencesModel
    readonly property url apiUrl: "http://api.media.ccc.de/public/conferences"
    property bool loading: false

    onLoadingChanged: if (!loading) console.log(listModel.count + " items in list")

    onVisibleChanged: {
        if (visible) {
            update()
        }
    }

    function update() {
        listModel.clear()
        conferencesModel.loading = true;
        RF.getList(apiUrl, loaded)
    }

    function loaded(jsonObject) {
        for (var conference in jsonObject.conferences) {
            listModel.append({
                                 "acronym"         : jsonObject.conferences[conference].acronym,
                                 "aspect_ratio"    : jsonObject.conferences[conference].aspect_ratio,
                                 "updated_at"      : jsonObject.conferences[conference].updated_at,
                                 "title"           : jsonObject.conferences[conference].title,
                                 "schedule_url"    : jsonObject.conferences[conference].schedule_url,
                                 "webgen_location" : jsonObject.conferences[conference].webgen_location,
                                 "logo_url"        : jsonObject.conferences[conference].logo_url,
                                 "images_url"      : jsonObject.conferences[conference].images_url,
                                 "recordings_url"  : jsonObject.conferences[conference].recordings_url,
                                 "url"             : jsonObject.conferences[conference].url
                             });
        }
        conferencesModel.loading = false
    }

    ListModel {
        id: listModel
    }
}