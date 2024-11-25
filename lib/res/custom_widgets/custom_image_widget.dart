import 'package:flutter/cupertino.dart';

class CommonImageWidget extends StatelessWidget {
  const CommonImageWidget({
    super.key,
    required this.image,
    required this.height,
  });
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
