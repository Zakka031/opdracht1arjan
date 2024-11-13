<?php require_once APPROOT . '/views/includes/header.php'; ?>
<div class="container">
    <h3><?= $data['title']; ?></h3>
    <p>Naam Product: <?= $data['product']->Naam; ?></p>
    <p>Barcode: <?= $data['product']->Barcode; ?></p>
    <?php if (isset($data['message'])): ?>
        <div class="alert alert-<?= $data['messageColor']; ?>" role="alert" style='<?= $data['messageVisibility']; ?>'>
            <?= $data['message']; ?>
        </div>
    <?php endif; ?>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Allergene Naam</th>
                <th>Omschrijving</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($data['allergenenData'])): ?>
                <tr>
                    <td colspan="2" class="text-center">In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken</td>
                </tr>
            <?php else: ?>
                <?php foreach ($data['allergenenData'] as $allergene): ?>
                    <tr>
                        <td><?= $allergene->Naam; ?></td>
                        <td><?= $allergene->Omschrijving; ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>
<?php require_once APPROOT . '/views/includes/footer.php'; ?>