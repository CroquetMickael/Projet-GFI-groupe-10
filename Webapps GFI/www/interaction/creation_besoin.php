<?php



//Connexion à la Bdd
try
{
     $bdd = new PDO('mysql:host=localhost;dbname=id3137637_snapat;', 'id3137637_admingfi', 'adminadmin');
} catch (Exception $e) {
    die('Erreur : '.$e->getMessage());
}
//génération de la currentDate au bon pattern (YYYY-mm-dd)
$date = new DateTime();
$date->format('Y-m-d');

//Récupération des valeurs entrée dans les text_input coté html.
$title = $_POST['title'];
$contactName = $_POST['contactName'];
$dateCreation = $date;
$fullDescription = $_POST['description'];
$duration = $_POST['duration'];
$durationFrequence = $_POST['durationFrequence'];
$startAtTheLatest = $_POST['startAtTheLatest'];
$location = $_POST['location'];
$rate = $_POST['rate'];
$statut = $_POST['statut'];
$idClient = 1;
$idCommercial = 1;


        
//Requete d'insertion dans la table besoin 
$req = $bdd->prepare('INSERT INTO besoin(title, contactName, GETDATE(), fullDescription, duration, durationFrequence, startAtTheLatest, location, rate, statut, id_client, id_commercial)'
        . ' VALUES(:title, :contactName, :dateCreation, :fullDescription, :duration, :durationFrequence, :startAtTheLatest, :location, :rate, :statut, :id_client, :id_commercial)');
$req->execute(array(
	'title' => $title,
	'contactName' => $contactName,
	'dateCreation' => $dateCreation,
	'fullDescription' => $fullDescription,
	'duration' => $duration,
	'durationFrequence' => $durationFrequence,
        'startAtTheLatest' => $startAtTheLatest,
        'location' => $location,
        'rate' => $rate,
        'statut' => $statut,
        'id_client' => $idClient,
        'id_commercial' => $idCommercial,
	));


//Gestion des fichiers
if (isset($_FILES['inputFile']) AND $_FILES['inputFile']['error'] == 0)
{
    if ($_FILES['inputFile']['size'] <= 1000000)
        {
            $infosfichier = pathinfo($_FILES['inputFile']['name']);
                $extension_upload = $infosfichier['extension'];
                $extensions_autorisees = array('jpg', 'jpeg', 'gif', 'png', 'csv', 'xls', 'xlsx', 'doc', 'docx', 'txt');
                if (in_array($extension_upload, $extensions_autorisees))
                {
                    move_uploaded_file($_FILES['inputFile']['tmp_name'], basename($_FILES['monfichier']['name']));
                        echo "L'envoi a bien été effectué !";
                }
        }
}
?>