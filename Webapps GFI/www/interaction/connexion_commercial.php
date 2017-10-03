<?php
$login = $_POST['email'];
$password = $_POST['password'];

$ok = 1;
$erreur = 0;

if (($login == '') || ($password == '')) { //On renvoie la liste des conteneurs
    echo $erreur;
} else {
    $results = compare_commercial($login, $password);

    if (count($results) != 0) {
        echo $ok;
    } else {
        echo $erreur;
    }
}

//Fonction de test commercial
function compare_commercial($prmlogin, $prmpassword)
{
    try
    {
        $db = new PDO('mysql:host=localhost;dbname=snapat;', 'root', '');
    }
catch (PDOException $e)
    {
        echo $e->getMessage();
    }
        $sql = 'SELECT * FROM commercial WHERE login = ? AND password =?';
        $preparesql = $db->prepare($sql);
        $preparesql->execute($prmlogin, $prmpassword);
        $donnes = $preparesql->fetch();

        return $donnes;
    }

?>