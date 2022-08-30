import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
        IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/bottom_navigation_screen');
            },
            icon:Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title:  Text(
          'Setting',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),

      ),
      body: Stack(
        children: [
          Container(
            height: 110.h,
            width: double.infinity,
            color: Color(0xFFFA076E8),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 50, start: 23.w,end: 23),
            child: Container(
              width: 325.w ,
              height:123.h ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,0),
                    color: Colors.black45,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 30,bottom: 28,start: 20),
                child: ListTile(
                  leading: CircleAvatar(radius: 30.r,backgroundImage: AssetImage('images/pe.png')),
                  title: Text('Robin Scherbatsky',style: GoogleFonts.cairo(),),
                  subtitle: Text('+2934565678',style: GoogleFonts.cairo(),),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 200,start: 10,end: 10),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    child: Text('Account',style: GoogleFonts.cairo(fontSize: 18.sp,fontWeight: FontWeight.w500),)
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text(
                    'Change Password',
                    style: GoogleFonts.cairo(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pop(context);
                    Future.delayed(Duration(microseconds: 500), () {
                      Navigator.pushNamed(context, '/change_password');
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text(
                    'Edit Mobile',
                    style: GoogleFonts.cairo(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pop(context);
                    Future.delayed(Duration(microseconds: 500), () {
                      Navigator.pushNamed(context, '/edite_mobile_screen');
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text(
                    'Edit Profile',
                    style: GoogleFonts.cairo(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pop(context);
                    Future.delayed(Duration(microseconds: 500), () {
                      Navigator.pushNamed(context, '/edit_profile_screen');
                    });
                  },
                ),
                Divider(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    child: Text('Settings',style: GoogleFonts.cairo(fontSize: 18.sp,fontWeight: FontWeight.w500),)
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text(
                    'Language',
                    style: GoogleFonts.cairo(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showLanguageSheet();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_history),
                  title: Text(
                    'Adresse',
                    style: GoogleFonts.cairo(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, '/adresse_screen');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _showLanguageSheet() {
    showModalBottomSheet<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
          ),
        ),
        clipBehavior: Clip.antiAlias,
        context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (context , setState){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Change Language',style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                      ),

                      Text('Choose Sutable Language',style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        height: 1.0.h,
                        fontWeight: FontWeight.w300,
                        color: Colors.black45,
                      ),
                      ),
                      Divider(),
                      RadioListTile<String>(
                          value: 'en',
                          title: Text('English',style: GoogleFonts.cairo(),),
                          groupValue: 'en',
                          onChanged: (String? value){

                          }
                      ),
                      RadioListTile<String>(
                          value: 'ar',
                          title: Text('العربية',style: GoogleFonts.cairo(),),
                          groupValue: 'ar',
                          onChanged: (String? value){
                          }
                      ),
                    ],
                  ),
                );
              }
          );
        }
    );

  }

}
