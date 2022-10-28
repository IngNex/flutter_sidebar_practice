import 'package:flutter/material.dart';

class CollapsingListTitle extends StatefulWidget {
  final String title;
  final IconData icon;

  const CollapsingListTitle(
      {super.key, required this.title, required this.icon});

  @override
  State<CollapsingListTitle> createState() => _CollapsingListTitleState();
}

class _CollapsingListTitleState extends State<CollapsingListTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon, color: Colors.white30),
        SizedBox(width: 10.0),
        Text(widget.title)
      ],
    );
  }
}
