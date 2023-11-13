import 'package:better_life_admin/src/views/widgets/buttons/loading_switcher.dart';
import 'package:better_life_admin/src/views/widgets/indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Color? color;
  final bool isLoading;
  final bool isDisabled;
  final Future<void> Function()? onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width, height;
  final BoxBorder? border;
  const CustomButton(
      {this.child,
      this.text,
      this.color,
      this.isLoading = false,
      this.isDisabled = false,
      this.onPressed,
      this.padding,
      this.height,
      this.width,
      this.margin,
      this.border,
      super.key})
      : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return LoadingSwitcher(
        onPressed: _getOnTap,
        loadingChild: _loadingChild(context),
        child: _buttonLayout(context));
  }

  Future<void> Function()? get _getOnTap {
    if (isDisabled || isLoading) return null;
    return onPressed;
  }

  _CustomButton _buttonLayout(BuildContext context) {
    return _CustomButton(
      color: getColor(context),
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      border: border,
      child: _getChild(),
    );
  }

  _CustomButton _loadingChild(BuildContext context) {
    return _CustomButton(
      color: context.theme.disabledColor.withOpacity(0.10),
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      border: border,
      child: const MyLoadingIndicator(),
    );
  }

  Widget _getChild() {
    if (isLoading) {
      return _showLoading();
    } else if (child != null) {
      return child!;
    } else {
      return _showText();
    }
  }

  Row _showLoading() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyLoadingIndicator(),
      ],
    );
  }

  Color getColor(BuildContext context) {
    if (isDisabled || isLoading) {
      return Get.theme.disabledColor.withOpacity(0.10);
    } else {
      return color ?? Get.theme.primaryColor;
    }
  }

  Text _showText() {
    Color color = Colors.white;

    if (isDisabled) {
      color = Get.theme.disabledColor.withOpacity(0.40);
    }
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxBorder? border;
  const _CustomButton({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    required this.child,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: padding,
      margin: margin,
      duration: 200.milliseconds,
      alignment: Alignment.center,
      width: width ?? context.mediaQuery.size.width,
      height: height ?? 50,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4.0),
          border: border),
      child: child,
    );
  }
}
