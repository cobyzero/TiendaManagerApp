import 'package:app/Common/common.dart';
import 'package:app/Common/mycolors.dart';
import 'package:app/Common/widgets.dart';
import 'package:app/Data/carrito.dart';
import 'package:app/Model/itemModel.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.gray900(),
      body: SafeArea(
        child: Column(
          children: [containerTop(context), listaDeItems(context), containerBot()],
        ),
      ),
    );
  }

  Expanded containerBot() {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.gray800(),
          borderRadius:
              const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [productosCantidad(), precioyBotton()],
      ),
    ));
  }

  Row productosCantidad() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Productos:",
          style: TextStyle(fontSize: 20, color: MyColors.gray50()),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            Carrito.data.length.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.gray50()),
          ),
        ),
      ],
    );
  }

  Row precioyBotton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total: ",
          style: TextStyle(fontSize: 20, color: MyColors.gray50()),
        ),
        MyWidgets.textBasePrecio(Carrito.getPriceFinal(Carrito.data)),
        MyWidgets.botonBase(() => null, "Ir a Pagar"),
      ],
    );
  }

  SizedBox listaDeItems(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.60,
      child: ListView.builder(
        itemCount: Carrito.getCantForItems(Carrito.data),
        itemBuilder: (context, index) {
          return itemBase(Carrito.data[index]);
        },
      ),
    );
  }

  itemBase(ItemModel itemModel) {
    return Card(
      margin: const EdgeInsets.all(20),
      color: MyColors.gray800(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [imagenPrincipal(itemModel.imageItem), informacionYPrecio(itemModel)],
      ),
    );
  }

  SizedBox informacionYPrecio(ItemModel itemModel) {
    return SizedBox(
      height: 100,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            itemModel.nameItem,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.gray50()),
          ),
          Text(
            "\$ ${itemModel.priceItem} /  KG",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: MyColors.gray400()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botonAumentarDisminuir(() {
                setState(() {
                  Carrito.data.removeAt(Carrito.getIndexItemForId(Carrito.data, itemModel.id));
                });
              }, Icons.remove),
              Text(
                Carrito.getItemCant(Carrito.data, itemModel.id).toString(),
                style: TextStyle(color: MyColors.gray50(), fontSize: 18),
              ),
              botonAumentarDisminuir(() {
                setState(() {
                  Carrito.data.add(itemModel);
                });
              }, Icons.add)
            ],
          )
        ],
      ),
    );
  }

  Image imagenPrincipal(String imagen) {
    return Image.network(
      imagen,
      width: 100,
      height: 120,
    );
  }

  botonAumentarDisminuir(Function() function, IconData icon) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 16,
        ),
        color: Colors.white,
        onPressed: function,
      ),
    );
  }

  Row containerTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyWidgets.botonRetroceder(context, () {
          setState(() {
            Navigator.pop(context);
          });
        }),
      ],
    );
  }
}
