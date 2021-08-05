import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLine;
  final TextInputType type;
  final Widget icon;
  final bool readOnly;
  final Function onTap;
  const TextInput(
      {Key key,
      this.controller,
      this.label,
      this.maxLine,
      this.type,
      this.icon,
      this.onTap,
      this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        autocorrect: false,
        controller: controller,
        keyboardType: type,
        maxLength: maxLine,
        maxLines: null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: icon,
          labelText: label,
          hintMaxLines: maxLine,
        ),
        readOnly: readOnly == null ? false : true,
        onTap: onTap,
      );
}
