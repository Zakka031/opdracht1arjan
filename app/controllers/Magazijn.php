<?php
class Magazijn extends BaseController
{
    private $magazijnModel; 
    public function __construct()
    {
        $this->magazijnModel = $this->model('MagazijnModel');
    }

    public function index()
    {
        // Haal alle producten op uit de database
        $products = $this->magazijnModel->getAllProducts();
        $data = [
            'title' => 'Overzicht Magazijn Jamin',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'display: none;',
            'products' => $products // Voeg de products array toe aan de data array
        ];
        $this->view('magazijn/index', $data);
    }

    public function leveringInfo($productId)
    {
        $leveringData = $this->magazijnModel->getLeveringByProductId($productId);
        $data = [
            'title' => 'Levering Informatie',
            'leveringData' => $leveringData
        ];
        if (empty($leveringData)) {
            $data['message'] = 'Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is: 30-04-2023';
            $data['messageVisibility'] = 'flex';
            $data['messageColor'] = 'danger';
            $this->view('magazijn/levering_info', $data);
            header("Refresh:4; url=" . URLROOT . "/magazijn/index");
        } else {
            $this->view('magazijn/levering_info', $data);
        }
    }

    public function allergenenInfo($productId)
    {
        $allergenenData = $this->magazijnModel->getAllergenenByProductId($productId);
        $product = $this->magazijnModel->getProductById($productId);
        $data = [
            'title' => 'Overzicht Allergenen',
            'allergenenData' => $allergenenData,
            'product' => $product
        ];
        $this->view('magazijn/allergenen_info', $data);
    }
}