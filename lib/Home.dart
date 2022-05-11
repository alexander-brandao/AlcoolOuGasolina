import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";
  void _calcular(){

    double? precoAlcool = double.tryParse( _controllerAlcool.text);
    double? precoGasolina = double.tryParse( _controllerGasolina.text);


    if( precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Valores invalidos,"
            " Confira se os numeros estão preenchidos com o ( . )";
      });
    } else{

      if( (precoAlcool/precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina";
        });
      } else{
        setState(() {
          _textoResultado = "Melhor abastecer com Alcool";
        });
      }

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo_teste.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual a melhor opcao de"
                    " abastecimento do seu carro",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 2.59",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text(
                    "calcular",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),)

            ],
          ),
        )
      ),
    );
  }
}
