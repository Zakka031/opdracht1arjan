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
                <th>Naam Leverancier</th>
                <th>Contactpersoon</th>
                <th>Leveranciernummer</th>
                <th>Mobiel</th>
                <th>LeveringsDatum</th>
                <th>Verwachte LeveringsDatum</th>
                <th>Aantal</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($data['leveringData'])): ?>
                <tr>
                    <td colspan="7" class="text-center">Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is: 30-04-2023</td>
                </tr>
            <?php else: ?>
                <?php foreach ($data['leveringData'] as $levering): ?>
                    <tr>
                        <td><?= $levering->LeverancierNaam; ?></td>
                        <td><?= $levering->Contactpersoon; ?></td>
                        <td><?= $levering->Leveranciernummer; ?></td>
                        <td><?= $levering->Mobiel; ?></td>
                        <td><?= $levering->LeveringsDatum; ?></td>
                        <td><?= $levering->VerwachteLeveringsDatum; ?></td>
                        <td><?= $levering->Aantal; ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
</div>
<?php require_once APPROOT . '/views/includes/footer.php'; ?>