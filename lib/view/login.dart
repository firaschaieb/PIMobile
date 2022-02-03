
import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(children: [
        const SizedBox(
          width: 20,
        ),

        const Text(
          "Music Hub",
          style: TextStyle(
              fontSize: 50,
                color: Colors.blueGrey
          ),
          textAlign: TextAlign.center,

        ),
        Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Image.asset("assets/images/logo.png",
                width: 215, height: 380)),

        Container(
          margin: const EdgeInsets.fromLTRB(30, 10 , 30, 0 ),
          child: const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Username"),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 20 ),
          child: const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Mot de passe"),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrangeAccent, // background
            ),
            child: const Text("S'authentifier"),
            onPressed: () {
            //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));

            },
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child:ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey, // background
            ),
            child: const Text("Créer un compte"),
            onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signup()));
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 50,
            ),
            Text("Mot de passe oublié ?  "),
            Center(

              child:
              Text("Cliquez ici",
                  style: TextStyle(color: Colors.orangeAccent),
                  textDirection: TextDirection.ltr),
            ),
          ],
        )
      ]),

    );
  }
}
