import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "Application/json"});
    List data = json.decode(response.body);
    print(data[1]);
    return "sucess";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App de Miguel"),
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Text("Mi primer contenido"),
            ),
            Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/481px-Cat03.jpg"),
            Image.network(
                "https://as01.epimg.net/meristation/imagenes/2021/07/09/noticias/1625830789_803748_1625830832_noticia_normal_recorte1.jpg"),
            Image.network(
                "https://i.pinimg.com/originals/21/6f/69/216f69f569a73717d54db552551ad43f.jpg"),
            ElevatedButton(onPressed: getData, child: Text("Obtener datos"))
          ],
        ));
  }
}
