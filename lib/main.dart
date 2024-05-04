import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tm_10/pages/add_color_page.dart';
import 'package:tm_10/pages/application_lifecycle.dart';
import 'package:tm_10/pages/checkbox.dart';
import 'package:tm_10/pages/future_builder.dart';
import 'package:tm_10/pages/add_product_page.dart';
import 'package:tm_10/pages/key.dart';
import 'package:tm_10/providers/colors.dart';
import 'package:tm_10/providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const ApplicationLifecycle(),
    const FutureBuilderApp(),
    KeyPage(),
    const CheckboxPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(create: (_) => Products()),
        //Tambahkan provider lain jika diperlukan
        ChangeNotifierProvider<MultiColor>(create: (_) => MultiColor()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '51',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '52',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '53',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '54',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
        routes: {
          KeyPage.routeName: (ctx) => KeyPage(),
          AddProductPage.routeName: (ctx) => AddProductPage(),
          CheckboxPage.routeName: (ctx) => CheckboxPage(),
          AddColorPage.routeName: (ctx) => AddColorPage(),
        },
      ),
    );
  }
}
