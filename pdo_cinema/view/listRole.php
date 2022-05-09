<?php ob_start(); ?>

<p class="uk-label uk-label-warning">Il y a <?= $requete->rowCount(); ?> <?= ($requete->rowCount() > 1) ? 'roles' : 'role'; ?></p>

<table class="uk-table uk-table-stripped">
    <thead>
        <tr>
            <th>Role<th>
        </tr>
    </thead>
    <tbody>
        <?php
           // var_dump($requete->fetchALL());

            foreach ($requete as $ligne) { ?>
                <tr>
                    <td><?= $ligne['roles']; ?></td>
                </tr>
          <?php }

          $requete = null;

          ?>
    </tbody>
</table>

<?php

$titre = "Role";
$contenu = ob_get_clean();
require 'view/template.php';