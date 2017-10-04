<?php
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