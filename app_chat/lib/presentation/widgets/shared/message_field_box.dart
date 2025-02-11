import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        //Diseño del input del teclado
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      //Decoración del input
      hintText: 'End your message with a "??"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          // Todo Toma el valor del botón de enviar
          final textValue = textController
              .value.text; //Tomar el valor y asignarlo a "TextController"
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      // Todo Toma el valor del Enter del teclado
      focusNode: focusNode, //Cuando no queremos quitar el foco del teclado
      controller: textController,
      onTapOutside: (event) {
        // Quitar el foco del teclado cuando haces click afuera
        focusNode.unfocus();
      },
      //Input de texto
      decoration: inputDecoration, //Importar el input decoration
      onFieldSubmitted: (value) {
        textController.clear(); //Borrar texto
        focusNode.requestFocus(); //implementamos el focus en el teclado
        onValue(value);
      },
    );
  }
}
