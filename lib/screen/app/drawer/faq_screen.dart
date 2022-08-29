import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screen/models/faq.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {


  List<Faq> _faqs = <Faq> [
    Faq(question: 'Question#1', answer: 'Answer#1'),
    Faq(question: 'Question#2', answer: 'Answer#2'),
    Faq(question: 'Question#3', answer: 'Answer#3'),
    Faq(question: 'Question#4', answer: 'Answer#4'),
    Faq(question: 'Question#5', answer: 'Answer#5'),
    Faq(question: 'Question#6', answer: 'Answer#6'),
    Faq(question: 'Question#7', answer: 'Answer#7'),
    Faq(question: 'Question#8', answer: 'Answer#8'),
    Faq(question: 'Question#9', answer: 'Answer#9'),
    Faq(question: 'Question#10', answer: 'Answer#10'),
    Faq(question: 'Question#11', answer: 'Answer#11'),
    Faq(question: 'Question#12', answer: 'Answer#12'),
    Faq(question: 'Question#1', answer: 'Answer#13'),
    Faq(question: 'Question#13', answer: 'Answer#13'),
    Faq(question: 'Question#14', answer: 'Answer#14'),
    Faq(question: 'Question#15', answer: 'Answer#15'),
    Faq(question: 'Question#16', answer: 'Answer#16'),
    Faq(question: 'Question#17', answer: 'Answer#17'),
    Faq(question: 'Question#18', answer: 'Answer#18'),
    Faq(question: 'Question#19', answer: 'Answer#19'),
    Faq(question: 'Question#20', answer: 'Answer#20'),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
        IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/bottom_navigation_screen');
            },
            icon:Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title: Text('Frequent Question',style: GoogleFonts.cairo(color: Colors.white),),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFFFF2F4F7),
          ),
          ListView(
            children: [
              ExpansionPanelList(
                  elevation: 4,
                  animationDuration: Duration(seconds: 1),
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(()=> _faqs[panelIndex].isExpanded = !isExpanded);
                  },
                  children: _faqs.map((e){
                    return ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: e.isExpanded,
                      backgroundColor: Color(0xFFFEBEBEB),
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.question_answer,size: 18,),
                                Text(e.question),
                                SizedBox(width: 5,),
                              ],
                            ));
                      }, body: Container(
                        color: Color(0xFFEAE3D2),
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(e.answer,style: GoogleFonts.montserrat(),)),

                    );
                  }).toList()
              ),
            ],
          ),
        ],
      ),
    );
  }
}
