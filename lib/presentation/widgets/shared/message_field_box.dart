import 'package:flutter/material.dart';

class MessageFileBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFileBox({
    super.key, 
    required this.onValue
  });

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
            textController.clear();
            onValue(textValue);
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
        textController.clear();
        focusNode.requestFocus();
        onValue(value); // siempre va mantener el focus
      },
    );
  }
}