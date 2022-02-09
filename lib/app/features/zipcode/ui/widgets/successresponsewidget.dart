import 'package:flutter/material.dart';
import 'package:zipcodefinder/app/features/zipcode/models/addressmodel.dart';

class SuccessResponseWidget extends StatelessWidget {
  const SuccessResponseWidget({Key? key, required AddressModel address})
      : _address = address,
        super(key: key);

  final AddressModel _address;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rua: ${_address.rua}',
            textAlign: TextAlign.justify,
          ),
          Text(
            'Bairro: ${_address.bairro}',
            textAlign: TextAlign.justify,
          ),
          Text(
            '${_address.cidade}/${_address.uf}',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
