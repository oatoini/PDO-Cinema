<?php 
    ob_start(); 
    $realisateur = $requete->fetch();

?>

<h1><?= $realisateur["nom_realisateur"] ?></h1>
<?php $requete = null; 

?>


    <table>
        <thead>
            <tr>
                <th>Titre</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach($requeteFilmographie->fetchAll() as $ligne)  { ?>
        <tr>
            <td><?= $ligne['titre']; ?></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>
    
    </tbody>
</table>

<?php

$titre = "Détail Realisateur";
$contenu = ob_get_clean();
require 'view/template.php';