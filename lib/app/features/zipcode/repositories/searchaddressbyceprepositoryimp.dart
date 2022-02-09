import 'package:zipcodefinder/app/core/httpclientservice.dart';
import 'package:zipcodefinder/app/features/zipcode/models/addressmodel.dart';
import 'package:zipcodefinder/app/features/zipcode/repositories/searchaddresbyceprepository.dart';

class SearchAddressByCepRepositoryImp implements SearchAddressByCepRepository {
  final HttpClientService _client;

  SearchAddressByCepRepositoryImp(this._client);

  @override
  Future<AddressModel> call(String cep) async {
    final response = await _client.get('https://viacep.com.br/ws/$cep/json/');

    return AddressModel.fromJson(response['body']);
  }
}
