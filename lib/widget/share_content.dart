import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types, must_be_immutable
class share_content extends StatelessWidget {
  final String iconName;
  final String text;
  final String subtite;
  final VoidCallback onTap;

  const share_content({
    super.key,
    required this.iconName,
    required this.text,
    required this.subtite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const ShapeDecoration(
              color: Color(0xFFF2F8F7),
              shape: OvalBorder(),
            ),
            child: Center(child: SvgPicture.asset(iconName)),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF000D07),
                  fontSize: 14,
                  fontFamily: 'Caros',
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                subtite,
                style: const TextStyle(
                  color: Color(0xFF797C7B),
                  fontSize: 12,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
