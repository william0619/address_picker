import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressPickerTheme {
  /// 选中的颜色
  Color selectedColor;

  /// 选择的icon
  Widget selectedIcon;

  AddressPickerTheme({this.selectedColor, this.selectedIcon}) {
    defaultTheme();
  }

  defaultTheme() {
    if (this.selectedColor == null) this.selectedColor = Color(0xffFF004F);
    if (this.selectedIcon == null) {
      this.selectedIcon = Container(margin: EdgeInsets.only(right: 8), child: Icon(Icons.done_sharp, color: this.selectedColor, size: 18));
    }
  }

  /// 获取共享类
  static AddressPickerTheme of(BuildContext context) {
    return Provider.of<AddressPickerTheme>(context);
  }
}
