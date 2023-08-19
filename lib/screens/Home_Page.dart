import 'package:flutter/material.dart';
import 'package:g/widgets/widget_musicItem.dart';
import '../models/model_AudioDescription.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
//I need to construct widgetmusicItems to display
  final List<ModelAudioDescription> modelAudioDescriptionList = const [
    ModelAudioDescription(
      image: 'assets/images/Arcade.jpg',
      name: 'Arcade',
      soundpath: 'sound/Arcade.mp3',
      colors: [
        Color(0xff163151),
        Color(0xff001522),
      ],
    ),
    ModelAudioDescription(
      image: 'assets/images/dandelions.jpg',
      name: 'Dndelions',
      soundpath: 'sound/Dandelions.mp3',
      colors: [
        Color(0xff9D8B3F),
        Color(0xffFFDFBD),
        Color(0xffFFDFBD),
      ],
    ),
    ModelAudioDescription(
      image: 'assets/images/shinunoga.jpg',
      name: 'Shinunoga',
      soundpath: 'sound/Shinunoga.mp3',
      colors: [
        Color(0xff000000),
        Color(0xff747881),
      ],
    ),
    ModelAudioDescription(
      image: 'assets/images/nightChanges.jpg',
      name: 'Night changes',
      soundpath: 'sound/Night_changes.mp3',
      colors: [
        Color(0xff023950),
        Color(0xff000000),
      ],
    ),
    ModelAudioDescription(
      image: 'assets/images/SNAP.jpg',
      name: 'SNAP',
      soundpath: 'sound/SNAP.mp3',
      colors: [
        Color(0xffE90037),
        Color(0xff43224B),
      ],
    ),
    ModelAudioDescription(
      image: 'assets/images/Snowman.jpg',
      name: 'Snowman',
      soundpath: 'sound/Snowman.mp3',
      colors: [
        Color(0xffA1B4B8),
        Color(0xffF3F8FB),
        Color(0xffA20000),
      ],
    ),
    ModelAudioDescription(
      image: 'assets/images/still_with_you.jpg',
      name: 'Still with you',
      soundpath: 'sound/StillWithYou.mp3',
      colors: [
        Color(0xff677FC2),
        Color(0xff03151C),
      ],
    ),
    ModelAudioDescription(
      image: 'assets/images/under_the_influence.jpg',
      name: 'Under influence',
      soundpath: 'sound/UndertheInfluence.mp3',
      colors: [
        Color(0xff403CB4),
        Color(0xffA54A5C),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 155,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 21, 193, 164),
                  Color.fromARGB(255, 3, 49, 41),
                  Color.fromARGB(255, 2, 22, 19),
                ],
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                    endIndent: 145,
                    indent: 145,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Energetic music',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Playlist',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              itemCount: modelAudioDescriptionList.length,
              itemBuilder: (context, index) {
                return widgetMusicItem(
                    modelAudioDescription: modelAudioDescriptionList[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
