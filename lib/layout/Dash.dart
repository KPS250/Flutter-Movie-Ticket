import 'package:flutter/material.dart';
class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context,BoxConstraints constraints) {
        final boxWidth=constraints.constrainWidth();
        final dw=8.0;
        final dht=2.0;
        final dashCount=(boxWidth/(2*dw)).floor();
        return Flex(
          children:List.generate(dashCount, (_) {
            return SizedBox(
              width:dw,
              height:dht,
              child:DecoratedBox(
                decoration:BoxDecoration(color:Colors.grey),
              ),
            );
          }),
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          direction:Axis.horizontal,
        );
      },
    );
  }
}