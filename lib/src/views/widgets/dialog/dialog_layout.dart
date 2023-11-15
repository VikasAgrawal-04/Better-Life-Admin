import 'package:flutter/material.dart';

class DialogLayout extends StatelessWidget {
  final Widget child;

  const DialogLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      child: child,
    );
  }
}
