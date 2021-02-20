import 'package:address_picker/enum/address_enum.dart';
import 'package:address_picker/model/address_item_model.dart';
import 'package:flutter/widgets.dart';

/// 订阅
class AddressNotification extends Notification {
  AddressNotification({@required this.value, @required this.type});
  final AddressTypeEnum type;
  final AddressItemModel value;
}
