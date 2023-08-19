import 'package:flutter/material.dart';
import 'package:g/models/model_AudioDescription.dart';
import 'package:g/widgets/widget_coverpage.dart';

class widgetMusicItem extends StatelessWidget {
  const widgetMusicItem({super.key, required this.modelAudioDescription});
  final ModelAudioDescription modelAudioDescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.black,
      child: Row(
        children: [
          const SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              modelAudioDescription.image,
              width: 90,
              height: 90,
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  modelAudioDescription.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    body: WidgetCoverPage(
                        modelAudioDescription: modelAudioDescription),
                  );
                }));
              },
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*
body: ListView.builder(
        itemCount: familymemberslist.length,
        itemBuilder: (context, index) {
          return item(
            myItem: familymemberslist[index],
            myColor: const Color(0xff7D40A2),
          );
        },
      ),
 */