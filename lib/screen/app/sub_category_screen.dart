import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/all_category_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Sub Categories',
          style: GoogleFonts.cairo(fontSize: 25.sp, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          GridView.builder(
              itemCount: 10,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/product_screen');
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/category1.png',
                          width: double.infinity,
                          height: 110.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 120.w,
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(start: 16),
                              child: Text(
                                'Women Apparel Accessories',
                                style: GoogleFonts.cairo(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
