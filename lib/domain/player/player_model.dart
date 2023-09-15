class PlayerModel {
  String playerPicture;
  String playerName;

  PlayerModel({
    required this.playerPicture,
    required this.playerName,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        playerPicture: json["playerImage"],
        playerName: json["playerName"],
      );

  Map<String, dynamic> toJson() => {
        "playerImage": playerPicture,
        "playerName": playerName,
      };
}
