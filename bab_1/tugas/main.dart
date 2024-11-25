class User {
  String name;
  int age;
  late List<Product> products = [];
  Role? role;
  User(this.name, this.age);

  void viewProducts() {
    if (products.isEmpty) {
      print("Tidak ada produk");
    } else {
      for (var product in products) {
        print(
            "${product.productName} - ${product.price} - ${product.inStock ? "Tersedia" : "Habis"}");
      }
    }
  }
}

class Product {
  String productName;
  double price;
  bool inStock;
  Product(this.productName, this.price, this.inStock);
}

enum Role { admin, user }

class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age) {
    role = Role.admin;
    products = [];
  }

  void addProduct(Product product) {
    if (product.inStock) {
      products.add(product);
    } else {
      throw Exception(
          "Produk ${product.productName} tidak tersedia dalam stok.");
    }
  }

   void removeProduct(Product product) {
    products.remove(product);
  }
}

class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age) {
    role = Role.user;
    products = [];
  }
}

// Fungsi asinkron untuk meniru pengambilan data produk dari server
Future<void> fetchProductDetails(Product product) async {
  await Future.delayed(Duration(seconds: 2)); // Simulasi penundaan
  print("Detail produk ${product.productName} telah diambil dari server.");
}

void main() async {
  // Daftar produk menggunakan Map dan memastikan produk unik dengan Set
  Map<String, Product> productCatalog = {
    'Laptop': Product('Laptop', 1500.0, true),
    'Headphone': Product('Headphone', 150.0, true),
    'Smartphone': Product('Smartphone', 800.0, false),
  };
  Set<Product> uniqueProducts = {};

  // Admin User
  AdminUser admin = AdminUser("Admin A", 30);

  // Menambah produk ke dalam daftar admin dengan pengecekan stok
  try {
    productCatalog.forEach((name, product) {
      uniqueProducts.add(product);
      admin.addProduct(product);
    });
  } on Exception catch (e) {
    print(e);
  }

  // Customer User
  CustomerUser customer = CustomerUser("Customer B", 25);
  customer.products = admin.products; // Customer melihat produk yang ditambahkan oleh admin

  // Menampilkan daftar produk untuk Customer
  print("\nDaftar produk untuk Customer:");
  customer.viewProducts();

  // Mengambil detail produk secara asinkron
  for (var product in uniqueProducts) {
    await fetchProductDetails(product);
  }
}
