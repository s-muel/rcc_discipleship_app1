import 'package:flutter/material.dart';
import 'package:my_todo_app1/all_members_page.dart';

import 'controllers/member_controller.dart';
import 'models/member_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MemberController _memberController = MemberController();

  final List<Members> papa_ernesto = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Ernest Adjei") {
          papa_ernesto.add(element);
        }

        setState(() {});
        //  print("these are members $member");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            const Text("Ps Ernest Adjei"),
            const SizedBox(width: 50),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_ernesto.jpg'),
            ),
            const SizedBox(width: 10),
            const Text("Total :  ", style: TextStyle(fontSize: 10)),
            Text(
              papa_ernesto.length.toString(),
              style: TextStyle(color: Colors.red[100], fontSize: 13),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return AllDisciplesWidget(
                name: papa_ernesto[index].name,
                number: papa_ernesto[index].contact,
                picture: papa_ernesto[index].picture,
                gPSLocation: papa_ernesto[index].homeAddress,
                digitalAdd: papa_ernesto[index].digitalAdd,
                auxilliary: papa_ernesto[index].auxilliary,
                birthdate: papa_ernesto[index].birthday,
                shepherd: papa_ernesto[index].shepherd);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: papa_ernesto.length),
    );
  }
}
