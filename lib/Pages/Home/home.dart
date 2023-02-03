import 'package:app/Common/common.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topContainer(),
            anuncio(),
            categorias(),
            populares(context),
          ],
        ),
      ),
    );
  }

  Column populares(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /**
         * Texto de populares
         */
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: textCategorias("Populares"),
        ),
        SizedBox(
          width: double.infinity,
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              itemProductos(context),
              itemProductos(context),
              itemProductos(context),
              itemProductos(context),
            ],
          ),
        )
      ],
    );
  }

  Text textCategorias(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
    );
  }

  itemProductos(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/Item");
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 180,
          height: 230,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              /**
                 * Imagen del producto
                 */
              Image.network(
                "https://idard.org.do/wp-content/uploads/2018/03/naranja1.png",
                width: 160,
                height: 140,
                fit: BoxFit.contain,
              ),
              Common.space(10),
              /**
                 * Texto del nombre del producto
                 */
              const Text(
                "Naranja fresca",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Common.space(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /**
                     * Contenedor de peso
                     */
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.all(4),
                    width: 38,
                    height: 27,
                    decoration:
                        BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "1 kg",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  /**
                     * Imagen del dolar
                     */
                  Image.asset(
                    "assets/dolar.png",
                    width: 15,
                    height: 15,
                  ),
                  /**
                     * Texto del precio
                     */
                  const Text(
                    "3.20",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container anuncio() {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(top: 10, bottom: 30, left: 20, right: 20),
      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)),
    );
  }

  categorias() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /**
         * Texto Categorias
         */
        Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: textCategorias("Categorias")),
        /**
         * Listado Categorias
         */
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            itemCategoria("assets/categorias/frutas.png", "Frutas"),
            itemCategoria("assets/categorias/frutas.png", "Frutas"),
            itemCategoria("assets/categorias/frutas.png", "Frutas"),
            itemCategoria("assets/categorias/frutas.png", "Frutas"),
            itemCategoria("assets/categorias/frutas.png", "Frutas"),
            itemCategoria("assets/categorias/frutas.png", "Frutas"),
            itemCategoria("assets/categorias/frutas.png", "Frutas")
          ]),
        ),
      ],
    );
  }

  Container itemCategoria(String image, String nombre) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20),
      width: 100,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 30,
            height: 30,
          ),
          Text(nombre)
        ],
      ),
    );
  }

  topContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nombreUsuario(),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.exit_to_app,
            size: 30,
          ),
        )
      ],
    );
  }

  Column nombreUsuario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 2),
          child: Text(
            "Hey Sebastian!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            "Que te gustaria comer hoy?",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        )
      ],
    );
  }
}
