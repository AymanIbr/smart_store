import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({required this.id,Key? key}) : super(key: key);
  final int id ;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

bool _likeproduct = true;

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    print("id ${widget.id}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Products',
          style: GoogleFonts.cairo(fontSize: 25.sp, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/sub_detalis_screen');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 200,
                    margin:
                    EdgeInsetsDirectional.only(bottom: 15),
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                color: const Color(0xFFEBF0F7),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextButton(
                              clipBehavior: Clip.antiAlias,
                              onPressed: () {

                              },
                              child: Image.asset('images/category1.png',fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 30),
                            Text(
                              'Marshal Bluetooth',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: Text(
                                'They sound great, but what really sets them apart is the price.',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('\$239.96'),
                                const SizedBox(width: 9),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Row(
                                children: [

                                  const SizedBox(width: 15),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFFEBF0F7),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(
                                                () => {_likeproduct = !_likeproduct});
                                      },
                                      icon: Icon(
                                        color: Colors.red,
                                        _likeproduct
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}