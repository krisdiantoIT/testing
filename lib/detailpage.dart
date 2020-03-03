import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  //  final  User user;
  //  DetailPage({this.user});
  @override
  Widget build(BuildContext context){
        return Scaffold(
          
         body:ListView(
           children: <Widget>[
             Container(
               height:70.0,
               width: double.infinity,
               child:Center(child: Text('Tambah Data',style: TextStyle(fontSize: 30.0,color:Colors.white),)),
               color:Colors.blue,
             ),
             Column(
               children: <Widget>[
                 SizedBox(height:30.0),
                 TextFormField(
                   decoration: InputDecoration(
                     hintText: 'email',
                     icon: Icon(Icons.email),
                   ),
                 ),

                  SizedBox(height: 40.0,),
                 TextFormField(
                   decoration: InputDecoration(
                     hintText: 'first_name',
                     icon: Icon(Icons.nature_people)
                   ),
                 ),

                 SizedBox(height:40.0),
                 TextFormField(
                   decoration: InputDecoration(
                     hintText: 'last_name',
                     icon: Icon(Icons.people)
                   ),
                 ),

                  SizedBox(height:40.0),
                 GestureDetector(
                   child: Container(
                     child:Center(child: Text('Tambah',style: TextStyle(fontSize: 20.0,color: Colors.white),)),
                     height:50.0,
                     width:300.0,
                     decoration: BoxDecoration(
                       color: Colors.black,
                       borderRadius: BorderRadius.circular(10.0),
                     ),
                   ),
                   onTap: (){},
                 )
               ],
             )
           ],
         )
    
    );
  } 
}

// class User  {
//   final int index;
//   final String email;
 

//   User({
//     this.index, this.email
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//     index: json['index'],
//     email: json['email'],
//     );
// }
