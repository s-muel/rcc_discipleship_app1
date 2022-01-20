import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:my_todo_app1/all_members_page.dart';
import 'package:my_todo_app1/messaging_page.dart';

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
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Ernest Adjei") {
          papa_ernesto.add(element);
        }

        setState(() {
          number = papa_ernesto.map((member) => member.contact).toList();
        });
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
      body: FutureBuilder(
          future: _memberController.getAllMembers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
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
                  itemCount: papa_ernesto.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}

class PapaAndy extends StatefulWidget {
  const PapaAndy({Key? key}) : super(key: key);

  @override
  _PapaAndyState createState() => _PapaAndyState();
}

class _PapaAndyState extends State<PapaAndy> {
  final MemberController _memberController = MemberController();

  final List<Members> papa_andy = [];
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Balthassar Anderson") {
          papa_andy.add(element);
        }

        setState(() {
          number = papa_andy.map((member) => member.contact).toList();
        });
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
              backgroundImage: AssetImage('assets/images/papa_andy.jpg'),
            ),
            const SizedBox(width: 10),
            const Text("Total :  ", style: TextStyle(fontSize: 10)),
            Text(
              papa_andy.length.toString(),
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
                    return AllDisciplesWidget(
                        name: papa_andy[index].name,
                        number: papa_andy[index].contact,
                        picture: papa_andy[index].picture,
                        gPSLocation: papa_andy[index].homeAddress,
                        digitalAdd: papa_andy[index].digitalAdd,
                        auxilliary: papa_andy[index].auxilliary,
                        birthdate: papa_andy[index].birthday,
                        shepherd: papa_andy[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: papa_andy.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}

class PapaKelvin extends StatefulWidget {
  const PapaKelvin({Key? key}) : super(key: key);

  @override
  _PapaKelvinState createState() => _PapaKelvinState();
}

class _PapaKelvinState extends State<PapaKelvin> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Kelvin Osei Safah") {
          mog.add(element);
        }

        setState(() {
          number = mog.map((member) => member.contact).toList();
        });
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
            const Text("Ps Kelvin Safah"),
            const SizedBox(width: 50),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_kelvin.jpg'),
            ),
            const SizedBox(width: 10),
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
                    return AllDisciplesWidget(
                        name: mog[index].name,
                        number: mog[index].contact,
                        picture: mog[index].picture,
                        gPSLocation: mog[index].homeAddress,
                        digitalAdd: mog[index].digitalAdd,
                        auxilliary: mog[index].auxilliary,
                        birthdate: mog[index].birthday,
                        shepherd: mog[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: mog.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}

class MadRita extends StatefulWidget {
  const MadRita({Key? key}) : super(key: key);

  @override
  _MadRitaState createState() => _MadRitaState();
}

class _MadRitaState extends State<MadRita> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Rita Kandah") {
          mog.add(element);
        }

        setState(() {
          number = mog.map((member) => member.contact).toList();
        });
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
            const Text("Ps Rita Kandah"),
            const SizedBox(width: 50),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/mama_rita.jpg'),
            ),
            const SizedBox(width: 10),
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
                    return AllDisciplesWidget(
                        name: mog[index].name,
                        number: mog[index].contact,
                        picture: mog[index].picture,
                        gPSLocation: mog[index].homeAddress,
                        digitalAdd: mog[index].digitalAdd,
                        auxilliary: mog[index].auxilliary,
                        birthdate: mog[index].birthday,
                        shepherd: mog[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: mog.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}

// pat
class MadPat extends StatefulWidget {
  const MadPat({Key? key}) : super(key: key);

  @override
  _MadPatState createState() => _MadPatState();
}

class _MadPatState extends State<MadPat> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Rita Kandah") {
          mog.add(element);
        }

        setState(() {
          number = mog.map((member) => member.contact).toList();
        });
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
            const Text("Ps Patricia Essel"),
            const SizedBox(width: 50),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/pat.jpg'),
            ),
            const SizedBox(width: 10),
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
                    return AllDisciplesWidget(
                        name: mog[index].name,
                        number: mog[index].contact,
                        picture: mog[index].picture,
                        gPSLocation: mog[index].homeAddress,
                        digitalAdd: mog[index].digitalAdd,
                        auxilliary: mog[index].auxilliary,
                        birthdate: mog[index].birthday,
                        shepherd: mog[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: mog.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}
//pat

class PapaAmoah extends StatefulWidget {
  const PapaAmoah({Key? key}) : super(key: key);

  @override
  _PapaAmoahState createState() => _PapaAmoahState();
}

class _PapaAmoahState extends State<PapaAmoah> {
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];
  List<String> number = [];

  @override
  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps James Amoah") {
          mog.add(element);
        }

        setState(() {
          number = mog.map((member) => member.contact).toList();
        });
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
            const Text("Ps James Amoah"),
            const SizedBox(width: 50),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/default1.jpg'),
            ),
            const SizedBox(width: 10),
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
                    return AllDisciplesWidget(
                        name: mog[index].name,
                        number: mog[index].contact,
                        picture: mog[index].picture,
                        gPSLocation: mog[index].homeAddress,
                        digitalAdd: mog[index].digitalAdd,
                        auxilliary: mog[index].auxilliary,
                        birthdate: mog[index].birthday,
                        shepherd: mog[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: mog.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}

class PapaWilber extends StatefulWidget {
  const PapaWilber({Key? key}) : super(key: key);

  @override
  _PapaWilberState createState() => _PapaWilberState();
}

class _PapaWilberState extends State<PapaWilber> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Wilberforce Kyere") {
          mog.add(element);
        }

        setState(() {
          number = mog.map((member) => member.contact).toList();
        });
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
          children: [
            const Text("Ps Wilberforce Kyere"),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_wilber.jpg'),
            ),
            const SizedBox(width: 5),
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
                    return AllDisciplesWidget(
                        name: mog[index].name,
                        number: mog[index].contact,
                        picture: mog[index].picture,
                        gPSLocation: mog[index].homeAddress,
                        digitalAdd: mog[index].digitalAdd,
                        auxilliary: mog[index].auxilliary,
                        birthdate: mog[index].birthday,
                        shepherd: mog[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: mog.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}

class PapaKofy extends StatefulWidget {
  const PapaKofy({Key? key}) : super(key: key);

  @override
  _PapaKofyState createState() => _PapaKofyState();
}

class _PapaKofyState extends State<PapaKofy> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Francis Class-Peters") {
          mog.add(element);
        }

        setState(() {
          number = mog.map((member) => member.contact).toList();
        });
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
            const Text("Ps Francis Class-Peters",
                style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_kofy.jpg'),
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
                    return AllDisciplesWidget(
                        name: mog[index].name,
                        number: mog[index].contact,
                        picture: mog[index].picture,
                        gPSLocation: mog[index].homeAddress,
                        digitalAdd: mog[index].digitalAdd,
                        auxilliary: mog[index].auxilliary,
                        birthdate: mog[index].birthday,
                        shepherd: mog[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: mog.length);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Check Internet Connection"));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = "This is a test message!";
          List<String> recipents = number;

          _sendSMS(message, recipents);
        },
        child: const Icon(Icons.mail),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}

