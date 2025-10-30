<?php

require_once __DIR__ . '/../config/db.php';

class AlumnoModel {
    private $pdo;

    function __construct(){ //
        // echo "clase Home, cargada";
        $this->pdo = Database::getInstance()->getConnection();
    }

    public function all(){
        $sql = "SELECT * FROM alumnos;";
        $alumnos = $this->pdo->prepare($sql);
        $alumnos->execute();
        // $rst = $alumnos->fetchAll(PDO::FETCH_ASSOC);
        $rst = $alumnos->fetchAll();
        // var_dump($rst);
        
        return $rst;
    }
}