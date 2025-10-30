<?php
require_once __DIR__ . '/../app/config/db.php';
require_once __DIR__ . '/../autoload.php';
require_once __DIR__ . '/../app/config/parameters.php';

require_once __DIR__ . '/../app/views/layout/header.php';
require_once __DIR__ . '/../app/views/layout/main.php';


$controller = $_GET['controller'] ?? "HomeController";
$action = $_GET['action'] ?? "index";

if (class_exists($controller)) {
    $controller = new $controller();
    if (method_exists($controller, $action)) {
        $controller->$action();
    } else {
        echo "la pagina no existe";
    }
} else {
    echo "la pagina no existe";
}

require_once __DIR__ . '/../app/views/layout/footer.php';