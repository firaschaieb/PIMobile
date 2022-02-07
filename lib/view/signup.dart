import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String? _username;
  late String? _email;
  late String? _password;
  late String? _firstName;
  late String? _lastName;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  final String _baseUrl = "10.0.2.2:3000";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Center(child: Text('SignUp')),
      ),
      body: Form(
        key: _keyForm,
        child:ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/logo.png", width: 150, height: 220)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
                onSaved: (String? value) {
                  _username = value;
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty) {
                    return "Le username ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "Le username doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
                onSaved: (String? value) {
                  _email = value;
                },
                validator: (String? value) {
                  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                  if(value == null || value.isEmpty) {
                    return "L'adresse email ne doit pas etre vide";
                  }
                  else if(!RegExp(pattern).hasMatch(value)) {
                    return "L'adresse email est incorrecte";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mot de passe"),
                onSaved: (String? value) {
                  _password = value;
                },
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "FirstName"),
                onSaved: (String? value) {
                  _firstName = value;
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty) {
                    return "firstname ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "firstname doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "LastName"),
                onSaved: (String? value) {
                  _lastName = value;
                },
                validator: (String? value) {
                  if(value == null || value.isEmpty) {
                    return "lastname ne doit pas etre vide";
                  }
                  else if(value.length < 5) {
                    return "lastname doit avoir au moins 5 caractères";
                  }
                  else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent, // background
                ),
                child: const Text("Confirm !"),
                onPressed: () {
                  if(_keyForm.currentState!.validate()) {
                    _keyForm.currentState!.save();

                    Map<String, dynamic> userData = {
                      "profilePicture": _username,
                      "password" : _password,
                      "email" : _email,
                      "lastName" : _lastName,
                      "firstName" : _firstName
                    };

                  Map<String, String> headers = {
                      "Content-Type": "application/json; charset=UTF-8"
                    };

                    http.post(Uri.http(_baseUrl, "/api/user/register"), headers: headers, body: json.encode(userData))
                        .then((http.Response response) {
                      if(response.statusCode == 201) {
                        Navigator.pushReplacementNamed(context, "/");
                      }
                      else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("Une erreur s'est produite. Veuillez réessayer !"),
                              );
                            });
                      }
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}