import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zipcodefinder/app/core/httpclientservice.dart';
import 'package:zipcodefinder/app/core/httpclientserviceimp.dart';
import 'package:zipcodefinder/app/features/zipcode/repositories/searchaddresbyceprepository.dart';
import 'package:zipcodefinder/app/features/zipcode/repositories/searchaddressbyceprepositoryimp.dart';
import 'package:zipcodefinder/app/features/zipcode/ui/searchzipcodebloc.dart';

import 'features/zipcode/ui/seachzipcodepage.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HttpClientService>(create: (_) => HttpClientServiceImp()),
        RepositoryProvider<SearchAddressByCepRepository>(create: (ctx) => SearchAddressByCepRepositoryImp(ctx.read())),
      ],
      child: BlocProvider(
        create: (ctx) => SearchZipCodeBloc(ctx.read()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            // colorSchemeSeed: Colors.green,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            ),
            brightness: Brightness.dark,
          ),
          home: const SearchZipCodePage(),
        ),
      ),
    );
  }
}
