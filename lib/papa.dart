import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'all_members_page.dart';
import 'controllers/member_controller.dart';
import 'models/member_model.dart';

class Papa extends StatefulWidget {
  const Papa({Key? key}) : super(key: key);

  @override
  State<Papa> createState() => _PapaState();
}

class _PapaState extends State<Papa> {
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Ebo Jackson") {
          mog.add(element);
        }

        setState(() {});
        //  print("these are members $member");
      }
    });
    super.initState();
  }

  late String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Pastor Ebo's Disciples",
                style: TextStyle(fontSize: 15)),
            const SizedBox(width: 40),
            const CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage('assets/images/papa.jpg'),
            ),
            const SizedBox(width: 4),
            const Text("Total :  ", style: TextStyle(fontSize: 10)),
            Text(
              mog.length.toString(),
              style: TextStyle(color: Colors.red[100], fontSize: 13),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
          future: _memberController.getAllMembers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return PapaDisciplesWidget(
                      name: mog[index].name,
                      number: mog[index].contact,
                      picture: mog[index].picture,
                      gPSLocation: mog[index].homeAddress,
                      digitalAdd: mog[index].digitalAdd,
                      auxilliary: mog[index].auxilliary,
                      birthdate: mog[index].birthday,
                      shepherd: mog[index].shepherd,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 20,
                    );
                  },
                  itemCount: mog.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
    );
  }
}

class PapaDisciplesWidget extends StatelessWidget {
  const PapaDisciplesWidget({
    Key? key,
    required this.name,
    required this.number,
    required this.picture,
    required this.gPSLocation,
    required this.digitalAdd,
    required this.auxilliary,
    required this.birthdate,
    required this.shepherd,
  }) : super(key: key);
  final String name;
  final String number;
  final String picture;
  final String gPSLocation;
  final String digitalAdd;
  final String auxilliary;
  final String birthdate;
  final String shepherd;

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
      subtitle: Row(
        children: [
          const Icon(
            Icons.groups,
            color: Colors.green,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'shepherd : ',
            style: TextStyle(fontSize: 13, color: Colors.green),
          ),
          Text(
            shepherd,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
      // subtitle: Text("hello am subtite"),
      children: [
        ListTile(
          trailing: TextButton(
            onPressed: () {
              launch("tel:$number");
            },
            child: const Icon(Icons.call),
          ),
          // trailing: const Icon(Icons.phone, color: Colors.green),
          title: const Text("Number"),
          subtitle: Text(number, style: const TextStyle(color: Colors.green)),
        ),
        ListTile(
          title: const Text("Digital Address         /    Home Location"),
          subtitle: Row(
            children: [
              Text(digitalAdd),
              const SizedBox(
                width: 10,
              ),
              Text(
                gPSLocation,
                maxLines: 1,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          trailing: const Icon(
            Icons.location_on,
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: const Text("Birthdate"),
          subtitle: Text(birthdate),
          trailing: const Icon(
            Icons.calendar_today_rounded,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
