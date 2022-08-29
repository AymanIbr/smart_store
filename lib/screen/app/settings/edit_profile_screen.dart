import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with helpers {

  late TextEditingController _nameEditeController ;
  late TextEditingController _emailEditeController ;
  late TextEditingController _AboutEditeController ;
  late TextEditingController _AdressEditeController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameEditeController = TextEditingController();
    _emailEditeController = TextEditingController();
    _AboutEditeController = TextEditingController();
    _AdressEditeController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameEditeController.dispose();
    _emailEditeController.dispose();
    _AboutEditeController.dispose();
    _AdressEditeController.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEBEBEB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
        IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/profile_screen');
            },
            icon:Icon(Icons.arrow_back_ios,color: Color(0xFFFA076E8),)
        ),
        backgroundColor: Color(0xFFFEBEBEB),
        title:  Text(
          'Edite Profile',
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
              height: 560.h,
              decoration: BoxDecoration(
                color: Color(0xFFFA076E8),
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Full Name',
                        style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                   Divider(),
                   AppTextField(
                       hint: 'Ayman Ibrahem',
                       prefixIcon: Icons.person,
                       keyboardType: TextInputType.text,
                       controller:_nameEditeController
                   ),
                    SizedBox(height: 10.h,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Divider(),
                    AppTextField(
                        hint: 'ayman@gmail.com',
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.text,
                        controller:_emailEditeController
                    ),
                    SizedBox(height: 10.h,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Gender',
                        style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Divider(),
                    AppTextField(
                        hint: 'Male',
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.text,
                        controller:_AboutEditeController
                    ),
                    SizedBox(height: 10.h,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Address',
                        style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Divider(),
                    AppTextField(
                        hint: 'fgfg fgdf dfbdf ',
                        prefixIcon: Icons.add_location_alt_rounded,
                        keyboardType: TextInputType.text,
                        controller:_AdressEditeController
                    ),
                    SizedBox(height: 30.h,),
                    ElevatedButton(
                      onPressed: ()=>{_editProfile()},
                      child: Text(
                        'Upadte Profile',
                        style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        primary: Colors.white,
                        minimumSize: Size(325.w, 50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
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
  void _editProfile(){
    if(CheckData()){
      changeProfile();
    }
  }

  bool CheckData(){
    if(_AdressEditeController.text.isNotEmpty&&
        _AboutEditeController.text.isNotEmpty&&
        _emailEditeController.text.isNotEmpty&&
        _nameEditeController.text.isNotEmpty){
      return true ;
    }
  ShowSnackBar(context, message: 'Enter required data !',error: true);
    return false;
  }

  void changeProfile(){
    Navigator.pop(context);
  }
}
