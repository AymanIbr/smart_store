import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Products',style: GoogleFonts.cairo(fontSize: 25.sp,color: Colors.white),),
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
                'All new products ',
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
                      leading: Image.asset('images/product.png',width: 100.w,height: double.infinity,fit: BoxFit.cover,),
                      title: Text('Unisex Henry LondonHeritage',style: GoogleFonts.cairo(),),
                      subtitle: Text('\$495.00',style: GoogleFonts.cairo(color: Color(0xFF9C68F5)),),
                      trailing: Icon(Icons.favorite_border),
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
