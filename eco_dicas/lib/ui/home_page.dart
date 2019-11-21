// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _indexDicaSelecionada = 0;
  String _dicaDia = "Evite o desperdício de papel e contribua para a redução do corte de árvores e do lançamento dos gases que formam o efeito estufa. Use o outro lado dos papéis como rascunho";
  
  void _getDicas(int valor) async {
    List<String> listaDicas = new List();
    listaDicas.add(
        "Evite o desperdício de papel e contribua para a redução do corte de árvores e do lançamento dos gases que formam o efeito estufa. Use o outro lado dos papéis como rascunho");
    listaDicas.add(
        "Utilize a água somente o necessário. Só 2,5% da água do Planeta Terra é doce e destes, somente 0,01% é utilizável pelo homem. Portanto, nunca lave uma calçada utilizando uma mangueira. Use um balde");
    listaDicas.add(
        "Deixe o carro na garagem e utilize o transporte coletivo e a bicicleta, quando possível. Dê preferência a combustíveis como o álcool e o biodiesel. Faça revisões periódicas no seu veículo para reduzir as emissões de poluentes");
    listaDicas.add(
        "Ajude a recuperar o verde de sua cidade. Plante árvores no seu quintal, na sua propriedade rural e até mesmo em áreas públicas");
    listaDicas.add(
        "Evite o desperdício de água. Feche sempre a torneira quando não estiver em uso. Em áreas sujeitas a secas prolongadas, armazene água. E arrume as torneiras que estão pingando. Uma torneira pingando desperdiça mais de 40 litros de água por dia");
    listaDicas.add(
        "Economize energia. Troque lâmpadas incandescentes por fluorescentes, apague luzes desnecessárias, desligue aparelhos domésticos quando não estiverem em uso e compre eletrodomésticos classificados como nível A em eficiência energética");
    listaDicas.add(
        "Não compre mais que o necessário, pois certamente vai virar lixo dentro da sua casa, ocupando espaço, muitas vezes, por anos a fio e sem utilidade, portanto, se tem excessos, faça trocas ou doações");
    listaDicas.add(
        "Desligue o computador. Muita gente tem o péssimo hábito de deixar o computador ligado ininterruptamente, às vezes fazendo downloads, às vezes por pura comodidade. Desligue o computador sempre que for ficar mais de 2 horas sem utilizá-lo e o monitor por até quinze minutos");
    listaDicas.add(
        "Use sacolas de pano em vez das de plástico. Sacolas de plástico – quando jogadas nas vias públicas – entopem os esgotos e provocam enchentes");

    if (valor == 1)
     _indexDicaSelecionada < listaDicas.length ? _indexDicaSelecionada++ : _indexDicaSelecionada = listaDicas.length;
    else
      _indexDicaSelecionada > 0 ? _indexDicaSelecionada-- : _indexDicaSelecionada = 0;

    _dicaDia = listaDicas[_indexDicaSelecionada];
    // http.Response response;

    // if(_search == null)
    //  response = await http.get("urldovitão" + valor.toString());

    //  return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    _dicaDia,
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
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
            _getDicas(index);
          });
        },
      ),
    );
  }
}
