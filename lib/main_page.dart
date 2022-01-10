import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app1/add_member.dart';
import 'package:my_todo_app1/detailpage2.dart';
// import 'package:my_todo_app1/add_member_page.dart';
// import 'package:my_todo_app1/create_todo_view.dart';
import 'package:my_todo_app1/details_page.dart';

import 'package:my_todo_app1/papa.dart';
// import 'package:my_todo_app1/utilities.dart';

import 'all_members_page.dart';
import 'controllers/member_controller.dart';
import 'create_todo_view.dart';
import 'models/member_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PapaNicholas _nicholas = const PapaNicholas();

  final MemberController _memberController = MemberController();
  final List<Members> papa_ernesto = [];
  final List<Members> papa = [];

  @override
  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Ebo Jackson") {
          papa.add(element);
        }
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
              child: MOGProfileWidget(
                  picture: "assets/images/papa.jpg",
                  name: "Pastor Ebo Jackson",
                  numberOfDisciples: papa.length),
            ),
            // 2 MOG
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const DetailsPage();
                  }));
                },
                child: MOGProfileWidget(
                    picture: "assets/images/papa_ernesto.jpg",
                    name: "Pastor Ernest Adjei",
                    numberOfDisciples: papa_ernesto.length)),
            // 3 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaAndy();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_andy.jpg",
                  name: "Pastor Balthassar Anderson",
                  numberOfDisciples: "10"),
            ),
            // 4 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaKelvin();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_kelvin.jpg",
                  name: "Pastor Kelvin Osei Safah",
                  numberOfDisciples: "10"),
            ),
            // 5.1 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MadRita();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/mama_rita.jpg",
                  name: "Lady Pastor Rita Kandah",
                  numberOfDisciples: "8.."),
            ),
            // 5 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaAmoah();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/default2.jpg",
                  name: "Pastor James Amoah",
                  numberOfDisciples: "8.."),
            ),
            // 6 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaWilber();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_wilber.jpg",
                  name: "Pastor Wilberforce Owusu Kyere",
                  numberOfDisciples: "10"),
            ),
            // 7 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaKofy();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_kofy.jpg",
                  name: "Pastor Francis Class-Peters",
                  numberOfDisciples: "8.."),
            ),
            // 8 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaWilfred();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_wilfred.jpeg",
                  name: "Pastor  Wilfred Mensah",
                  numberOfDisciples: "8.."),
            ),
            // 9 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaIsaac();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_baah.jpg",
                  name: "Pastor Isaac Baah",
                  numberOfDisciples: "15"),
            ),
            // 10 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaBen();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/default2.jpg",
                  name: "Pastor  Benjamin Kojo Antwi",
                  numberOfDisciples: "15"),
            ),
            // 11 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaSammy();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_sammy.jpg",
                  name: "Pastor Samuel Essuman",
                  numberOfDisciples: "8.."),
            ),
            // 12.1 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaSterling();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_sterling.jpg",
                  name: "Pastor Prince Mensah",
                  numberOfDisciples: "8.."),
            ),
            // 12 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaFocus();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_focus.jpg",
                  name: "Pastor Daniel Kojo Ampaw",
                  numberOfDisciples: "8.."),
            ),
            // 13 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaBismark();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_bismark.jpg",
                  name: "Pastor  Bismark Prah",
                  numberOfDisciples: "8.."),
            ),
            // 14 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaSteph();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_steph.jpg",
                  name: "Pastor  Stephen Arthur",
                  numberOfDisciples: "8.."),
            ),
            // 15 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaNuwa();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/default2.jpg",
                  name: "Pastor Nuworsa Akumani",
                  numberOfDisciples: "8.."),
            ),
            // 16 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaSena();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_sena.jpg",
                  name: "Pastor Sena Akumani",
                  numberOfDisciples: "8.."),
            ),
            // 17 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaKandah();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/papa_kandah.jpg",
                  name: "Pastor  Daniel Kandah",
                  numberOfDisciples: "8.."),
            ),
            // 18 MOG
            MOGProfileWidget(
                picture: "assets/images/default1.jpg",
                name: "Pastor   James Addo",
                numberOfDisciples: "8.."),
            // 19 MOG
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PapaNicholas();
                }));
              },
              child: MOGProfileWidget(
                  picture: "assets/images/default1.jpg",
                  name: "Pastor Nicholas Effum",
                  numberOfDisciples: "1.."),
            ),
          ],
        ),
        // bottom navigation bar
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.group_rounded, color: Colors.green),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AllMembersPage();
                    }));
                  }),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AllMembersPage();
                    }));
                  },
                  child: const Text(
                    "All members",
                    style: TextStyle(fontSize: 10),
                  )),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AdminAlert();
                    }));
                  },
                  child: const Text("Help", style: TextStyle(fontSize: 10))),
              IconButton(
                  icon: const Icon(
                    Icons.help_center_rounded,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AdminAlert();
                    }));
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
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

class AdminAlert extends StatelessWidget {
  const AdminAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: const Text("Settings/Help"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("Contact Admin"),
          Icon(Icons.call),
          Text("+233557889037"),
          Divider(
            color: Colors.black,
            indent: 10,
          ),
          Text("Email Admin"),
          Icon(Icons.email),
          Text("samuelessuman8@gmail.com"),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

class MOGProfileWidget extends StatelessWidget {
  MOGProfileWidget({
    Key? key,
    required this.picture,
    required this.name,
    this.numberOfDisciples,
  }) : super(key: key);
  final String picture;
  final String name;
  var numberOfDisciples;

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
              numberOfDisciples.toString(),
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
