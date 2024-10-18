import 'package:firebase_google/controller/autenticacao_controller.dart';
import 'package:firebase_google/view/components/botaoEntrarGoogle.dart';
import 'package:firebase_google/view/components/informacoesUsuario.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AutenticacaoController _controller = AutenticacaoController();

  @override
  void initState() {
    super.initState();
    _controller.autenticacaoModel.autenticacao
        .authStateChanges()
        .listen((event) {
      setState(() {
        _controller.autenticacaoModel.usuario;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Autenticação com o Google"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _controller.autenticacaoModel.usuario != null
                    ? InformacaoUsuario(
                        _controller.autenticacaoModel.usuario!.photoURL!,
                        _controller.autenticacaoModel.usuario!.displayName!,
                        _controller.autenticacaoModel.usuario!.email!,
                        _controller.deslogar)
                    : BotaoGoogle(_controller.logar),
              ),
            ],
          ),
        ));
  }
}
