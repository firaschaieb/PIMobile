import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class Usermodel extends StatefulWidget {
  const Usermodel({Key? key}) : super(key: key);

  @override
  _UsermodelState createState() => _UsermodelState();
}

class _UsermodelState extends State<Usermodel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.deepOrange,
              title: Text("Welcome MR . " ),

              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.power_settings_new),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Deconnexion")
                ],
              ),
              onTap: () async {
                SharedPreferences preferences =
                await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.pushNamed(context, "/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
