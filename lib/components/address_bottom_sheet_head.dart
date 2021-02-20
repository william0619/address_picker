import 'package:flutter/material.dart';

class AddressBottomSheetHead extends StatelessWidget {
  final String hit;
  const AddressBottomSheetHead({Key key, @required this.hit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          hit != null ? Text(hit, style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15)) : SizedBox(),
          _BaseIconButton(icon: Icons.close, onPress: () => {Navigator.of(context, rootNavigator: true).pop()}),
        ],
      ),
    );
  }
}

class _BaseIconButton extends StatelessWidget {
  _BaseIconButton({
    Key key,
    @required this.icon,
    this.onPress,
    this.iconColor,
    this.size = 24,
    this.iconSize = 20,
    this.background = Colors.white,
  }) : super(key: key);

  final IconData icon;

  final double size;

  final double iconSize;

  final Color iconColor;

  final VoidCallback onPress;

  final Color background;

  @override
  Widget build(BuildContext context) {
    Color iconColor = this.iconColor ?? Color(0xFFCCCCCC);
    return Container(
      margin: EdgeInsets.zero,
      width: size,
      height: size,
      alignment: Alignment.center,
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(0),
        onPressed: this.onPress,
        child: Icon(this.icon, size: iconSize, color: iconColor),
        shape: CircleBorder(),
        color: background,
      ),
    );
  }
}
