<?php
spl_autoload_register(function($className) {
    $directories = [
        __DIR__ . '/app/controllers/',
        //Alguna ruta mas
    ];

    $fileName = $className . '.php';

    foreach($directories as $directory) {
        $filePath = $directory . '/' . $fileName;
        if(file_exists($filePath)){
            require_once $filePath;
            return true;
        }
    }
    return false;
});