/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var currentDateLong = new Date(); //Récupération de la date courrante
var annee = currentDateLong.getFullYear();
var mois = currentDateLong.getMonth() + 1;
var jour = currentDateLong.getDate();
var currentDate = jour + "/" + mois + "/" + annee;
document.getElementById('currentDateString').innerHTML = currentDate;

function showThis(_div) {
    var obj = document.getElementById(_div);
    obj.style.display = "block";
}

function hideThis(_div) {
    var obj = document.getElementById(_div);
    obj.style.display = "none";
}

function onDeviceReady() {
    navigator.geolocation.getCurrentPosition(onSuccess, onError);
}


function onSuccess(position) {
    var text = document.getElementById('location');
    text.value="";
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    
    var reverseGeocoder = new google.maps.Geocoder();
    var currentPosition = new google.maps.LatLng(latitude, longitude);
    reverseGeocoder.geocode({'latLng': currentPosition}, function(results, status) {
 
            if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                    text.value+= results[0].formatted_address ;
                    }
            else {
                    console.log('Unable to detect your address.');
                    }
        } else {
            console.log('Unable to detect your address.');
        }
    });
    
}

function onError(error) {
    alert('code: ' + error.code + '\n' +
            'message: ' + error.message + '\n');
}

