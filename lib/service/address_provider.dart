import 'package:flutter/widgets.dart';
import 'package:address_picker/enum/address_enum.dart';
import 'package:address_picker/data/area_data.dart';
import 'package:address_picker/data/cities_data.dart';
import 'package:address_picker/data/provinces_data.dart';
import 'package:address_picker/model/address_item_model.dart';
import 'package:provider/provider.dart';

/// 收货地址状态管理
class AddressProvider extends ChangeNotifier {
  List<AddressItemModel> get provinces => _organizeData(provincesData);
  List<AddressItemModel> get cities => getCurrentProvinceCities();
  List<AddressItemModel> get area => getCurrentCitiesArea();

  /// 选择省
  AddressItemModel selectedProvince;

  /// 选中市
  AddressItemModel selectedCity;

  /// 选择区
  AddressItemModel selectedArea;

  AddressProvider({this.selectedArea, this.selectedCity, this.selectedProvince});

  /// 整理数据
  List<AddressItemModel> _organizeData(Map<String, dynamic> map) {
    List<AddressItemModel> list = [];
    map.keys.forEach((element) {
      String name = map[element]['name'];
      String alpha = map[element]['alpha'];
      list.add(AddressItemModel(code: element, name: name, alpha: alpha.toUpperCase()));
    });
    list.sort((a, b) => a.alpha.compareTo(b.alpha));
    return list;
  }

  /// 获取当前省 市数据
  List<AddressItemModel> getCurrentProvinceCities() {
    if (this.selectedProvince != null) {
      Map<String, dynamic> cities = citiesData[this.selectedProvince.code];
      return _organizeData(cities);
    }
    return [];
  }

  /// 获取当前市 区数据
  List<AddressItemModel> getCurrentCitiesArea() {
    if (this.selectedCity != null) {
      Map<String, dynamic> areas = areaData[this.selectedCity.code];
      return _organizeData(areas);
    }
    return [];
  }

  /// 头部导航文本
  String getNavRowText(AddressTypeEnum type) {
    String defaultText = '请选择';
    switch (type) {
      case AddressTypeEnum.provinces:
        return this.selectedProvince != null ? this.selectedProvince.name : defaultText;
        break;
      case AddressTypeEnum.cities:
        return this.selectedCity != null ? this.selectedCity.name : defaultText;
        break;
      case AddressTypeEnum.area:
        return this.selectedArea != null ? this.selectedArea.name : defaultText;
        break;
    }
    return defaultText;
  }

  /// 是否选择中
  bool isSelected(AddressTypeEnum type, AddressItemModel item) {
    switch (type) {
      case AddressTypeEnum.provinces:
        return item.code == this.selectedProvince?.code;
        break;
      case AddressTypeEnum.cities:
        return item.code == this.selectedCity?.code;
        break;
      case AddressTypeEnum.area:
        return item.code == this.selectedArea?.code;
        break;
    }
    return false;
  }

  void clearSelectedAllValue() {
    this.selectedProvince = null;
    this.selectedCity = null;
    this.selectedArea = null;
  }

  /// 获取共享类
  static AddressProvider of(BuildContext context) {
    return Provider.of<AddressProvider>(context);
  }
}
