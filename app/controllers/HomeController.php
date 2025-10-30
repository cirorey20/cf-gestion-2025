<?php
require_once __DIR__ . '/../models/alumnoModel.php';

class HomeController {

    public function index(){
        $alumno = new AlumnoModel();
        $item = $alumno->all(); 
        require_once __DIR__ . '/../views/home.php';
    }
}