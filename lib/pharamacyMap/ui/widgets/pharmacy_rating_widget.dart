import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medication_remainder/pharamacyMap/constants/file_constants.dart';
import 'package:medication_remainder/pharamacyMap/constants/space_constants.dart';

class PharmacyRatingWidget extends StatefulWidget {
  final double initRating;
  final Function onRatingTap;
  const PharmacyRatingWidget(
      {this.initRating = 0.0, required this.onRatingTap});

  @override
  _PharmacyRatingWidgetState createState() => _PharmacyRatingWidgetState();
}

class _PharmacyRatingWidgetState extends State<PharmacyRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: widget.initRating,
      minRating: 0,
      ignoreGestures: true,
      updateOnDrag: true,
      itemCount: 5,
      itemSize: 12,
      allowHalfRating: true,
      itemPadding:
          const EdgeInsets.symmetric(horizontal: SpaceConstants.spacing3),
      ratingWidget: RatingWidget(
        full: SvgPicture.asset(FileConstants.icFilledStar),
        half: SvgPicture.asset(FileConstants.icEmptyStar),
        empty: SvgPicture.asset(FileConstants.icEmptyStar),
      ),
      onRatingUpdate: (rating) => widget.onRatingTap(rating),
    );
  }
}
