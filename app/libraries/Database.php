<?php
class Database
{
    private $dbHost = DB_HOST;
    private $dbName = DB_NAME;
    private $dbUser = DB_USER;
    private $dbPass = DB_PASS;
    private $dbHandler;
    private $statement;

    public function __construct()
    {
        $conn = 'mysql:host=' . $this->dbHost . ';dbname=' . $this->dbName;
        $options = array(
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_EMULATE_PREPARES => false
        );
        try {
            $this->dbHandler = new PDO($conn, $this->dbUser, $this->dbPass, $options);
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

    public function query($sql)
    {
        $this->statement = $this->dbHandler->prepare($sql);
    }

    public function resultSet()
    {
        $this->statement->execute();
        $results = $this->statement->fetchAll(PDO::FETCH_OBJ);
        $this->statement->closeCursor(); // Voeg deze regel toe
        return $results;
    }

    public function bind($parameter, $value, $type = null)
    {
        $this->statement->bindValue($parameter, $value, $type);
    }

    public function execute()
    {
        return $this->statement->execute();
    }

    public function single()
    {
        $this->statement->execute();
        $result = $this->statement->fetch(PDO::FETCH_OBJ);
        $this->statement->closeCursor(); // Voeg deze regel toe
        return $result;
    }
}