class PapaKandah extends StatefulWidget {
  const PapaKandah({Key? key}) : super(key: key);

  @override
  _PapaKandahState createState() => _PapaKandahState();
}

class _PapaKandahState extends State<PapaKandah> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];
  List<String> number = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Daniel Kandah") {
          mog.add(element);
        }

        setState(() {
          number = mog.map((member) => member.contact).toList();
        });
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
            const Text("Ps Daniel Kandah", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_kandah.jpg'),
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
                    return AllDisciplesWidget(
                        name: mog[index].name,
                        number: mog[index].contact,
                        picture: mog[index].picture,
                        gPSLocation: mog[index].homeAddress,
                        digitalAdd: mog[index].digitalAdd,
                        auxilliary: mog[index].auxilliary,
                        birthdate: mog[index].birthday,
                        shepherd: mog[index].shepherd);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
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

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

// class PapaKofy extends StatefulWidget {
//   const PapaKofy({Key? key}) : super(key: key);

//   @override
//   _PapaKofyState createState() => _PapaKofyState();
// }

// class _PapaKofyState extends State<PapaKofy> {
//   @override
//   final MemberController _memberController = MemberController();

//   final List<Members> mog = [];

//   void initState() {
//     _memberController.getAllMembers().then((member) {
//       for (Members element in member) {
//         if (element.shepherd == "Ps Francis Class-Peters") {
//           mog.add(element);
//         }

//         setState(() {});
//         //  print("these are members $member");
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Row(
//           children: [
//             const Text("Ps Francis Class-Peters",
//                 style: TextStyle(fontSize: 16)),
//             const SizedBox(width: 30),
//             const CircleAvatar(
//               radius: 15,
//               backgroundImage: AssetImage('assets/images/papa_kofy.jpg'),
//             ),
//             const SizedBox(width: 4),
//             const Text("Total :  ", style: TextStyle(fontSize: 10)),
//             Text(
//               mog.length.toString(),
//               style: TextStyle(color: Colors.red[100], fontSize: 13),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.green,
//       ),
//       body: ListView.separated(
//           itemBuilder: (context, index) {
//             return AllDisciplesWidget(
//                 name: mog[index].name,
//                 number: mog[index].contact,
//                 picture: mog[index].picture,
//                 gPSLocation: mog[index].homeAddress,
//                 digitalAdd: mog[index].digitalAdd,
//                 auxilliary: mog[index].auxilliary,
//                 birthdate: mog[index].birthday,
//                 shepherd: mog[index].shepherd);
//           },
//           separatorBuilder: (context, index) {
//             return const Divider();
//           },
//           itemCount: mog.length),
//     );
//   }
// }
