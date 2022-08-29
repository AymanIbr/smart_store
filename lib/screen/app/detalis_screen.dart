import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/taps/secound_tab_screen.dart';


class DetalisScreen extends StatefulWidget {
  const DetalisScreen({Key? key}) : super(key: key);

  @override
  State<DetalisScreen> createState() => _DetalisScreenState();
}

class _DetalisScreenState extends State<DetalisScreen> with SingleTickerProviderStateMixin {

  late TabController  _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2,vsync: this );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
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
            Navigator.pop(context,'/home_screen');
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
              'images/detalid.png',
            width: double.infinity,
            height: 300.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 100),
            child: Row(
              children: [
               Column(
                 children: [
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
                   Text(
                     '\$495.00',
                     style: GoogleFonts.cairo(
                         fontSize: 18.sp,
                         fontWeight: FontWeight.bold,
                         color:  Color(0xFF9C68F5)
                     ),
                   ),
                 ],
               ),
              Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.favorite_border)
                  ),
                ],
              ),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
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
                  SecoundScreen(),
                ]
            ),
          ),
          ElevatedButton(
            onPressed: (){
                _showLanguageSheet();
            },
            child: Text('ADD TO CART'),
            style: ElevatedButton.styleFrom(
              primary: Color(0XFFF1ABC9C),
              elevation: 4,
              minimumSize: Size(325.w, 50),
            ),
          ),
        ],
      ),
    );
  }
  void _showLanguageSheet() {
    showModalBottomSheet<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
          ),
        ),
        clipBehavior: Clip.antiAlias,
        context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (context , setState){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 5.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                        ),
                        SizedBox(height: 40.h,),
                        Image.asset('images/done.png'),
                        Text(
                          'Added to Cart!',
                          style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    );

  }

}
