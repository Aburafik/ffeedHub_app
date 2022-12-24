import 'package:flutter/cupertino.dart';

class DonateProvider extends ChangeNotifier {
 final List<Map> _donateItemData=[];

  get donateDataList => _donateItemData;

  setDonateData({List <Map>? addData}) {
    _donateItemData.addAll(addData!);
    notifyListeners();
  }
}
