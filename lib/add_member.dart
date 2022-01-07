import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class AddMembers extends StatefulWidget {
  AddMembers({Key? key}) : super(key: key);

  @override
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  final GlobalKey<FormState> createATodokey = GlobalKey();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController contactController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController gendarController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController shepherdController = TextEditingController();

  final TextEditingController auxiliaryController = TextEditingController();

//auxiliary
  String dropdownvalue = 'Gender';

  String shepherd = 'Shepherd';
  String auxiliary = 'Auxiliary';

  // List of items in our dropdown menu
  var items = ['Gender', 'Male', 'Female'];
  var shepherdItems = [
    'Shepherd',
    'Ps Ebo Jackson',
    'Ps Ernest Adjei',
    'Ps Balthassar Anderson',
    "Ps Kelvin Osei Safah",
    "Ps Rita Kandah",
    "Ps James Amoah",
    "Ps Wilberforce Kyere",
    "Ps Francis Class-Peters",
    "Ps Wilfred Mensah",
    "Ps Isaac Baah",
    "Ps Benjamin Kojo Antwi",
    "Ps Samuel Essuman",
    "Ps Prince Mensah",
    "Ps Daniel Kojo Ampah",
    "Ps Bismark Prah",
    "Ps Stephen Arthur",
    "Ps Nuworsa Akumani",
    "Ps Sena Akumani",
    "Ps Daniel Kandah",
    "Ps James Addo",
    "Ps Nicholas Effum",
  ];
  var auxiliaryItems = [
    'Auxiliary',
    'Prayer',
    'Singing',
    'Usher',
    'R.. Couriers',
    'Media',
    'others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        //  foregroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
        title: const Text("Add New Member"),
      ),
      body: SafeArea(
        child: Form(
          key: createATodokey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/default1.jpg'),
                  radius: 49,
                  // child: Text("Admin will add the image later",
                  //     style: TextStyle(
                  //       color: Colors.green,
                  //     )),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field must not be empty";
                    }
                  },
                  decoration: const InputDecoration(
                      label: Text(
                        "Fullname",
                        style: TextStyle(color: Colors.green),
                      ),
                      border: OutlineInputBorder(),
                      icon: Icon(
                        Icons.person,
                        color: Colors.green,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: contactController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field must not be empty";
                    }
                  },
                  decoration: const InputDecoration(
                      label: Text("Contact",
                          style: TextStyle(color: Colors.green)),
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.call, color: Colors.green)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: dobController,
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)))
                              .then((value) =>
                                  dobController.text = value.toString());
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This Field must not be empty";
                          }
                        },
                        decoration: const InputDecoration(
                            label: Text("Date of Birth",
                                style: TextStyle(color: Colors.green)),
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.calendar_today,
                                color: Colors.green)),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Icon(Icons.arrow_circle_down_sharp,
                        color: Colors.green),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,
                        style: TextStyle(color: Colors.green),

                        // Down Arrow Icon

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            gendarController.text = newValue;
                            print(newValue);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: locationController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field must not be empty";
                    }
                  },
                  decoration: const InputDecoration(
                      label: Text("Location(GPS)",
                          style: TextStyle(color: Colors.green)),
                      border: OutlineInputBorder(),
                      icon:
                          Icon(Icons.location_on_rounded, color: Colors.green)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const Icon(Icons.groups, color: Colors.green),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton(
                        // Initial Value
                        value: shepherd,
                        style: const TextStyle(color: Colors.green),
                        hint: const Text("Shepherd",
                            style: TextStyle(color: Colors.green)),

                        // Down Arrow Icon

                        // Array list of items
                        items: shepherdItems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            shepherd = newValue!;
                            shepherdController.text = newValue;
                            print(newValue);
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.group_add, color: Colors.green),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          // Initial Value
                          value: auxiliary,
                          style: const TextStyle(color: Colors.green),
                          hint: const Text("Shepherd"),

                          // Down Arrow Icon

                          // Array list of items
                          items: auxiliaryItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              auxiliary = newValue!;
                              auxiliaryController.text = newValue;
                              print(newValue);
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextButton(
                    onPressed: () {
                      if (createATodokey.currentState!.validate()) {
                        // send to database
                      } else {
                        // dont send to database
                      }
                    },
                    child: const Text(
                      "Add Member",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Text(
                    "We Believe there is more",
                    style: TextStyle(color: Colors.green),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
