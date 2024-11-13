<?php
class MagazijnModel
{
    private $db;
    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAllProducts()
    {
        $this->db->query('SELECT * FROM Product ORDER BY Barcode ASC');
        return $this->db->resultSet();
    }

    public function getLeveringByProductId($productId)
    {
        $this->db->query('CALL spGetLeveringByProductId(:productId)');
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);
        return $this->db->resultSet();
    }

    public function getAllergenenByProductId($productId)
    {
        $this->db->query('CALL spGetAllergenenByProductId(:productId)');
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);
        return $this->db->resultSet();
    }

    public function getProductById($productId)
    {
        $this->db->query('SELECT * FROM Product WHERE Id = :productId');
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);
        return $this->db->single();
    }
}