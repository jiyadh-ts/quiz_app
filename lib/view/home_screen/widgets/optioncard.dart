import 'package:flutter/material.dart';

class Optionscard extends StatelessWidget {
  const Optionscard({
    super.key,
    required this.optionindex,
    required this.options,
    this.onTap,
    required this.col,
  });

  final int optionindex;
  final List<String> options;
  final void Function()? onTap;
  final Color col;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.transparent,
          border: Border.all(color: col, width: 2),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                options[optionindex],
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Container(
                width: 25,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
