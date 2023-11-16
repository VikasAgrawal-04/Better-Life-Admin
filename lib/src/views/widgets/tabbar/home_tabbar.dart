import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeTabbar extends StatelessWidget {
  const HomeTabbar({
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: kBorderRadius,
        child: ColoredBox(
          color: const Color(0xffF4F4F6),
          child: Row(
            children: tabs.map(
              (e) {
                final isSelectedIndex = currentIndex == tabs.indexOf(e);
                final bgColor = isSelectedIndex
                    ? Get.theme.primaryColor
                    : const Color(0xffF4F4F6);
                final textColor = isSelectedIndex ? Colors.white : Colors.black;
                return Expanded(
                  child: _tab(e, bgColor, textColor),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  GestureDetector _tab(String e, Color bgColor, Color textColor) {
    return GestureDetector(
      onTap: () => onTap(tabs.indexOf(e)),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: kBorderRadius,
        ),
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          e,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
