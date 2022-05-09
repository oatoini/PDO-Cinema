<?php

namespace Controller;

use Model\Connect;

class ActeurController {
    /**
     * Lister les acteurs.
     */
    public function requeteListActeur(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query('
            SELECT id_acteur, nom_acteur AS nom, prenom_acteur AS prenom
            FROM acteur
            ORDER BY nom
            ');

        require 'view/listActeur.php';
    }

    public function detailActeur($id) {
        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare("
            SELECT nom_acteur 
            FROM acteur
            WHERE id_acteur = :id");


        $requeteFilmographie = $pdo->prepare("
        SELECT titre_film AS titre, nom_role AS role
        FROM film f
        INNER JOIN casting c ON f.id_film = c.id_film
        INNER JOIN role r ON r.id_role = c.id_role
        WHERE c.id_acteur = :id
        ");

        $requete->execute(["id" => $id]);
        $requeteFilmographie->execute(["id" => $id]);

        require "view/detailActeur.php";

    }
}
