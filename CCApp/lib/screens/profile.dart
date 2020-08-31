import 'package:CCApp/providers/profile.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/editProfile.dart';
import 'package:CCApp/screens/setupprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
  int i;
  List<String> image=[
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
  List<String> name=[
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
  List<String> pos=[
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
  List<String> eventimage20=[
    'devsoc20.jpg',
  ];
  List<String> eventimage19=[
    'devsoc19.jpg',
    'webapps.jpeg',
    'cook.jpeg',
    'insight.jpeg',
    'game.jpeg',
    'server.jpeg',
    'blitz.jpeg',
  ];
  List<String> eventimage18=[
    'blockchain.jpg',
    'data_analytics.jpg',
    'error404.jpg',
    'codecombat.jpeg',
    'who-breaks-first.jpeg',
    'seriesbuff.jpeg',
  ];
  List<String> eventimage17=[
    'insight17.jpeg',
    'bigdata.jpeg',
    'cookoff3.jpeg'
  ];
  List<dynamic> prof = [];
  bool _isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Profile>(context, listen: false)
          .profileView(Provider.of<Reg>(context, listen: false).token);
      setState(() {
        prof = Provider.of<Profile>(context, listen: false).details;
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : prof.toString() == '[]'
          ? SetupProfile()
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 30 / 414,
                      MediaQuery.of(context).size.height * 70 / 896,
                      0,
                      0),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 12,
                    height: 1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *
                          75 /
                          896),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => EditProfile(),
                        ),
                      );
                    },
                    child: Text(
                      'Edit',
                      style:
                      TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 30 / 896,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 30 / 414,
                ),
                FaIcon(
                  FontAwesomeIcons.userCircle,
                  size: 28,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 10 / 414,
                      0,
                      0,
                      0),
                  child: Text(
                    prof[0]['name'],
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 25 / 896,
            ),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          30 /
                          414,
                    ),
                    FaIcon(
                      FontAwesomeIcons.phone,
                      size: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width *
                              10 /
                              414,
                          0,
                          0,
                          0),
                      child: Text(
                        prof[0]['phone'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: 12,
                    height: 1,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          30 /
                          414,
                    ),
                    FaIcon(
                      prof[0]['gender'] == 'FEM'
                          ? FontAwesomeIcons.venus
                          : FontAwesomeIcons.mars,
                      size: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 10 / 414,
                        0,
                        MediaQuery.of(context).size.width * 30 / 414,
                        0,
                      ),
                      child: Text(
                        prof[0]['gender'] == 'FEM'
                            ? 'Female'
                            : 'Male',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 10 / 896,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 30 / 414,
                ),
                FaIcon(
                  FontAwesomeIcons.envelope,
                  size: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 10 / 414,
                      0,
                      0,
                      0),
                  child: Text(
                    prof[0]['email'],
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 10 / 896,
            ),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          30 /
                          414,
                    ),
                    FaIcon(
                      FontAwesomeIcons.graduationCap,
                      size: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width *
                              10 /
                              414,
                          0,
                          0,
                          0),
                      child: Text(
                        prof[0]['regno'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: 12,
                    height: 1,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          30 /
                          414,
                    ),
                    FaIcon(
                      FontAwesomeIcons.building,
                      size: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width *
                              10 /
                              414,
                          0,
                          0,
                          0),
                      child: Text(
                        prof[0]['block'] + ' : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width *
                              30 /
                              414),
                      child: Text(
                        prof[0]['room'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 50 / 896,
            ),
            Container(
              margin: EdgeInsets.only(left: 44, right: 44),
              height: MediaQuery.of(context).size.height * 56 / 896,
              width: 326,
              child: FlatButton(
                onPressed: () async {
                  await Provider.of<Reg>(context, listen: false)
                      .logout();
                  RestartWidget.restartApp(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF3BE0EB),
                      Color(0xFF1D59A1)
                    ]),
                    borderRadius: BorderRadius.circular(33),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Log Out",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Codechef-VIT is one of the prestigious technical chapters of VIT Vellore. '
                            'Our aim is to educate and enable the youth who will lead in various innovative endeavours. '
                            'We hope that together, each one of us may contribute to the chapter\'s countless accolades and leave a lasting mark. '
                            '\nCheck out our '
                    ),
                    TextSpan(
                        text: 'website.',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            const url = 'https://codechefvit.com';
                            launchURL(url);
                          }),
                    TextSpan(
                        text: '\nFollow us on '
                    ),
                    TextSpan(
                        text: 'instagram ',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            const url = 'https://www.instagram.com/codechefvit';
                            launchURL(url);
                          }),
                    TextSpan(
                        text: 'to stay updated on our activities.'
                    ),
                  ],
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
                  itemBuilder: (context, index){
                    return  Center(
                      child: Container(
                        height: 375,
                        width:400,
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
                                    SizedBox(height: 10,),
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
                  }
                ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                'Events',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                '2020',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            SizedBox(height: 10,),
            for(i=0;i<eventimage20.length;i++)
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: (){
                      print("tapped");
                    },
                    child: Image.asset(
                      'assets/images/Events/${eventimage20[i]}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                '2019',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            SizedBox(height: 10,),
            for(i=0;i<eventimage19.length;i++)
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/Events/${eventimage19[i]}',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                '2018',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            SizedBox(height: 10,),
            for(i=0;i<eventimage18.length;i++)
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/Events/${eventimage18[i]}',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                '2017',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  fontFamily: 'SFProDisplay',
                ),
              ),
            ),
            SizedBox(height: 10,),
            for(i=0;i<eventimage17.length;i++)
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/Events/${eventimage17[i]}',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}