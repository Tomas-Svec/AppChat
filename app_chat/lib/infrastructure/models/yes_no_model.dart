import 'package:app_chat/domain/entities/message.dart';

class YesNoModelo {
  final String answer;
  final bool forced;
  final String image;

  YesNoModelo({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModelo.fromJsonMap(Map<String, dynamic> json) => YesNoModelo(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
  text: answer == 'yes' ? 'Si' : 'No', 
  fromWho: FromWho.hers,
  imageUrl: image
  );
}
