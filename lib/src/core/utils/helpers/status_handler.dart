import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/views/widgets/indicator/empty_screen.dart';
import 'package:better_life_admin/src/views/widgets/indicator/error_screen.dart';
import 'package:better_life_admin/src/views/widgets/indicator/loading_indicator.dart';
import 'package:flutter/material.dart';

enum Status { initial, success, error, loading, empty }

extension StatusExtension on Status {
  bool get isInitial => this == Status.initial;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
  bool get isLoading => this == Status.loading;
  bool get isEmpty => this == Status.empty;
}

typedef StatusWidgetBuilder = Widget Function(BuildContext context);

class StatusHandler extends StatelessWidget {
  final Status status;
  final Widget onSuccess;
  final StatusWidgetBuilder? errorBuilder;
  final StatusWidgetBuilder? emptyBuilder;
  final StatusWidgetBuilder? loadingBuilder;

  final String? errorMessage;
  final String? emptyMessage;
  const StatusHandler(
      {super.key,
      required this.status,
      required this.onSuccess,
      this.errorBuilder,
      this.emptyBuilder,
      this.loadingBuilder,
      this.errorMessage,
      this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kDuration,
      child: _handleState(context),
    );
  }

  Widget _handleState(BuildContext context) {
    late Widget child;
    switch (status) {
      case Status.initial:
      case Status.loading:
        child = loadingBuilder?.call(context) ?? const MyLoadingIndicator();
        break;
      case Status.empty:
        child = emptyBuilder?.call(context) ??
            EmptyScreen(message: emptyMessage ?? 'No data found');
        break;
      case Status.success:
        child = onSuccess;
        break;
      case Status.error:
        child =
            errorBuilder?.call(context) ?? ErrorScreen(message: errorMessage);
        break;
    }
    return child;
  }
}
