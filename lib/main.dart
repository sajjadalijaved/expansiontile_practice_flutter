import 'package:expansiontile_practice/text_tile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'advanced_tile_page.dart';
import 'basic_tile_page.dart';
import 'dart:async';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Expansion Tile';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home_outlined),
          leadingWidth: 65,
          title: const Text('Expansion Tile'),
          centerTitle: true,
          titleSpacing: 2,
          elevation: 10,
          shadowColor: Colors.black54,
          actionsIconTheme:
              const IconThemeData(color: Colors.black, opacity: 5),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    const style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Text('ExpansionTile', style: style),
          label: 'Text',
        ),
        BottomNavigationBarItem(
          icon: Text('ExpansionTile', style: style),
          label: 'Basic',
        ),
        BottomNavigationBarItem(
          icon: Text('ExpansionTile', style: style),
          label: 'Advanced',
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const TextTilePage();
      case 1:
        return const BasicTilePage();
      case 2:
        return const AdvancedTilePage();
      default:
        return Container();
    }
  }
}
