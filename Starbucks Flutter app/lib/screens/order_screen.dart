import 'package:flutter/material.dart';
import '../models/drink.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Define 4 variables to keep track of unitPrice, qty, stars and redemption
  double unitPrice = 0;
  int qty = 1;
  double stars = 124;
  double starsholding = 0;
  bool redeem = false;
  List<String> rooms = ['Tall', 'Grande', 'Venti'];

  @override
  Widget build(BuildContext context) {
    //TODO Q4 Read argument passed from HomeScreen
    final Drink drinks = ModalRoute.of(context)?.settings.arguments as Drink;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CONFIRM ORDER'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'MEMBERSHIP STATUS'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Green Level',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${stars.toStringAsFixed(2)} / 300 stars earned',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    LinearProgressIndicator(
                      value: stars / 300,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ],
                ),
              ),
              ListTile(
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
              ), //TODO Q5 Widgets to show image, name and description
              Divider(),
              Text(
                'CHOICE OF SIZE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              RadioListTile(
                title: Text(rooms[0]),
                value: drinks.price - 0.60,
                groupValue: unitPrice,
                onChanged: (value) {
                  setState(() {
                    unitPrice = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text(rooms[1]),
                value: drinks.price,
                groupValue: unitPrice,
                onChanged: (value) {
                  setState(() {
                    unitPrice = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text(rooms[2]),
                value: drinks.price + 0.60,
                groupValue: unitPrice,
                onChanged: (value) {
                  setState(() {
                    unitPrice = value!;
                  });
                },
              ),
              //TODO Q6 RadioListTile to choose size of drink
              Divider(),
              Row(
                children: [
                  Text('Qty :', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 24),
                  //TODO Q7 DropdownButton to choose qty
                  DropdownButton(
                    value: qty,
                    items: [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text('1'),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text('2'),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text('3'),
                      ),
                      DropdownMenuItem<int>(
                        value: 4,
                        child: Text('4'),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        qty = newValue!;
                      });
                    },
                  ),
                ],
              ),
              //TODO Q8 CheckboxListTile to indicate whether to redeem reward
              CheckboxListTile(
                title: const Text(
                    'Rewards Redemption:\n \$6 off a drink with 60 stars'),
                controlAffinity: ListTileControlAffinity.leading,
                value: redeem,
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      redeem = newValue;
                      if (redeem) {
                        stars -= 60;
                        stars = stars > 0
                            ? stars
                            : 0; // Ensure stars doesn't go below 0
                      } else {
                        stars +=
                            60; // Refund the stars when unchecking the checkbox
                      }
                    });
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                color: Colors.green[800],
                child: Center(
                  child: Text(
                    'Total: ${(unitPrice * qty - (redeem ? 6 : 0)).clamp(0.00, double.infinity).toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
