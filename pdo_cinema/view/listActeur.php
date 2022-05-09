<?php ob_start(); ?>

<p class="uk-label uk-label-warning">Il y a <?= $requete->rowCount(); ?> <?= ($requete->rowCount() > 1) ? 'acteurs' : 'acteur'; ?></p>

<table class="uk-table uk-table-stripped">
    <thead>
        <tr>
            <th>Nom<th>
            <th>Prenom<th>
        </tr>
    </thead>
    <tbody>
        <?php
           // var_dump($requete->fetchALL());

            foreach ($requete->fetchAll() as $ligne) { ?>
                <tr>
                    <td><a href="index.php?action=detailActeur&id=<?= $ligne["id_acteur"] ?>"><?= $ligne['nom']; ?></a></td>
                    <td><?= $ligne['prenom']; ?></td>
                </tr>
          <?php }

          $requete = null;

          ?>
    </tbody>
</table>

<?php

$titre = "Acteurs";
$contenu = ob_get_clean();
require 'view/template.php';