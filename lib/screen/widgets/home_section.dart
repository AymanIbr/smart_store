import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeSction extends StatelessWidget {
  const HomeSction({
    Key? key,
    required this.title,
    required this.onPressed
  }) : super(key: key);

  final String title ;
  final void Function() onPressed ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See All',
            style: GoogleFonts.cairo(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
}
