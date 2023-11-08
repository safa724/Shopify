import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  CommonBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 37, 36, 36),
      currentIndex: currentIndex,
      
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? Colors.orange : Colors.white,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            color: currentIndex == 1 ? Colors.orange : Colors.white,
          ),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: currentIndex == 2 ? Colors.orange : Colors.white,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == 3 ? Colors.orange : Colors.white,
          ),
          label: 'Profile',
       
        ),
        
      ],
    
    );
  }
}
