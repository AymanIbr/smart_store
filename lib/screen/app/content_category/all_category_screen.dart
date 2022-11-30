import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/content_api_categoryController.dart';
import 'package:smart_store/api/models/api_response.dart';
import 'package:smart_store/api/models/category.dart';
import 'package:smart_store/screen/app/content_category/sub_category_screen.dart';

class AllCategoryScreen extends StatefulWidget {
  AllCategoryScreen({Key? key, this.id}) : super(key: key);
  String? id;

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoriesApiController().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/bottom_navigation_screen');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Categories',
          style: GoogleFonts.cairo(fontSize: 25.sp, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
      ),
      body: FutureBuilder<ApiResponse<List<Categories>>>(
        future: CategoriesApiController().getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.data!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'All products categories',
                      style: GoogleFonts.cairo(
                          fontSize: 22.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var category =
                        snapshot.data!.data!.elementAt(index);
                        return Container(
                          padding: EdgeInsets.only(top: 5),
                          margin: EdgeInsetsDirectional.only(
                              bottom: 10, start: 10, end: 10),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                color: Colors.black45,
                                blurRadius: 4,
                              )
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsetsDirectional.only(top: 10, start: 10),
                            leading: Image.network(
                              snapshot.data!.data![index].imageUrl,
                              width: 100.w,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              snapshot.data!.data![index].nameEn,
                              style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  height: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubCategoryScreen(
                                        id: category.id.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Icons.arrow_forward_ios)),
                          ),
                        );
                      }),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.cairo(),
              ),
            );
          }
        },
      ),
    );
  }
}
