import 'package:flutter/material.dart';
import 'package:plana/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  String name;
  TextEditingController? controller;
  IconData icon;
  bool? isPassword;
  FocusNode? focus;
  Function(String)? onSubmit;
  void Function()? onClose;
  CustomTextField(
      {Key? key,
      this.isPassword = false,
      required this.name,
      this.focus,
      required this.icon,
      this.onClose,
      this.onSubmit,
      this.controller})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
            color: lightgrey, borderRadius: BorderRadius.circular(20)),
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 600),
        width: MediaQuery.of(context).size.width * 0.9,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 5, bottom: 8),
                child: TextFormField(
                  onFieldSubmitted: widget.onSubmit,
                  focusNode: widget.focus,
                  textAlignVertical: TextAlignVertical.center,
                  controller: widget.controller,
                  textAlign: TextAlign.left,
                  enabled: true,
                  // cursorHeight: 26,
                  cursorColor: black,
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 16, color: black),
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      widget.icon,
                      color: Colors.grey.shade500,
                    ),
                    suffixIconConstraints: BoxConstraints(minWidth: 60),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    hintText: widget.name,
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
