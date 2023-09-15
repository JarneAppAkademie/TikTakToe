


import 'package:flutter/material.dart';

import '../../../domain/player/player_model.dart';


class PlayerIcon extends StatelessWidget {
  final PlayerModel player;

  const PlayerIcon({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 40,
          child: Image.asset(player.playerPicture,),
        ),
        Text(player.playerName)
      ],
    );
  }
}
