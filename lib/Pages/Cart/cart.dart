import 'package:app/Common/mycolors.dart';
import 'package:app/Common/widgets.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int cantidad = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white2(),
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
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [productosCantidad(), precioyBotton()],
      ),
    ));
  }

  Row productosCantidad() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Productos:",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(
            "4",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Row precioyBotton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Total: ",
          style: TextStyle(fontSize: 20),
        ),
        MyWidgets.textBasePrecio(5.60),
        MyWidgets.botonBase(() => null, "Ir a Pagar"),
      ],
    );
  }

  SizedBox listaDeItems(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.60,
      child: ListView(children: [itemBase(), itemBase(), itemBase(), itemBase(), itemBase()]),
    );
  }

  Card itemBase() {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [imagenPrincipal(), informacionYPrecio()],
      ),
    );
  }

  SizedBox informacionYPrecio() {
    return SizedBox(
      height: 100,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Naranja fresca",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "\$ 4.60 /  KG",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botonAumentarDisminuir(() {
                setState(() {
                  if (cantidad != 0) {
                    cantidad--;
                  }
                });
              }, Icons.remove),
              Text(
                cantidad.toString(),
                style: const TextStyle(color: Colors.lightBlue, fontSize: 18),
              ),
              botonAumentarDisminuir(() {
                setState(() {
                  cantidad++;
                });
              }, Icons.add)
            ],
          )
        ],
      ),
    );
  }

  Image imagenPrincipal() {
    return Image.network(
      "https://idard.org.do/wp-content/uploads/2018/03/naranja1.png",
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
      children: [MyWidgets.botonRetroceder(context), MyWidgets.botonSalir(context)],
    );
  }
}
