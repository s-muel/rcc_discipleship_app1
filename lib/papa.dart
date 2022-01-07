import 'package:flutter/material.dart';

class Papa extends StatefulWidget {
  const Papa({Key? key}) : super(key: key);

  @override
  State<Papa> createState() => _PapaState();
}

class _PapaState extends State<Papa> {
  final List<Map<String, dynamic>> database = [
    {
      'name': 'Ernest Adjei',
      'picture': "assets/images/papa_ernesto.jpg",
      'number': "+233 24 522 4866",
      'GPS_Location': "Anaji Street",
    },
    {
      'name': 'Kelvin Sefa',
      'picture': "assets/images/papa_kelvin.jpg",
      'number': "+233 54 745 2840",
      'GPS_Location': "WS-23, Ota, Anaji Street",
    },
    {
      'name': ' Balthassar Anderson',
      'picture': "assets/images/papa_andy.jpg",
      'number': "+233 24 476 4156",
      'GPS_Location': "WS-23, Ota, Anaji Street",
    },
    {
      'name': 'Rita Kandah',
      'picture': "assets/images/mama_rita.jpg",
      'number': "+233 24 476 4156",
      'GPS_Location': "WS-23, Ota, Anaji Street",
    },
    {
      'name': 'Nicholas Effum',
      'picture': "assets/images/default1.jpg",
      'number': "+233 24 476 4156",
      'GPS_Location': "WS-23, Ota, Anaji Street",
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text("Pastor Ebo's Disciples"),
            SizedBox(width: 50),
            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage('assets/images/papa.jpg'),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return DisciplesWidget(
              name: database[index]['name'],
              number: database[index]['number'],
              picture: database[index]['picture'],
              GPSLocation: database[index]['GPS_Location']);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: database.length,
      ),
    );
  }
}

class DisciplesWidget extends StatelessWidget {
  const DisciplesWidget({
    Key? key,
    required this.name,
    required this.number,
    required this.picture,
    required this.GPSLocation,
  }) : super(key: key);
  final String name;
  final String number;
  final String picture;
  final String GPSLocation;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.green[50],
      collapsedIconColor: Colors.green,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(picture),
      ),
      title: Text(name),
      children: [
        ListTile(
          trailing: const Icon(Icons.phone, color: Colors.green),
          title: const Text("Number"),
          subtitle: Text(number, style: const TextStyle(color: Colors.green)),
        ),
        ListTile(
          title: const Text("GPS Location"),
          subtitle: Text(GPSLocation),
          trailing: const Icon(
            Icons.location_on,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

// class PapasDiscipleWidget extends StatelessWidget {
//   const PapasDiscipleWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
