import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required TextEditingController actionStepTEcontroller,
    required this.hintText,
  }) : _actionStepTEcontroller = actionStepTEcontroller;

  final TextEditingController _actionStepTEcontroller;
  final String hintText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: _actionStepTEcontroller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      maxLines: 4,
      decoration: InputDecoration(
          hintText: hintText
      ),
    );
  }
}