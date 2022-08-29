import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> with helpers {

  late TextEditingController _reset1TextController;
  late TextEditingController _reset2TextController;
  bool _obscure = true ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reset1TextController = TextEditingController();
    _reset2TextController = TextEditingController();
  }
  @override
  void dispose() {
    _reset1TextController.dispose();
    _reset2TextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Change Password',
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
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
                child: Column(
                  children: [
                    AppTextField(
                      hint: 'New Password',
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      controller: _reset1TextController,
                      obscureText: _obscure,
                      sufficIcon: IconButton(
                        onPressed: (){
                          setState(()=> _obscure =! _obscure);
                        }, icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off ,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    AppTextField(
                      hint: 'New password confirmation',
                      prefixIcon: Icons.lock,
                      keyboardType: TextInputType.text,
                      controller: _reset2TextController,
                      obscureText: _obscure,
                      sufficIcon: IconButton(
                        onPressed: (){
                          setState(()=> _obscure =! _obscure);
                        }, icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off ,
                        color: Colors.white,
                      ),
                      ),
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
                    SizedBox(height: 240.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context, '/login_screen');
                          },
                          child: Text(
                              'Sign In',
                            style: GoogleFonts.cairo(
                              fontSize: 17.sp,
                              color: Colors.white
                            ),
                          ),
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
    if(_reset1TextController.text.isNotEmpty && _reset2TextController.text.isNotEmpty){
      return true ;
    }
    ShowSnackBar(context, message: 'Enter required data !',error: true);
    return false;
  }

  void login(){
    Navigator.pop(context);
  }
}
