import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/widgets/on_boarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  late PageController _pageController;
  int _CurrentPage = 0 ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        children: [
          Expanded(
            child:  PageView(
              physics: BouncingScrollPhysics(),
              onPageChanged: (int CurrentPage){
                setState(()=> _CurrentPage = CurrentPage );
              },
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: const [
               OnBordingContent(
                   title: 'NEW',
                   image: 'image_1',
                   EndTitle: 'Shop the latest collections, groovy exclusive and new items',
                   Subtitle: 'PRODUCTS'
               ),
                OnBordingContent(
                    title: 'PREMIUM',
                    image: 'image_2',
                    EndTitle: 'Make groovy yours, discover the brands you love. ',
                    Subtitle: 'BRANDS'
                ),
                OnBordingContent(
                    title: 'EXPRESS DELIVERY',
                    image: 'image_3',
                    EndTitle: 'Lorem ipsum dolor sit amet,Consectetur adipiscing elit. Interger Maximus accumsan erat ide facilisis.  ',
                    Subtitle: 'BRANDS'
                ),
              ],

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              TabPageSelectorIndicator(
                  backgroundColor: _CurrentPage == 0 ? Colors.blue : Colors.grey ,
                  borderColor: _CurrentPage == 0 ? Colors.orange : Colors.transparent ,
                  size: 10 ,
              ),
              TabPageSelectorIndicator(
                backgroundColor: _CurrentPage == 1 ? Colors.blue : Colors.grey ,
                borderColor: _CurrentPage == 1 ? Colors.orange : Colors.transparent ,
                size: 10 ,
              ),
              TabPageSelectorIndicator(
                backgroundColor: _CurrentPage == 2 ? Colors.blue : Colors.grey ,
                borderColor: _CurrentPage == 2 ? Colors.orange : Colors.transparent ,
                size: 10 ,
              ),
            ],
          ),
          SizedBox(height: 60.h,),
          Row(
            children: [
               Padding(
                 padding: EdgeInsetsDirectional.only(
                   start: 15.w
                 ),
                 child: Align(
                   alignment: AlignmentDirectional.bottomStart,
                   child: Visibility(
                     child: Visibility(
                       visible: _CurrentPage < 2 ,
                       replacement: TextButton(
                         onPressed: (){
                           Navigator.pushReplacementNamed(context, '/login_screen');
                         },
                         child: Text('START'),
                       ),
                       child: TextButton(
                         onPressed: (){
                           _pageController.animateToPage(
                               2,
                               duration: Duration(seconds: 1),
                               curve: Curves.easeInOutBack
                           );
                         },
                         child: Text('SKIP'),
                       ),
                     ),
                   ),
                 ),
               ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 20.w
                ),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Visibility(
                    child: Visibility(
                      visible: _CurrentPage < 2 ,
                      replacement: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            minimumSize: Size(120.w, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, '/login_screen');
                          },
                          child: Text('SART')
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            minimumSize: Size(120.w, 60.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: (){
                            if(_CurrentPage < 2 ){
                              _pageController.nextPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOutBack
                              );
                            }
                          },
                          child: Text('NEXT')
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 61.h,),
        ],
      ),
    );
  }
}

