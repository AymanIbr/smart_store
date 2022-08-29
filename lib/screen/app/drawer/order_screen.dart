import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/bottom_navigation_screen');
            },
            icon:Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title:  Text(
          'Orders',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/order_details_screen');
            },
            child: Container(
              height: 150.h,
              margin: EdgeInsetsDirectional.only(bottom: index == 3.h ? 0 : 15.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    )
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage('images/product.png'),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Order: #1',
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 30.w,),
                              Text('14/12/2020',style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w300,color: Colors.black45),),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'Total: \$165',
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFA076E8)),
                              ),
                              SizedBox(width: 30.w,),
                              Text(
                                'Delivered',
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold, color: Colors.green),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                'Payment type: ',
                                style: GoogleFonts.nunitoSans(),
                              ),
                              Text(
                                ' ONLINE ',
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFFFF7750)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}