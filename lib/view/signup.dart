import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Center(child: Text('SignUp')),
      ),
      body: ListView(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Image.asset("assets/images/logo.png", width: 150, height: 220)
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Mot de passe"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "FirstName"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 10 ),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "LastName"),
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
                //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));

              },
            ),
          ),
        ],
      ),
    );
  }
}
