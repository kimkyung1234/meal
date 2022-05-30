import 'package:flutter/material.dart';
import 'package:meal/widgets/common.dart';

class SquareImage extends StatelessWidget {
  final String url;

  const SquareImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(
        fit: StackFit.expand,
        children: [
          carryImageWidget(
            url: url,
            boxFit: BoxFit.scaleDown,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
