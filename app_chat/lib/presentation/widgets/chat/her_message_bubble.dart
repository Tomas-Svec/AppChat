import 'package:app_chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              //Aliniar el texto a la izquierda
              color: colors.secondary,
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(message.imageUrl!),

        const SizedBox(height: 10),

        // Todo: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  //Imagen

  final String imageUrl;

  const _ImageBubble(this.imageUrl );

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; //Calcular el tamaño del dispositivo

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7, //Definir el tamaño de la imagen
          height: 150, //Definir el alto de la imagen
          fit: BoxFit.cover, //Hacer el border
          loadingBuilder: (context, child, loadingProgress) {
            //Loading de la imagen
            if (loadingProgress == null)
              return child; // Preguntar si ya se mando

            return Container(
              //Esperando la respuesta
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Esta enviando una imagen"),
            );
          },
        ));
  }
}
