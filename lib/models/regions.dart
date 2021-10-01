import 'package:flutter/material.dart';

enum RegionPokedex { kanto, jhoto }

extension SelectedRegionPokedex on RegionPokedex {
  Map<String, int> get range {
    switch (this) {
      case RegionPokedex.kanto:
        return {"limit": 151, "offset": 0};
      case RegionPokedex.jhoto:
        return {"limit": 100, "offset": 151};
    }
  }

  Color get color {
    switch (this) {
      case RegionPokedex.kanto:
        return Colors.red;
      case RegionPokedex.jhoto:
        return Colors.blue;
    }
  }
}
