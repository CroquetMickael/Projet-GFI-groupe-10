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
    
    console.log(position );
    
}

function onError(error) {
        alert('code: '    + error.code    + '\n' +
              'message: ' + error.message + '\n');
    }
