import 'package:CCApp/providers/profile.dart';
import 'package:CCApp/providers/reg.dart';
import 'package:CCApp/screens/setupprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  List<dynamic> prof=[];
  bool _isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async{
    setState(() {
      _isLoading = true;
    });
    try{
    await Provider.of<Profile>(context, listen: false)
        .profileView(Provider.of<Reg>(context, listen: false).token);
        setState(() {
          prof=Provider.of<Profile>(context, listen: false).details;
        });
    }catch(e){
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
            ? Center(child:CircularProgressIndicator())
            : prof[0]['uuid']!=null
              ? Center(child: Text('done'),)
              : SetupProfile()
    );
  }
}
