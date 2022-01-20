import 'package:flutter/material.dart';
import 'package:my_todo_app1/controllers/member_controller.dart';
import 'package:my_todo_app1/models/member_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AllMembersPage extends StatefulWidget {
  AllMembersPage({Key? key}) : super(key: key);

  @override
  State<AllMembersPage> createState() => _AllMembersPageState();
}

class _AllMembersPageState extends State<AllMembersPage> {
  final MemberController _memberController = MemberController();
  var total;

  final List<Members> allMembers = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        allMembers.add(element);
        setState(() {});
        //  print("these are members $member");
      }
    });
    super.initState();
  }

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
          title: Row(
        children: [
          const Text("Total Members"),
          const SizedBox(
            width: 20,
          ),
          Text(allMembers.length.toString())
        ],
      )),
      body: FutureBuilder(
          future: _memberController.getAllMembers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return AllDisciplesWidget(
                      name: allMembers[index].name,
                      number: allMembers[index].contact,
                      picture: allMembers[index].picture,
                      gPSLocation: allMembers[index].homeAddress,
                      digitalAdd: allMembers[index].digitalAdd,
                      auxilliary: allMembers[index].auxilliary,
                      birthdate: allMembers[index].birthday,
                      shepherd: allMembers[index].shepherd,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 20,
                    );
                  },
                  itemCount: allMembers.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),

      // body: ListView.separated(
      //     itemBuilder: (context, index) {
      //       return AllDisciplesWidget(
      //         name: allMembers[index].name,
      //         number: allMembers[index].contact,
      //         picture: allMembers[index].picture,
      //         gPSLocation: allMembers[index].homeAddress,
      //         digitalAdd: allMembers[index].digitalAdd,
      //         auxilliary: allMembers[index].auxilliary,
      //         birthdate: allMembers[index].birthday,
      //         shepherd: allMembers[index].shepherd,
      //       );
      //     },
      //     separatorBuilder: (context, index) {
      //       return const Divider(
      //         height: 20,
      //       );
      //     },
      //     itemCount: allMembers.length),
    );
  }
}

class AllDisciplesWidget extends StatelessWidget {
  const AllDisciplesWidget({
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
                " /  $gPSLocation",
                maxLines: 1,
                overflow: TextOverflow.clip,
                softWrap: false,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
