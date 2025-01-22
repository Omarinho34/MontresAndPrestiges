<?php

class Utilisateur {
    public $id;
    public $email;
    public $telephone;
    public $password;
    public $role_id;

    public function __construct($id, $email, $telephone, $password, $status) {
        $this->id = $id;
        $this->email = $email;
        $this->telephone = $telephone;
        $this->password = $password;
        $this->role_id = $status;
    }
}
?>