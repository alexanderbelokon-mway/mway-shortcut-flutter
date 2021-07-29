import 'package:flutter/material.dart';
import 'package:flutter_image_detection/pages/detector/detector_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.arrow_right),
                const Text(
                  'Cat or Dog',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetectorPage()),
              );
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.arrow_right),
                const Text(
                  'YOLO',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
