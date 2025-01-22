<?php
require_once('../config/routes.php');

// Récupération des clés du tableau ROUTES_EXISTANTES
$NomRoutesExistante = array_keys(ROUTES_EXISTANTES);

if(isset($_GET['page']) && in_array($_GET['page'], $NomRoutesExistante)) {
    $controller = ROUTES_EXISTANTES[$_GET['page']];
} else {
    $controller = ROUTES_EXISTANTES['home'];
}

// Inclusion du controller
require '../app/controllers/' . $controller . '.php';

?>