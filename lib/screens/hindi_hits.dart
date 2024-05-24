import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_player/radio_player.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HindiHits extends StatefulWidget {
  @override
  _HindiHitsState createState() => _HindiHitsState();
}

class _HindiHitsState extends State<HindiHits> {
  RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;

  @override
  void initState() {
    super.initState();
    initRadioPlayer();
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: 'Radio Player',
      url: 'https://server.mixify.in/listen/new_hits/radio.mp3',
      imagePath: 'assets/cover.jpg',
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Uri facebook =
        Uri.parse('https://www.facebook.com/profile.php?id=100095251196273');
    final Uri twitter = Uri.parse('https://twitter.com/mixifyradio');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF144771),
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Hindi Hits",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: () {
                  Share.share('');
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 26.0, right: 8.0),
                  child: Icon(Icons.share),
                )),
          ],
        ),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset("animations/music.json", width: 200),
                Text(
                  metadata?[0] ?? 'Artist/Title',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white),
                ),
                Text(
                  metadata?[1] ?? '',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchUrl(facebook,
                            mode: LaunchMode.externalApplication);
                      },
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(twitter,
                            mode: LaunchMode.externalApplication);
                      },
                      child: const Icon(
                        FontAwesomeIcons.xTwitter,
                        size: 25,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  _radioPlayer.stop();
                },
                icon: const Icon(
                  Icons.stop,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                isPlaying ? _radioPlayer.pause() : _radioPlayer.play();
              },
              tooltip: 'Control button',
              child: Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
