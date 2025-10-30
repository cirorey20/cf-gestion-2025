<?php

require_once __DIR__. "/env.php";

// Conexion a base de datos
class Database {
    private $DB_HOST;
    private $DB_NAME;
    private $DB_USER;
    private $DB_PASS;

    private static $instance = null;
    private $connect;

    function __construct(){
        $this->DB_HOST = getenv("DB_HOST");
        $this->DB_NAME = getenv("DB_NAME");
        $this->DB_USER = getenv("DB_USER");
        $this->DB_PASS = getenv("DB_PASS");
        
        try {
            $dsn = "mysql:host={$this->DB_HOST};dbname={$this->DB_NAME};charset=utf8mb4";

            $opciones = [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES   => false,
            ];
            
            $this->connect = new PDO($dsn, $this->DB_USER, $this->DB_PASS, $opciones);
        } catch (PDOExeption $e) {
            echo "Error en la conexión: ". $e->getMessage();
            exit();
        }
    }

    public static function getInstance() {
        if(self::$instance == null) {
            self::$instance = new Database();
        }
        return self::$instance;
    }

    public function getConnection() {
        return $this->connect;
    }

}