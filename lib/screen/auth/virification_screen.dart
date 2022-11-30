import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/auth_api_controller.dart';
import 'package:smart_store/api/models/api_response.dart';
import 'package:smart_store/helpers/context_extintion.dart';
import 'package:smart_store/screen/app/settings/virification_mobile_edite_screen.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class VirifcationScreen extends StatefulWidget {
   VirifcationScreen({Key? key,required this.code,required this.mobile}) : super(key: key);

  @override
  State<VirifcationScreen> createState() => _VirifcationScreenState();
final String mobile ;
final int code ;
}

class _VirifcationScreenState extends State<VirifcationScreen> with helpers {
  late TextEditingController _mobileTextController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _mobileTextController = TextEditingController()..text = widget.code.toString();
  }

  @override
  void dispose() {
  _mobileTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login_screen');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Verification',
          style: GoogleFonts.cairo(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
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
               SizedBox(height: 50.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: AppTextField(
                    hint: 'Enter Code',
                    prefixIcon: (Icons.phone_android_rounded),
                    keyboardType: TextInputType.number,
                    controller: _mobileTextController,
                  )),
              const SizedBox(height: 25),
              SizedBox(height: 50.h,),
              ElevatedButton(
                onPressed: ()=>performaLogin(),
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
        ],
      ),
  );
  }
  void performaLogin() {
    if (checkData()) {
      activate();
    }
  }

  bool checkData() {
    if (_mobileTextController.text.isNotEmpty) {
      return true;
    }
    ShowSnackBar(context,
        message: 'Enter required data' , error: true);

    return false;
  }

  Future<void> activate() async {
    ApiResponse apiResponse =
    await AuthAPiController().activate(widget.mobile, widget.code);
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
    // ignore: use_build_context_synchronously
    context.showSnackBar(
        message: apiResponse.message, error: !apiResponse.success);
  }
}
