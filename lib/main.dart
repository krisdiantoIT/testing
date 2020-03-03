import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tes_jogja/api.dart';
import 'package:tes_jogja/detailpage.dart';
import 'login.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HALAMAN UTAMA',
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  SharedPreferences sharedPreferences;

  @override
  void initState(){
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('token') == null){
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(BuildContext context )=> Login()), (Route<dynamic> route) =>false);    
    }
  }

// bool _isLoading = false;
// TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('HALAMAN UTAMA',style:TextStyle(color:Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              sharedPreferences.clear();
              sharedPreferences.commit();
            },
            child:GestureDetector(
              child: Text('Log Out',style: TextStyle(color:Colors.white),
          ),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
          },
            ),
          ),
        ],
      ),
      body: Tampilan(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color:Colors.white),
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage()));
        },
      ),
    );
  }
} 