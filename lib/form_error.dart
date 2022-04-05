import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/Error.svg",
          height: 14,
          width: 14,
        ),
        SizedBox(
          width: 10,
        ),
        Text(error,style: TextStyle(
            fontFamily: "Metrisch-Medium",
            color: Colors.black54,
            fontSize: 13)),
      ],
    );
  }
}
