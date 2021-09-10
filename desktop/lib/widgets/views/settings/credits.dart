import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key, required this.onOceanThemeUnlocked}) : super(key: key);

  final Function() onOceanThemeUnlocked;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NcBodyText(
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh ipsum consequat nisl vel pretium lectus quam id leo. Porta nibh venenatis cras sed felis eget velit. Est velit egestas dui id ornare arcu odio ut. Ac ut consequat semper viverra nam libero justo laoreet. Feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Est velit egestas dui id ornare arcu odio. Amet commodo nulla facilisi nullam. Ullamcorper sit amet risus nullam eget felis. Risus quis varius quam quisque id diam vel quam elementum. Tellus mauris a diam maecenas sed. Tortor consequat id porta nibh venenatis cras sed felis eget.
                In pellentesque massa placerat duis ultricies lacus sed. Elit sed vulputate mi sit amet mauris commodo quis imperdiet. Scelerisque varius morbi enim nunc faucibus a. Sollicitudin nibh sit amet commodo nulla facilisi nullam. Nulla malesuada pellentesque elit eget gravida cum sociis natoque. 
              ''',
          overflow: TextOverflow.visible,
          fontSize: 20,
        ),
        NcSpacing.xl(),
        NcButton(
          text: "",
          onTap: () {
            // TODO: Unlock Oceon Theme
            onOceanThemeUnlocked();
            throw Exception("test");
          },
        )
      ],
    );
  }
}
