import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),//MyHomePage
    );
  }
}

class MyHomePage extends StatelessWidget {

   final TextEditingController nombreController = TextEditingController();
   final TextEditingController correoController = TextEditingController();
   final TextEditingController contraController = TextEditingController();

   Future<void> cargarDatosDelUsuario() async{
  final url = Uri.parse('http://192.168.56.1/webService/ejemplopost.php');

  final response = await http.post(
    url,
    body: {
      'nombre': nombreController.text,
      'correo': correoController.text,
      'contraseña': contraController.text,
    }
  );

   if (response.statusCode == 200) {
      // La solicitud se realizó con éxito
      final responseData = response.body;
      print(responseData); // Puedes procesar la respuesta aquí
    } else {
      // Hubo un error en la solicitud
      print('Error: ${response.statusCode}');
      print('Mensaje de error: ${response.body}');
    }
}

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
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              controller: correoController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: contraController,
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
