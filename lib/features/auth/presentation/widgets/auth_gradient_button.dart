import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AuthGradientButton({
    required this.label,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppPallete.gradient1
          ,AppPallete.gradient2
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: ElevatedButton(onPressed:onPressed, child: Text(label,style: TextStyle(
        fontSize: 20,
      fontWeight: FontWeight.w600
      
      ),),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(395, 55),
        backgroundColor: AppPallete.transparentColor,shadowColor: AppPallete.transparentColor
      ),),
    );
  }
}