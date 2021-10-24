import 'package:flutter/material.dart';

class GroupButton extends StatelessWidget {
  final String textLeft;
  final String textRight;

  final Color colorBackgroudLeft;
  final Color colorTextLeft;
  final Color colorTopBorder;
  final VoidCallback handlerLeft;
  final VoidCallback handlerRight;

  const GroupButton({
    Key? key,
    required this.textLeft,
    required this.textRight,
    required this.colorBackgroudLeft,
    required this.colorTextLeft,
    required this.handlerLeft,
    required this.handlerRight, required this.colorTopBorder,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorTopBorder),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: handlerLeft,
              child: Text(textLeft),
              style: ElevatedButton.styleFrom(
                primary: colorBackgroudLeft,
                onPrimary: colorTextLeft,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    // topRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(20),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: handlerRight,
              child: Text(textRight),
              style: ElevatedButton.styleFrom(
                primary: colorTextLeft,
                onPrimary: colorBackgroudLeft,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    // topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
