import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/app/settings/virification_mobile_edite_screen.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class VirifcationScreen extends StatefulWidget {
  const VirifcationScreen({Key? key}) : super(key: key);

  @override
  State<VirifcationScreen> createState() => _VirifcationScreenState();
}

class _VirifcationScreenState extends State<VirifcationScreen> with helpers {

  late TextEditingController _forgetTextController;
  late TextEditingController _verify1TextController;
  late TextEditingController _verify2TextController;
  late TextEditingController _verify3TextController;
  late TextEditingController _verify4TextController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _verify1TextController = TextEditingController();
    _verify2TextController = TextEditingController();
    _verify3TextController = TextEditingController();
    _verify4TextController = TextEditingController();
  }

  @override
  void dispose() {
    _verify1TextController.dispose();
    _verify2TextController.dispose();
    _verify3TextController.dispose();
    _verify4TextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/login_screen');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
            'Verification',
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
              SizedBox(height: 30.h,),
              Text(
                textAlign: TextAlign.center,
                'A verification code will be sent to your phone.',
                style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
                child: Column(
                  children: [
                     Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VerificationTextFeild(verify1TextController: _verify1TextController,first: true,),
                        SizedBox(width: 7.w,),
                        VerificationTextFeild(verify1TextController: _verify2TextController),
                        SizedBox(width: 7.w,),
                        VerificationTextFeild(verify1TextController: _verify3TextController),
                        SizedBox(width: 7.w,),
                        VerificationTextFeild(verify1TextController: _verify4TextController,last: true,),

                      ],
                    ),
                    SizedBox(height: 50.h,),
                    ElevatedButton(
                      onPressed: ()=>_performlogin(),
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

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _performlogin() {
    if (_checkVeriyData()) {
      _login();
    }
  }

  bool _checkVeriyData() {
    if (_verify1TextController.text.isNotEmpty &&
        _verify2TextController.text.isNotEmpty &&
        _verify3TextController.text.isNotEmpty &&
        _verify4TextController.text.isNotEmpty){
      ShowSnackBar(context, message: 'Register Successfully');
      return true;
    }
    ShowSnackBar(context, message:  'Enter your veriy code');

    return false;

  }

  _login() {
    Navigator.pushNamed(context, '/login_screen');

  }
}

class VerificationTextFeild extends StatelessWidget {
  VerificationTextFeild({
    this.first = false,
    this.last = false,
    Key? key,
    required TextEditingController verify1TextController,
  }) : _verify1TextController = verify1TextController, super(key: key);

  final TextEditingController _verify1TextController;
  bool first;
  bool last ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: TextField(
        onChanged: (value) {
          if(value.isNotEmpty&&!last) {
            FocusScope.of(context).nextFocus();
          }else if(value.isEmpty&&!first){
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        controller: _verify1TextController,
        maxLength: 1,
        keyboardType: const TextInputType
            .numberWithOptions(
            decimal: false, signed: false),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0XFFF9F3EE),
          helperMaxLines: 1,
          hintStyle: GoogleFonts.nunitoSans(
              fontSize: 16.sp),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  20.r),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  20.r),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  20.r),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  20.r),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  20.r),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  20.r),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )
          ),
        ),

      ),

    );
  }
}
