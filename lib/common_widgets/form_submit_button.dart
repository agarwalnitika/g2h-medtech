import 'package:g2h_medtech/common_widgets/custom_raised_button.dart';

import 'package:flutter/material.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
    h: 44.0,
    color:  Colors.cyan[900],
    borderRadius: 4.0,
    onPressed: onPressed,
  );
}
