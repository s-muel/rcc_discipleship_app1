import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app1/create_todo_view.dart';
import 'package:my_todo_app1/utilities.dart';

import 'create_todo_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, dynamic>> completedTask = [];

  final List<Map<String, dynamic>> mydatabase = [
    {
      'title': 'Pastor Ebo Jackson',
      'description':
          'https://scontent.facc6-1.fna.fbcdn.net/v/t39.30808-6/229277114_646611003399083_1277748776024873130_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHJot-sRWjkCKzmSnlxeF1vnD627uOK4NmcPrbu44rg2ThT8N-6ScZMoHNP4k1AZODUTqT6OiLg5dsfz3sHX1Uc&_nc_ohc=uhMns-HaO9cAX8gtsGy&_nc_zt=23&_nc_ht=scontent.facc6-1.fna&oh=00_AT-MTk8lA-SBi-J6ga8zo3CXecvlNnW0xmKsAzsaEfDYxQ&oe=61CE0B86',
      'time': 'Yesterday',
      'isCompleted': false
    },
    {
      'title': 'Work on final flutter project',
      'description':
          'https://scontent.facc6-1.fna.fbcdn.net/v/t39.30808-6/229277114_646611003399083_1277748776024873130_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHJot-sRWjkCKzmSnlxeF1vnD627uOK4NmcPrbu44rg2ThT8N-6ScZMoHNP4k1AZODUTqT6OiLg5dsfz3sHX1Uc&_nc_ohc=uhMns-HaO9cAX8gtsGy&_nc_zt=23&_nc_ht=scontent.facc6-1.fna&oh=00_AT-MTk8lA-SBi-J6ga8zo3CXecvlNnW0xmKsAzsaEfDYxQ&oe=61CE0B86',
      'time': 'Tomorrow',
      'isCompleted': true
    },
    {
      'title': 'Grade assignment',
      'description': 'Grade the assignment before the ending of December',
      'time': 'Today',
      'isCompleted': true
    }
  ];

  @override
  Widget build(BuildContext context) {
    for (var element in mydatabase) {
      if (element['isCompleted'] == true) {
        completedTask.add(element);
      }
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 243, 243, 1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://scontent.facc6-1.fna.fbcdn.net/v/t1.6435-9/87058367_2547933208667514_4830625910531031040_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeGLPg2LCIYxFcL3BINXkAScGf3IYibtGAoZ_chiJu0YChYt5vTCLXeNuy731Yj5dRl2_mFW-kzqwRDPTxuNqWzZ&_nc_ohc=dbAdurxnOk0AX9Ud1Xk&_nc_oc=AQk8fcRRfVk0xylcdMt01qu11d8D_05By3GxyoIeNO-63ud-DDcBlka0JwGX5pGRHGs&_nc_ht=scontent.facc6-1.fna&oh=00_AT_RWQR8ss4pkEdK8ozzfhmv29aQD02BlpxqJ6zQ1Otavg&oe=61EE2AD2"),
          )),
          title: const Text(
            "Reapers discipleship",
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            Icon(Icons.filter_list, color: Colors.black),
            Icon(Icons.search, color: Colors.black),
          ]),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return TodoWidget(
                task: mydatabase[index]['title'],
                description: mydatabase[index]['description'],
                time: mydatabase[index]['time']);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: mydatabase.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateToDo();
          }));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        // This is the card at the bottom of the home page showing
        // the completed task and the number of completed task
        child: InkWell(
          onTap: () {
            // this is the bottom sheet that displays our completed task
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return TodoWidget(
                            task: completedTask[index]['title'],
                            description: completedTask[index]['description'],
                            time: completedTask[index]['time']);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: completedTask.length);
                });
          },
          child: Card(
            color: const Color.fromRGBO(220, 229, 238, 1),
            // color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("Completed"),
                  const SizedBox(
                    width: 3,
                  ),
                  const Icon(Icons.arrow_drop_down),
                  const Spacer(),
                  Text(completedTask.length.toString())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// this is the widget that contains the todo task
class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key,
    required this.task,
    required this.description,
    required this.time,
  }) : super(key: key);
// this is the variable for the title
  final String task;
  final String description;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(description),
            radius: 30,
          ),
          title: Text(task),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add_box,
                color: Colors.green,
              ),
              Text(
                "Add Disciple",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person,
                color: paint(time),
              ),
              Text(
                "10 ",
                style: TextStyle(
                  color: paint(time),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
