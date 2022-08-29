import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/models/country.dart';
import 'package:smart_store/screen/widgets/app_text_field.dart';
import 'package:smart_store/utils/helpers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with helpers {

  late TextEditingController _nameTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _passwordTextController;
  bool _obscure = true ;
  String? _gender;


  final List<Country> _countries = <Country>[
    Country(id: 1, title: 'Palestaine'),
    Country(id: 2, title: 'Egypt'),
    Country(id: 3, title: 'Moroco'),
    Country(id: 4, title: 'Jordan'),
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }
  @override
  void dispose() {
    _nameTextController.dispose();
    _mobileTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  int? _selectedCountryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Sign Up',
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
              SizedBox(height: 15.h,),
              Container(
                  child: Image.asset('images/logo.png')
              ),
              SizedBox(height: 50.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
                child: Column(
                  children: [
                    AppTextField(
                        hint: 'Name',
                        prefixIcon: Icons.title,
                        keyboardType: TextInputType.text,
                        controller: _nameTextController
                    ),
                    SizedBox(height: 20.h,),
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
                    SizedBox(height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                        DropdownButton <int>(
                            value: _selectedCountryId,
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Colors.grey.shade300,
                            icon: Icon(Icons.keyboard_arrow_down_sharp),
                            hint: Text('Select Country'),
                            style: GoogleFonts.montserrat(
                                color: Colors.black
                            ),
                            isExpanded: true,
                            items: _countries.map(
                                    (Country) =>DropdownMenuItem<int>(
                                  child: Text(Country.title),
                                  value: Country.id,
                                )
                            ) .toList(),
                            onChanged: (int? value){
                              setState(()=> _selectedCountryId = value);
                            }

                        ),
                        SizedBox(height: 20.h,),
                        Text(
                          'Gender',
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                  value: 'M',
                                  title: Text(
                                    'Male',style: GoogleFonts.cairo(
                                      color: Colors.black
                                  ),),
                                  groupValue: _gender,
                                  onChanged: (String? value){
                                    setState(()=>_gender = value);
                                  }
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                  value: 'F',
                                  title: Text('Female',style: GoogleFonts.cairo(
                                      color: Colors.black
                                  ),),
                                  groupValue: _gender,
                                  onChanged: (String? value){
                                    setState(()=>_gender = value);
                                  }
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h,),
                    ElevatedButton(
                      onPressed: ()=>_performRegister(),
                      child: Text(
                        'SIGN UP',
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

  void _performRegister(){
    if(CheckData()){
      _register();
    }
  }

  bool CheckData(){
    if(_nameTextController.text.isNotEmpty
        &&_nameTextController.text.isNotEmpty
        && _passwordTextController.text.isNotEmpty
    &&_mobileTextController.text.isNotEmpty
    ){
      return true ;
    }
    ShowSnackBar(context, message: 'Enter required data !',error: true);

    return false;
  }
  void _register (){
      Navigator.pop(context, '/login_screen');
  }
}
