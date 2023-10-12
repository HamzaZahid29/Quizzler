import 'package:flutter/material.dart';
class tilef extends StatelessWidget {
  String teext;
  IconData id;


  tilef(this.teext, this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange, // Choose the border color
            width: 2.0, // Choose the border width
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 26,horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 3,
                  child: Text(teext, style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                  ),)),
              Expanded(
                  flex: 1,
                  child: Icon(id, color: Colors.amber[900],size: 40,))
            ],
          ),
        ),
      ),
    );
  }
}
