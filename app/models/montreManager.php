<?php
require_once '../app/models/connection.php';
require_once '../app/models/Montre.php';

// Récupération des 3 dernières montres ajoutées (utilisé pour l'onglet "Nouveautés").
function getLesMontres(int $limit = 3):array{
    $sql = "SELECT id, nom, description, date_ajout, quantite, prix, genre_id, type_id, matiere_id, couleur_id, mouvement_id, marque_id FROM montres ORDER BY date_ajout DESC LIMIT :limit";
    $query = dbConnect()->prepare($sql);
    $query->bindValue(':limit', $limit, PDO::PARAM_INT);
    $query->execute();
    $reponses = $query->fetchAll();
    $lesMontres = [];
    foreach($reponses as $montre){
        $lesMontres[] = new Montre($montre['id'], $montre['nom'], $montre['description'], $montre['date_ajout'], $montre['quantite'], $montre['prix'], $montre['genre_id'], $montre['type_id'], $montre['matiere_id'], $montre['couleur_id'], $montre['mouvement_id'], $montre['marque_id']);   
    }
    return $lesMontres;
}

// Récupération d'une montre en fonction de son id (utilisé pour la page "Détails du produit").
function getMontre(int $id):Montre{
    $sql = "SELECT id, nom, description, date_ajout, quantite, prix, genre_id, type_id, matiere_id, couleur_id, mouvement_id, marque_id FROM produit WHERE id = :id";
    $query = dbConnect()->prepare($sql);
    $query->bindValue(':id', $id, PDO::PARAM_INT);
    $query->execute();
    $query->setFetchMode(PDO::FETCH_CLASS, 'Montre');
    $montre = $query->fetch();
    return $montre;
}

function addMontre(array $newMontre):bool{
    $sql = "INSERT INTO produit (nom, description, prix, image, created_at) VALUES (:nom, :description, :prix, :image, NOW())";
    $query = dbConnect()->prepare($sql);
    $query->bindValue(':nom', $newMontre['nom'], PDO::PARAM_STR);
    $query->bindValue(':description', $newMontre['description'], PDO::PARAM_STR);
    $query->bindValue(':prix', $newMontre['prix'], PDO::PARAM_INT);
    $query->bindValue(':image', $newMontre['image'], PDO::PARAM_STR);
    return $query->execute();
}

// Récupération des montres en promotions (select * from montres where id IN (SELECT montre_id from reductions JOIN promotions ON reductions.promotion_id = promotions.id WHERE date_fin > CURRENT_DATE))
function getLesPromotions():array{
    $sql = "SELECT id, nom, description, date_ajout, quantite, prix, genre_id, type_id, matiere_id, couleur_id, mouvement_id, marque_id from montres where id IN (SELECT montre_id from reductions JOIN promotions ON reductions.promotion_id = promotions.id WHERE date_fin > CURRENT_DATE)";
    $query = dbConnect()->prepare($sql);
    $query->execute();
    $reponses = $query->fetchAll();
    $lesMontres = [];
    foreach($reponses as $montre){
        $lesMontres[] = new Montre($montre['id'], $montre['nom'], $montre['description'], $montre['date_ajout'], $montre['quantite'], $montre['prix'], $montre['genre_id'], $montre['type_id'], $montre['matiere_id'], $montre['couleur_id'], $montre['mouvement_id'], $montre['marque_id']);   
    }
    return $lesMontres;
}

// Récupération de la valeur de la promos par montre (select reduction from reductions where montre_id = :id)
function getPromo(int $id):int{
    $sql = "SELECT reduction from reductions where montre_id = :id";
    $query = dbConnect()->prepare($sql);
    $query->bindValue(':id', $id, PDO::PARAM_INT);
    $query->execute();
    $promo = $query->fetch();
    return $promo['reduction'];
}
?>