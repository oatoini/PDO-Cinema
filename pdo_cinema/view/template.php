<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $titre ?></title>
</head>
<body>
    <nav>
        <a href="index.php?action=listFilm">Films</a>
        <a href="index.php?action=listActeur">Acteurs</a>
        <a href="index.php?action=listGenre">Genres</a>
        <a href="index.php?action=listRealisateur">Realisateurs</a>
        <a href="index.php?action=listRole">Roles</a>
    </nav>
    <div class="">
        <?= $contenu ?>
    </div>
</body>
</html>