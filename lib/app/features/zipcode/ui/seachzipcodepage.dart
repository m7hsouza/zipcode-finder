import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zipcodefinder/app/features/zipcode/ui/searchzipcodebloc.dart';
import 'package:zipcodefinder/app/features/zipcode/ui/states/searchzipcodestate.dart';
import 'package:zipcodefinder/app/features/zipcode/ui/widgets/successresponsewidget.dart';

class SearchZipCodePage extends StatefulWidget {
  const SearchZipCodePage({Key? key}) : super(key: key);

  @override
  State<SearchZipCodePage> createState() => _SearchZipCodePageState();
}

class _SearchZipCodePageState extends State<SearchZipCodePage> {
  final _inputController = TextEditingController();
  late final SearchZipCodeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screen.width, screen.height * .09),
        child: Card(
          elevation: 7,
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(),
          color: Colors.red,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: '69000000',
                labelText: 'CEP',
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                hintStyle: TextStyle(color: Colors.black.withOpacity(.4), fontStyle: FontStyle.italic),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _bloc.add(_inputController.text);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (_, state) {
          if (state is SearchZipCodeSuccess) {
            return SuccessResponseWidget(address: state.address);
          }

          if (state is SearchZipCodeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SearchZipCodeError) {
            return const Center(child: Text('Erro ao buscar o cep!'));
          }

          return Container();
        },
      ),
    );
  }

  @override
  void initState() {
    _bloc = context.read<SearchZipCodeBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
