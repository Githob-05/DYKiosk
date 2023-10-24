import 'package:flutter/material.dart';

class SelectedDrinkPage extends StatelessWidget {
  final drinkData;

  const SelectedDrinkPage({super.key, this.drinkData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(drinkData["name"]),
          ],
        ),
      ),
    );
  }
}
