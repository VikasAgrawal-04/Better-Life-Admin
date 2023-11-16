import 'package:better_life_admin/src/core/utils/constants/constants.dart';
import 'package:better_life_admin/src/core/utils/helpers/status_handler.dart';
import 'package:better_life_admin/src/views/widgets/global/header_text.dart';
import 'package:better_life_admin/src/views/widgets/indicator/empty_screen.dart';
import 'package:better_life_admin/src/views/widgets/indicator/error_screen.dart';
import 'package:better_life_admin/src/views/widgets/indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MySliverList<T> extends StatelessWidget {
  final String title;
  final Status status;
  final String? emptyMessage;
  final String? errorMessage;
  final StatusWidgetBuilder? errorBuilder;
  final StatusWidgetBuilder? emptyBuilder;
  final StatusWidgetBuilder? loadingBuilder;
  final NullableIndexedWidgetBuilder itemBuilder;
  final List<T> list;
  const MySliverList(
      {super.key,
      required this.title,
      required this.status,
      this.emptyMessage,
      this.errorMessage,
      this.errorBuilder,
      this.emptyBuilder,
      this.loadingBuilder,
      required this.itemBuilder,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildHeader(),
        _buildList(context),
      ],
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(
            text: title,
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    Widget child = const SizedBox.shrink();
    switch (status) {
      case Status.initial:
      case Status.loading:
        child = loadingBuilder?.call(context) ??
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(child: MyLoadingIndicator()),
            );
        break;
      case Status.success:
        child = _onSuccess();
        break;
      case Status.error:
        child =
            errorBuilder?.call(context) ?? ErrorScreen(message: errorMessage);
        break;
      case Status.empty:
        child = emptyBuilder?.call(context) ??
            EmptyScreen(message: emptyMessage ?? 'No data found');
        break;
    }

    if (!status.isSuccess) {
      return SliverToBoxAdapter(
        child: AnimatedSwitcher(
          duration: kDuration,
          child: child,
        ),
      );
    }

    return child;
  }

  SliverList _onSuccess() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        itemBuilder,
      ),
    );
  }
}
