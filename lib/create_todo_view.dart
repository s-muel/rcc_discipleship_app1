import 'package:flutter/material.dart';

class CreateToDo extends StatelessWidget {
  CreateToDo({Key? key}) : super(key: key);
  final GlobalKey<FormState> createATodokey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crete To-Do"),
      ),
      body: Form(
        key: createATodokey,
        child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This Field must not be empty";
                }
              },
              decoration: const InputDecoration(label: Text("Title")),
            ),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              controller: descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This Field must not be empty";
                }
              },
              decoration: const InputDecoration(label: Text("Description")),
            ),
            const SizedBox(
              height: 50,
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
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)))
                          .then((value) =>
                              dateController.text = value.toString());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This Field must not be empty";
                      }
                    },
                    decoration: const InputDecoration(label: Text("Date")),
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
                    decoration: const InputDecoration(label: Text("Time")),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
