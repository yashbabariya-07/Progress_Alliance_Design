import 'package:flutter/material.dart';

class LocationListtile extends StatelessWidget {
  final String location;
  final VoidCallback press;
  const LocationListtile(
      {super.key, required this.location, required this.press});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0,
          leading: Icon(Icons.pin_drop),
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
