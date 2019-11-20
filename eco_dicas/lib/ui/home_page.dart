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
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 5.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Utilize a água somente o necessário. Só 2,5% da água do Planeta Terra é doce e destes, \nsomente 0,01% é utilizável pelo homem. \nPortanto, nunca lave uma calçada utilizando uma mangueira. \nUse um balde;",
                            style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
