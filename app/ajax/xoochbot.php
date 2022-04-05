<?php
    session_start();

    if(isset($_SESSION['username'])){
        include '../db.conn.php';
        //Colocar mysql scape
            $mensajeUsuario = $_POST['mensaje'];
            $sql = "SELECT * FROM xoochbot WHERE pregunta LIKE '%$mensajeUsuario%'";
            $stmt = $conn->prepare($sql);
            $stmt->execute();

            if($stmt->rowCount() > 0 ){
                $respuestas = $stmt->fetchAll();

                foreach ($respuestas as $respuesta) 
                    echo $respuesta['respuesta'];

            }else
                echo "Lo siento, no he logrado entenderte";
    }else {
        header("Location: ../../index.php");
        exit;
    }
    
?>
