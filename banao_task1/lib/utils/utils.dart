import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture svg(String path) {
  return SvgPicture.asset(path);
}

showImage() {
  return CachedNetworkImage(imageUrl: "https://picsum.photos/seed/picsum/242/140");
}
