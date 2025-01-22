<section style="height:auto;" id="nouveaute">
    <div class="container-fluid p   t-2" style="background: linear-gradient(rgba(250,253,255,0.2), rgba(0,123,255,0.2) 100%) center / cover; width: 100%; height: 100%;">
        <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
            <h1 class="display-4">Nouveautés</h1>
        </div>
        <div class="container">
            <div class="row  text-center">
                <?php foreach($lesNouveautés as $montre): ?>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100" style="border-radius: 15px;">
                            <div class="card-header">
                                <h4 class="my-0 font-weight-normal"><?= $montre->nom ?></h4>
                            </div>
                            <div class="card-body" style="background: #F9F9F8">
                            <img class="card-img-top p-2" src="../public/img/montres/<?php echo $montre->id ?>.png" alt="<?= $montre->nom ?>" style="max-height: 300px; object-fit: contain; min-height: 300px;">
                                <h1 class="card-title fs-2 pricing-card-title p-1"><?= $montre->prix?> €</h1>
                                <p class="lh-base text-start p-4"><small><?= $montre->description?></small></p>
                                <button type="button" class="btn btn-success btn-rounded" data-mdb-ripple-init>Voir détails</button>
                                <button type="button" class="btn btn-light btn-rounded border" data-mdb-ripple-init>Ajouter au panier</button>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
            <h1 class="display-4">Promotions</h1>
        </div>
        <div class="container" id="promotions">
            <div class="row  text-center">
                <?php foreach($lesPromotions as $montre): ?>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100" style="border-radius: 15px;">
                            <div class="card-header">
                                <h4 class="my-0 font-weight-normal"><?= $montre->nom ?></h4>
                            </div>
                            <div class="card-body" style="background: #F9F9F8">
                            <img class="card-img-top p-2" src="../public/img/montres/<?php echo $montre->id ?>.png" alt="<?= $montre->nom ?>" style="max-height: 300px; object-fit: contain; min-height: 300px;">
                                <h1 class="card-title fs-3 text-danger text-decoration-line-through pricing-card-title"><?= $montre->prix?> €</h1>
                                <h1 class="card-title fs-2 pricing-card-title"><?= $montre->prix - ($montre->prix / 100 * getPromoMontre($montre->id))?>€ - <?=getPromoMontre($montre->id)?>%</h1>
                                <p class="lh-base text-start p-4"><small><?= $montre->description?></small></p>
                                <button type="button" class="btn btn-success btn-rounded" data-mdb-ripple-init>Voir détails</button>
                                <button type="button" class="btn btn-light btn-rounded border" data-mdb-ripple-init>Ajouter au panier</button>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        
    </div>
</section>


