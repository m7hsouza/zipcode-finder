import 'package:zipcodefinder/app/features/zipcode/models/addressmodel.dart';

abstract class SearchAddressByCepRepository {
  Future<AddressModel> call(String cep);
}
