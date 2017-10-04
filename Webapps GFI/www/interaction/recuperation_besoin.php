<?php

$results = recup_besoin();
$jsonresult = json_encode($results);
echo $jsonresult;

//Fonction de récupération des besoins 
function recup_besoin() {
    try {
         $db = new PDO('mysql:host=localhost;dbname=id3137637_snapat;', 'id3137637_admingfi', 'adminadmin');
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
    $sql = 'SELECT bsn.title, bsn.dateCreation, clt.name, bsn.status FROM besoin as bsn INNER JOIN client as clt on clt.id = bsn.id_client';
    $result = $db->query($sql);
    $row = $result->fetchAll();
   
    return $row;

}

?>