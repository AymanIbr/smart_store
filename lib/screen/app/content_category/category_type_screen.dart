import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTypeScreen extends StatefulWidget {
  const CategoryTypeScreen({Key? key}) : super(key: key);

  @override
  State<CategoryTypeScreen> createState() => _CategoryTypeScreenState();
}

class _CategoryTypeScreenState extends State<CategoryTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,'/home_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 27,
          ),
        ),
        title: Text(
            'Women Apparel',
          style: GoogleFonts.cairo(
            color: Colors.white
          )
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 130.h,
            width: double.infinity,
            color: Color(0xFFFA076E8),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            children: [
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 156/182,
                  ) ,
                  itemBuilder: (context,index){
                    return  Card(
                      elevation:6,
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          Image.asset(
                            'images/category1.png',
                            height: 102.h,
                            width: 156.w,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$495.00',
                                      style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xFF9C68F5)
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.favorite_outline)
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/sub_detalis_screen');
                                  },
                                  child: Text(
                                    'Unisex Henry LondonHeritage',
                                    style: GoogleFonts.cairo(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                    );
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
