import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';


Widget BotaoGoogle(Function() apertarBotao) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      height: 50,
      child: SignInButton(
        Buttons.google,
        text: "Entrar com conta Google",
        onPressed:apertarBotao,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
