import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medication_remainder/pharamacyMap/constants/file_constants.dart';
import 'package:medication_remainder/pharamacyMap/constants/size_constants.dart';
import 'package:medication_remainder/pharamacyMap/constants/space_constants.dart';

class SquareImage extends StatelessWidget {
  final String image;
  const SquareImage({this.image = ""});

  @override
  Widget build(BuildContext context) {
    SpaceConstants.getScreenSize(context);
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(SpaceConstants.spacing10),
            child: Stack(children: <Widget>[
              CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: SpaceConstants.screenSize.width * 0.27,
                  height: SpaceConstants.screenSize.width * 0.27,
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                          height: SizeConstants.size35,
                          width: SizeConstants.size35,
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.blue))),
                  errorWidget: (context, url, error) => Image.asset(
                        FileConstants.icPharmacyPlaceHolder,
                      ),
                  imageUrl: image)
            ])));
  }
}
