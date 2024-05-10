import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBar extends ConsumerWidget {
  final String imgLink;

  const TopBar({
    super.key,
    required this.imgLink,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return FlexibleSpaceBar(
        background: Stack(
      children: [
        Image.asset(
          height: size.height / 2.5,
          imgLink,
          fit: BoxFit.cover,
        ),
      ],
    ));
  }
}