import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<dynamic>> items = [];

  List<String> list = ["Option 1", "Option 2", "Option 3"];

  int gIndex = 0;
  @override
  void initState() {
    super.initState();
    for (String element in list) {
      DropdownMenuItem item = DropdownMenuItem(
        value: list.indexOf(element),
        child: Text(element),
      );
      items.add(item);
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        actions: [
          PopupMenuButton(
            onSelected: (value){
              print("Datatype : ${value.runtimeType} and value : $value");
            },
            itemBuilder: (context){
              List<PopupMenuEntry<dynamic>> list = [
                PopupMenuItem(child: Text("Item 1"),value: 0,),
                PopupMenuItem(child: Text("Item 2"),value: 1,),
                PopupMenuItem(child: Text("Item 3"),value: 2,),
              ];
              return list;
            },
          )

        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Gap(size.height / 12),
                  ProfileWidget(context: context),
                  const Gap(40),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Enter your email address',
                    ),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter your password',
                    ),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Enter your confirm password',
                    ),
                  ),
                  const Gap(40),
                  Center(
                    child: ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text('SignUp'),
                      ),
                      onPressed: () {
                        _login();
                      },
                    ),
                  ),

                  ///----- drop down button ----
                  DropdownButton(
                      hint: Text(list[gIndex]),
                      items: items,
                      onChanged: (value) {
                        setState(() {
                          gIndex = value;
                        });
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login() {
    print("login run");
  }

  // ignore: non_constant_identifier_names
  ProfileWidget({required BuildContext context}) {
    return InkWell(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22),
        height: 120,
        width: 120,
        decoration:
            const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
    );
  }
}
