import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final String data;
  final bool isSelected;
  final int? index;
  final Function(int)? onTapHandler;
  const MyBadge({
    Key? key,
    required this.data,
    required this.isSelected,
    this.onTapHandler, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:index!=null? ()=> onTapHandler!(index!) :null,
      child: Container(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            //const Color(0xFFDBE9FF)
            color: isSelected
                ? Theme.of(context).textTheme.headline2!.color!.withOpacity(0.2)
                : Colors.grey[300],
            border: Border.all(
                //const Color(0xffc4d7f5)
                color: isSelected
                    ? Theme.of(context)
                        .textTheme
                        .headline2!
                        .color!
                        .withOpacity(0.1)
                    : Colors.white,
                width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Text(
          data,
          style: TextStyle(
              color: isSelected
                  ? Theme.of(context).textTheme.headline2!.color!
                  : Colors.grey),
        ),
      ),
    );
  }
}
