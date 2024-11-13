<?php require_once APPROOT . '/views/includes/header.php'; ?>
<div class="container">
    <h3><?= $data['title']; ?></h3>
    <?php if (isset($data['message'])): ?>
        <div class="alert alert-<?= $data['messageColor']; ?>" role="alert" style='<?= $data['messageVisibility']; ?>'>
            <?= $data['message']; ?>
        </div>
    <?php endif; ?>
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
</div>
<?php require_once APPROOT . '/views/includes/footer.php'; ?>