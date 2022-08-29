import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',style: GoogleFonts.cairo(fontSize: 25.sp,color: Colors.white),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search_rounded)
          ),
        ],
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'All products categories',
                style: GoogleFonts.cairo(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.only(top: 5),
                    margin: EdgeInsetsDirectional.only(bottom:10,start: 10,end: 10),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,0),
                          color: Colors.black45,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset('images/section.png',width: 100.w,height: double.infinity,fit: BoxFit.cover,),
                      title: Text('Women Apparel Accessories',style: GoogleFonts.cairo(),),
                      subtitle: Text('Lorem Ipsum has been the industry standard.',style: GoogleFonts.cairo(),),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
