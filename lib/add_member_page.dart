import 'package:flutter/material.dart';

class AddMember extends StatelessWidget {
  AddMember({Key? key}) : super(key: key);
  final GlobalKey<FormState> createATodokey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Member"),
      ),
      body: Form(
        key: createATodokey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This Field must not be empty";
                    }
                  },
                  decoration: const InputDecoration(
                      label: Text("Fullname"),
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person))),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field must not be empty";
                  }
                },
                decoration: const InputDecoration(
                    label: Text("Contact"),
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.call)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dateController,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((value) =>
                                dateController.text = value.toString());
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field must not be empty";
                        }
                      },
                      decoration:
                          const InputDecoration(label: Text("Date Of Birth")),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: timeController,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) =>
                                timeController.text = value!.format(context));
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field must not be empty";
                        }
                      },
                      decoration:
                          const InputDecoration(label: Text("Marital Status")),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  if (createATodokey.currentState!.validate()) {
                    // send to database
                  } else {
                    // dont send to database
                  }
                },
                child: const Text(
                  "Create",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
