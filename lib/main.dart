import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_view/layout/Dash.dart';
import 'package:ticket_view/model/flim.dart';
void main() async =>runApp(MyApp(f:await loadFlim()));
class MyApp extends StatelessWidget {
  final Flim f;
  MyApp({this.f});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(fontFamily:'Roboto'),
      home:MyCard(f:f),
    );
  }
}
class MyCard extends StatelessWidget{
  final Flim f;
  MyCard({this.f});
  var edgeInsets=EdgeInsets.only(left:9.0,right:9.0,top:6,bottom:6);
  var border=BeveledRectangleBorder(borderRadius:BorderRadius.circular(14.0));
  var mypad=EdgeInsets.only(left:20.0,right:20.0,top:0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor:Color(0xFF673AE0),
      body:Container(
        child:SingleChildScrollView(
          child:ConstrainedBox(
            constraints:BoxConstraints(),
            child:Column(
              children:<Widget>[
                 Card(
                  margin:EdgeInsets.only(left:20.0,right:20.0,top:30),
                  shape:border,
                  child:Column(
                    children:<Widget>[
                      _child(f.ln+' | '+f.tp+' | '+f.cr,f.nm),
                      _image(),
                       Container(
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children:<Widget>[
                            _col('SHOW DATE',f.dt,'SEATS',f.sa),
                            _col('SHOW TIME',f.tm,'BOOK ID',f.bo),
                            _col('SCREEN',f.sr,'AMOUNT',f.bl+'/-')
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                 Card(
                margin:mypad,
                shape:border,
                child:Column(
                  children:<Widget>[
                     Padding(
                      padding:mypad,
                      child:Dash(),
                    ),
                     Image.asset('assets/images/'+f.qc),
                    _child("LOCATION",f.lc)
                  ],
                ),
              )
              ],
            ),
          )
        )
      )
    );
  }

  _child(t,d)=>Container(
    padding:edgeInsets,
    child:Column(
      children:<Widget>[
         Container(
          padding:edgeInsets,
          child:Text(t,style:TextStyle(fontSize:12.0)),
        ),
         Container(
          padding:edgeInsets,
          child:Text(d,style:TextStyle(fontSize:17.0,fontWeight:FontWeight.bold)),
        )
      ],
    )
  );

  _col(t1,d1,t2,d2)=>Container(
    child:Column(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:<Widget>[
        _child(t1,d1),
        _child(t2,d2),
      ],
    )
  );

  _image()=>ShaderMask(
    shaderCallback:(rect){
      return LinearGradient(
        begin:Alignment.topCenter,
        end:Alignment.bottomCenter,
        colors:[Colors.white,Colors.transparent],
      ).createShader(Rect.fromLTRB(0,120,rect.width,rect.height));
    },
    blendMode:BlendMode.dstIn,
    child:Image.asset('assets/images/'+f.ia,fit:BoxFit.contain),
  );
}