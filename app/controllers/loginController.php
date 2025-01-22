<?php
require_once dirname(__DIR__, 2) . '/app/models/UtilisateurManager.php';

$vue = "../app/views/pages/login.php";

if(isset($_GET['action'])){
    $action = $_GET['action'];
    switch($action){
        case 'login':
            login();
            break;
        case 'signup':
            signup();
            break;
        default:
            echo "Action non reconnue";
    }
}

function login(){
    if(isset($_POST['emailCo']) && isset($_POST['passwordCo'])){
        $email = $_POST['emailCo'];
        $password = $_POST['passwordCo'];
        $utilisateur = getUtilisateur($email, $password);
        if($utilisateur){
            $_SESSION['utilisateur'] = $utilisateur;
            header('Location: index.php');
            exit();
        } else {
            echo "Email ou mot de passe incorrect";
        }
    }
}

function signup(){
    if(isset($_POST['email']) && isset($_POST['password']) && isset($_POST['telephone'])){
        $email = $_POST['email'];
        $password = $_POST['password'];
        $telephone = $_POST['telephone'];
        $utilisateur = new Utilisateur(null, $email, $telephone, $password, 0);
        $id = createUtilisateur($utilisateur);
        if($id){
            $utilisateur->id = $id;
            $_SESSION['utilisateur'] = $utilisateur;
            exit();
        }else{
            echo "Erreur lors de l'inscription";
        }
    }
}

function verifyLoginForm(){
    // récupérer sous forme de data 

    
}
?>