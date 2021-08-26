import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcScrollbar extends StatefulWidget {
  const NcScrollbar({ Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _NcScrollbarState createState() => _NcScrollbarState();
} 
class _NcScrollbarState extends State<NcScrollbar> {
  
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: GridView.builder(
        itemCount: 120,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text('item $index'),
          );
        },
      ),
    );
  }
}