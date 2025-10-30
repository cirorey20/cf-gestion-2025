<h2>Listado de alumnos</h2>

<hr>

    <?php
        foreach ($item as $alumno){
            echo $alumno['nombre']."<br>";
        }
    ?>