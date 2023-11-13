import 'package:better_life_admin/src/views/widgets/indicator/loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingSwitcher extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget child;
  final bool isLoading;
  final Widget? loadingChild;
  const LoadingSwitcher(
      {this.isLoading = false,
      required this.onPressed,
      required this.child,
      this.loadingChild,
      super.key});

  @override
  State<LoadingSwitcher> createState() => _LoadingSwitcherState();
}

class _LoadingSwitcherState extends State<LoadingSwitcher> {
  bool isLoading = false;

  void setLoading(bool value) {
    if (!mounted) return;
    setState(() {
      isLoading = value;
    });
  }

  Future<void> onTap() async {
    try {
      setLoading(true);
      await widget.onPressed?.call();
      setLoading(false);
    } catch (e) {
      setLoading(false);
    }
  }

  @override
  void initState() {
    isLoading = widget.isLoading;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LoadingSwitcher oldWidget) {
    final hasChange = widget.isLoading != oldWidget.isLoading;
    if (hasChange) {
      setLoading(widget.isLoading);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? widget.loadingChild ?? const MyLoadingIndicator()
        : widget.child;
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeInOut,
        child: child,
      ),
    );
  }
}
