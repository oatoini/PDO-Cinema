<?php ob_start(); ?>

<p class="uk-label uk-label-warning">Il y a <?= $requete->rowCount(); ?> <?= ($requete->rowCount() > 1) ? 'films' : 'film'; ?></p>

<table class="uk-table uk-table-stripped">
    <thead>
        <tr>
            <th>Films<th>
            <th>Durée<th>
        </tr>
    </thead>
    <tbody>
        <?php
           // var_dump($requete->fetchALL());

            foreach ($requete->fetchAll() as $ligne) { ?>
                <tr>
                    <td><a href="index.php?action=detailFilm&id=<?= $ligne["id_film"] ?>"><?= $ligne['titre']; ?></a></td>
                    <td><?= $ligne['dureeHeures']; ?></td>
                </tr>
          <?php }

          $requete = null;

          ?>
    </tbody>
</table>

<?php

$titre = "Films";
$contenu = ob_get_clean();
require 'view/template.php';
