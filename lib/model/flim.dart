import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Flim{
  String nm, ia, ln, tp, cr, dt, tm, sr, sa, bo, bl, lc, qc;
  Flim({this.nm, this.ia, this.ln, this.tp, this.cr, this.dt, this.tm, this.sr, this.sa, this.bo, this.bl, this.lc, this.qc});
  factory Flim.fromJson(Map<String, dynamic> p){
    return Flim(nm:p['nm'],ia:p['ia'],ln:p['ln'],tp:p['tp'],cr:p['cr'],dt:p['dt'],tm:p['tm'],sr:p['sr'],sa:p['sa'],bo:p['bo'],bl:p['bl'],lc:p['lc'],qc:p['qc']);
  }
}
Future<String> loadAsset() async{return await rootBundle.loadString('assets/data/flim.json');}
Future<Flim> loadFlim() async{return new Flim.fromJson(json.decode(await loadAsset()));}