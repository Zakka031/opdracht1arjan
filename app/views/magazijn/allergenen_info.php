<?php require_once APPROOT . '/views/includes/header.php'; ?>
<div class="container">
    <h3><?= $data['title']; ?></h3>
    <p>Naam Product: <?= $data['product']->Naam; ?></p>
    <p>Barcode: <?= $data['product']->Barcode; ?></p>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Allergene Naam</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($data['allergenenData'] as $allergene): ?>
                <tr>
                    <td><?= $allergene->AllergeneNaam; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
<?php require_once APPROOT . '/views/includes/footer.php'; ?>