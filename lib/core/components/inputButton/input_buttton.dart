import 'package:flutter/material.dart';
import 'package:kakubo/features/input/entries/input.dart';

class InputButtton extends StatelessWidget {
  const InputButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return const InputItems();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
