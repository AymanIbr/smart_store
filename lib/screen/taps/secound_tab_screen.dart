import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SecoundScreen extends StatelessWidget {
  const SecoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder:(context,index){
          return Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Container(
              margin: EdgeInsetsDirectional.only(start: 5,bottom: 15),
              height: 90.h,
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
                padding: EdgeInsets.only(left: 5,top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage:AssetImage(
                              'images/pe.png'
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'John Doe',
                          style: GoogleFonts.cairo(
                              fontSize: 10.sp,
                              color: Colors.black,
                              height: 2.h
                          ),
                        )
                      ],
                    ),
                   Row(
                     children: [
                       SizedBox(width: 20.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 220,
                            child: Text(
                              'Great products! Quality is awesome. Also the delivery was very fast. Love it so much...',
                              style: GoogleFonts.cairo(
                                  fontSize: 12.sp
                              ),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            '22 Dec, 2018',
                            style: GoogleFonts.cairo(
                                fontSize: 10.sp,
                              color: Colors.red
                            ),
                          ),
                        ],
                      ),
                     ],
                   ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
