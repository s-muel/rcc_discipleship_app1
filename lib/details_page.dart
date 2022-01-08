import 'package:flutter/material.dart';

import 'controllers/member_controller.dart';
import 'models/member_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MemberController _memberController = MemberController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text("COMING SOON"),
            SizedBox(width: 50),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/default1.jpg'),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: const Center(
          child: Text(
        "Coming Soon",
        style: TextStyle(color: Colors.green),
      )),
    );
  }
}
