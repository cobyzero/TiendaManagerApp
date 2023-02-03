import 'package:app/Common/common.dart';
import 'package:app/Common/widgets.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(children: [customAppBar(), imagenCentral(), contenedorBot()]),
      ),
    );
  }

  Expanded contenedorBot() {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          precioProducto(),
          nombreProducto(),
          textoDescripcion(),
          descripcion(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyWidgets.textBasePrecio(5.60),
              MyWidgets.botonBase(() {
                Navigator.pushNamed(context, "/Cart");
              }, "Agregar al Carrito")
            ],
          )
        ],
      ),
    ));
  }

  descripcion() {
    return const Text(
      "Naranja fresca hecha por la mejor calidad que podras encontrar junto a promociones otorgadas por nuestros mas fieles productores.",
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.grey),
    );
  }

  textoDescripcion() {
    return const Text(
      "Descripcion",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  precioProducto() {
    return const Text(
      "\$4.60 /kg",
      style: TextStyle(fontSize: 23, color: Colors.lightBlue, fontWeight: FontWeight.bold),
    );
  }

  nombreProducto() {
    return const Text(
      "Naranja fresca",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Image imagenCentral() {
    return Image.network(
      "https://idard.org.do/wp-content/uploads/2018/03/naranja1.png",
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
    );
  }

  Row customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [MyWidgets.botonRetroceder(context), MyWidgets.botonCarrito(context)],
    );
  }
}
