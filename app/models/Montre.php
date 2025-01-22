<?php

class Montre {
    public $id;
    public $nom;
    public $description;
    private $date_ajout;
    private $quantite;
    public $prix;
    private $genre_id;
    private $type_id;
    private $matiere_id;
    private $couleur_id;
    private $mouvement_id;
    private $marque_id;

    public function __construct($id, $nom, $description, $date_ajout, $quantite, $prix, $genre_id, $type_id, $matiere_id, $couleur_id, $mouvement_id, $marque_id) {
        $this->id = $id;
        $this->nom = $nom;
        $this->description = $description;
        $this->date_ajout = $date_ajout;
        $this->quantite = $quantite;
        $this->prix = $prix;
        $this->genre_id = $genre_id;
        $this->type_id = $type_id;
        $this->matiere_id = $matiere_id;
        $this->couleur_id = $couleur_id;
        $this->mouvement_id = $mouvement_id;
        $this->marque_id = $marque_id;
    }

    public function ToString() {
        return $this->id . ' ' . $this->nom . ' ' . $this->description . ' ' . $this->date_ajout . ' ' . $this->quantite . ' ' . $this->prix . ' ' . $this->genre_id . ' ' . $this->type_id . ' ' . $this->matiere_id . ' ' . $this->couleur_id . ' ' . $this->mouvement_id . ' ' . $this->marque_id;
    }
}
?>
