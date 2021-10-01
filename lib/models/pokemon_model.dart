class PokemonModel {
  String name;
  String url;

  PokemonModel({this.name, this.url});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    url = json['url'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
