import 'package:flutter/material.dart';

class StyleOption {
  StyleOption({this.assetName, this.createdBy, this.id});

  String assetName;
  String createdBy;
  int id;

  StyleOption.fromMap(Map<String, dynamic> map) {
    assetName = map['assetname'];
    createdBy = map['createdby'];
    id = map['styleid'];
  }

  Image getImage() {
    return Image.asset(assetName);
  }
}
