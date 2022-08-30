import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with helpers{
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEBEBEB),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFEBEBEB),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,'/profile_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 27,
            color: Color(0xFFFA076E8),
          ),
        ),
        title:  Text(
          'Contact',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFA076E8)
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5,left: 5,right: 5),
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
              child: Column(
                children: [
                  SizedBox(height: 30.h,),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  Text(
                    'groovy administrator ',
                    style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h,),
                  const Divider(
                    thickness: 0.6,
                    color: Color(0xffD6EFED),
                    endIndent: 40,
                    indent: 40,
                    height: 50,
                  ),
                  AppTextField(hint: 'Enter your message', prefixIcon: Icons.contact_support_outlined, keyboardType: TextInputType.text, controller: _textEditingController),
                  SizedBox(height: 50.h,),
                  ElevatedButton(
                    onPressed: ()=>{_prformSend()},
                    child: Text(
                      'Send Message',
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


            const Spacer(),
            Text(
              'Ayman Ibrahem - eLancer2',
              style: GoogleFonts.cairo(fontSize: 16),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  void _prformSend() {
    if(_checkData()) {
      _send();
    }
  }
  bool _checkData() {
    if(_textEditingController.text.isNotEmpty){
      return true;
    }
    ShowSnackBar(context, message: 'No Message');
    return false;
  }

  void _send() {
    Future.delayed(Duration(milliseconds: 500),(){
      ShowSnackBar(context, message: 'Your message has been delivered, thank you');
      Navigator.pop(context);
    });
  }
}