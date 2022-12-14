import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screen/app/adresses/about_screen.dart';
import 'package:smart_store/screen/app/adresses/adress_screen.dart';
import 'package:smart_store/screen/app/adresses/contact_screen.dart';

import 'package:smart_store/screen/app/adresses/update_adreese_screen.dart';
import 'package:smart_store/screen/app/content_category/all_category_screen.dart';
import 'package:smart_store/screen/app/all_new_product_screen.dart';
import 'package:smart_store/screen/app/caredit_card_screen.dart';
import 'package:smart_store/screen/app/cart_screen.dart';
import 'package:smart_store/screen/app/content_category/category_type_screen.dart';
import 'package:smart_store/screen/app/drawer/order_detalis.dart';
import 'package:smart_store/screen/app/drawer/order_screen.dart';
import 'package:smart_store/screen/app/payment_screen.dart';
import 'package:smart_store/screen/app/content_category/product_screen.dart';
import 'package:smart_store/screen/app/profile_screen.dart';
import 'package:smart_store/screen/app/settings/change_password_screen.dart';
import 'package:smart_store/screen/app/content_notifi_screen.dart';
import 'package:smart_store/screen/app/detalis_fa_screen.dart';
import 'package:smart_store/screen/app/detalis_screen.dart';
import 'package:smart_store/screen/app/content_category/detalis_sub_screen.dart';
import 'package:smart_store/screen/app/drawer/faq_screen.dart';
import 'package:smart_store/screen/app/settings/edit_profile_screen.dart';
import 'package:smart_store/screen/app/settings/edite_mobile_screen.dart';
import 'package:smart_store/screen/app/fav_screen.dart';
import 'package:smart_store/screen/app/home_screen.dart';
import 'package:smart_store/screen/app/notifications.dart';
import 'package:smart_store/screen/app/settings/virification_mobile_edite_screen.dart';
import 'package:smart_store/screen/app/content_category/sub_category_screen.dart';
import 'package:smart_store/screen/auth/forget_password.dart';
import 'package:smart_store/screen/auth/login_screen.dart';
import 'package:smart_store/screen/auth/register_screen.dart';
import 'package:smart_store/screen/auth/reset_password_screen.dart';
import 'package:smart_store/screen/auth/virification_screen.dart';
import 'package:smart_store/screen/bottom_navigation_screen.dart';
import 'package:smart_store/screen/core/launch_screen.dart';
import 'package:smart_store/screen/on_boarding_screen/on_boarding_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      minTextAdapt: true,
      builder: (context,child){
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Color(0xFFFA076E8),
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/lauanch_screen',
          routes: {
            '/lauanch_screen' : (context)=>const LaunchScreen(),
            '/on_boarding_screen' : (context) => const OnBoardingScreen(),
            '/login_screen' : (context) => const LoginScreen(),
            '/register_screen' : (context) => const RegisterScreen(),
            '/forget_password' : (context) => const ForgetPassword(),



            '/reset_screen' : (context)=> const ResetScreen(),
            '/home_screen' : (context)=>const HomeScreen(),
            '/bottom_navigation_screen' :(context)=>const BottomNavigationScreen(),
            '/favorite_screen':(context)=>FavoriteScreen(),
            '/cart_screen': (context)=>const CartScreen(),
            '/notify_screen':(context)=>const NotificationsScreen(),
            '/detalis_screen': (context) => const DetalisScreen(),
            '/category_type_screen' : (context)=>const CategoryTypeScreen(),
            '/sub_detalis_screen':(context) => const DetalisSubScreen(),
            '/faqs_screen':(context)=>const FaqsScreen(),
            '/all_category_screen':(context)=>   AllCategoryScreen(),
            '/all_new_products':(context)=>const NewProductScreen(),
            '/detalis_fa_screen':(context)=>const  DetalisFavScreen(),
            '/content_notify_screen' : (context)=>const ContentNotificationScreen(),
            '/change_password':(context)=> const ChangePasswordScreen(),
            '/edit_profile_screen':(context)=>const EditProfileScreen(),
            '/edite_mobile_screen':(context)=>const EditeMobileScreen(),
            '/virification_mobile_screen':(context)=>const VrificationMobileScreen(),
            '/profile_screen':(context)=>const ProfileScreen(),
            '/order_screen':(context)=>const OrdersScreen(),
            '/order_details_screen':(context)=>const OrderDetailsScreen(),
            '/adresse_screen':(context)=>const AddressScreen(),
            '/update_adreese':(context)=>const UpdatedAddressScreen(),
            '/paymen_screen':(context)=>const PaymentCardsScreen(),

            '/sub_category_screen':(context)=> SubCategoryScreen(),
            '/about_screen':(context)=>const AboutScreen(),
            // '/product_screen':(context)=>const ProductsScreen(),
            '/contact_screen':(context)=>const ContactScreen(),
            '/credit_screen':(context)=> MySample(),
          },
        );
      },
    );
  }
}
