import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture svg(String path) {
  return SvgPicture.asset(path);
}

showSnackbar(BuildContext context,String msg, bool isError) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: isError ? Colors.redAccent : Colors.green,
  ));
}
