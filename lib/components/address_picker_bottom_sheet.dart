import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:address_picker/enum/address_enum.dart';
import 'package:address_picker/model/address_picker_model.dart';
import 'package:address_picker/service/address_picker_theme.dart';
import 'package:address_picker/components/address_tab.dart';
import 'package:address_picker/service/address_notification.dart';
import 'package:address_picker/service/address_provider.dart';
import 'package:address_picker/components/address_bottom_sheet_head.dart';

class AddressPickerBottomSheet extends StatefulWidget {
  /// 选中地址
  final AddressPickerModel selectedAddress;

  /// 设置主题
  final AddressPickerTheme theme;
  const AddressPickerBottomSheet({Key key, this.selectedAddress, this.theme}) : super(key: key);
  @override
  _AddressPickerBottomSheetState createState() => _AddressPickerBottomSheetState();
}

class _AddressPickerBottomSheetState extends State<AddressPickerBottomSheet> {
  /// 提示语
  String get hit => '选择所在区域';

  /// page控制器
  PageController pageController;

  /// 共享数据
  AddressProvider _addressProvider;

  /// 当前page 索引
  int currentPageIndex = 0;

  /// 头部流
  StreamController _streamController = StreamController<int>();

  /// 获取主题
  AddressPickerTheme get _theme {
    if (widget.theme == null) return AddressPickerTheme();
    return widget.theme;
  }

  @override
  void initState() {
    pageController = PageController(initialPage: currentPageIndex);

    /// 实例化共享层
    _addressProvider = AddressProvider();

    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Column(
        children: [
          AddressBottomSheetHead(hit: hit),
          Expanded(child: buildBody()),
        ],
      ),
    );
  }

  /// 主数据
  Widget buildBody() {
    return MultiProvider(
      providers: [
        Provider(create: (_) => _addressProvider),
        Provider(create: (_) => _theme),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNavAddress(),
          SizedBox(height: 12),
          Expanded(
            child: NotificationListener<AddressNotification>(
              onNotification: onNotification,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  AddressTab(data: _addressProvider.provinces, type: AddressTypeEnum.provinces),
                  AddressTab(data: _addressProvider.cities, type: AddressTypeEnum.cities),
                  AddressTab(data: _addressProvider.area, type: AddressTypeEnum.area),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 选中值导航
  Widget _buildNavAddress() {
    return StreamBuilder<int>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        return Container(
          height: 36,
          child: Row(
            children: [
              _buildNavButton(0, AddressTypeEnum.provinces),
              Visibility(visible: _addressProvider.selectedProvince != null, child: _buildNavButton(1, AddressTypeEnum.cities)),
              Visibility(visible: _addressProvider.selectedCity != null, child: _buildNavButton(2, AddressTypeEnum.area)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavButton(int index, AddressTypeEnum type) {
    bool isSelected = currentPageIndex == index;
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () => {_onChangePageViewIndex(index)},
        child: Text(
          _addressProvider.getNavRowText(type),
          style: TextStyle(
            color: isSelected ? _theme.selectedColor : Theme.of(context).textTheme.bodyText2.color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  /// 回调
  bool onNotification(AddressNotification v) {
    switch (v.type) {
      case AddressTypeEnum.provinces:
        _addressProvider.clearSelectedAllValue();
        _addressProvider.selectedProvince = v.value;
        _onChangePageViewIndex(1);
        break;
      case AddressTypeEnum.cities:
        _addressProvider.selectedCity = v.value;
        _addressProvider.selectedArea = null;
        _onChangePageViewIndex(2);
        break;
      case AddressTypeEnum.area:
        _addressProvider.selectedArea = v.value;
        Navigator.of(context).pop(_addressProvider.getSelectedValue());
        break;
    }
    setState(() {});
    return false;
  }

  /// 跳转页
  void _onChangePageViewIndex(int index) {
    currentPageIndex = index;
    pageController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.ease);
    _streamController.sink.add(index);
  }
}
