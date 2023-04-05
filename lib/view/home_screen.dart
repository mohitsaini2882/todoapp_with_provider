import 'package:flutter/material.dart';
import 'package:todoapp_with_provider/view/add_todo_screen.dart';

import '../utils/common_strings.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>addTask(),
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        leading: Container(
          padding:  EdgeInsets.only(left: 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              UtilStrings.profilePicture,
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children:const [
              Text(UtilStrings.appName),
             Text("mohitsaini2882@gmail.com",
            style: TextStyle(
              fontSize: 10
            ),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(bottom: 100,top: 10),
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              leading: Checkbox(
                value: false,
                onChanged: (value){

                },
              ),
              trailing: IconButton(onPressed: (){},icon:  Icon(Icons.delete,color: Colors.red.shade300,),),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("31 March 2023",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.black,thickness: 3,),
                  Text("Make todo app",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.blue
                  ),),
                  Divider(color: Colors.black,thickness: 3,),
                  Text("I need to make todo app for ios and android and publish on playstore and learn how to publish on app store"),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context,int index){
            return const Divider(thickness: 3,);
          },
          itemCount: 20),
    );
  }

  addTask(){
    print("add task run");
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddTodoScreen()));
  }
}
