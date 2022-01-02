import 'package:flutter/material.dart';

class Papa extends StatefulWidget {
  const Papa({Key? key}) : super(key: key);

  @override
  State<Papa> createState() => _PapaState();
}

class _PapaState extends State<Papa> {
  final List<Map<String, dynamic>> database = [
    {
      'name': 'Pastor Ernest Adjei',
      'picture':
          "https://scontent.facc1-1.fna.fbcdn.net/v/t1.6435-9/43255777_1683840948410082_2134138634855514112_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeHF7JQ2AivRyB682puSZ5TqX4_okobPvL1fj-iShs-8vYbS9ib4znjR0qdRiY2uflo7zQEjoHOk2s-Jq52KwqRv&_nc_ohc=oxPerE3MMT8AX-P8N6l&_nc_ht=scontent.facc1-1.fna&oh=00_AT-2MZb7awVXnLExEEqpKlSVZothFJv69Rq97NEWpT8gPg&oe=61F046B7",
      'number': "0230145888",
      'GPS_Location': "WS-23, Ota, Anaji Street",
    },
    {
      'name': 'Pastor Kelvin Sefa',
      'picture':
          "https://scontent.facc1-1.fna.fbcdn.net/v/t1.6435-9/51225985_1193061190851497_5078222258225283072_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=730e14&_nc_eui2=AeH7g69wWSSBcA0Q6hSsJ7XpZpm35RGY2CRmmbflEZjYJAfpfw9NCy2PfnvPruaTgXK8oh2nLdqUDkwskK_yGAdr&_nc_ohc=MZCLOl_C8qoAX-dxcUx&_nc_ht=scontent.facc1-1.fna&oh=00_AT9FjwAQmtjIueiBlNiiRtzsLrLhOuEhwpDn5mbwytWVSQ&oe=61F1176B",
      'number': "0230145888",
      'GPS_Location': "WS-23, Ota, Anaji Street",
    },
    {
      'name': 'Pastor Addy',
      'picture':
          "https://scontent.facc1-1.fna.fbcdn.net/v/t1.6435-9/43255777_1683840948410082_2134138634855514112_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeHF7JQ2AivRyB682puSZ5TqX4_okobPvL1fj-iShs-8vYbS9ib4znjR0qdRiY2uflo7zQEjoHOk2s-Jq52KwqRv&_nc_ohc=oxPerE3MMT8AX-P8N6l&_nc_ht=scontent.facc1-1.fna&oh=00_AT-2MZb7awVXnLExEEqpKlSVZothFJv69Rq97NEWpT8gPg&oe=61F046B7",
      'number': "0230145888",
      'GPS_Location': "WS-23, Ota, Anaji Street",
    }
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
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://scontent.facc6-1.fna.fbcdn.net/v/t39.30808-6/229277114_646611003399083_1277748776024873130_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHJot-sRWjkCKzmSnlxeF1vnD627uOK4NmcPrbu44rg2ThT8N-6ScZMoHNP4k1AZODUTqT6OiLg5dsfz3sHX1Uc&_nc_ohc=uhMns-HaO9cAX8gtsGy&_nc_zt=23&_nc_ht=scontent.facc6-1.fna&oh=00_AT-MTk8lA-SBi-J6ga8zo3CXecvlNnW0xmKsAzsaEfDYxQ&oe=61CE0B86'),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PapasDisciplesWidget(
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

class PapasDisciplesWidget extends StatelessWidget {
  const PapasDisciplesWidget({
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

class PapasDiscipleWidget extends StatelessWidget {
  const PapasDiscipleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
