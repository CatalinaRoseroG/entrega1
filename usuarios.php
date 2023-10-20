<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Conecta a la base de datos
    $conn = new mysqli("localhost", "usuario_db", "contrasena_db", "nombre_db");
    
    // Verifica la conexión
    if ($conn->connect_error) {
        die("La conexión a la base de datos falló: " . $conn->connect_error);
    }
    
    // Obtén los datos del correo y la contraseña del formulario de registro
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];
    
    // Realiza una inserción segura en la base de datos
    $hashedPassword = password_hash($contrasena, PASSWORD_DEFAULT);
    $stmt = $conn->prepare("INSERT INTO usuarios (correo, contrasena) VALUES (?, ?)");
    $stmt->bind_param("ss", $correo, $hashedPassword);
    
    if ($stmt->execute()) {
        // Registro exitoso
        echo "Registro exitoso";
    } else {
        // Error en el registro
        echo "Error en el registro: " . $stmt->error;
    }
    
    $stmt->close();
    $conn->close();
}
?>
