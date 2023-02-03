import 'package:app/Common/common.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int cantidadItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(children: [
          customAppBar(),
          imagenCentral(),
          nombreProducto(),
          precioProducto(),
          contenedorBot()
        ]),
      ),
    );
  }

  Expanded contenedorBot() {
    return Expanded(
        child: Container(
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
          textoDescripcion(),
          descripcion(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [seccionCantidad(), seccionTiempodeEntrega()],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20)),
                  onPressed: () {
                    if (cantidadItem != 0) {}
                  },
                  child: const Text("Agregar al carrito")),
            ),
          )
        ],
      ),
    ));
  }

  seccionTiempodeEntrega() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          const Text(
            "Tiempo de entrega",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Common.space(10),
          const Text(
            "20 - 30 min",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }

  Column seccionCantidad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: Text(
            "Cantidad",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Row(
          children: [
            botonIzquierdo(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                cantidadItem.toString(),
                style: TextStyle(fontSize: 19),
              ),
            ),
            botonDerecho()
          ],
        )
      ],
    );
  }

  botonIzquierdo() {
    return InkWell(
      onTap: () {
        setState(() {
          if (cantidadItem != 0) {
            cantidadItem--;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset("assets/atras.png"),
      ),
    );
  }

  botonDerecho() {
    return Transform.rotate(
      angle: 3.1,
      child: InkWell(
        onTap: () {
          setState(() {
            cantidadItem++;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset("assets/atras.png"),
        ),
      ),
    );
  }

  Padding descripcion() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Text(
          "Naranja fresca hecha por la mejor calidad que podras encontrar junto a promociones otorgadas por nuestros mas fieles productores."),
    );
  }

  Padding textoDescripcion() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Text(
        "Descripcion",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Text precioProducto() {
    return const Text(
      "4.60 /kg",
      style: TextStyle(fontSize: 17),
    );
  }

  Text nombreProducto() {
    return const Text(
      "Naranja fresca",
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }

  Image imagenCentral() {
    return Image.network(
      "https://idard.org.do/wp-content/uploads/2018/03/naranja1.png",
      width: double.infinity,
      height: 300,
    );
  }

  Row customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        botonRetroceder(),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Stack(children: [
            Image.asset(
              "assets/carrito.png",
              width: 30,
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 1, left: 11),
              child: Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            )
          ]),
        )
      ],
    );
  }

  botonRetroceder() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset("assets/atras.png"),
      ),
    );
  }
}
