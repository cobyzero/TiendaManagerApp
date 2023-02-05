import 'package:app/API/api.dart';
import 'package:app/Common/common.dart';
import 'package:app/Common/mycolors.dart';
import 'package:app/Common/widgets.dart';
import 'package:app/Data/carrito.dart';
import 'package:app/Model/itemModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Carrito carrito = Carrito();
  int numCategory = 1;
  int precionado = 0;

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: MyColors.gray900(),
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
              children: [
                if (numCategory == 0) populares(context),
                if (numCategory == 0) Common.space(20),
                if (numCategory == 0) listCategoriaBase(context, "Frutas", 1),
                if (numCategory == 0) Common.space(20),
                if (numCategory == 0) listCategoriaBase(context, "Verduras", 2),
                if (numCategory != 0) itemSelectforCategory(context, numCategory),
              ],
            ))
          ],
        ),
      ),
    );
  }

  itemSelectforCategory(BuildContext context, int id) {
    return FutureBuilder(
      future: API.getCategoryForId(id, "nameCategory"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return listCategoriaBase(context, snapshot.data!, id);
        } else if (snapshot.hasError) {
          return Text("Error Data");
        } else {
          return CircularProgressIndicator();
        }
      },
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
                    var itemModel = ItemModel(
                        snapshot.data![index]["id"],
                        snapshot.data![index]["nameItem"],
                        snapshot.data![index]["descriptionItem"],
                        snapshot.data![index]["priceItem"],
                        snapshot.data![index]["imageItem"],
                        snapshot.data![index]["amountItem"],
                        snapshot.data![index]["uItem"],
                        snapshot.data![index]["numOrderItem"],
                        snapshot.data![index]["categoryId"]);

                    return itemProductos(context, itemModel);
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

  Column listCategoriaBase(BuildContext context, String texto, int categoria) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /**
         * Texto de populares
         */
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: textCategorias(texto),
        ),
        FutureBuilder(
          future: API.getItemforCategory(categoria.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: double.infinity,
                height: 230,
                child: ListView.builder(
                  itemCount: snapshot.data!.isEmpty ? 0 : snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var itemModel = ItemModel(
                        snapshot.data![index]["id"],
                        snapshot.data![index]["nameItem"],
                        snapshot.data![index]["descriptionItem"],
                        snapshot.data![index]["priceItem"],
                        snapshot.data![index]["imageItem"],
                        snapshot.data![index]["amountItem"],
                        snapshot.data![index]["uItem"],
                        snapshot.data![index]["numOrderItem"],
                        snapshot.data![index]["categoryId"]);
                    return itemProductos(context, itemModel);
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
      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: MyColors.gray50()),
    );
  }

  itemProductos(BuildContext context, ItemModel itemModel) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/Item', arguments: itemModel.id).then((_) => setState(() {}));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 180,
          height: 230,
          padding: const EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: MyColors.gray800(), borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              /**
                 * Imagen del producto
                 */
              Image.network(
                itemModel.imageItem,
                width: 110,
                height: 140,
                fit: BoxFit.contain,
              ),
              Common.space(10),
              /**
                 * Texto del nombre del producto
                 */
              Text(
                itemModel.nameItem,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: MyColors.gray50()),
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
                      itemModel.uItem ? "1 Un" : "1 Kg",
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
                    color: MyColors.gray400(),
                  ),
                  /**
                     * Texto del precio
                     */
                  Text(
                    itemModel.priceItem.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 19, color: Color(0xFF9E9E9E)),
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
                        return itemCategoria(
                            snapshot.data![index]["imageCategory"],
                            snapshot.data![index]["nameCategory"],
                            index,
                            precionado == index ? true : false);
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

  itemCategoria(String image, String nombre, int index, bool activo) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20),
      width: 110,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: activo ? MyColors.gray500() : MyColors.gray700()),
          color: activo ? MyColors.gray800() : MyColors.gray900()),
      child: InkWell(
        onTap: () {
          setState(() {
            numCategory = index + 1;
            precionado = index;
          });
        },
        onDoubleTap: () {
          setState(() {
            numCategory = 0;
            precionado = 0;
          });
        },
        child: Row(
          children: [
            Image.network(
              image,
              width: 30,
              height: 30,
            ),
            Text(
              nombre,
              style: TextStyle(color: activo ? MyColors.gray50() : MyColors.gray500()),
            )
          ],
        ),
      ),
    );
  }

  topContainer(BuildContext context, int id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        nombreUsuario(id),
        MyWidgets.botonCarrito(context, () {
          Navigator.pushNamed(context, '/Cart').then((_) => setState(() {}));
        })
      ],
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
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: MyColors.gray50()),
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
