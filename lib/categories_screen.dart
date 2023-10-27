import 'package:flutter/material.dart';

import 'cart_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
      name: 'Mobiles',
      // image:
      //     'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/CellPhone.png/1200px-CellPhone.png',
      image: 'assets/Apple-iPhone-12-PNG-Picture.png',
      products: [
        Product(
          name: 'iPhone 14 Pro',
          price: 789,
          // image:
          //     'https://www.cellularsales.com/wp-content/uploads/2023/02/iphone-14-pro-gold-fall22-a.png',
          image: 'assets/G03.jpg',
          description:
              'The latest iPhone with super fast processor, 5G and new display technology',
        ),
        Product(
          name: 'Samsung Galaxy S21',
          price: 599,
          // image:
          //     'https://clipart-library.com/image_gallery2/Samsung-Mobile-Phone-PNG-Image.png',
          image: 'assets/Samsung-Galaxy-S21-5G-Yoast-image-packshot-review.jpg',
          description:
              'The latest Samsung flagship with 5G, stunning display and advanced camera features',
        ),
        Product(
          name: 'OnePlus 9',
          price: 499,
          // image:
          //     'https://oasis.opstatics.com/content/dam/oasis/page/2021/9-series/spec-image/9/Wintermist_2080a_euna.png',
          image: 'assets/Wintermist_2080a_euna.png',
          description:
              'The OnePlus flagship with 5G, powerful processor and excellent camera',
        ),
      ],
    ),
    Category(
      name: 'Foods',
      // image: 'https://cdn-icons-png.flaticon.com/512/2927/2927347.png',
      image: 'assets/Steak-icon.png',
      products: [
        Product(
          name: 'Pizza',
          price: 10.99,
          // image:
          //     'https://png.pngtree.com/png-clipart/20230412/original/pngtree-modern-kitchen-food-boxed-cheese-lunch-pizza-png-image_9048155.png',
          image: 'assets/Pizza-icon.png',
          description:
              'Delicious pizza with cheese, tomato sauce and your favorite toppings',
        ),
        Product(
          name: 'Burger',
          price: 5.99,
          // image:
          //     'https://t4.ftcdn.net/jpg/05/85/29/13/360_F_585291338_0J8Q8vYbKDCu8yqqwAO8PsQZ4ESP2zd8.jpg',
          image: 'assets/burger-icon.png',
          description:
              'Juicy burger with beef patty, lettuce, tomato and mayonnaise',
        ),
        Product(
          name: 'Sandwich',
          price: 3.99,
          // image:
          //     'https://purepng.com/public/uploads/large/purepng.com-sandwichfood-slice-salad-tasty-bread-vegetable-health-delicious-breakfast-sandwich-941524618723s9u0o.png',
          image: 'assets/Sandwich-icon.png',
          description:
              'Classic sandwich with your favorite fillings, served with chips',
        ),
      ],
    ),
    Category(
      name: 'Vegetables',
      // image: 'https://cdn-icons-png.flaticon.com/512/5016/5016804.png',
      image: 'assets/Fruits-Vegetables-icon.png',
      products: [
        Product(
          name: 'Tomato',
          price: 1.50,
          // image:
          //     'https://png.pngtree.com/png-clipart/20230113/ourmid/pngtree-red-fresh-tomato-with-green-leaf-png-image_6561484.png',
          image: 'assets/Tomato-icon.png',
          description: 'Juicy red tomato, great for salads and sandwiches',
        ),
        Product(
          name: 'Cucumber',
          price: 1.00,
          // image:
          //     'https://e7.pngegg.com/pngimages/770/911/png-clipart-fresh-cucumber-slices-hq-s-cucumber-cucumber-slices.png',
          image: 'assets/Cucumber-icon.png',
          description:
              'Crisp and refreshing cucumber, perfect for salads and sandwiches',
        ),
        Product(
          name: 'Carrot',
          price: 0.75,
          // image:
          //     'https://w7.pngwing.com/pngs/543/73/png-transparent-four-orange-carrots-carrot-vegetable-computer-file-carrot-natural-foods-leaf-vegetable-food.png',
          image: 'assets/Carrot-icon.png',
          description:
              'Sweet and crunchy carrot, great for snacking and cooking',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductListScreen(
                    category: categories[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    categories[index].image,
                    height: 100.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    categories[index].name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final String name;
  final String image;
  final List<Product> products;

  Category({
    required this.name,
    required this.image,
    required this.products,
  });
}

class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class ProductListScreen extends StatelessWidget {
  final Category category;

  ProductListScreen({required this.category});

  void _addToCart(BuildContext context, Product product) {
    final cartItem = CartItem(
      name: product.name,
      price: product.price,
      quantity: 1,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${product.name} added to cart"),
        duration: Duration(seconds: 1),
      ),
    );
    // Add the cart item to the cart list
    CartScreen.cartItems.add(cartItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: category.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: category.products[index],
                    onAddToCart: () {
                      _addToCart(context, category.products[index]);
                    },
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    category.products[index].image,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    category.products[index].name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '\$${category.products[index].price}',
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
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  ProductDetailScreen({
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '\$${product.price}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              product.description,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onAddToCart();
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
