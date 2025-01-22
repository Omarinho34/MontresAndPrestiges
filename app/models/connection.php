<?php

require_once dirname(__DIR__,2).'/config/database.php';

function dbConnect(){
    $db = new PDO("mysql:host=" . DB_CONFIG['host'] . ";port=" . DB_CONFIG['port'] . ";dbname=" . DB_CONFIG['dbname'],DB_CONFIG['username'],DB_CONFIG['password']);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $db->exec("SET NAMES UTF8");
    return $db;
}
?>