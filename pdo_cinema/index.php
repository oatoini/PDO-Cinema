<?php

use Controller\ActeurController;
use Controller\FilmController;
use Controller\GenreController;
use Controller\RealisateurController;
use Controller\RoleController;

spl_autoload_register(function ($class_name) {
    include $class_name.'.php';
});

$ctrlActeur = new ActeurController();
$ctrlFilm = new FilmController();
$ctrlGenre = new GenreController();
$ctrlRealisateur = new RealisateurController();
$ctrlRole = new RoleController();

if(isset($_GET["action"])){
    switch($_GET["action"]){

        case "listFilm": $ctrlFilm->requeteListFilm(); break;
        case "detailFilm": $ctrlFilm->detailFilm($_GET["id"]); break;
        case "listActeur": $ctrlActeur->requeteListActeur(); break;
        case "detailActeur": $ctrlActeur->detailActeur($_GET["id"]); break;
        case "listGenre": $ctrlGenre->requeteListGenre(); break;
        case "listRealisateur": $ctrlRealisateur->requeteListRealisateur(); break;
        case "detailRealisateur": $ctrlRealisateur->detailRealisateur($_GET["id"]); break;
        case "listRole": $ctrlRole->requeteListRole(); break;

    }
} else {
    $ctrlFilm->requeteListFilm();
}