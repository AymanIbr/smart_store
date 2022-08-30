import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class VrificationMobileScreen extends StatefulWidget {
  const VrificationMobileScreen({Key? key}) : super(key: key);

  @override
  State<VrificationMobileScreen> createState() => _VrificationMobileScreenState();
}

class _VrificationMobileScreenState extends State<VrificationMobileScreen> with helpers {

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
          'verification',
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
              height: 400.h,
              width: double.infinity,
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
              child:Padding(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter Your Code',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Enter the 4 digits code that you recived on'
                          'your mobile',
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 0.4,
                          color: Colors.black45
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 140.h,
                      width: 250.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerificationTextFeild(verify1TextController: _verify1TextController,first: true,),

                          VerificationTextFeild(verify1TextController: _verify2TextController),
                          VerificationTextFeild(verify1TextController: _verify3TextController),

                          VerificationTextFeild(verify1TextController: _verify4TextController,last: true,),

                        ],
                      ),
                    ),
                    SizedBox(height: 50.h,),
                    ElevatedButton(
                      onPressed: ()=>{_performlogin()},
                      child: Text(
                        'Update Mobile',
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
                    SizedBox(height: 30.h,),
                  ],
                ),
              ),
            ),
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
      ShowSnackBar(context, message: 'Update Mobile Successfully');
      return true;
    }
    ShowSnackBar(context, message:  'Enter your veriy code');

    return false;

  }

  _login() {
    Navigator.pushNamed(context, '/virification_mobile_screen');

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
