import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  IconData? iconData;
  String? text;
}

class FABBottomAppBar extends StatelessWidget {
  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;
  final int currentIndex; // Tambahkan currentIndex

  const FABBottomAppBar({
    super.key,
    required this.items,
    this.centerItemText,
    this.height = 10.0,
    this.iconSize = 22.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    required this.onTabSelected,
    required this.currentIndex, // Tambahkan currentIndex ke constructor
  }) : assert(items.length == 2 || items.length == 4);

  @override
  Widget build(BuildContext context) {
    List<Widget> itemsList = List.generate(items.length, (int index) {
      return _buildTabItem(
        item: items[index],
        index: index,
        onPressed: onTabSelected,
      );
    });
    itemsList.insert(itemsList.length >> 1, _buildMiddleTabItem());

// Gunakan IntrinsicHeight untuk tinggi dinamis
    return IntrinsicHeight(
      child: PhysicalShape(
        clipper: _BottomAppBarClipper(
            notchedShape: notchedShape ?? const CircularNotchedRectangle()),
        color: backgroundColor ?? ColorApp.white,
        elevation: 10.0, // Shadow elevation
        shadowColor: Colors.black.withOpacity(0.9), // Shadow color
        child: BottomAppBar(
          color: backgroundColor,
          // shape: notchedShape,
          child: Row(
            mainAxisSize: MainAxisSize.min, // Sesuaikan dengan konten
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: itemsList,
          ),
        ),
      ),
    );

    // Use PhysicalShape to add shadow and handle notch
    // return PhysicalShape(
    //   clipper: _BottomAppBarClipper(
    //       notchedShape: notchedShape ?? const CircularNotchedRectangle()),
    //   color: backgroundColor ?? ColorApp.white,
    //   elevation: 100.0, // Shadow elevation
    //   shadowColor: Colors.black.withOpacity(0.9), // Shadow color
    //   child: BottomAppBar(
    //     height: height,
    //     color: backgroundColor,
    //     // shape: notchedShape,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: itemsList,
    //     ),
    //   ),
    // );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: iconSize),
            Text(
              centerItemText ?? '',
              style: TextStyle(color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    // Ubah warna berdasarkan currentIndex
    Color itemColor = currentIndex == index ? selectedColor! : color!;
    return Expanded(
      child: SizedBox(
        // height: height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            borderRadius: BorderRadius.circular(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  item.iconData,
                  color: itemColor,
                  size: iconSize,
                ),
                const SizedBox(height: 2),
                Text(
                  item.text ?? '',
                  style: TextStyleApp.bodyTextSmall.copyWith(
                    color: itemColor,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom clipper to handle the notch and shadow
class _BottomAppBarClipper extends CustomClipper<Path> {
  final NotchedShape notchedShape;

  _BottomAppBarClipper({required this.notchedShape});

  @override
  Path getClip(Size size) {
    final Rect button = Rect.fromCircle(
      center: Offset(size.width / 2, 0),
      radius: 35.0, // Adjust this radius based on your FAB size
    );
    return notchedShape.getOuterPath(Offset.zero & size, button);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
