import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/cart_provider.dart';

class Productdetail extends StatefulWidget {
  final Map<String, Object> product;
  const Productdetail({super.key, required this.product});

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  int selectedsize = 0;
  void onTap() {
    Provider.of<Cartprovider>(context, listen: false).addproduct({
      'id': widget.product['id'],
      'title': widget.product['title'],
      'price': widget.product['price'],
      'company': widget.product['company'],
      'imageurl': widget.product['imageurl'],
      'Size': selectedsize,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Details')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset(widget.product['imageurl'] as String),
          ),
          const Spacer(flex: 2),
          Container(
            height: 210,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 229, 239, 248),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['Size'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = (widget.product['Size'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedsize == size
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromARGB(255, 253, 238, 238),
                            label: Text(
                              size.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: onTap,
                    child: const Text(
                      'Add To Card',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
