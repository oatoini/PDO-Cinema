<?php

namespace Controller;

use Model\Connect;

class GenreController {
    /**
     * Lister les genres.
     */
    public function requeteListGenre(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query('
            SELECT id_genre, libelle_genre AS type
            FROM genre
            ORDER BY type
            ');

        require 'view/listGenre.php';
    }

    
}
