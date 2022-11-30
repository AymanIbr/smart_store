import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/content_api_categoryController.dart';
import 'package:smart_store/api/home_getx_controller.dart';
import 'package:smart_store/api/models/Sub_Category.dart';
import 'package:smart_store/api/models/api_response.dart';
import 'package:smart_store/api/sub_categories_api.dart';

class Test extends GetView<HomeGetController> {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder(
          builder: (controller) => Text(
            "",
          ),
        ),
        ListView(),
        Text("counter"),
      ],
    );
  }
}

class SubCategoryScreen extends StatefulWidget {
  SubCategoryScreen({Key? key, this.id}) : super(key: key);
  String? id;

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
      body: FutureBuilder<ApiResponse<List<SubCategories>>>(
        future: SubCategoriesApiController()
            .getSubCategories(categoryId: widget.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Test: ${snapshot.error}');
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.data!.isNotEmpty) {
            print('Test555: ${snapshot.error}');
            return Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/product_screen');
                  },
                  child: GridView.builder(
                      itemCount: snapshot.data!.data!.length,
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                Image.network(
                                  snapshot.data!.data![index].imageUrl,
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
                                      padding:
                                          EdgeInsetsDirectional.only(start: 16),
                                      child: Text(
                                        snapshot.data!.data![index].nameEn,
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
                ),
              ],
            );
          } else {
            return Container(
              child: Center(
                child: Text(
                  'NO DATA',
                  style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
