import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_page.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'].toString(),
          'title': widget.product['title'].toString(),
          'price': widget.product['price'].toString(),
          'imageUrl': widget.product['imageUrl'].toString(),
          'company': widget.product['company'].toString(),
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product added to cart.")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select a size.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final String price = widget.product['price'].toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(widget.product['imageUrl'] as String)),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(31, 188, 187, 187),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "₹$price",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final int size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                              label: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "$size",
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        onTap();
                      },
                      label: Text(
                        "Add To Cart",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
