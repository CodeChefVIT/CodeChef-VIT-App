import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> info = [
      'assets/default_pic.jpg',
      'Kunal Chaudhary',
      'President',
      'abc@gmail.com',
      '+91 7014531554',
      'assets/default_pic.jpg',
      'Rajat Sablok',
      'Vice President',
      'abc@gmail.com',
      '+91 9926817645',
      'assets/default_pic.jpg',
      'Akshat Gupta',
      'Technical Chair  ',
      'abc@gmail.com',
      '+91 9600093179',
      'assets/default_pic.jpg',
      'Muskan Tewari',
      'General Secretary',
      'abc@gmail.com',
      '+91 9831460332',
      'assets/default_pic.jpg',
      'Nishi Jain',
      'Events and Publicity Director',
      'abc@gmail.com',
      '+91 6381033638',
      'assets/default_pic.jpg',
      'Ishan Gupta',
      'Operations and HR Director',
      'abc@gmail.com',
      '+91 9818304476',
      'assets/default_pic.jpg',
      'Shreya Chatterjee',
      'Finance Director',
      'abc@gmail.com',
      '+91 7762819065',
      'assets/default_pic.jpg',
      'Dipto Chakraborty',
      'Projects Lead',
      'abc@gmail.com',
      '+91 9003755024',
      'assets/default_pic.jpg',
      'Priyank Kaushik',
      'Logistics and Outreach Director',
      'abc@gmail.com',
      '+91 7771956423',
      'assets/default_pic.jpg',
      'Devang Pandey',
      'Design and Media head',
      'abc@gmail.com',
      '+91 9755487562',
      'assets/default_pic.jpg',
      'Anmol Pant',
      'Editorial Head',
      'abc@gmail.com',
      '+91 9868884672',
      'assets/default_pic.jpg',
      'Vansh Goel',
      'Research Lead',
      'abc@gmail.com',
      '+91 9873052528',
      'assets/default_pic.jpg',
      'Kshitiz Verma',
      'Competitive Coding Head',
      'abc@gmail.com',
      '+91 8449736175',
      'assets/default_pic.jpg',
      'Anuj Kapoor',
      'App lead',
      'abc@gmail.com',
      '+91 6394577290',
      'assets/default_pic.jpg',
      'Navya Sharma',
      'Web Master',
      'abc@gmail.com',
      '+91 9315673060'
    ];
    int i;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 42),
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
                'We hope that together, each one of us may contribute to the chapter\'s countless accolades and leave a lasting mark. ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
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
              child: Column(
                children: [
                  for (i = 0; i < info.length; i = i + 5)
                    Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        CircleAvatar(
                          backgroundImage: AssetImage(info[i]),
                          radius: 50.0,
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                info[i + 1],
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
                                info[i + 2],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  fontFamily: 'SFProDisplay',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 120),
                            Icon(
                              Icons.mail,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 10),
                            Text(
                              info[i + 3],
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 120),
                            Icon(
                              Icons.phone,
                              color: Colors.grey[600],
                            ),
                            SizedBox(width: 10),
                            Text(
                              info[i + 4],
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
