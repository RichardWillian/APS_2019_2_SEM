import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _indexDicaSelecionada = 0;
  String _dicaDia = "";

  //Sim, fiz gambiarra
  void _getDicas(String valor) async {
    var url = "";

    if (valor == null)
      url = "http://10.222.113.23:3000/api/dicas?idMensagem=$valor";
    else {
      valor == 1.toString() ? _indexDicaSelecionada++ : _indexDicaSelecionada--;
      url =
          "http://10.222.113.23:3000/api/dicas?idMensagem=$_indexDicaSelecionada";
    }

    http.Response response;
    _dicaDia =
        "um mamuentasdaskld laskldaskl daskd askldklasdas djasdj askldjskladjklasjdskadjklasd ads";

    // response = await http.get(Uri.encodeFull(url),
    //     headers: {"content-type": "application/json"});

    // var resposta = json.decode(response.body);

    // _dicaDia = resposta["dica"];
    // _selectedIndex = resposta["id"];
  }

  @override
  Widget build(BuildContext context) {
    _getDicas(null);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
              backgroundColor: Colors.green,
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
                          fontSize: 50.0,
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
        backgroundColor: Colors.green,
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
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            _getDicas(index.toString());
          });
        },
      ),
    );
  }
}
