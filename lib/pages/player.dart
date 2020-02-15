import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_player/Util/config.dart';
import 'package:flutter_player/Util/menu.dart';
import 'package:flutter_player/pages/music.dart';
import 'package:flutter_player/transition/slide.dart';
import 'package:flutter_player/Util/util.dart';


class PlayerXD extends StatefulWidget {
  @override
  _PlayerXDState createState() => _PlayerXDState();
}

class _PlayerXDState extends State<PlayerXD> {
  
  List musicList = [
    new Music('Intro !!!', '2:29'),
    new Music('Outcast', '4:24'),
    new Music('10 Feet Down', '3:23'),
    new Music('Green Light', '2:40'),
    new Music('Dreams','3:26'),
    new Music('Night Out','2:16'),
    new Music('Say Loud','4:00'),
    new Music('Quite','2:26'),
  ];
  ScrollController _controller = ScrollController();

  bool isPlaying = true;
  bool isRepeatOne = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.145,),
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: SizeConfig.safeBlockHorizontal * 5.4,
                      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 34),bottomRight: Radius.circular(SizeConfig.safeBlockHorizontal * 34)),),
                      child: SizedBox(
                        width: SizeConfig.screenWidth * 0.7,
                        height: SizeConfig.screenHeight * 0.54,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal * 34),bottomRight: Radius.circular(SizeConfig.safeBlockHorizontal * 34)),
                            child: Image.asset('img/teen1.png',fit: BoxFit.cover,)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 46.4, left:  SizeConfig.safeBlockHorizontal * 24.4),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Perception',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 5.4,
                                letterSpacing: 0.4,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: SizeConfig.safeBlockVertical * 1.4,),
                          Text(
                              'NF',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.4
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                )
              ),

              SizedBox(
                height: SizeConfig.safeBlockVertical * 34,
                child: ListView.builder(
                    controller: _controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: musicList.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, SlideTopRoute(page: MusicXD()));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 8.4,vertical: SizeConfig.safeBlockVertical * 2.4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  '${musicList[index].name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff424242),
                                ),
                              ),
                              Text(
                                  '${musicList[index].duration}',
                                style: TextStyle(
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),


              SizedBox(height: SizeConfig.safeBlockVertical * 5,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 6),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.shuffle, size: SizeConfig.safeBlockHorizontal * 5,),

                    SizedBox(width: SizeConfig.safeBlockHorizontal  * 21,),
                    Icon(Icons.fast_rewind,size: SizeConfig.safeBlockHorizontal * 5,),

                    SizedBox(width: SizeConfig.safeBlockHorizontal * 6,),
                    Card(
                      elevation: SizeConfig.safeBlockHorizontal * 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 8)
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isPlaying = isPlaying ? false : true;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: SizeConfig.safeBlockHorizontal * 6,
                            child: isPlaying ? Icon(Icons.pause,color: Colors.white,) : Icon(Icons.play_arrow,color: Colors.white,)
                        ),
                      ),
                    ),

                    SizedBox(width: SizeConfig.safeBlockHorizontal  * 6,),
                    Icon(Icons.fast_forward,size: SizeConfig.safeBlockHorizontal * 5,),

                    SizedBox(width: SizeConfig.safeBlockHorizontal  * 19,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isRepeatOne  = isRepeatOne ? false : true;
                        });
                      },
                      child: Icon(
                        isRepeatOne ? Icons.repeat_one : Icons.repeat,
                        size: SizeConfig.safeBlockHorizontal * 5,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 4,horizontal: SizeConfig.safeBlockHorizontal * 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.arrow_back_ios,color: Color(0xff424242),size: 22,),
                MenuXD(Color(0xff616161),Color(0xff212121)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
