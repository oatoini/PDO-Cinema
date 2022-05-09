<?php 
    ob_start(); 
    $acteur = $requete->fetch();

?>

<h1><?= $acteur["nom_acteur"] ?></h1>
<?php $requete = null; ?>


    <table>
        <thead>
            <tr>
                <th>Titre</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach($requeteFilmographie->fetchAll() as $ligne)  { ?>
        <tr>
            <td><?= $ligne['titre']; ?></td>
            <td><?= $ligne['role']; ?><br></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>
    
    </tbody>
</table>

<?php

$titre = "Détail Acteur";
$contenu = ob_get_clean();
require 'view/template.php';