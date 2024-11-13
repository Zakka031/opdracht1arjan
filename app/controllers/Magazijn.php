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
        $product = $this->magazijnModel->getProductById($productId);
        $aantalAanwezig = $this->magazijnModel->getAantalAanwezigByProductId($productId);

        $data = [
            'title' => 'Levering Informatie',
            'leveringData' => $leveringData,
            'product' => $product,
            'messageVisibility' => 'none'
        ];

        if ($product->Naam == 'Winegums' && $aantalAanwezig->AantalAanwezig == 0) {
            $data['message'] = 'Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is: 30-04-2023';
            $data['messageVisibility'] = 'flex';
            $data['messageColor'] = 'danger';
            $data['leveringData'] = []; // Clear leveringData to ensure no delivery data is shown
            $this->view('magazijn/levering_info', $data);
            echo "<script>
                    setTimeout(function(){
                        window.location.href = '" . URLROOT . "/magazijn/index';
                    }, 4000);
                  </script>";
            return;
        }

        if (empty($leveringData)) {
            $data['message'] = 'Er zijn geen leveringsgegevens beschikbaar voor dit product.';
            $data['messageVisibility'] = 'flex';
            $data['messageColor'] = 'danger';
        }

        $this->view('magazijn/levering_info', $data);
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

        if (empty($allergenenData)) {
            $data['message'] = 'In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken';
            $data['messageVisibility'] = 'flex';
            $data['messageColor'] = 'danger';
            $this->view('magazijn/allergenen_info', $data);
            header("Refresh:4; url=" . URLROOT . "/magazijn/index");
        } else {
            $this->view('magazijn/allergenen_info', $data);
        }
    }
}