import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text("Pastor Ebo's Disciples"),
            SizedBox(width: 50),
            CircleAvatar(
              radius: 25 ,
              backgroundImage: AssetImage('assets/images/papa.jpg'),),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
