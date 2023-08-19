import 'package:flutter/material.dart';
import 'package:g/models/model_AudioDescription.dart';
import 'package:g/widgets/widget_AudioPlayer.dart';

class WidgetCoverPage extends StatefulWidget {
  const WidgetCoverPage({super.key, required this.modelAudioDescription});

  final ModelAudioDescription modelAudioDescription;

  @override
  State<WidgetCoverPage> createState() => _WidgetCoverPageState();
}

class _WidgetCoverPageState extends State<WidgetCoverPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: getcolors(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                widget.modelAudioDescription.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Listen to yuor favourite music",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 330,
                height: 310,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.0),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.modelAudioDescription.image,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                widget.modelAudioDescription.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            WidgetAudioPlayer(
                modelAudioDescription: widget.modelAudioDescription),
          ],
        ),
      ),
    );
  }

  List<Color> getcolors() {
    List<Color> items = [];

    for (var color in widget.modelAudioDescription.colors) {
      items.add(color);
    }
    return items;
  }
}
