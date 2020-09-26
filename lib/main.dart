import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',

      initialRoute: '/principal',
      routes: {
        '/principal' : (context) => TelaPrincipal(),
        '/resultado' : (context) => TelaResultado(),
      },
    )
  );
}

//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  //Atributos para receber os valores digitados no TextField
  var txtValor1;
  var txtValor2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,        
          children: [
            
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor 1'
              ),
              onChanged: (value){
                txtValor1 = value.toString();
              },
            ),

            SizedBox(height: 20,),
            
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor 2'
              ),
              onChanged: (value){
                txtValor2 = value.toString();
              },
            ),

            SizedBox(height: 40,),

            RaisedButton(
              child: Text('adição'),
              onPressed: (){

                //Criar um Mapa para estruturar os dados que serão enviados
                //para outra Tela
                
                // {'valor1': '10', 'valor2': '20', 'operacao': '+'}
                var dados = Map();
                dados['valor1'] = txtValor1;
                dados['valor2'] = txtValor2;
                dados['operacao'] = '+';

                Navigator.pushNamed(context, '/resultado', arguments: dados);

              },              
            ),
            SizedBox(height: 30,),

            RaisedButton(
              child: Text('subtração'),
              onPressed: (){

                //Criar um Mapa para estruturar os dados que serão enviados
                //para outra Tela
                
                // {'valor1': '10', 'valor2': '20', 'operacao': '+'}
                var dados = Map();
                dados['valor1'] = txtValor1;
                dados['valor2'] = txtValor2;
                dados['operacao'] = '-';

                Navigator.pushNamed(context, '/resultado', arguments: dados);

              },              
            ),
            SizedBox(height: 30,),

            RaisedButton(
              child: Text('multiplicação'),
              onPressed: (){

                //Criar um Mapa para estruturar os dados que serão enviados
                //para outra Tela
                
                // {'valor1': '10', 'valor2': '20', 'operacao': '+'}
                var dados = Map();
                dados['valor1'] = txtValor1;
                dados['valor2'] = txtValor2;
                dados['operacao'] = '*';

                Navigator.pushNamed(context, '/resultado', arguments: dados);

              },              
            ),
            SizedBox(height: 30,),

            RaisedButton(
              child: Text('divisão'),
              onPressed: (){

                //Criar um Mapa para estruturar os dados que serão enviados
                //para outra Tela
                
                // {'valor1': '10', 'valor2': '20', 'operacao': '+'}
                var dados = Map();
                dados['valor1'] = txtValor1;
                dados['valor2'] = txtValor2;
                dados['operacao'] = '/';

                Navigator.pushNamed(context, '/resultado', arguments: dados);

              },              
            ),

        ],),
      ),
      
    );
  }
}




//
// TELA RESULTADO
//
class TelaResultado extends StatefulWidget {
  @override
  _TelaResultadoState createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  @override
  Widget build(BuildContext context) {

    //
    // Recuperar os dados da Tela Principal
    //
    Map dados = ModalRoute.of(context).settings.arguments;
    double resultado;

    if ( dados != null){

      if ( dados['operacao'] == '+'){
        resultado = double.parse(dados['valor1'])+double.parse(dados['valor2']);
      }else if ( dados['operacao'] == '-'){
        resultado = double.parse(dados['valor1'])-double.parse(dados['valor2']);
      }else if ( dados['operacao'] == '*'){
        resultado = double.parse(dados['valor1'])*double.parse(dados['valor2']);
      }else if ( dados['operacao'] == '/'){
        resultado = double.parse(dados['valor1'])/double.parse(dados['valor2']);
      }

    }else{
      Navigator.pop(context);
    }


    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),

      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Valor 1', style: TextStyle(fontSize: 16),),
            Text(dados['valor1'], style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),

            Text('Valor 2', style: TextStyle(fontSize: 16),),
            Text(dados['valor2'], style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,)),
            SizedBox(height: 10,),

            Text('Operação', style: TextStyle(fontSize: 16),),
            Text(dados['operacao'], style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,)),
            SizedBox(height: 30,),

            Text('Resultado', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            Text(resultado.toStringAsFixed(2), style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,)),

          ],
        ),
      ),
    );
  }
}