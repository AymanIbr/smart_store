import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/app/cart_screen.dart';
import 'package:smart_store/screen/app/fav_screen.dart';
import 'package:smart_store/screen/app/home_screen.dart';
import 'package:smart_store/screen/app/notifications.dart';
import 'package:smart_store/screen/models/bn_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  List<BnScreen> _screens = <BnScreen> [
    BnScreen( widget: HomeScreen()),
    BnScreen(widget: FavoriteScreen()),
    BnScreen(widget: CartScreen()),
    BnScreen(widget: NotificationsScreen())
 ];

  int _selectPageIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF2F4F7),
      body: _screens[_selectPageIndex].widget ,
      // drawer: Drawer(
      //
      // ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectPageIndex,
        onTap: (int selectPageIndex){
          setState(()=>_selectPageIndex = selectPageIndex);
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home,size: 30.sp,color: Color(0xFFFA076E8),),
              icon: Icon(Icons.home_outlined,size: 25.sp,color: Colors.grey.shade600),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite,size: 30.sp,color: Color(0xFFFA076E8),),
              icon: Icon(Icons.favorite_outline,size: 25.sp,color: Colors.grey.shade600),
              label: 'Favorite'
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.add_shopping_cart,size: 30.sp,color: Color(0xFFFA076E8),),
              icon: Icon(Icons.add_shopping_cart_outlined,size: 25.sp,color: Colors.grey.shade600),
              label: 'Shope'
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.notification_add,size: 30.sp,color: Color(0xFFFA076E8),),
              icon: Icon(Icons.notification_add_outlined,size: 25.sp,color: Colors.grey.shade600),
              label: 'Notify'
          ),
        ],
      ),
    );
  }
}
