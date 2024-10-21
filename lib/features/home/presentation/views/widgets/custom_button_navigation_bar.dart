import 'package:flutter/material.dart';

import '../domain/entities/button_navigation_bat_entity.dart';
import 'navigation_bar_item.dart';

class CustomButtonNavigationBar extends StatefulWidget {
   CustomButtonNavigationBar({super.key,this.selectedIndex=0, required this.onItemTapped});
  int selectedIndex = 0;
  ValueChanged<int> onItemTapped;
  @override
  State<CustomButtonNavigationBar> createState() => _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),shadows: [
          BoxShadow(
            color: Color(0x19000000),
            offset: Offset(0, -2),
            blurRadius: 25,
            spreadRadius: 0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:bottomNavigationBarList.asMap().entries.map((e) {
          var index=e.key;
          var item=e.value;
          return GestureDetector(
            onTap: (){    
              setState(() {
                widget.onItemTapped(index);
              });
            },
            child: NavigationBarItem(
              barEntity: item,
              isSelected:widget.selectedIndex==index ,
              
            ),
          );
        }).toList()
      ),
    );
  }
}




