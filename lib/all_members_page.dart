import 'package:flutter/material.dart';

class AllMembersPage extends StatelessWidget {
  AllMembersPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> database = [
    {
      'name': 'Ernest Adjei',
      'picture': "",
      'number': "+233 24 522 4866",
      'GPS_Location': "Anaji Street",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Members'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return AllDisciplesWidget(
                name: database[index]['name'],
                number: database[index]['number'],
                picture: database[index]['picture'],
                GPSLocation: database[index]['GPS_Location']);
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 20,
            );
          },
          itemCount: database.length),
    );
  }
}

class AllDisciplesWidget extends StatelessWidget {
  const AllDisciplesWidget({
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
        backgroundImage: NetworkImage(picture),
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
