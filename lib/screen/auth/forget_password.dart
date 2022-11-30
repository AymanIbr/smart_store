import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with helpers {
  late TextEditingController _mobileTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();
  }
  @override
  void dispose() {
    _mobileTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Forgot password',
          style: GoogleFonts.cairo(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [Color(0xFFFA076E8), Color(0xFFFA076E8)]),
            ),

          ),
          Column(
            children: [
              SizedBox(height: 70.h,),
              Container(
                  child: Image.asset('images/logo.png')
              ),
              SizedBox(height: 50.h,),
              Text(
                'Login to Continue Your Account',
                style: GoogleFonts.cairo(
                  height: 0.3,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
                child: Column(
                  children: [
                    AppTextField(
                        hint: 'Mobile',
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.number,
                        controller: _mobileTextController
                    ),
                    SizedBox(height: 50.h,),
                    ElevatedButton(
                      onPressed: ()=>_PerformForget(),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.cairo(
                            fontSize: 14.sp,
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
                    SizedBox(height: 28.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' Don’t work?',
                          style: GoogleFonts.cairo(
                              fontSize: 14.sp,
                              color: Colors.white
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            // Navigator.pop(context, '/forget_password');
                          },
                          child: Text('Try another way!'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
  void _PerformForget(){
    if(CheckData()){
      login();
    }
  }

  bool CheckData(){
    if(_mobileTextController.text.isNotEmpty){
      return true ;
    }
    ShowSnackBar(context, message: 'Enter required data !',error: true);
    return false;
  }

  void login(){
  }
}
