import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'categories_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final tabs = [
    Center(child: Text('Home')),
    Center(child: Text('Categories')),
    Center(child: Text('Cart')),
    Center(child: Text('Profile')),
  ];

  List<Product> products = [
    Product(
      name: 'iPhone 14 Pro',
      price: '789',
      // image:
      //     'https://www.cellularsales.com/wp-content/uploads/2023/02/iphone-14-pro-gold-fall22-a.png',
      image: 'assets/G03.jpg',
      description:
          'The latest iPhone with super fast processor, 5G and new display technology',
    ),
    Product(
      name: 'Pizza',
      price: '10.99',
      // image:
      //     'https://png.pngtree.com/png-clipart/20230412/original/pngtree-modern-kitchen-food-boxed-cheese-lunch-pizza-png-image_9048155.png',
      image: 'assets/Pizza-icon.png',
      description:
          'Delicious pizza with cheese, tomato sauce and your favorite toppings',
    ),
    Product(
      name: 'Tomato',
      price: '1.50',
      // image:
      //     'https://png.pngtree.com/png-clipart/20230113/ourmid/pngtree-red-fresh-tomato-with-green-leaf-png-image_6561484.png',
      image: 'assets/Tomato-icon.png',
      description: 'Juicy red tomato, great for salads and sandwiches',
    ),
  ];

  bool _searchBarVisible = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_searchBarVisible ? 80.0 : 56.0),
        child: AppBar(
          title: _searchBarVisible
              ? TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                  ),
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    // Perform search
                  },
                )
              : Text("My Shop"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _searchBarVisible = true;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          product: products[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          products[index].image,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          products[index].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '\$${products[index].price}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoriesScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '\$${product.price}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
