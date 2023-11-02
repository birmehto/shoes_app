import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/global_variable.dart';

void main() => runApp(const Carddetails());

class Carddetails extends StatelessWidget {
  const Carddetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeNotifier(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
        ),
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Cart'),
            ),
          ),
          body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (BuildContext context, int index) {
              final cartitem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(cartitem['imageurl'] as String),
                ),
                title: Text(cartitem['title'].toString()),
                subtitle: Text('Size:${cartitem['Size']}'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
