import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/common.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.textEditingController,
    required this.focusNode,
    required this.keyboardType,
    required this.maxLength,
    this.hasError = false,
    this.onChanged,
    this.textAlign = TextAlign.center,
    super.key,
  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final int maxLength;
  final TextAlign textAlign;
  final bool hasError;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isRevealed = true;

  @override
  Widget build(BuildContext context) {
    final inputTheme = InputFieldTheme.of(context);

    return TextFormField(
      controller: widget.textEditingController,
      style: inputTheme.primaryTextStyle,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onTapOutside: (event) {
        widget.focusNode.unfocus();
      },
      textAlign: widget.textAlign,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        enabledBorder: widget.hasError ? inputTheme.errorBorder : inputTheme.enabledBorder,
        focusedBorder: widget.hasError ? inputTheme.errorBorder : inputTheme.enabledBorder,
        contentPadding: inputTheme.contentPadding,
        fillColor: inputTheme.backgroundColor,
        filled: true,
        counterText: '',
      ),
      maxLength: widget.maxLength,
      cursorHeight: inputTheme.cursorHeight,
      cursorColor: inputTheme.cursorColor,
    );
  }
}
