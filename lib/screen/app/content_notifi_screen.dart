import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentNotificationScreen extends StatefulWidget {
  const ContentNotificationScreen({Key? key}) : super(key: key);

  @override
  State<ContentNotificationScreen> createState() => _ContentNotificationScreenState();
}

class _ContentNotificationScreenState extends State<ContentNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEBEBEB),
      appBar: AppBar(

        automaticallyImplyLeading: false,
        leading:
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/notify_screen');
              },
              icon:Icon(Icons.arrow_back_ios,color: Color(0xFFFA076E8),)
          ),
        backgroundColor: Color(0xFFFEBEBEB),
        title:  Text(
          'Notification',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFA076E8)
          ),
        ),
      ),
      body: Stack(
        children: [
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
        padding: EdgeInsets.only(top: 5),
        margin: EdgeInsetsDirectional.only(bottom:10,start: 10,end: 10),
        height: 600.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,0),
              color: Colors.black45,
              blurRadius: 4,
            )
          ],
        ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Text(
                  'Lorem Ipsum has bedeng the very industry standard dummy text everg since .',
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 10.h,),
                Image.asset('images/noti.png',height: 300.h,width: double.infinity,fit: BoxFit.cover,),
                SizedBox(height: 10.h,),
                Text(
                  'Lorem Ipsum has bedeng the very industry standard dummy text everg since the to mun1500s, when aning tih unknown printer took a galley of type and very goo scrambled it tomake a type specimen book. Step out in a street-ready look with this men Hoxton Woven Tracksuit from Nike. In a blue colourway, this loose-fit suit is made from lightweight taffeta fabric with a knit mesh lining for a breathable feel .',
                  style: GoogleFonts.cairo(
                      color: Colors.grey.shade400,
                      fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 10.h,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '10/Feb/2021 04:24 pm',
                    style: GoogleFonts.cairo(
                      color: Colors.grey.shade400,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
    ),
      ),
        ],
      ),
    );
  }
}
