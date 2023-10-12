import 'package:flutter/material.dart';

class nextbtn extends StatefulWidget {
  bool isSelected;
  final VoidCallback function;

  nextbtn(this.isSelected, this.function);

  @override
  State<nextbtn> createState() => _nextbtnState();
}

class _nextbtnState extends State<nextbtn> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: !widget.isSelected,
        child: GestureDetector(
          onTap: widget.function,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.isSelected ? Colors.amber[900] : Colors.grey.shade300,
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.isSelected ? Colors.white : Colors.grey
                ),
              ),
            ),
          ),
        ));
  }
}
