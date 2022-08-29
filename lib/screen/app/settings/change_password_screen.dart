import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with helpers {

  late TextEditingController _pass1TextController;
  late TextEditingController _pass2TextController;
  late TextEditingController _currentPassword;
  bool _obscure1 = true ;
  bool _obscure2 = true ;
  bool _obscure3 = true ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pass1TextController = TextEditingController();
    _pass2TextController = TextEditingController();
    _currentPassword = TextEditingController();
  }
  @override
  void dispose() {
    _pass1TextController.dispose();
    _pass2TextController.dispose();
    _currentPassword.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Change Password',
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
            padding: EdgeInsets.only(top: 5),
            child: Container(
              padding: EdgeInsets.only(top: 5),
              margin: EdgeInsetsDirectional.only(bottom:10,start: 10,end: 10),
              height: 450.h,
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
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Your Password',
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                    Text(
                      'Enter New Password',
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black45
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      hint:'Current Password',
                      obscureText: _obscure1,
                      sufficIcon: IconButton(
                        onPressed: (){
                          setState(()=> _obscure1 =! _obscure1);
                        }, icon: Icon(
                        _obscure1 ? Icons.visibility : Icons.visibility_off ,
                        color: Colors.white,
                      ),
                      ),
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      controller: _currentPassword,
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      hint:'New Password',
                      obscureText: _obscure2,
                      sufficIcon: IconButton(
                        onPressed: (){
                          setState(()=> _obscure2 =! _obscure2);
                        }, icon: Icon(
                        _obscure2 ? Icons.visibility : Icons.visibility_off ,
                        color: Colors.white,
                      ),
                      ),
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      controller: _pass1TextController,
                    ),
                    SizedBox(height: 10.h,),
                    AppTextField(
                      hint:'New password confirmation',
                      obscureText: _obscure3,
                      sufficIcon: IconButton(
                        onPressed: (){
                          setState(()=> _obscure3 =! _obscure3);
                        }, icon: Icon(
                        _obscure3 ? Icons.visibility : Icons.visibility_off ,
                        color: Colors.white,
                      ),
                      ),
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      controller: _pass2TextController,
                    ),
                    SizedBox(height: 20.h,),
                    ElevatedButton(
                      onPressed: ()=>{_performChange()},
                      child: Text(
                        'Upadte Password',
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
  void _performChange(){
    if(CheckData()){
      changepassword();
    }
  }

  bool CheckData(){
    if(_pass1TextController.text.isNotEmpty && _pass2TextController.text.isNotEmpty&&_currentPassword.text.isNotEmpty){
      return true ;
    }
    ShowSnackBar(context, message: 'Enter required data !',error: true);
    return false;
  }

  void changepassword(){
   Navigator.pop(context);
  }
}
