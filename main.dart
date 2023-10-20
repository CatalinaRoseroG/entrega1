import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // Importa la biblioteca dio

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                cargarDatosDelUsuario(); // Llama a la función para cargar datos
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

void cargarDatosDelUsuario() async{
  try{
  final response = await dio.get('http://172.16.8.218/flutter_pruebafinal/usuarios.php');

 if (response.statusCode == 200){
   print(response.data); // Puedes imprimir la respuesta o realizar otras acciones.
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}