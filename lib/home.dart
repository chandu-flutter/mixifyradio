import 'package:flutter/material.dart';
import 'package:mixifyradio/screens/bengali_hits.dart';
import 'package:mixifyradio/screens/english_hits.dart';
import 'package:mixifyradio/screens/evergreen_hits.dart';
import 'package:mixifyradio/screens/hindi_hits.dart';
import 'package:mixifyradio/screens/hits90.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF144771),
              Color(0xFF071A2C),
            ],
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            Image.asset("images/rose.jpeg"),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Hits90();
                      },
                    ),
                  );
                },
                child: const Tiles(title: "Mixify 90's Hits", index: "1")),
            const Divi(),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EvergreenHits();
                      },
                    ),
                  );
                },
                child: const Tiles(title: "Mixify Evergreen Hits", index: "2")),
            const Divi(),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HindiHits();
                      },
                    ),
                  );
                },
                child: const Tiles(title: "Mixify Hindi Hits", index: "3")),
            const Divi(),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BengaliHits();
                      },
                    ),
                  );
                },
                child: const Tiles(title: "Mixify Bengali Hits", index: "4")),
            const Divi(),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EnglishHits();
                      },
                    ),
                  );
                },
                child: const Tiles(title: "Mixify English Hits", index: "5")),
            const Divi(),
          ],
        ),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  final String title;

  final String index;

  const Tiles({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        subtitle: const Text(
          "Mixify Radio ",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
        trailing: const Icon(Icons.volume_up, color: Colors.white, size: 20),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            index,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class Divi extends StatelessWidget {
  const Divi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: Colors.grey,
      indent: 4,
      endIndent: 4,
    );
  }
}
