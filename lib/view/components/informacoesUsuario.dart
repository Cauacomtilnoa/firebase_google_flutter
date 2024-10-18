import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget InformacaoUsuario(String fotoUsuario, String nomeUsuario, String emailUsuario, Function() deslogar) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(fotoUsuario.toString() ?? ''),
          ),
          SizedBox(height: 16),
          Text(
            'Bem-vindo, ${emailUsuario ?? 'Usuário'}!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            emailUsuario.toString() ?? '',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: deslogar,
            child: Text("Sair"),
          ),
        ],
      ),
    );
  }