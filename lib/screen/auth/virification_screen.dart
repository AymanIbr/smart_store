import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class VirifcationScreen extends StatefulWidget {
  const VirifcationScreen({Key? key}) : super(key: key);

  @override
  State<VirifcationScreen> createState() => _VirifcationScreenState();
}

class _VirifcationScreenState extends State<VirifcationScreen> with helpers {

  late TextEditingController _numberTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberTextController = TextEditingController();
  }

  @override
  void dispose() {
    _numberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
            'Verification Code',
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
                    AppTextField(
                        hint: 'Mobile',
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.number,
                        controller:_numberTextController
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
    if(_numberTextController.text.isNotEmpty){
      return true ;
    }
    ShowSnackBar(context, message: 'Enter required data !',error: true);
    return false;
  }

  void login(){
    Navigator.pushReplacementNamed(context, '/reset_screen');
  }
}
