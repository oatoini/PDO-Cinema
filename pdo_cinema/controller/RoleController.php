<?php

namespace Controller;

use Model\Connect;

class RoleController {
    /**
     * Lister les roles.
     */
    public function requeteListRole(){
        $pdo = Connect::seConnecter();
        $requete = $pdo->query('
            SELECT id_role, nom_role AS roles
            FROM role
            ORDER BY roles
            ');

        require 'view/listRole.php';
    }

    
}
