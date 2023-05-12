import 'package:flutter/material.dart';

typedef StringCallback<T> = String? Function(String?);
class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final IconData? icon;
  final bool isSecure;
  final StringCallback? validator;
  final TextInputType? keys;
  final TextEditingController? controller;
  final bool? readOnly;
  final AutovalidateMode? autoValidateMode;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function(String)? onChanged;


  const CustomTextField({Key? key,
    this.title,
    this.hintText,
    this.onChanged,
    this.icon,
    this.isSecure = false,
    this.validator,
    this.keys,
    this.controller,
    this.readOnly,
    this.autoValidateMode,
    this.onTap,
    this.prefixIcon,
    this.obscureText
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  late bool hide;
  @override
  void initState() {
    super.initState();
    hide = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      readOnly: widget.readOnly??false,
      onTap: widget.onTap,
      keyboardType:widget.keys,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: hide,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        ),
        isDense:true,
        prefixIcon: widget.prefixIcon,
        disabledBorder: InputBorder.none,
        labelText: widget.title,
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 17.0, color: Color(0xffACACAC)),
        suffixIcon: (widget.obscureText ?? false) ? IconButton(
          onPressed: (){
            setState(() => hide = !hide);
          },
          icon: !hide ? const Icon(Icons.visibility_outlined) :
          const Icon(Icons.visibility_off_outlined),
        ) : null,
        fillColor:  Color(0xff262626),
        filled: true,
      ),
    );
  }
}
