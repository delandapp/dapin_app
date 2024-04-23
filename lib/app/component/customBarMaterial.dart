import 'package:flutter/material.dart';

class CustomBottomBarMaterial extends StatelessWidget {

  final Color colorIcon = const Color(0xFFFFFFFF);
  final Color colorSelect = const Color(0xFFEA1818);
  final Color colorBackground = const Color(0xFF1B1B1D);
  final int currentIndex;
  final Function(int) onTap;


  CustomBottomBarMaterial({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color colorIcon= Color(0xFF000000);
    const Color colorSelect= Color(0xFFFFC700);
    const Color colorBackground= Color.fromARGB(255, 255, 255, 255);

    return BottomNavigationBar(
      unselectedItemColor: colorIcon,
      selectedItemColor: colorSelect,
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorBackground,
      iconSize: 24,
      showUnselectedLabels: true,
      items: [
        _bottomNavigationBarItem(
          icon: Icons.person_2_rounded,
          label: 'Profile',
        ),
        
        _bottomNavigationBarItem(
          icon: Icons.history,
          label: 'Riwayat',
        ),
        _bottomNavigationBarItem(
          icon: Icons.house_rounded,
          label: 'Home',
        ),
        _bottomNavigationBarItem(
          icon: Icons.heart_broken_outlined,
          label: 'Favorit',
        ),
      ],
    );
  }
  BottomNavigationBarItem _bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
