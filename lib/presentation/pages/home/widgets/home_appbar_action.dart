import 'package:flutter/material.dart';

class HomeAppbarAction extends StatelessWidget {
  const HomeAppbarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 70,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Positioned(
            right: 38,
            child: CircleAvatar(
              maxRadius: 16,
              backgroundImage: NetworkImage(
                  "https://musicart.xboxlive.com/7/4d4d6500-0000-0000-0000-000000000002/504/image.jpg"),
            ),
          ),
          Positioned(
            right: 12,
            child: CircleAvatar(
              maxRadius: 20,
              backgroundImage: NetworkImage(
                  "https://ichef.bbci.co.uk/images/ic/480xn/p0dnxrcv.jpg.webp"),
            ),
          ),
        ],
      ),
    );
  }
}
