<?php

namespace Controller;

use Model\Connect;

class RealisateurController {
    /**
     * Lister les realisateurs.
     */
    public function requeteListRealisateur(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query('
            SELECT id_realisateur, nom_realisateur AS nom, prenom_realisateur AS prenom
            FROM realisateur
            ORDER BY nom
            ');

        require 'view/listRealisateur.php';
    }

    public function detailRealisateur($id) {
        $pdo = Connect::seConnecter();
        $requete = $pdo->prepare("
            SELECT nom_realisateur
            FROM realisateur
            WHERE id_realisateur = :id");


        $requeteFilmographie = $pdo->prepare("
            SELECT titre_film AS titre, nom_realisateur AS realisateur
            FROM film f
            INNER JOIN realisateur r ON f.⁪id_realisateur = r.id_realisateur
            WHERE r.id_realisateur = :id
        ");

        $requete->execute(["id" => $id]);
        $requeteFilmographie->execute(["id" => $id]);

        require "view/detailRealisateur.php";

    }
}
