import 'package:app/Model/itemModel.dart';

class Carrito {
  static List<ItemModel> data = [];

  static getPriceFinal(List<ItemModel> datatemp) {
    double price = 0;
    for (var element in datatemp) {
      price += element.priceItem;
    }

    return price;
  }

  static getItemCant(List<ItemModel> datatemp, int id) {
    int cant = 0;
    for (var element in datatemp) {
      if (id == element.id) {
        cant++;
      }
    }
    return cant;
  }

  static getIndexItemForId(List<ItemModel> datatemp, int id) {
    int index = 0;

    for (int i = 0; i < datatemp.length; i++) {
      if (datatemp[i].id == id) {
        index = i;
        continue;
      }
    }

    return index;
  }

  static getCantForItems(List<ItemModel> datatemp) {
    List list = [];
    for (var temp in datatemp) {
      if (!list.contains(temp.id)) {
        list.add(temp.id);
      }
    }

    return list.length;
  }
}
