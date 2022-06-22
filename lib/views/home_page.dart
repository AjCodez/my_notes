import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/firebase_options.dart';
import 'package:my_notes/views/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Pizza Menu",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255))),
                  backgroundColor: const Color.fromARGB(255, 47, 204, 186),
                ),
                body: SafeArea(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                  image: NetworkImage(
                                      "https://cdn.discordapp.com/emojis/884920491641536512.webp?size=128&quality=lossless"),
                                  width: 60)),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Corn Pizza",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                  image: NetworkImage(
                                      "https://cdn.discordapp.com/emojis/884920207842357259.webp?size=128&quality=lossless"),
                                  width: 60)),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Vegetable Pizza",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                  image: NetworkImage(
                                      "https://cdn.discordapp.com/emojis/884920208014340126.webp?size=128&quality=lossless"),
                                  width: 60)),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Pepperoni Pizza",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                  image: NetworkImage(
                                      "https://cdn.discordapp.com/emojis/884920208085614593.webp?size=128&quality=lossless"),
                                  width: 60)),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Vegan Pizza",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                  image: NetworkImage(
                                      "https://cdn.discordapp.com/emojis/884920207724916747.webp?size=128&quality=lossless"),
                                  width: 60)),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Sausage Pizza",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                  image: NetworkImage(
                                      "https://cdn.discordapp.com/emojis/884920491402489908.webp?size=128&quality=lossless"),
                                  width: 60)),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Chicken Pizza",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                  image: NetworkImage(
                                      "https://cdn.discordapp.com/emojis/965981569724600321.webp?size=128&quality=lossless"),
                                  width: 60)),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Heart Shape Pizza",
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
