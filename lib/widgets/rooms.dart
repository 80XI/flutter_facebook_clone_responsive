import 'package:flutter/material.dart';

import '../config/pallette.dart';
import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          return Container(
              margin: const EdgeInsets.all(2.0),
              height: 20.0,
              width: 20.0,
              color: Colors.red);
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => print("Create Room"),
        style: OutlinedButton.styleFrom(
            shape:  const RoundedRectangleBorder(
              side: BorderSide(
                width: 3.0,
                color: Colors.white,
              ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
        child: Row(
          children:  [
            ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: const Icon(
                Icons.video_call,
                size: 35.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            const Text('Create\nRoom'),
          ],
        )
    );
  }
}