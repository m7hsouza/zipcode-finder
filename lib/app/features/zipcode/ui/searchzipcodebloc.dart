import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zipcodefinder/app/features/zipcode/repositories/searchaddresbyceprepository.dart';
import 'package:zipcodefinder/app/features/zipcode/ui/states/searchzipcodestate.dart';

class SearchZipCodeBloc extends Bloc<String, SearchZipCodeState> {
  final SearchAddressByCepRepository _addressByCepRepository;

  SearchZipCodeBloc(this._addressByCepRepository) : super(SearchZipCodeIdle()) {
    on<String>((cep, emit) async {
      if (cep.isEmpty) return;

      emit(SearchZipCodeLoading());
      try {
        final address = await _addressByCepRepository(cep);

        emit(
          SearchZipCodeSuccess(
            address: address,
          ),
        );
      } catch (e) {
        emit(SearchZipCodeError());
      }
    });
  }
}
