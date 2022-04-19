<?php

    session_start();

    if(isset($_POST['act-pass']) && isset($_POST['new-pass']) && isset($_POST['conf-pass'])){

        # Conexión a la BD
        include '../db.conn.php';

        # Se obtiene el valor de las variables
        $current_password = $_POST['act-pass'];
        $new_password = $_POST['new-pass'];
        $conf_password = $_POST['conf-pass'];

        # Se forma la Data
        $data = 'current_password='.$current_password.'&new_password='.$new_password;

        if(empty($current_password)){
            $em = 'La contraseña actual es requerida';
            header("Location: ../../update-password.php?error=$em&$data");
   	        exit;
        }else if(empty($new_password)){
            $em = 'La contraseña nueva es requerida';
            header("Location: ../../update-password.php?error=$em&$data");
   	        exit;
        }else if(empty($conf_password)){
            $em = 'La confirmación de la contraseña es requerida';
            header("Location: ../../update-password.php?error=$em&$data");
   	        exit;
        }else if($new_password != $conf_password){
            $em = 'Las contraseñas no coinciden';
            header("Location: ../../update-password.php?error=$em&$data");
   	        exit;
        }else{
            # Verificando que el password ingresado sea el actual
            $sql = "SELECT password FROM users WHERE username = ? AND user_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->execute([$_SESSION['username'], $_SESSION['user_id']]);

            $user = $stmt->fetch();

            if(password_verify($current_password, $user['password'])){
                $new_password = password_hash($new_password, PASSWORD_DEFAULT);
                $sql = "UPDATE users SET password = ? WHERE username = ? AND user_id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->execute([$new_password, $_SESSION['username'], $_SESSION['user_id']]);
            }else{
                $em = "La contraseña actual no es correcta";
      	        header("Location: ../../update-password.php?error=$em&$data");
   	            exit;
            }

            $sm = "La contraseña se ha actualizado correctamente";
      	    header("Location: ../../update-password.php?success=$sm");
   	        exit;
        }
    }
?>