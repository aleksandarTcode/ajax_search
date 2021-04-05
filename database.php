<?php

class Database {

    public $conn;

    public function __construct($host = 'localhost',$user = 'root',$password = '',$base = 'ajax_football')
    {
        try{
            $this->conn = new PDO("mysql:host=$host;dbname=$base",$user,$password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//        echo "Connected successfully";
        } catch (PDOException $ex){
            echo "Connection failed: " . $ex->getMessage();
        }
    }




}

$database = new Database();



?>