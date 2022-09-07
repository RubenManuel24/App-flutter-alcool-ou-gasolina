
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<App> {

  TextEditingController _textEditingAlcool = TextEditingController();
  TextEditingController _textEditingGasolina = TextEditingController();
  String _resultado = "";

  void Calcular(){

    var _alcool = double.tryParse(_textEditingAlcool.text);
    var _gasolina = double.tryParse(_textEditingGasolina.text);

    if(_alcool == null || _gasolina == null){
      setState(() {
         _resultado = "Número inválid, entra com um número diferente de 0 com (.)";
      });
    }
    else{
      if(_alcool/_gasolina >= 0.7){

        setState((){
           _resultado = "Melhor abastecer com gasolina!";
        });
      }
      else{
        setState((){
             _resultado = "Melhor abastecer com álcool!";
        });
      }
    }
    limpar();
  }
    void limpar(){
      _textEditingAlcool.text = "";
      _textEditingGasolina.text = "";
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Color.fromARGB(255, 22, 199, 223)
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 10),
               child: Image.asset("imagens/logo.png"),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10),
               child: Text("Saiba qual a melhor opção para abastecimento do seu carro.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
               ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Álcool ex: 1.59",
                ),
                style: TextStyle(
                  fontSize: 15,
                ),
                controller: _textEditingAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina ex: 3.59",
                ),
                style: TextStyle(
                  fontSize: 15,
                ),
                 controller: _textEditingGasolina,
              ),

              Padding(padding: EdgeInsets.only(top: 15, bottom: 15),
               child:  TextButton(onPressed: () => Calcular(), 
              child: Text(
                "Calcular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 22, 199, 223)              ),
              ),
              ),
              Text(
                _resultado,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
              ),
            ]),
        ),
      ),
    );
  }
}