import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Text("FoodGO")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("home"),
            onTap: () => _navigateTo(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Products"),
            onTap: () => _navigateTo(context, 'products'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            onTap: () => _navigateTo(context, 'cart'),
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text("order summary"),
            onTap: () => _navigateTo(context, 'order-sumary'),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context); //so to close the drawer
    Navigator.pushNamed(context, routeName);
  }
}
