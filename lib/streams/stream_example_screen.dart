import 'dart:async';

import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget{
   StreamExample({Key? key}):super(key: key);

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
   int counter = 0;

   StreamController counterStreamController = StreamController<IncrementModel>();

    Stream? myStream;

   increment(){
     print("increment run");
     counter++;
     IncrementModel incrementModel = IncrementModel(value: "$counter  value", counterValue: counter);
     counterStreamController.sink.add(incrementModel);
   }

   @override
  void initState() {
    super.initState();
    myStream = counterStreamController.stream.asBroadcastStream();
  }

   @override
  Widget build(BuildContext context){
     return Scaffold(
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: increment,
       ),
       body: Container(
         alignment: Alignment.center,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             StreamBuilder(
               stream: myStream,
               builder: (context,snapshot){
                 var data = snapshot.data;
                 IncrementModel  item = IncrementModel(value: "value : 0", counterValue: 0);
                 if(snapshot.hasData){
                     item = data as IncrementModel;
                 }
                 if(snapshot.hasData){
                   return Text("${item.counterValue}",style: TextStyle(
                     fontSize: 70,
                     fontWeight: FontWeight.bold
                   ),);
                 }else{
                   return Text("0", style: TextStyle(
                       fontSize: 70,
                       fontWeight: FontWeight.bold
                   ),);
                 }
               },
             ),
             Divider(),
             StreamBuilder(
               stream: myStream,
               builder: (context,snapshot){
                 var data = snapshot.data;
                 IncrementModel  item = IncrementModel(value: "value : 0", counterValue: 0);
                 if(snapshot.hasData){
                   item = data as IncrementModel;
                 }
                 if(snapshot.hasData){
                   return Text("${item.counterValue}",style: TextStyle(
                     fontSize: 70,
                     fontWeight: FontWeight.bold
                   ),);
                 }else{
                   return Text("0", style: TextStyle(
                       fontSize: 70,
                       fontWeight: FontWeight.bold
                   ),);
                 }
               },
             ),
           ],
         ),
       ),
     );
  }
}


class IncrementModel{
  IncrementModel({required this.value,required this.counterValue});
  String value;
  int counterValue;
}
