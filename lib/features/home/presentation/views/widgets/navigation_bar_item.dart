import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/domain/entities/button_navigation_bat_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/active_icon.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/in_active_icon.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({super.key, required this.isSelected, required this.barEntity});
final bool isSelected;
final BottomNavigationBarEntity barEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected? ActiveItem(image:barEntity.activeImage,title: barEntity.name,):InactiveItem(image:barEntity.inActiveImage);
  }
}