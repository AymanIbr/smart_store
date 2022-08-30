import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                _confirmClearDialog();
              },
              icon: Icon(Icons.delete_outline, size: 27,)
          ),
        ],
        leading: IconButton(
            onPressed:(){
              Navigator.pushNamed(context,'/bottom_navigation_screen');
            } ,
            icon: Icon(Icons.arrow_back_ios)
        ),
        title: Text(
          'Cart',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Container(
                    height: 115,
// alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.h
                    ),
                    padding: EdgeInsetsDirectional.only(
                      end: 5.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,0),
                          color: Colors.black45,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        PositionedDirectional(
                          end: 0,
                          top: 0,
                          child: IconButton(
                            onPressed: (){
                            },
                            icon: Icon(Icons.close),
                            color: Colors.red,
                            visualDensity: VisualDensity(
                                vertical: VisualDensity.minimumDensity,
                                horizontal: VisualDensity.minimumDensity
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/fa.png',
                              fit: BoxFit.fill,
                              height: 116.h,

                            ),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      'Zippered Backpack With Metal Lock',style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp
                                    ),),
                                    width: 115.w,
                                    height: 70.h,
                                  ),
                                  Text(
                                    '\$59.98',
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w300,
                                      height: 1.0,
                                      fontSize: 12.sp,
                                      color: Color(0xFFFA076E8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                  },
                                  iconSize: 20.sp,
                                  icon: Icon(Icons.add),
                                ),
                                IconButton(
                                  onPressed: (){
                                  },
                                  iconSize: 20.sp,
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
          Divider(
            height: 2,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Spacer(),
              Text(
                'Total',
                style: GoogleFonts.cairo(
                    fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 6,
              ),
              Text(
                '\$200',
                style: GoogleFonts.cairo(
                    fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                primary: const Color(0xFFFA076E8),
                minimumSize: Size(double.infinity, 45),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/paymen_screen');
              },
              child:  Text('Pay Now',style: GoogleFonts.cairo(fontSize: 18.sp),),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );

  }
  void _confirmClearDialog(){
    showDialog(
      barrierDismissible: false,
        context: context ,
        builder: (context){
          return AlertDialog(
            title: Text(
              'Confirm Deleted All !',
              style: GoogleFonts.cairo(
                fontSize: 18.sp,
                color: Colors.black
              ),
            ),
            content: Text(
                'Are You Sure ?',
              style: GoogleFonts.cairo(
                fontSize: 14.sp,
                color: Colors.black45
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Confirm',style: GoogleFonts.cairo(color: Colors.red),)
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Cancle',style: GoogleFonts.cairo())
              ),
            ],
          );
        }
    );
  }
}
