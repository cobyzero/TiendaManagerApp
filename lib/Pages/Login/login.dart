import 'package:app/API/api.dart';
import 'package:app/Common/common.dart';
import 'package:app/Common/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usuario = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyWidgets.fondoGeneral(
            context,
            SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.start,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyWidgets.botonRetroceder(context, left: 0),
                    textosTop(),
                    formCentral(),
                    botonLogin(context)
                  ],
                ),
              ),
            ),
            botton: 0,
            top: 0));
  }

  Center botonLogin(BuildContext context) {
    return Center(
      child: MyWidgets.botonBlancoInicio(context, () async {
        int id = await API.getLoginId(usuario.text, password.text);
        if (id > 0) {
          // ignore: use_build_context_synchronously
          Navigator.popAndPushNamed(context, "/Home", arguments: id);
        } else {
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                icon: Icon(Icons.error),
                title: Text("Error"),
                content: Text("Datos ingresados son invalidos"),
              );
            },
          );
        }
      }, "INGRESAR"),
    );
  }

  Column formCentral() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Ingresa tus datos",
          style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: "Itim"),
        ),
        Common.space(40),
        MyWidgets.myTexFormField(
            texto: "ejemplo@managerapp.com", icon: Icons.person, controller: usuario),
        Common.space(30),
        MyWidgets.myTexFormField(
            texto: "contraseña", icon: Icons.lock, controller: password, password: true),
        contrasenaOlvidada()
      ],
    );
  }

  Row contrasenaOlvidada() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "Olvido su contraseña?",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }

  Column textosTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Bienvenido denuevo",
          style: TextStyle(color: Colors.white, fontFamily: "Itim", fontSize: 30),
        ),
        Text(
          "Estamos felices de que vuelvas a usar tu cuenta",
          style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: "Itim"),
        )
      ],
    );
  }
}
