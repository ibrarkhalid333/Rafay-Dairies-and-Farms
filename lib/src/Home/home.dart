import 'package:flutter/material.dart';
import 'package:rafay_dairies_and_farms/src/Dashboard/dashboard.dart';
import 'package:rafay_dairies_and_farms/src/components/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedTile = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(
        selectedTile: selectedTile,
        onTileSelected: (String tileName) {
          setState(() {
            selectedTile = tileName;
          });
        },
      ),
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(child: Dashboard()),
    );
  }
}
