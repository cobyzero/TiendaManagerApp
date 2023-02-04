import 'package:flutter/material.dart';

class MyWidgets {
  static botonRetroceder(BuildContext context, {double left = 20}) {
    return Container(
        margin: EdgeInsets.only(left: left, top: 20, bottom: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  static botonSalir(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.close,
            size: 20,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, "/");
          },
        ));
  }

  static botonCarrito(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(children: [
        /**
           * Imagen carrito
           */
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/Cart");
            },
            icon: const Icon(
              Icons.storefront,
              size: 45,
              color: Colors.white,
            )),
        /**
           * Texto cantidad
           */
        const Padding(
          padding: EdgeInsets.only(top: 30, left: 26),
          child: Text(
            "0",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          ),
        )
      ]),
    );
  }

  static botonBase(Function() funtion, String texto) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            textStyle: const TextStyle(fontSize: 18),
            backgroundColor: Colors.blueAccent,
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20)),
        onPressed: funtion,
        child: Text(texto));
  }

  static textBasePrecio(double precio) {
    return Text(
      "\$ $precio" "0",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  static fondoGeneral(BuildContext context, Widget widget, {double botton = 40, double top = 20}) {
    return Container(
      padding: EdgeInsets.only(top: top, left: 30, right: 30, bottom: botton),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/fondo.jpg"))),
      child: widget,
    );
  }

  static myTexFormField(
      {required String texto,
      required IconData icon,
      required TextEditingController controller,
      bool password = false}) {
    return TextFormField(
      obscureText: password,
      controller: controller,
      decoration: InputDecoration(
        hintText: texto,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        prefixIconColor: Colors.purple,
        prefixIcon: Icon(
          icon,
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20))),
        fillColor: Colors.grey[100],
      ),
    );
  }

  static botonBlancoInicio(BuildContext context, Function() funtion, String text) {
    return ElevatedButton(
      onPressed: funtion,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: const StadiumBorder(),
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.3,
              right: MediaQuery.of(context).size.width * 0.3,
              top: 15,
              bottom: 15)),
      child: Text(text),
    );
  }
}
