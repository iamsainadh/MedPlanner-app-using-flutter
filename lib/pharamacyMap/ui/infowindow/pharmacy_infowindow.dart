import 'package:flutter/material.dart';
import 'package:medication_remainder/pharamacyMap/constants/file_constants.dart';
import 'package:medication_remainder/pharamacyMap/constants/fontsize_constants.dart';
import 'package:medication_remainder/pharamacyMap/constants/size_constants.dart';
import 'package:medication_remainder/pharamacyMap/constants/space_constants.dart';
import 'package:medication_remainder/pharamacyMap/ui/widgets/pharmacy_rating_widget.dart';
import 'package:medication_remainder/pharamacyMap/ui/widgets/triangle_anchor_shape.dart';

import 'model/pharmacy_details_model.dart';

class PharmacyInfoWindow extends StatefulWidget {
  final PharmacyDetailsModel model;
  const PharmacyInfoWindow({required this.model});
  @override
  _PharmacyInfoWindowState createState() => _PharmacyInfoWindowState();
}

class _PharmacyInfoWindowState extends State<PharmacyInfoWindow> {
  @override
  Widget build(BuildContext context) {
    SpaceConstants.getScreenSize(context);
    return SizedBox(
      width: SpaceConstants.screenSize.width,
      child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(SpaceConstants.screenSize.width / 7)),
                  boxShadow: [
                    BoxShadow(
                        color: widget.model.openingHours.openNow
                            ? Colors.green
                            : Colors.red,
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: const Offset(0, 0))
                  ]),
              child: ClipRRect(
                  child: CircleAvatar(
                radius: SpaceConstants.screenSize.width / 7,
                backgroundImage:
                    const AssetImage(FileConstants.icPharmacyPlaceHolder),
              )),
            ),
            const SizedBox(height: SpaceConstants.spacing15),
            Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: SpaceConstants.spacing30),
                elevation: SpaceConstants.elevation30,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: SpaceConstants.spacing10),
                          child: Text(widget.model.name,
                              style: const TextStyle(
                                  fontWeight: FontSizeConstants.fontWeightBold,
                                  fontSize: FontSizeConstants.fontSize14,
                                  color: Colors.blue))),
                      PharmacyRatingWidget(
                          onRatingTap: () {}, initRating: widget.model.rating),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: SpaceConstants.spacing10,
                              horizontal: SpaceConstants.spacing10),
                          child: Text(widget.model.vicinity,
                              style: const TextStyle(
                                fontWeight:
                                    FontSizeConstants.fontWeightSemiBold,
                                fontSize: FontSizeConstants.fontSize12,
                              )))
                    ])),
            CustomPaint(
                painter: TriangleAnchorShape(),
                child: SizedBox(
                    width: SizeConstants.size25, height: SizeConstants.size30))
          ])),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
