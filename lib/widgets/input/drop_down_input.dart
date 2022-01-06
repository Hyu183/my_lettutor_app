import 'package:flutter/material.dart';

class DropdownInput extends StatelessWidget {
  final String title;
  final List<String> list;
  final String selectedValue;
  final Function(String?) callback;
  const DropdownInput({
    Key? key,
    required this.title,
    required this.list,
    required this.selectedValue,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (String? newVal) {
                callback(newVal);
              },
              items: list
                  .map<DropdownMenuItem<String>>(
                      (String e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
