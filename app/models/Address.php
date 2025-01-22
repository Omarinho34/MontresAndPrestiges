<?php

class Address{
    public $id;
    public $numero_rue;
    public $adresse_ligne1;
    public $adresse_ligne2;
    public $ville;
    public $code_postal;
    public $is_default;
    public $utilisateur_id;
    public Utilisateur $utilisateur;

    public function __construct($id, $numero_rue, $adresse_ligne1, $adresse_ligne2, $ville, $code_postal, $is_default, $utilisateur_id){
        $this->id = $id;
        $this->numero_rue = $numero_rue;
        $this->adresse_ligne1 = $adresse_ligne1;
        $this->adresse_ligne2 = $adresse_ligne2;
        $this->ville = $ville;
        $this->code_postal = $code_postal;
        $this->is_default = $is_default;
        $this->utilisateur_id = $utilisateur_id;
    }
}

?>