<?php require_once APPROOT . '/views/includes/header.php'; ?>
<!-- Maak een nieuwe view aan voor deze link -->
<div class="container">
    <div class="row mt-3" style='<?= $data['messageVisibility']; ?>'>
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <div class="alert alert-<?= $data['messageColor']; ?>" role="alert">
                    <?= $data['message']; ?>
                </div>
            </div>
            <div class="col-2"></div>
   </div>
   
    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <h3><?= $data['title']; ?></h3>
        </div>
        <div class="col-2"></div>
    </div>
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <a href="<?= URLROOT; ?>/homepages/index">Homepage</a>
        </div>
        <div class="col-2"></div>
    </div>

    <table class="table table-hover">
<thead>
    <tr>
        <th>Naam</th>
        <th>Barcode</th>
        <th>Leverantie Info</th>
        <th>Allergenen Info</th>
    </tr>
</thead>
<tbody>
    <?php if (isset($data['products']) && !empty($data['products'])): ?>
        <?php foreach ($data['products'] as $product): ?>
            <tr>
                <td><?= $product->Naam; ?></td>
                <td><?= $product->Barcode; ?></td>
                <td><a href="<?= URLROOT; ?>/magazijn/leveringInfo/<?= $product->Id; ?>">?</a></td>
                <td><a href="<?= URLROOT; ?>/magazijn/allergenenInfo/<?= $product->Id; ?>"><i class="bi bi-x-circle-fill" style="color: red;"></i></a></td>
            </tr>
        <?php endforeach; ?>
    <?php else: ?>
        <tr>
            <td colspan="4" class="text-center">Geen producten gevonden</td>
        </tr>
    <?php endif; ?>
</tbody>
</table>