import 'package:app/API/api.dart';
import 'package:app/Common/common.dart';
import 'package:app/Common/mycolors.dart';
import 'package:app/Common/widgets.dart';
import 'package:app/Data/carrito.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  Carrito carrito = Carrito();

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: MyColors.black(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topContainer(context, id),
            anuncio(),
            Common.space(20),
            categorias(),
            Expanded(
                child: ListView(
              children: [populares(context), Common.space(20), limpieza(context)],
            ))
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
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: textCategorias("Populares"),
        ),
        FutureBuilder(
          future: API.getItemPopular(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: double.infinity,
                height: 230,
                child: ListView.builder(
                  itemCount: snapshot.data!.isEmpty ? 0 : snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return itemProductos(
                        context,
                        snapshot.data![index]["nameItem"],
                        snapshot.data![index]["imageItem"],
                        snapshot.data![index]["priceItem"],
                        snapshot.data![index]["uItem"]);
                  },
                ),
              );
            }
            if (snapshot.hasError) {
              return const Text("Error data");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Column limpieza(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /**
         * Texto de populares
         */
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: textCategorias("Frutas"),
        ),
        FutureBuilder(
          future: API.getItemforCategory("1"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: double.infinity,
                height: 230,
                child: ListView.builder(
                  itemCount: snapshot.data!.isEmpty ? 0 : snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return itemProductos(
                        context,
                        snapshot.data![index]["nameItem"],
                        snapshot.data![index]["imageItem"],
                        snapshot.data![index]["priceItem"],
                        snapshot.data![index]["uItem"]);
                  },
                ),
              );
            }
            if (snapshot.hasError) {
              return const Text("Error data");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Text textCategorias(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  itemProductos(BuildContext context, String nombre, String image, double precio, bool uItem) {
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
                image,
                width: 160,
                height: 140,
                fit: BoxFit.contain,
              ),
              Common.space(10),
              /**
                 * Texto del nombre del producto
                 */
              Text(
                nombre,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Common.space(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /**
                     * Contenedor de peso
                     */
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.all(4),
                    width: 38,
                    height: 27,
                    decoration:
                        BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      uItem ? "1 Un" : "1 Kg",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
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
                  Text(
                    precio.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
      height: 160,
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/anuncio.jpg"))),
    );
  }

  categorias() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
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

          FutureBuilder(
            future: API.getCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.isEmpty ? 0 : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return itemCategoria(snapshot.data![index]["imageCategory"],
                            snapshot.data![index]["nameCategory"]);
                      },
                    ));
              }
              if (snapshot.hasError) {
                return const Text("Error Data");
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Common.space(20)
        ],
      ),
    );
  }

  Container itemCategoria(String image, String nombre) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20),
      width: 110,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Image.network(
            image,
            width: 30,
            height: 30,
          ),
          Text(nombre)
        ],
      ),
    );
  }

  topContainer(BuildContext context, int id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [nombreUsuario(id), MyWidgets.botonCarrito(context)],
    );
  }

  Column nombreUsuario(int id) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: API.getDataforId(id, "nameUsers"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, bottom: 2),
                child: Text(
                  "Hey ${snapshot.data}!",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              );
            } else if (snapshot.hasError) {
              return const Text("Error Data");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        const Padding(
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
