<?php 
    ob_start(); 
    $film = $requete->fetch();

?>

<h1><?= $film["titre_film"] ?></h1>

<p><?= $film["synopsis_film"] ?></p>

<p><strong>Durée du film : </strong><?= $film["dureeHeures"] ?></p>


<p><strong>Sorti le : </strong><?= $film["dateSortie"] ?></p>

<?php $requete = null; ?>


    <h2>Casting</h2>
    <table>
        <thead>
            <tr>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach($requeteCasting->fetchAll() as $ligne)  { ?>
        <tr>
            <td><?= $ligne['nom']; ?></td>
            <td><?= $ligne['prenom']; ?></td>
            <td><?= $ligne['role']; ?><br></td>
        </tr>
        <?php } ?>
        </tbody>
    </table>

    </tbody>
</table>

<?php

$titre = "Détail du film";
$contenu = ob_get_clean();
require 'view/template.php';