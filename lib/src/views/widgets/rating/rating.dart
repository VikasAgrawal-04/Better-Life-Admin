import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Ratings extends StatelessWidget {
  final double rating;
  const Ratings({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        itemCount: 5,
        direction: Axis.horizontal,
        allowHalfRating: true,
        initialRating: rating,
        itemSize: 2.h,
        ignoreGestures: true,
        ratingWidget: RatingWidget(
            full: SvgPicture.asset(
              'assets/full_star.svg',
            ),
            half: SvgPicture.asset(
              'assets/half_star.svg',
            ),
            empty: SvgPicture.asset(
              'assets/empty_star.svg',
            )),
        onRatingUpdate: (vale) {});
  }
}
