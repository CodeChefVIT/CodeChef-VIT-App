import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OutsideAboutUs extends StatelessWidget {
  List<String> image = [
    'kunal.jpg',
    'rajat.jpg',
    'akshat.jpg',
    'muskan.jpg',
    'nishi.jpg',
    'ishan.jpg',
    'shreya.jpg',
    'dipto.jpg',
    'priyank.jpg',
    'devang.jpg',
    'anmol.jpg',
    'vansh.jpg',
    'kshitiz1.jpg',
    'anuj.jpg',
    'navyaa.jpg',
  ];
  List<String> name = [
    'Kunal Chaudhary',
    'Rajat Sablok',
    'Akshat Gupta',
    'Muskan Tewari',
    'Nishi Jain',
    'Ishan Gupta',
    'Shreya Chatterjee',
    'Dipto Chakraborty',
    'Priyank Kaushik',
    'Devang Pandey',
    'Anmol Pant',
    'Vansh Goel',
    'Kshitiz Verma',
    'Anuj Kapoor',
    'Navya Sharma',
  ];
  List<String> pos = [
    'President',
    'Vice President',
    'Technical Chair ',
    'General Secretary',
    'Events and Publicity Director',
    'Operations and HR Director',
    'Finance Director',
    'Projects Lead',
    'Logistics and Outreach Director',
    'Design and Media head',
    'Editorial Head',
    'Research Lead',
    'Competitive Coding Head',
    'App lead',
    'Web Master',
  ];
  List<String> info = [
    '+91 7014531554',
    '+91 9926817645',
    '+91 9600093179',
    '+91 9831460332',
    '+91 6381033638',
    '+91 9818304476',
    '+91 7762819065',
    '+91 9003755024',
    '+91 7771956423',
    '+91 9755487562',
    '+91 9868884672',
    '+91 9873052528',
    '+91 8449736175',
    '+91 6394577290',
    '+91 9315673060',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 42),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.arrowLeft),
              color: Color(0xFF1D59A1),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 54,
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/fulllogo.png'),
          ),
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.only(left: 24),
            alignment: Alignment.centerLeft,
            child: Text(
              'About Us',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                fontFamily: 'SFProDisplay',
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 24, right: 24),
            alignment: Alignment.centerLeft,
            child: Text(
              'Codechef-VIT is one of the prestigious technical chapters of VIT Vellore. '
              'Our aim is to educate and enable the youth who will lead in various innovative endeavours. '
              'We hope that together, each one of us may contribute to the chapter\'s countless accolades and leave a lasting mark. '
              'Check out our website at https://www.codechefvit.com/',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'SFProDisplay',
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 24),
            alignment: Alignment.centerLeft,
            child: Text(
              'Meet our Board',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                fontFamily: 'SFProDisplay',
              ),
            ),
          ),
          Container(
            height: 350,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      height: 375,
                      width: 400,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30),
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Board/${image[index]}'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    name[index],
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      fontFamily: 'SFProDisplay',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    pos[index],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontFamily: 'SFProDisplay',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    info[index],
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
