import 'package:flutter/material.dart';
import 'global_variables.dart';
import 'product_card.dart';
import 'product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final List<String> filters = ['All', 'Adidas', 'Nike', 'Converse', 'Bata'];

    late String selectedFilter = filters[0];

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoe\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefix: Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Icon(
                        Icons.search_outlined,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2.0,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 2.0,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(35),
                      ),
                    ),
                    hintText: 'Search',
                    hintFadeDuration: Duration(milliseconds: 600),
                    hintStyle: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(213, 216, 223, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      label: Text(
                        filter,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(60, 61, 64, 1),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetailsPage(product: product);
                    }));
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
