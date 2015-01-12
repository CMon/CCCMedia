import QtQuick 2.0
import "../RequestFunctions.js" as RF

Item {
    id: conferencesModel
    property variant model: listModel
    property url conferenceUrl: ""
    property bool loading: false

    onLoadingChanged: if (!loading) console.log(listModel.count + " items in list")

    onConferenceUrlChanged: {
        if (conferenceUrl != "") {
            update()
        }
    }

    function compareConference(lhs, rhs) {
        if (lhs.release_date < rhs.release_date) return  1;
        if (lhs.release_date > rhs.release_date) return -1;
        return 0;
    }

    function update() {
        listModel.clear()
        conferencesModel.loading = true;
        RF.getList(conferenceUrl, loaded)
    }

    function loaded(jsonObject) {
        var objects = []
//                "acronym":"31c3-sendezentrum",
//                "aspect_ratio":"16:9",
//                "updated_at":"2015-01-02T10:31:59.281+01:00",
//                "title":"31c3 Sendezentrum","schedule_url":
//                "http://c3voc.de/share/sendezentrum.schedule.xml",
//                "webgen_location":"broadcast/sendezentrum",
//                "logo_url":"http://media.ccc.de/images/logos/broadcast/sendezentrum/sendezentrum.png",
//                "images_url":"http://static.media.ccc.de/media/broadcast/sendezentrum",
//                "recordings_url":"http://cdn.media.ccc.de/broadcast/sendezentrum",
//                "url":"http://api.media.ccc.de/public/conferences/56",
//                "events":[{
//                    "guid":"8a908634-6d94-4183-beaf-9bfb3f82648c",
//                    "title":"Workshop: Ultraschall: Die Zukunft",
//                    "subtitle":"",
//                    "slug":"1011",
//                    "link":null,
//                    "description":"",
//                    "persons":[],
//                    "tags":[],
//                    "date":null,
//                    "release_date":"2015-01-02",
//                    "updated_at":"2015-01-12T18:42:26.546+01:00",
//                    "length":3572,
//                    "thumb_url":"http://static.media.ccc.de/media/broadcast/sendezentrum/1011-hd.jpg",
//                    "poster_url":"http://static.media.ccc.de/media/broadcast/sendezentrum/1011-hd_preview.jpg",
//                    "frontend_link":"http://media.ccc.de/browse/broadcast/sendezentrum/1011.html",
//                    "url":"http://api.media.ccc.de/public/events/2287",
//                    "conference_url":"http://api.media.ccc.de/public/conferences/56"
//                }]
        for (var event in jsonObject.events) {
            objects.push({
                             "title"        : jsonObject.events[event].title,
                             "release_date" : jsonObject.events[event].release_date,
                             "thumb_url"    : jsonObject.events[event].thumb_url,
                             "description"  : jsonObject.events[event].description,
                             "persons"      : jsonObject.events[event].thumb_url,
                             "url"          : jsonObject.events[event].url
                         });
        }

        objects.sort(compareConference)

        listModel.append(objects)
        conferencesModel.loading = false
    }

    ListModel {
        id: listModel
    }
}
