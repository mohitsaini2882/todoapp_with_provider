import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: GestureDetector(
        onTap: (){
            FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          height: size.height,
          width: size.width,color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gap(size.height/4.3),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Enter your email address',
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Enter your password',
                  ),
                ),
                const Gap(20),
                Center(
                  child: ElevatedButton(
                    child: const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 40),
                      child:  Text('Login'),
                    ),
                    onPressed: () {
                      _login();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(){
    print("login run");
  }
}
