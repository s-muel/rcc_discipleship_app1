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
              backgroundImage: NetworkImage(
                  'https://scontent.facc6-1.fna.fbcdn.net/v/t39.30808-6/229277114_646611003399083_1277748776024873130_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHJot-sRWjkCKzmSnlxeF1vnD627uOK4NmcPrbu44rg2ThT8N-6ScZMoHNP4k1AZODUTqT6OiLg5dsfz3sHX1Uc&_nc_ohc=uhMns-HaO9cAX8gtsGy&_nc_zt=23&_nc_ht=scontent.facc6-1.fna&oh=00_AT-MTk8lA-SBi-J6ga8zo3CXecvlNnW0xmKsAzsaEfDYxQ&oe=61CE0B86'),
            ),
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
