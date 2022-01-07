import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app1/add_member.dart';
import 'package:my_todo_app1/add_member_page.dart';
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
            "Reapers discipleship ",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            // 1 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Papa();
                }));
              },
              child: const MOGProfileWidget(
                picture: "assets/images/papa.jpg",
                name: "Pastor Ebo Jackson",
                numberOfDisciples: "20",
              ),
            ),
            // 2 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_ernesto.jpg",
                name: "Pastor Ernest Adjei",
                numberOfDisciples: "15"),
            // 3 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_andy.jpg",
                name: "Pastor Balthassar Anderson",
                numberOfDisciples: "10"),
            // 4 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_kelvin.jpg",
                name: "Pastor Kelvin Osei Safah",
                numberOfDisciples: "10"),
            // 5.1 MOG
            const MOGProfileWidget(
                picture: "assets/images/mama_rita.jpg",
                name: "Lady Pastor Rita Kandah",
                numberOfDisciples: "8.."),
            // 5 MOG
            const MOGProfileWidget(
                picture: "assets/images/default2.jpg",
                name: "Pastor James Amoah",
                numberOfDisciples: "8.."),
            // 6 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_wilber.jpg",
                name: "Pastor Wilberforce Owusu Kyere",
                numberOfDisciples: "10"),
            // 7 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_kofy.jpg",
                name: "Pastor Francis Class-Peters",
                numberOfDisciples: "8.."),
            // 8 MOG
            const MOGProfileWidget(
                picture: "assets/images/default2.jpg",
                name: "Pastor  Wilfred Mensah",
                numberOfDisciples: "8.."),
            // 9 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_baah.jpg",
                name: "Pastor Isaac Baah",
                numberOfDisciples: "15"),
            // 10 MOG
            const MOGProfileWidget(
                picture: "assets/images/default2.jpg",
                name: "Pastor  Benjamin Kojo Antwi",
                numberOfDisciples: "15"),
            // 11 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_sammy.jpg",
                name: "Pastor Samuel Essuman",
                numberOfDisciples: "8.."),
            // 12.1 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_sterling.jpg",
                name: "Pastor Prince Mensah",
                numberOfDisciples: "8.."),
            // 12 MOG
            const MOGProfileWidget(
                picture: "assets/images/default1.jpg",
                name: "Pastor Daniel Kojo Ampah",
                numberOfDisciples: "8.."),
            // 13 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_bismark.jpg",
                name: "Pastor  Bismark Prah",
                numberOfDisciples: "8.."),
            // 14 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_steph.jpg",
                name: "Pastor  Stephen Arthur",
                numberOfDisciples: "8.."),
            // 15 MOG
            const MOGProfileWidget(
                picture: "assets/images/default2.jpg",
                name: "Pastor Nuworsa Akumani",
                numberOfDisciples: "8.."),
            // 16 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_sena.jpg",
                name: "Pastor Sena Akumani",
                numberOfDisciples: "8.."),
            // 17 MOG
            const MOGProfileWidget(
                picture: "assets/images/papa_kandah.jpg",
                name: "Pastor  Daniel Kandah",
                numberOfDisciples: "8.."),
            // 18 MOG
            const MOGProfileWidget(
                picture: "assets/images/default1.jpg",
                name: "Pastor   James Addo",
                numberOfDisciples: "8.."),
            // 19 MOG
            const MOGProfileWidget(
                picture: "assets/images/default1.jpg",
                name: "Pastor Nicholas Effum",
                numberOfDisciples: "8.."),
          ],
        ),
        // bottom navigation bar
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.group_rounded), onPressed: () {}),
              const Spacer(),
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            splashColor: Colors.green,
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AddMembers();
                },
              ));
            }),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
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
          backgroundImage: AssetImage(picture),
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
