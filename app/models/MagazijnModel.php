<?php
class MagazijnModel
{
    private $db;
    public function __construct()
    {
        $this->db = new Database();
    }

    public function getLeveringByProductId($productId)
    {
        $this->db->query('CALL spGetLeveringByProductId(:productId)');
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);
        return $this->db->resultSet();
    }
}