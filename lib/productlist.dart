import 'package:flutter/material.dart';
import 'package:shoes_app/global_variable.dart';
import 'package:shoes_app/product_card.dart';
import 'package:shoes_app/product_detail.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  final List<String> filter = const [
    'All',
    'Nike',
    'Adidas',
    'Bata',
    'Other',
  ];
  late String selectedFilter;

 

  @override
  void initState() {
    super.initState();
    selectedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
    );
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Shoes\nCollection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filter.length,
            itemBuilder: (context, index) {
              final filters = filter[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filters;
                    });
                  },
                  child: Chip(
                    backgroundColor: selectedFilter == filters
                        ? Theme.of(context).colorScheme.primary
                        : const Color.fromARGB(255, 253, 238, 238),
                    label: Text(filters),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Productdetail(product: product);
                      }),
                    );
                  },
                  child: ProductCart(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageurl'] as String,
                    bagroundcolor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(255, 236, 236, 1),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
