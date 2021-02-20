import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressPickerTheme {
  /// 选中的颜色
  Color selectedText = Color(0xffFF004F);

  /// 选择的icon
  Widget selectedIcon;

  AddressPickerTheme({this.selectedText, this.selectedIcon});

  /// 获取共享类
  static AddressPickerTheme of(BuildContext context) {
    return Provider.of<AddressPickerTheme>(context);
  }
}
