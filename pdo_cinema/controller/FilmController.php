<?php

namespace Controller;

use Model\Connect;

class FilmController {
    /**
     * Lister les films.
     */
    public function requeteListFilm(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query('
            SELECT id_film, titre_film AS titre, TIME_FORMAT(SEC_TO_TIME(duree_film*60), "%H:%i") AS dureeHeures
            FROM film
            ORDER BY titre_film
            ');

        require 'view/listFilm.php';
    }

    public function detailFilm($id) {
        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare('
            SELECT titre_film, synopsis_film, TIME_FORMAT(SEC_TO_TIME(duree_film*60), "%H h %i") AS dureeHeures, DATE_FORMAT(date_sortie_film, "%Y.%m.%d") AS dateSortie
            FROM film 
            WHERE id_film = :id');


        $requeteCasting = $pdo->prepare("
        SELECT titre_film AS titre, duree_film AS duree, synopsis_film AS synopsis, nom_role AS role, nom_acteur AS nom, prenom_acteur AS prenom
        FROM film f
        INNER JOIN casting c ON f.id_film = c.id_film
        INNER JOIN role r ON r.id_role = c.id_role
        INNER JOIN acteur a ON a.id_acteur = c.id_acteur
        WHERE f.id_film = :id
        ");

        $requete->execute(["id" => $id]);
        $requeteCasting->execute(["id" => $id]);

        require "view/detailFilm.php";

    }
    
}
