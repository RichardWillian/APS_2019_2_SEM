import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _indexDicaSelecionada = 1;
  String _dicaDia = "Economizar água é algo essencial";

  void _getDicas(int valor) async {

    var url =
        "https://dicas-api-v1.herokuapp.com/api/dicas?idMensagem=$valor";

    http.Response response;

    response = await http.get(Uri.encodeFull(url),
        headers: {"content-type": "application/json"});

    var resposta = json.decode(response.body);

    _dicaDia = resposta["dica"];
    _indexDicaSelecionada = resposta["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
              backgroundColor: Colors.white,
              title: Image.asset(
                "images/EcoDicas.png",
                fit: BoxFit.cover,
                height: 1500,
              ),
              centerTitle: true)),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/FundoReciclagem.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 5, left: 20, right: 0, top: 15),
                    child: Text(
                      _dicaDia,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            title: Text('Dica anterior'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            title: Text('Próxima dica'),
          ),
        ],
        selectedItemColor: Colors.green,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {

            index == 1 ? _indexDicaSelecionada++ : _indexDicaSelecionada--;
            _selectedIndex = index;
            _getDicas(_indexDicaSelecionada);
          });
        },
      ),
    );
  }
}
