import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Função responsável por fazer a requisição das dicas
  _getDicas() async {
    http.Response response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.green,
          title: Image.asset(
            "images/EcoDicas.png",
            fit: BoxFit.contain,
          ),
          centerTitle: true,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.all(15.0),
        itemCount: 15,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(children: <Widget>[

                ],),
              ),
            ),
          );
        },
      ),
    );
  }
}
