import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../utilities/constants.dart';

///
class InboxPicture extends StatelessWidget {
  ///
  // ignore: non_constant_identifier_names
  const InboxPicture({required this.URL, required this.name});

  ///
  // ignore: non_constant_identifier_names
  final String URL;

  ///
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
      width: kPictureSize,
      height: kPictureSize,
      child: ClipOval(
        child: FadeInImage.memoryNetwork(
          fit: BoxFit.cover,
          placeholder: kTransparentImage,
          imageErrorBuilder: (context, exception, stackTrace) {
            return Center(
              child: Text(
                name[0],
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.white),
              ),
            );
          },
          image: URL,
        ),
      ),
    );
  }
}
