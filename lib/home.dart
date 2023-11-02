import 'package:flutter/material.dart';
import 'package:shoes_app/carddetails.dart';
import 'package:shoes_app/productlist.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int curentpage = 0;
  List<Widget> pages = const [
    Productlist(),
    Carddetails(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[curentpage]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          curentpage = value;
        }),
        iconSize: 27,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: curentpage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
