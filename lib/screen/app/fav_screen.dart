import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/app/home_screen.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context,'/bottom_navigation_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 27,
          ),
        ),
        title: Text(
            'Women Apparel',
            style: GoogleFonts.cairo(
                color: Colors.white,fontSize: 25.sp,
            )
        ),
      ),
      body:Stack(
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
                            'images/fa.png',
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
                                    const Icon(Icons.favorite,color: Colors.red,)
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context,'/detalis_fa_screen');
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
