import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = 'imagens/opcao.png';
  var _mensagem = "Escolha uma opção abaixo";

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["cara", "coroa"];
    var numero = Random().nextInt(2);
    var escolhaApp = opcoes[numero];
    switch (escolhaApp) {
      case 'cara':
        setState(() {
          _imagemApp = 'imagens/cara260.png';
        });
        break;
      case 'coroa':
        setState(() {
          _imagemApp = 'imagens/coroa260.png';
        });
        break;
    }
    if (escolhaUsuario == escolhaApp) {
      setState(() {
        _mensagem = "Parabens! Voce venceu!";
      });
    } else {
      setState(() {
        _mensagem = "Fracassado ruim lixo verme";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cara ou Coroa")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do Computador',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            _imagemApp,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => opcaoSelecionada('cara'),
                child: Image.asset(
                  'imagens/cara260.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada('coroa'),
                child: Image.asset(
                  'imagens/coroa260.png',
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
