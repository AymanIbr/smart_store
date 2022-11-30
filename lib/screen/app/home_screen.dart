import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/home_getx_controller.dart';
import 'package:smart_store/screen/app/content_category/product_screen.dart';
import 'package:smart_store/screen/widgets/home_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _favorite = true;

  final controller = Get.put<HomeGetController>(HomeGetController());

  late PageController _pageController;

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'groovy',
            style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              alignment: AlignmentDirectional.topStart,
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                size: 26.sp,
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150.r),
                bottomRight: Radius.circular(150.r)),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromRadius(110),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 190),
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: controller.home!.slider.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int pageIndex) {
                    setState(() => currentIndex = pageIndex);
                  },
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      clipBehavior: Clip.antiAlias,
                      margin:
                          EdgeInsetsDirectional.only(end: index != 2 ? 10 : 0),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          children: [
                            // Icon(Icons.branding_watermark_rounded)
                            Expanded(
                              flex: 2,
                              child: Text(
                                textAlign: TextAlign.center,
                                'Interior Items 60% OFF',
                                style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                    color: const Color(0xfff8b4df3),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 4,
                              child: Image.network(
                                controller.home!.slider[currentIndex].imageUrl,
                                width: 180.w,
                                height: 180.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFFFA076E8)),
                accountName: Text(
                  'Ayman Ibrahem',
                  style: GoogleFonts.cairo(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  'ayman@gmail.com',
                  style: GoogleFonts.cairo(
                      fontSize: 12.sp, fontWeight: FontWeight.w300),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/pe.png'),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/pe.png'),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/pe.png'),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/pe.png'),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.border_all),
                title: Text(
                  'Order',
                  style: GoogleFonts.cairo(),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(microseconds: 500), () {
                    Navigator.pushNamed(context, '/order_screen');
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.mode_edit),
                title: Text(
                  'About',
                  style: GoogleFonts.cairo(),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(microseconds: 500), () {
                    Navigator.pushNamed(context, '/about_screen');
                    Navigator.pushNamed(context, '/order_screen');
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail_rounded),
                title: Text(
                  'Contact Us',
                  style: GoogleFonts.cairo(),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(microseconds: 500), () {
                    Navigator.pushNamed(context, '/contact_screen');
                    Navigator.pushNamed(context, '/order_screen');
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.question_answer),
                title: Text(
                  'Faqs',
                  style: GoogleFonts.cairo(),
                ),
                subtitle: Text(
                  'Frequent Question',
                  style: GoogleFonts.cairo(),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(microseconds: 500), () {
                    Navigator.pushNamed(context, '/faqs_screen');
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: GoogleFonts.cairo(),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(microseconds: 500), () {
                    Navigator.pushNamed(context, '/profile_screen');
                  });
                },
              ),
              SizedBox(
                height: 200.h,
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.cairo(),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _confirmLogoutDialog();
                },
              ),
            ],
          ),
        ),
        body: GetBuilder<HomeGetController>(
          builder: (controller) {
            var home = controller.home;
            if (controller.loading == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (home != null) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  HomeSction(
                      title: 'Browse by Category',
                      onPressed: () {
                        Navigator.pushNamed(context, '/all_category_screen');
                      }),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 100,
                    ),
                    child: GridView.builder(
                        itemCount: home.categories.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          childAspectRatio: 87.h / 141.w,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: const Color(0xFFF6E5656),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/category_type_screen');
                              },
                              child: Stack(
                                children: [
                                  ImageFiltered(
                                    imageFilter:
                                        ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                                    child: Image(
                                      image: NetworkImage(
                                          home.categories[index].imageUrl),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        bottom: 5,
                                        left: 10,
                                        right: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          textAlign: TextAlign.center,
                                          home.categories[index].nameEn,
                                          style: GoogleFonts.cairo(
                                              fontSize: 15.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  HomeSction(
                      title: 'New Products',
                      onPressed: () {
                        Navigator.pushNamed(context, '/all_new_products');
                      }),
                  SizedBox(
                    height: 19.h,
                  ),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: home.latestProducts.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 156 / 182,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Image(
                                  image: NetworkImage(
                                    home.latestProducts[index].imageUrl,
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '\$${home.latestProducts[index].price}',
                                          style: GoogleFonts.cairo(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w300,
                                              color: const Color(0xFF9C68F5)),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _favorite = !_favorite;
                                              });
                                            },
                                            icon: Icon(
                                              _favorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: const Color(0XFFFF7750),
                                            )),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductsScreen(
                                                    id: home
                                                        .latestProducts[index]
                                                        .id),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        home.latestProducts[index].nameEn,
                                        style: GoogleFonts.cairo(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              );
            } else {
              return Center(
                child: Text(
                  'NO DATA',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              );
            }
          },
        ));
  }

  void _confirmLogoutDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Confirm Logout',
              style: GoogleFonts.cairo(fontSize: 18.sp, color: Colors.black),
            ),
            content: Text(
              'Are You Sure ?',
              style: GoogleFonts.cairo(fontSize: 14.sp, color: Colors.black45),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.cairo(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancle', style: GoogleFonts.cairo())),
            ],
          );
        });
  }
}
