import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/bottom_navigation_screen');
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Notifications',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
        child: ListView(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Today ',
                    style: GoogleFonts.cairo(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: (){},
                  child: Text(
                    'Clear All',
                    style: GoogleFonts.cairo(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/content_notify_screen');
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      margin: EdgeInsetsDirectional.only(bottom:10,start: 10,end: 10),
                      height: 100,
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
                      child: ListTile(
                        leading: Icon(Icons.notification_important_sharp,size: 40,),
                        title: Text('Unisex Henry LondonHeritage',style: GoogleFonts.cairo(),),
                        subtitle: Text('Lorem ipsum dolor sit ame nsetetur sadipscing elitr, sed diag',style: GoogleFonts.cairo(),),
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
