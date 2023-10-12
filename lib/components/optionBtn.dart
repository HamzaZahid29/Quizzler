import 'package:flutter/material.dart';

class OptionsBtn extends StatelessWidget {
  final String optionLabel;
  final String optionName;
  bool isSelected ;
 final VoidCallback function;



  OptionsBtn(this.optionLabel, this.optionName, this.isSelected, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.amber,
              width: 1,
            ),
            color: isSelected ? Colors.amber[900] : Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  optionLabel + ' :',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.amber[900],
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  optionName,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.amber[900],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
