<section style="height:93.5vh;">
    <div class="container h-100 d-flex justify-content-center align-items-center">
        <div class="row w-100">
            <!-- Choix entre connexion et inscription (radio button qui affiche et cache le bon formulaire) -->
            <div class="col-12 text-center mb-4">
                <input type="radio" class="btn-check" name="options-base" id="optionConnexion" autocomplete="off" checked>
                <label class="btn" for="optionConnexion">Connexion</label>

                <input type="radio" class="btn-check" name="options-base" id="optionInscription" autocomplete="off">
                <label class="btn" for="optionInscription">Inscription</label>
            </div>

            <!-- Formulaire de connexion -->
            <div class="col-md-6 mx-auto" id="connexion-form">
                <form action="../app/controllers/loginController.php?action=login" method="post" style="border: 1px solid #e2e2e2; padding: 20px; border-radius: 10px;">
                    <div class="form-group pb-3">
                        <label for="emailCo">Email :</label>
                        <input type="email" class="form-control" id="emailCo" name="emailCo" required placeholder="Entrez votre email">
                    </div>
                    <div class="form-group pb-3">
                        <label for="passwordCo">Mot de passe :</label>
                        <input type="password" class="form-control" id="passwordCo" name="passwordCo" required placeholder="Entrez votre mot de passe">
                    </div>
                    <button type="submit" class="btn btn-primary d-block mx-auto">Se connecter</button>
                </form>
            </div>

            <!-- Formulaire d'inscription -->
            <div class="col-md-6 mx-auto" id="inscription-form" style="display: none;">
                <form action="../app/controllers/loginController.php?action=signup" method="post" style="border: 1px solid #e2e2e2; padding: 20px; border-radius: 10px;">
                    <div class="form-group pb-3">
                        <label for="email">Email :</label>
                        <input type="email" class="form-control" id="email" name="email" required placeholder="Entrez votre email">
                    </div>
                    <div class="form-group pb-3">
                        <label for="ConfirmEmail">Confirmer votre email :</label>
                        <input type="email" class="form-control" id="ConfirmEmail" name="ConfirmEmail" required placeholder="Confirmez votre email">
                    </div>
                    <div class="form-group pb-3">
                        <label for="telephone">Téléphone :</label>
                        <input type="tel" class="form-control" id="telephone" name="telephone" required placeholder="Entrez votre numéro de téléphone">
                    </div>
                    <div class="form-group pb-3">
                        <label for="password">Mot de passe :</label>
                        <input type="password" class="form-control" id="password" name="password" required placeholder="Entrez votre mot de passe">
                    </div>
                    <div class="form-group pb-3">
                        <label for="ConfirmPassword">Confirmer votre mot de passe :</label>
                        <input type="password" class="form-control" id="ConfirmPassword" name="ConfirmPassword" required placeholder="Confirmez votre mot de passe">
                    </div>
                    <button type="submit" class="btn btn-primary d-block mx-auto">S'inscrire</button>
                </form>
            </div>
        </div>
    </div>
</section>

<script>
// Fonction qui préprare les formulaires(remet a blanc tout les champs)
function prepareForm(form) {
    form.querySelectorAll('input').forEach(input => {
        input.value = '';
    });
}
// Affichage du bon formulaire en fonction du choix de l'utilisateur
document.getElementById('optionConnexion').addEventListener('change', function() {
    document.getElementById('connexion-form').style.display = 'block';
    document.getElementById('inscription-form').style.display = 'none';
    prepareForm(document.getElementById('inscription-form'));
});

document.getElementById('optionInscription').addEventListener('change', function() {
    document.getElementById('connexion-form').style.display = 'none';
    document.getElementById('inscription-form').style.display = 'block';
    prepareForm(document.getElementById('connexion-form'));
});
</script>