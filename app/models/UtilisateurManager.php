<?php
require_once dirname(__DIR__, 2) . '/app/models/Utilisateur.php';
require_once dirname(__DIR__, 2) . '/app/models/connection.php';

// récupère un utilisateur par son email et son mot de passe
function getUtilisateur(string $email, string $password): ?Utilisateur {
    $conn = dbConnect();
    $sql = "SELECT * FROM utilisateurs WHERE email = :email AND password = :password";
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':email', $email, PDO::PARAM_STR);
    $stmt->bindValue(':password', $password, PDO::PARAM_STR);
    $stmt->execute();
    $row = $stmt->fetch();
    if ($row) {
        return new Utilisateur($row['id'], $row['email'], $row['telephone'], $row['password'], $row['role_id']);
    }
    return null;
}

// ajoute un utilisateur
function createUtilisateur(Utilisateur $utilisateur): bool {
    $conn = dbConnect();
    $sql = "INSERT INTO utilisateurs (email, telephone, password, role_id) VALUES (:email, :telephone, :password, 0)";
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':email', $utilisateur->email, PDO::PARAM_STR);
    $stmt->bindValue(':telephone', $utilisateur->telephone, PDO::PARAM_STR);
    $stmt->bindValue(':password', $utilisateur->password, PDO::PARAM_STR);
    return $stmt->execute();
}
?>