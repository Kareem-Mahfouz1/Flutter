import 'dart:io';

void main(List<String> args) {
  App().run();
}

class User {
  String name;
  String id;
  User({required this.name, required this.id});
}

class Product {
  String name;
  String id;
  String description;
  double price;
  int stock;
  Product({
    required this.name,
    required this.id,
    required this.description,
    required this.price,
    required this.stock,
  });
  editProductDescription(String newDescription) => description = newDescription;
  editProductPrice(double newPrice) => price = newPrice;
  addStock(int newStock) => stock += newStock;
  displayProductInfo() {
    print(name);
    print(description);
    print('left in stock: $stock');
    print('${price.toStringAsFixed(2)} \$');
  }
}

class Category {
  String name;
  List<Product> products = [];
  Category({required this.name});
  addProductToCategory(Product product) => products.add(product);
  displayProductsInCategory() {
    for (var i = 0; i < products.length; i++) {
      print('${i + 1} - ${products[i].name}');
    }
  }
}

class System {
  List<Category> categories = [];
  admin() {}
  takeProduct() {
    String productName;
    String productId;
    String productDescription;
    double productPrice;
    int productStock;
    print('Product name: ');
    productName = stdin.readLineSync()!;
    print('Product id: ');
    productId = stdin.readLineSync()!;
    print('Product description: ');
    productDescription = stdin.readLineSync()!;
    print('Product price: ');
    productPrice = double.parse(stdin.readLineSync()!);
    print('Product stock: ');
    productStock = int.parse(stdin.readLineSync()!);
    Product newProduct = Product(
        name: productName,
        id: productId,
        description: productDescription,
        price: productPrice,
        stock: productStock);
    return newProduct;
  }

  takeInput() {
    print('User Choice: ');
    return int.parse(stdin.readLineSync()!);
  }

  processInput(int userInput) {}

  displayCategories() {
    print('Available Categories:');
    for (var i = 0; i < categories.length; i++) {
      print('${i + 1} - ${categories[i].name}');
    }
  }

  isValid(int userInput) {
    if (userInput == 0 || userInput > categories.length) {
      print('choise not valid');
      return false;
    }
    return true;
  }

  addCategory(Category category) => categories.add(category);
}

class Ui {
  static displayThis(var chosen) {
    if (chosen is Product) {
      chosen.displayProductInfo();
    } else if (chosen is Category) {
      chosen.displayProductsInCategory();
    }
  }
}

class App {
  System system = new System();
  var current;
  run() {
    while (true) {
      system.displayCategories();
      var userInput = system.takeInput();
      while (system.isValid(userInput)) {
        current = system.categories[userInput];
        Ui.displayThis(current);
      }
      if (userInput == 109) {
        system.admin();
      }
    }
  }
}
