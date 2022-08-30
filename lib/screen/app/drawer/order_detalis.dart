import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/taps/secound_tab_screen.dart';
import 'package:smart_store/utils/helpers.dart';


class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> with helpers ,SingleTickerProviderStateMixin{


  late TabController  _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2,vsync: this );
  }
  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF2F4F7),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,'/order_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 27,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon:Icon(Icons.search_rounded, size: 27,)
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/product.png',
            width: double.infinity,
            height: 250.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 60.h,
            width: 200.w,
            child: Text(
              'Men\s Daniel Wellington St Mawes Watch ',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color:Colors.black87
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 65.w,),
              child:  Row(
                  children: [
                    SizedBox(height: 10.h,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text(
                             'Number : ',
                             style: GoogleFonts.cairo(
                               fontWeight: FontWeight.bold,
                             ),
                           ),

                           Text(
                             'order #1',
                             style: GoogleFonts.cairo(
                               fontWeight: FontWeight.bold,
                               color: Color(0xFFFA076E8),
                             ),
                           ),
                         ],
                       ),
                       Row(
                         children: [
                           Text(
                             'Quantity : ',
                             style: GoogleFonts.nunitoSans(
                               fontWeight: FontWeight.bold,

                             ),
                           ),

                           Text(
                             '2',
                             style: GoogleFonts.cairo(
                               fontWeight: FontWeight.bold,
                               color: Color(0xFFFA076E8),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                   SizedBox(width: 40.w,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Text(
                             'Total : ',
                             style: GoogleFonts.nunitoSans(
                               fontWeight: FontWeight.bold,
                             ),
                           ),

                           Text(
                             '\$120',
                             style: GoogleFonts.nunitoSans(
                               fontWeight: FontWeight.bold,
                               color: Color(0xFFFA076E8),
                             ),
                           ),
                         ],
                       ),
                       Row(
                         children: [
                           Text(
                             'Date : ',
                             style: GoogleFonts.nunitoSans(
                               fontWeight: FontWeight.bold,
                             ),
                           ),

                           Text(
                             '14/6/2021',
                             style: GoogleFonts.nunitoSans(
                               fontWeight: FontWeight.bold,
                               color: Color(0xFFFA076E8),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                  ],
                ),
          ),
          SizedBox(height: 20.h,),
          Divider(),
          SizedBox(height: 10.h,),
          TabBar(
            controller: _tabController,
            indicatorColor: Color(0xFFFF85564),
            indicatorWeight: 2.w,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Color(0xFFFF85564),
            unselectedLabelColor: Colors.black,
            onTap: (int selectdTabIndex){
              print(selectdTabIndex);
            },
            tabs: [
              Tab(text :'Product Details',),
              Tab(text :'Reviews',),
            ],
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            textAlign :TextAlign.start,
                            'Lorem Ipsum has bedeng the very industry standard dummy text everg since the to mun1500s, when aning tih unknown printer took a galley of type and very goo scrambled it tomake a type specimen book. Step out in a street-ready look with this men Hoxton Woven Tracksuit from Nike. In a blue colourway, this loose-fit suit is made from lightweight taffeta fabric with a knit mesh lining for a breathable feel .',
                            style: GoogleFonts.cairo(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          width: 310.w,
                          height: 240.h,
                        ),
                      ],
                    ),
                  ),
                  SecoundScreen()
                ]
            ),
          ),

        ],
      ),
    );
  }

}