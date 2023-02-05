import 'package:app/API/api.dart';
import 'package:app/Common/mycolors.dart';
import 'package:app/Common/widgets.dart';
import 'package:app/Data/carrito.dart';
import 'package:app/Model/itemModel.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    API.getItemForId(4);
    int id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: MyColors.gray900(),
      body: SafeArea(
        child: FutureBuilder(
          future: API.getItemForId(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var itemModel = ItemModel(
                  snapshot.data!["id"],
                  snapshot.data!["nameItem"],
                  snapshot.data!["descriptionItem"],
                  snapshot.data!["priceItem"],
                  snapshot.data!["imageItem"],
                  snapshot.data!["amountItem"],
                  snapshot.data!["uItem"],
                  snapshot.data!["numOrderItem"],
                  snapshot.data!["categoryId"]);

              return Column(
                  children: [customAppBar(), imagenCentral(itemModel), contenedorBot(itemModel)]);
            } else if (snapshot.hasError) {
              return Text("Error Data");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Expanded contenedorBot(ItemModel itemModel) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: MyColors.gray800(),
          borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nombreProducto(itemModel.nameItem),
          textoDescripcion(),
          descripcion(itemModel.descriptionItem),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyWidgets.textBasePrecio(itemModel.priceItem),
              MyWidgets.botonBase(() {
                setState(() {
                  Carrito.data.add(itemModel);
                });
              }, "Agregar al Carrito")
            ],
          )
        ],
      ),
    ));
  }

  descripcion(String description) {
    return Text(
      description,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: MyColors.gray400()),
    );
  }

  textoDescripcion() {
    return Text(
      "Descripcion",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColors.gray50()),
    );
  }

  precioProducto(double precio) {
    return Text(
      "\$$precio /kg",
      style: const TextStyle(fontSize: 23, color: Colors.lightBlue, fontWeight: FontWeight.bold),
    );
  }

  nombreProducto(String nombre) {
    return Text(
      nombre,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: MyColors.gray50()),
    );
  }

  Image imagenCentral(ItemModel itemModel) {
    return Image.network(
      itemModel.imageItem,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
    );
  }

  Row customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyWidgets.botonRetroceder(context, () {
          setState(() {
            Navigator.pop(context);
          });
        }),
        MyWidgets.botonCarrito(context, () {
          Navigator.pushNamed(context, '/Cart').then((_) => setState(() {}));
        })
      ],
    );
  }
}
