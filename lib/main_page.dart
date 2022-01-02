import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app1/create_todo_view.dart';
import 'package:my_todo_app1/details_page.dart';
import 'package:my_todo_app1/papa.dart';
import 'package:my_todo_app1/utilities.dart';

import 'create_todo_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          leading: const Center(
              child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/rcc_logo.jpg'),
          )),
          title: const Text(
            "Reapers discipleship",
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            Icon(Icons.filter_list, color: Colors.black),
            Icon(Icons.search, color: Colors.black),
          ]),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Papa();
              }));
            },
            child: const MOGProfileWidget(
              picture: "assets/images/papa.jpg",
              name: "Pastor Ebo Jackson",
              numberOfDisciples: "30",
            ),
          ),
          const MOGProfileWidget(
              picture:
                  "https://scontent.facc1-1.fna.fbcdn.net/v/t1.6435-9/43255777_1683840948410082_2134138634855514112_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeHF7JQ2AivRyB682puSZ5TqX4_okobPvL1fj-iShs-8vYbS9ib4znjR0qdRiY2uflo7zQEjoHOk2s-Jq52KwqRv&_nc_ohc=oxPerE3MMT8AX-P8N6l&_nc_ht=scontent.facc1-1.fna&oh=00_AT-2MZb7awVXnLExEEqpKlSVZothFJv69Rq97NEWpT8gPg&oe=61F046B7",
              name: "Pastor Ernest Adjei",
              numberOfDisciples: "50"),
          const MOGProfileWidget(
              picture:
                  "https://scontent.facc1-1.fna.fbcdn.net/v/t1.6435-9/43255777_1683840948410082_2134138634855514112_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeHF7JQ2AivRyB682puSZ5TqX4_okobPvL1fj-iShs-8vYbS9ib4znjR0qdRiY2uflo7zQEjoHOk2s-Jq52KwqRv&_nc_ohc=oxPerE3MMT8AX-P8N6l&_nc_ht=scontent.facc1-1.fna&oh=00_AT-2MZb7awVXnLExEEqpKlSVZothFJv69Rq97NEWpT8gPg&oe=61F046B7",
              name: "Pastor Ernest Adjei",
              numberOfDisciples: "50")
        ],
      ),
    );
  }
}

class MOGProfileWidget extends StatelessWidget {
  const MOGProfileWidget({
    Key? key,
    required this.picture,
    required this.name,
    required this.numberOfDisciples,
  }) : super(key: key);
  final String picture;
  final String name;
  final String numberOfDisciples;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/papa.jpg'),
          radius: 30,
        ),
        title: Text(name),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.add_box,
              color: Colors.green,
            ),
            Text(
              "View Disciples",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.person,
              color: Colors.green,
            ),
            Text(
              numberOfDisciples,
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
