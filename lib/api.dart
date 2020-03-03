import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detailpage.dart';



class Tampilan extends StatefulWidget{
  @override
  State<Tampilan> createState(){
    return TampilanState();
  }
}

class TampilanState extends State<Tampilan>{
  
Map data;
List userData;

Future getData()async{
  http.Response response = await http.get('https://reqres.in/api/users?page=2');
 data = json.decode(response.body);
 setState(() {
   userData = data['data'];
 });
 debugPrint(userData.toString());
}

@override
void initState(){
  super.initState();
  getData();
}
 
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: userData == null ? 0 : userData.length,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Card(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundImage: NetworkImage(userData[index]['avatar']),
                  ),

                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(child: Text('${userData[index]['first_name']}'),
                        onTap:(){
                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage(user: userData=data[index],)));
                        }
                        ),
                      ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}


