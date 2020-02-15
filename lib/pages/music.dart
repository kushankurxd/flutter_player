import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_player/Util/config.dart';
import 'package:flutter_player/Util/menu.dart';


class MusicXD extends StatefulWidget{

  @override
  State createState() {
    return _MusicXDState();
  }
}

class _MusicXDState extends State<MusicXD> {

  double _val = 2.4;
  double _maxVal = 10;

  bool isPlaying = true;
  bool isRepeat = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight,
                    child: Image.asset('img/teen2.png',fit: BoxFit.cover,),
                  ),


                  Container(
                    height: SizeConfig.screenHeight ,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey[900].withOpacity(0.64),Colors.grey[200].withOpacity(0.2)],
                          begin: Alignment.bottomCenter,
                          end:  Alignment.topCenter,
                        )
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 24,),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'FIRST',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockHorizontal * 12.6,
                                  letterSpacing: 2.4,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Narrow'
                              ),
                            ),
                            Text(
                              'WAVE',
                              style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockHorizontal * 12.6,
                                  letterSpacing: 2.4,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Narrow'
                              ),
                            ),
                            Text(
                              'IMPACT',
                              style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockHorizontal * 12.6,
                                  letterSpacing: 2.4,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Narrow'
                              ),
                            ),
                            Text(
                              'SECRET MACHINES',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.2,
                                fontSize: SizeConfig.safeBlockHorizontal * 3
                              ),
                            ),


                            SizedBox(height: SizeConfig.safeBlockVertical * 22.4,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
                              child: SliderTheme(
                                data: SliderThemeData(
                                  activeTrackColor: Colors.white70,
                                  trackHeight: 2,
                                  inactiveTrackColor: Colors.black54,
                                  thumbColor: Colors.transparent,
                                ),
                                child: Slider(
                                  onChanged: (val){
                                    setState(() {
                                      _val = val;
                                    });
                                  },
                                  max: _maxVal,
                                  value: _val,
                                ),
                              ),
                            ),


                            SizedBox(height: SizeConfig.safeBlockVertical * 6,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 21),
                              child: Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CircleAvatar(
                                    child: Icon(Icons.skip_previous,color: Colors.white,),
                                    backgroundColor: Colors.grey.withOpacity(0.4),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isPlaying = isPlaying ? false : true;
                                      });
                                    },
                                    child: Card(
                                      color: Colors.transparent,
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 10)),
                                      child: CircleAvatar(
                                        radius: SizeConfig.safeBlockHorizontal * 9,
                                        child: isPlaying ? Icon(Icons.pause,color: Colors.white,size: SizeConfig.safeBlockHorizontal * 9,) : Icon(Icons.play_arrow,color: Colors.white,size: SizeConfig.safeBlockHorizontal * 9,),
                                        backgroundColor: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    child: Icon(Icons.skip_next,color: Colors.white,),
                                    backgroundColor: Colors.grey.withOpacity(0.4),
                                  )
                                ],
                              ),
                            ),


                            SizedBox(height: SizeConfig.safeBlockVertical * 1.4,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 6.4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.shuffle,color: Colors.grey[200],),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isRepeat = isRepeat ? false : true;
                                      });
                                    },
                                    child: Icon(
                                      isRepeat ? Icons.repeat : Icons.repeat_one,
                                      color: Colors.grey[200],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  ),


                  //AppBar
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 4.4,horizontal: SizeConfig.safeBlockHorizontal * 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            child: Icon(Icons.keyboard_arrow_down,color: Color(0xffF5F5F5),size: 28,),
                            onTap: (){
                              Navigator.pop(context);
                            },
                        ),
                        Text(
                          'YOUR LIBRARY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 3,
                            letterSpacing: 0.4,
                            wordSpacing: 2
                          ),
                        ),
                        MenuXD(Color(0xffFAFAFA),Color(0xffEEEEEE)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
