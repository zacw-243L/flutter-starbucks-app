import 'package:flutter/material.dart';
import 'package:test1_221252k/models/drink.dart';
import '../models/drinks_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STARBUCKS'),
      ),
      body: ListView.builder(
        itemCount: DrinksRepository()
            .allDrinksCount, //TODO Q3 Indicate number of drinks
        itemBuilder: (context, index) {
          //TODO Q3 ListView with widgets to show image, name and description
          final drinks = DrinksRepository().allDrinks[index];
          //TODO Q4 Implement onTap method to navigate to OrderScreen, passing drink as argument
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/screens', arguments: drinks);
            },
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('images/' + drinks.image),
            ),
            title: Text(drinks.name.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.green)),
            subtitle: Text(drinks.description),
          );
        },
      ),
    );
  }
}
