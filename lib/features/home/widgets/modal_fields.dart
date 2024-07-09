import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:flutter/material.dart';

class ModalFields extends StatefulWidget {
  const ModalFields({super.key, required this.labelText, required this.prefixIcon,required this.maxLines,required this.maxLength,this.keyboardType=TextInputType.text,required this.onChanged});
  final String labelText;
  final IconData prefixIcon;
  final int maxLines;
  final int maxLength;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  @override
  State<ModalFields> createState() => _ModalFieldsState();
}

class _ModalFieldsState extends State<ModalFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      // height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            spreadRadius: 0.02,
            offset: const Offset(0.0, 0.0),
          )
        ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        style: const TextStyle(
          color: AppColors.blackColor,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: AppColors.blackColor,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: AppColors.blackColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
