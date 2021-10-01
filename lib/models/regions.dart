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
}
