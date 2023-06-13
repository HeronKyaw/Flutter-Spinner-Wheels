import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinnerWheelWidget extends StatefulWidget {
  final List<String>? items;
  const SpinnerWheelWidget({super.key, required this.items});

  @override
  State<SpinnerWheelWidget> createState() => _SpinnerWheelWidgetState();
}

class _SpinnerWheelWidgetState extends State<SpinnerWheelWidget> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected.add(
                  Fortune.randomInt(0, widget.items!.length),
                );
              });
            },
            child: Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var item in widget.items!) FortuneItem(child: Text(item))
                ]
              ),
            ),
          )
        )
      ],
    );
  }
}