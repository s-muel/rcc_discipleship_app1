import 'package:flutter/material.dart';
import 'package:my_todo_app1/all_members_page.dart';

import 'controllers/member_controller.dart';
import 'models/member_model.dart';

class PapaWilfred extends StatefulWidget {
  const PapaWilfred({Key? key}) : super(key: key);

  @override
  _PapaWilfredState createState() => _PapaWilfredState();
}

class _PapaWilfredState extends State<PapaWilfred> {
  final MemberController _memberController = MemberController();

  final List<Members> papa_andy = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Wilfred Mensah") {
          papa_andy.add(element);
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
            const Text("Ps Wilfred Mensah"),
            const SizedBox(width: 35),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/default2.jpg'),
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
      body: ListView.separated(
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
          itemCount: papa_andy.length),
    );
  }
}

class PapaIsaac extends StatefulWidget {
  const PapaIsaac({Key? key}) : super(key: key);

  @override
  _PapaIsaacState createState() => _PapaIsaacState();
}

class _PapaIsaacState extends State<PapaIsaac> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Isaac Baah") {
          mog.add(element);
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
            const Text("Ps Isaac Baah"),
            const SizedBox(width: 35),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_baah.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaBen extends StatefulWidget {
  const PapaBen({Key? key}) : super(key: key);

  @override
  _PapaBenState createState() => _PapaBenState();
}

class _PapaBenState extends State<PapaBen> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Benjamin Kojo Antwi") {
          mog.add(element);
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
            const Text("Ps Benjamin Kojo Antwi"),
            const SizedBox(width: 50),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/default2.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaSammy extends StatefulWidget {
  const PapaSammy({Key? key}) : super(key: key);

  @override
  _PapaSammyState createState() => _PapaSammyState();
}

class _PapaSammyState extends State<PapaSammy> {
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  @override
  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Samuel Essuman") {
          mog.add(element);
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
            const Text("Ps Samuel Essuman"),
            const SizedBox(width: 20),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_sammy.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaSterling extends StatefulWidget {
  const PapaSterling({Key? key}) : super(key: key);

  @override
  _PapaSterlingState createState() => _PapaSterlingState();
}

class _PapaSterlingState extends State<PapaSterling> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Prince Mensah") {
          mog.add(element);
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
        title: Row(
          children: [
            const Text("Ps Prince Mensah"),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_sterling.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaFocus extends StatefulWidget {
  const PapaFocus({Key? key}) : super(key: key);

  @override
  _PapaFocusState createState() => _PapaFocusState();
}

class _PapaFocusState extends State<PapaFocus> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Daniel Kojo Ampah") {
          mog.add(element);
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
            const Text("Ps Daniel Kojo Ampah", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/default2.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaSteph extends StatefulWidget {
  const PapaSteph({Key? key}) : super(key: key);

  @override
  _PapaStephState createState() => _PapaStephState();
}

class _PapaStephState extends State<PapaSteph> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Stephen Arthur") {
          mog.add(element);
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
            const Text("Ps Daniel Kojo Ampah", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_steph.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaBismark extends StatefulWidget {
  const PapaBismark({Key? key}) : super(key: key);

  @override
  _PapaBismarkState createState() => _PapaBismarkState();
}

class _PapaBismarkState extends State<PapaBismark> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Bismark Prah") {
          mog.add(element);
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
            const Text("Pastor  Bismark Prah", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_bismark.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaSena extends StatefulWidget {
  const PapaSena({Key? key}) : super(key: key);

  @override
  _PapaSenaState createState() => _PapaSenaState();
}

class _PapaSenaState extends State<PapaSena> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Sena Akumani") {
          mog.add(element);
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
            const Text("Ps Sena Akumani", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/papa_sena.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaNuwa extends StatefulWidget {
  const PapaNuwa({Key? key}) : super(key: key);

  @override
  _PapaNuwaState createState() => _PapaNuwaState();
}

class _PapaNuwaState extends State<PapaNuwa> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Nuworsa Akumani") {
          mog.add(element);
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
            const Text("Ps Nuworsa Akumani", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/default2.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}

class PapaNicholas extends StatefulWidget {
  const PapaNicholas({Key? key}) : super(key: key);

  @override
  _PapaNicholasState createState() => _PapaNicholasState();
}

class _PapaNicholasState extends State<PapaNicholas> {
  @override
  final MemberController _memberController = MemberController();

  final List<Members> mog = [];

  void initState() {
    _memberController.getAllMembers().then((member) {
      for (Members element in member) {
        if (element.shepherd == "Ps Nicholas Effum") {
          mog.add(element);
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
            const Text("Ps Nicholas Effum", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/default2.jpg'),
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
      body: ListView.separated(
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
          itemCount: mog.length),
    );
  }
}
