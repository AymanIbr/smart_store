import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/models/country.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';


import '../../../utils/helpers.dart';

class UpdatedAddressScreen extends StatefulWidget {
  const UpdatedAddressScreen({Key? key}) : super(key: key);

  @override
  State<UpdatedAddressScreen> createState() => _UpdatedAddressScreenState();
}

class _UpdatedAddressScreenState extends State<UpdatedAddressScreen> with helpers{
  late TextEditingController _nameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _infoTextController;
  int? _selectedCountryId;

  final List<Country> _country = <Country>[
    const Country(id: 1, title: 'North'),
    const Country(id: 2, title: 'Gaza'),
    const Country(id: 3, title: 'Central Region'),
    const Country(id: 4, title: 'Khan Younes'),
    const Country(id: 4, title: 'Rafah'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _infoTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _mobileTextController.dispose();
    _infoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
        IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/adresse_screen');
            },
            icon:Icon(Icons.arrow_back_ios,color: Color(0xFFFA076E8),)
        ),
        backgroundColor: Color(0xFFFEBEBEB),
        title:  Text(
          'Update Adresse',
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
              height: 500.h,
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
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                  children: [
                    AppTextField(
                        hint: 'Name',
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.name,
                        controller: _nameTextController),
                    SizedBox(height: 15.h,),
                    AppTextField(
                        hint:
                        'Info ',
                        prefixIcon: Icons.info,
                        keyboardType: TextInputType.text,
                        controller: _mobileTextController),
                    SizedBox(height: 15.h,),
                    AppTextField(
                        hint: 'Contact number',
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        controller: _infoTextController),
                    SizedBox(height: 25.h,),
                    DropdownButton<int>(
                      hint:  Text('Select your Country',style: GoogleFonts.cairo(color: Colors.white),),
                      style: GoogleFonts.montserrat(color: Colors.black),
                      onTap: () {
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
// itemHeight: 65,
                      dropdownColor: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      underline: const Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 0,
                      ),
                      isExpanded: true,
                      value: _selectedCountryId,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedCountryId = value;
                        });
                      },
                      items: _country.map((country) {
                        return DropdownMenuItem<int>(
                          value: country.id,
                          child: Text(country.title),
                        );
                      },
                      ).toList(),
                    ),
                    SizedBox(height: 20.h,),
                    ElevatedButton(
                      onPressed: ()=>{_performOk()},
                      child: Text(
                        'Update Adresses',
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



  void _performOk() {
    if (_checkData()) {
      _ok();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _infoTextController.text.isNotEmpty &&
        _mobileTextController.text.isNotEmpty&&
        _selectedCountryId != null
    ) {
      return true;
    }
    ShowSnackBar(context, message: 'Check your required  Data');
    return false;
  }

  void _ok() {
    Future.delayed(Duration(seconds: 1),(){

      showDialog(
          context: context,
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)
                  ),
                  title: Text(
                    'Updated Address Successfully!',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    'Check for Your addresses',
                    style: GoogleFonts.nunitoSans(fontSize: 14),
                  ),
                ),
              ],
            );
          });
    });
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/address_screen');
    });
  }
}