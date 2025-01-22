<?php
require '../app/models/montreManager.php';

$vue = '../app/views/pages/news.php';
$lesNouveautés = getLesMontres(3);
$lesPromotions = getLesPromotions();

function getPromoMontre(int $id):int{
    return getPromo($id);
}
?>