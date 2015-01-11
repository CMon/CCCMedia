.pragma library

function getList(url, callback) {
    console.log("updating " + url)
    var xhr = new XMLHttpRequest();

    xhr.open("GET", url, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == xhr.DONE) {
            if (xhr.status == 200) {
                callback(JSON.parse(xhr.responseText))
            } else if (xhr.status == 0) {
                console.log("Error: ", xhr.status, xhr.statusText);
            }
        } else if (xhr.status != 200) {
            console.log("Error: ", xhr.status)
        }
    }
    xhr.send();
}
