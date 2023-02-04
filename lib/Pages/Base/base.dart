import 'package:app/Common/common.dart';
import 'package:app/Common/widgets.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 40),
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://i.pinimg.com/originals/07/57/09/075709b38affd30aa6b4ec941e809567.jpg"))),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textosPrincipales(),
              botonBot(context),
            ],
          ),
        ),
      ),
    );
  }

  Column botonBot(BuildContext context) {
    return Column(
      children: [
        MyWidgets.botonBlancoInicio(context, () {}, "Comenzar"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ya eres miembro?",
              style: TextStyle(color: Colors.grey),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Login");
                },
                child: const Text(
                  "Ingresar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        )
      ],
    );
  }

  Column textosPrincipales() {
    return Column(children: [
      Common.space(50),
      const Text(
        "ManagerAPP",
        style: TextStyle(color: Colors.white, fontSize: 50, fontFamily: "Aboreto"),
        textAlign: TextAlign.start,
      ),
      const Text(
        "ven y disfruta",
        style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: "Aboreto"),
        textAlign: TextAlign.start,
      ),
      Common.space(20),
      const Text(
        "La mejor forma de pedir y recibir en la comodidad de tu hogar",
        style: TextStyle(color: Colors.grey, fontSize: 17, fontFamily: "Itim"),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
