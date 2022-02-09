import 'dart:convert';

class AddressModel {
  final String? rua;
  final String? bairro;
  final String? cidade;
  final String? uf;

  AddressModel({
    this.rua,
    this.bairro,
    this.cidade,
    this.uf,
  });

  Map<String, dynamic> toMap() {
    return {
      'logradouro': rua,
      'bairro': bairro,
      'localidade': cidade,
      'uf': uf,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      rua: map['logradouro'],
      bairro: map['bairro'],
      cidade: map['localidade'],
      uf: map['uf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
