import 'package:flutter/material.dart';

class MyWidgets {
  static botonRetroceder(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
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
              color: Colors.black,
            )),
        /**
           * Texto cantidad
           */
        const Padding(
          padding: EdgeInsets.only(top: 30, left: 26),
          child: Text(
            "0",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
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
}
