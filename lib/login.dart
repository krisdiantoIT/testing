import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState(){
    return LoginState();
  }
    }

class LoginState extends State<Login>{

  bool _isLoading = false;

  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Colors.blue,
              Colors.teal,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _isLoading  ? Center (child:CircularProgressIndicator()) : ListView(
          children: <Widget>[
            SizedBox(height: 25.0,),
            headerSection(),
            SizedBox(height:20.0),
            textSection(),
            SizedBox(height: 50.0,),
            buttonSection(),
            SizedBox(height: 25.0,),
             Column( 
               children: <Widget>[
                 Text( 'By : Krisdianto'),
                 Text('Medan'),
               ],
             ),
          ],
        ),
      ),
    );
  }

  signIn(String email, String password) async {

    Map data = {
      'email' : email,
      'password' : password,
    };
    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post('https://reqres.in/api/login', body: data);
    if(response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString('token', jsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(BuildContext context )=> MainPage()), (Route<dynamic> route) =>false);
      });
    } 
    else{
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.only(top:30.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child:RaisedButton(
        onPressed: (){
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passwordController.text);
        },
        color:Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:Text('Sign In',style: TextStyle(color:Colors.white70,fontSize: 20.0),),
      )
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.0),
      margin:EdgeInsets.only(top:30.0),
      child: Column(
        children: <Widget>[
          txtEmail('Email',Icons.email),
          SizedBox(height:50.0),
          txtPassword('Password',Icons.lock),
        ],
      ),
    );
  }

  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextFormField txtSection(String title, IconData icon) {
    return TextFormField(
      obscureText: title == "Email" ? false : true,
      style: TextStyle(color:Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color:Colors.white70),
        icon:Icon(icon),
      ),
    );
  }
  

  TextFormField txtEmail(String title, IconData icon) {
    return TextFormField(
      controller: emailController,
      style:TextStyle(color:Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle:TextStyle(color:Colors.white70),
        icon:Icon(icon),
      ),
    );
  }

  TextFormField txtPassword(String title, IconData icon) {
    return TextFormField(
      controller: passwordController,
      style:TextStyle(color:Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle:TextStyle(color:Colors.white70),
        icon:Icon(icon),
      ),
    );
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20.0, vertical:30.0),
      child: Text('Login First',style: TextStyle(color:Colors.white70,fontSize:40.0),),
    );
  }
}

















