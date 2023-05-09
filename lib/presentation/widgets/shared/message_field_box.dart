import 'package:flutter/material.dart';

class MessageFileBox extends StatelessWidget {
  const MessageFileBox({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode =FocusNode();
    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      );
      
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            print('value: $textValue');
            textController.clear();
          }, 
          icon: const Icon(Icons.send_outlined),
        ),
      );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value: $value');
        textController.clear();
        focusNode.requestFocus(); // siempre va mantener el focus
      },
    );
  }
}