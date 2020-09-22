import 'package:flutter/material.dart';

class MeetingCard extends StatefulWidget {
  final String name;
  final String time;
  final String venue;
  final String date;
  final String description;
  final String members;
  final Color bgcolor;
  final Color sgcolor;

  MeetingCard({
    @required this.name,
    @required this.time,
    @required this.venue,
    @required this.date,
    @required this.description,
    @required this.members,
    @required this.bgcolor,
    @required this.sgcolor,
  });
  @override
  State<StatefulWidget> createState() {
    return MeetingCardState();
  }
}

class MeetingCardState extends State<MeetingCard> {
  TimeOfDay time;
  DateTime date;
  String timeDisplay, dateDisplay;
  String getMonth(int month) {
    if (month == 01) {
      return "Jan";
    }
    if (month == 02) {
      return "Feb";
    }
    if (month == 03) {
      return "Mar";
    }
    if (month == 04) {
      return "Apr";
    }
    if (month == 05) {
      return "May";
    }
    if (month == 06) {
      return "Jun";
    }
    if (month == 07) {
      return "Jul";
    }
    if (month == 08) {
      return "Aug";
    }
    if (month == 09) {
      return "Sep";
    }
    if (month == 10) {
      return "Oct";
    }
    if (month == 11) {
      return "Nov";
    }
    if (month == 12) {
      return "Dec";
    } else {
      return "";
    }
  }

  void initState() {
    super.initState();
    time = TimeOfDay(
      hour: int.parse(widget.time.substring(0, 2)),
      minute: int.parse(widget.time.substring(3, 5)),
    );
    date = DateTime.parse(widget.date);
    if (time.hour > 12) {
      timeDisplay =
          '${time.hour - 12}:${time.minute > 10 ? time.minute : "0" + time.minute.toString()} PM';
    } else if (time.hour == 12) {
      timeDisplay =
          '${time.hour}:${time.minute > 10 ? time.minute : "0" + time.minute.toString()} PM';
    } else {
      timeDisplay =
          '${time.hour == 0 ? 12 : time.hour}:${time.minute > 10 ? time.minute : "0" + time.minute.toString()} AM';
    }
    dateDisplay = '${date.day} ' + '${getMonth(date.month)}' + ' ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          30, 0, 30, MediaQuery.of(context).size.height * 20 / 896),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: widget.bgcolor,
      ),
      width: 350,
      height: MediaQuery.of(context).size.height * 170 / 896,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34,
                    MediaQuery.of(context).size.height * 22 / 896 - 3, 0, 0),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0,
                    MediaQuery.of(context).size.height * 22 / 896 - 3, 34, 0),
                child: Text(
                  timeDisplay,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(34, 0, 0, 5),
                child: Text(
                  widget.venue,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(0, 0, 34, 5),
                child: Text(
                  dateDisplay,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 18 / 896,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: widget.sgcolor,
            ),
            margin: EdgeInsets.symmetric(horizontal: 34),
            height: MediaQuery.of(context).size.height * 54 / 896,
            width: 294,
            padding: EdgeInsets.all(10),
            child: Text(
              widget.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'SF Pro Text',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 6 / 896,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 34),
                child: Text(
                  widget.members,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontSize: MediaQuery.of(context).size.height * 16 / 896,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 18 / 896,
          ),
        ],
      ),
    );
  }
}
