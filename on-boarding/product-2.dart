import 'dart:io';

class Product{
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);

  void display(){
    print("Name: $name");
    print("Description: $description");
    print("Price: $price");
  }
  void update(String newName, String newDescription, double newPrice){
    name = newName;
    description = newDescription;
    price = newPrice;
  }
}

class Services{
  List<Product> products = [];

  void add(Product product){
    products.add(product);
    print("Product added successfully!");
    }

  void remove(String name){
    products.removeWhere((product) => product.name == name);
    print("Product removed!");
  }
  
  void displayProduct(){
    if (products.isEmpty){
      print('Np product found!');
    }else{
      for (var product in products){
        product.display();
      }
    }
  }

  Product? get(String name){
    for (var product in products){
      if (product.name == name){
        return product;
      }
    }
    print('Product not found!');
    return null;
  }

}

void main(){
  Services service = Services();

  while (true) {
    print('--- E-commerce ---');
    print('1. Add Product');
    print('2. Edit Product');
    print('3. Delete Product');
    print('4. View Products');
    print('5. Exit');
    stdout.write('Select an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        String description = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        double price = double.parse(stdin.readLineSync()!);
        Product product = Product(name, description, price);
        service.add(product);
        break;

      case '2':
        stdout.write('Enter product name to edit: ');
        String name = stdin.readLineSync()!;
        Product? product = service.get(name);
        if (product != null) {
          stdout.write('Enter new product name: ');
          String newName = stdin.readLineSync()!;
          stdout.write('Enter new product description: ');
          String newDescription = stdin.readLineSync()!;
          stdout.write('Enter new product price: ');
          double newPrice = double.parse(stdin.readLineSync()!);
          product.update(newName, newDescription, newPrice);
          print('Product updated successfully.');
        }
        break;

      case '3':
        stdout.write('Enter product name to delete: ');
        String name = stdin.readLineSync()!;
        service.remove(name);
        break;

      case '4':
        service.displayProduct();
        break;

      case '5':
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
