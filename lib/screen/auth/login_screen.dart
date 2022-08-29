import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with helpers {

  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  bool _obscure = true ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }
  @override
  void dispose() {
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Sign In',
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
                      SizedBox(height: 20.h,),
                      AppTextField(
                          hint: 'Password',
                          prefixIcon: Icons.lock,
                          keyboardType: TextInputType.text,
                          controller: _passwordTextController,
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

                      Padding(
                        padding: EdgeInsets.only(left: 213.w),
                        child: TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/forget_password');
                              },
                              child: Text(
                                'Forgot password?',
                                style: GoogleFonts.cairo(
                                    color: Colors.white
                                ),
                              ),
                            ),
                      ),

                      SizedBox(height: 50.h,),
                      ElevatedButton(
                          onPressed: ()=>_PerformLogin(),
                          child: Text(
                              'SIGN IN',
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
                      SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: GoogleFonts.cairo(
                                fontSize: 14.sp,
                                color: Colors.white
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/register_screen');
                            },
                            child: Text('Create Now!'),
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
  void _PerformLogin(){
    if(CheckData()){
      login();
    }
  }

  bool CheckData(){
    if(_mobileTextController.text.isNotEmpty && _passwordTextController.text.isNotEmpty){
      return true ;
    }
  ShowSnackBar(context, message: 'Enter required data !',error: true);
    return false;
  }

  void login(){
      Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
  }
}
