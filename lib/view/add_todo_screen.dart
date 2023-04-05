import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Enter title',
                        labelText: 'Enter title',
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'Enter description',
                        labelText: 'Enter description',
                      ),
                    ),
                    const Gap(20),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child:   Text('Set Task Date & Time'),
                        ),
                        onPressed: () {
                          _selectDateTime();
                        },
                      ),
                    ),
                    const Gap(20),
                    Center(
                      child: ElevatedButton(
                        child: const Text('Add Task'),
                        onPressed: () {
                          _addTask();
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectDateTime(){
    print("select date time run");
  }
  _addTask(){
    print("add task run");
  }
}
