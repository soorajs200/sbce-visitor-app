import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbce_loginapp/pages/admin.dart';
import 'package:sbce_loginapp/pages/security.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  void login(){
    final String username= _usernameController.text;
    final String password=_passwordController.text;

    if(username=='admin' && password=='12345'){
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>AdminPage()),
      );
    }
    else if(username=='sbce' && password=='sbce123'){
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>SecurityPage()),
      );
    }
    else{
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          title: Text("Login Failed"),
          content:Text("Invalid username or password"),
          actions: [
            TextButton(
              onPressed: ()=>Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSsA-sLYPolIDGqooOdPZchDUCgK0IXYc5EA&s"),
                radius: 70,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "UserName",
                  hintText: "Enter username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    ),
                    backgroundColor:Colors.amber
                ),
                onPressed: login,
                child: Text("LOGIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}