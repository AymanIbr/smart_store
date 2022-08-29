import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBordingContent extends StatelessWidget {
  const OnBordingContent({
    Key? key,
    required this.title,
    required this.image,
    required this.EndTitle,
    required this.Subtitle
  }) : super(key: key , );

  final String image ;
  final String title ;
  final String Subtitle;
  final String EndTitle ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
            'images/$image.png',
          height: 317,
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300
                ),
              ),
              Text(
                Subtitle,
                style: GoogleFonts.cairo(
                    fontSize: 35.sp,
                    height: 1,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                EndTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    height: 2.h,
                    fontWeight: FontWeight.w500 ,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
