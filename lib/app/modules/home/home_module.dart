// ignore_for_file: prefer_const_constructors

import 'package:flutter_modular/flutter_modular.dart';
import 'package:popquiz/app/modules/home/domain/repositories/home_repository.dart';
import 'package:popquiz/app/modules/home/domain/usecases/search_historic_list_mock_use_case.dart';
import 'package:popquiz/app/modules/home/domain/usecases/search_mock_list_use_case.dart';
import 'package:popquiz/app/modules/home/external/home_data_source_impl.dart';
import 'package:popquiz/app/modules/home/infra/datasource/data_source.dart';
import 'package:popquiz/app/modules/home/infra/repository/home_repoository_impl.dart';
import 'package:popquiz/app/modules/home/presenter/controller/home_controller.dart';
import 'package:popquiz/app/modules/home/presenter/pages/answer_form_page.dart';
import 'package:popquiz/app/modules/home/presenter/pages/cretate_new_form.dart';
import 'package:popquiz/app/modules/home/presenter/pages/historic_form_page.dart';
import 'package:popquiz/app/modules/home/presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<SearchHistoricFormUseCase>(
        (i) => SearchHistoricFormUseCaseImpl(i())),
    Bind.lazySingleton<SearchMockListUseCase>(
        (i) => SearchMockListUseCaseImpl(i())),
    Bind.lazySingleton<HomeRepository>((i) => HomeRepositoryImpl(i())),
    Bind.lazySingleton<HomeDataSource>((i) => HomeDataSourceImpl()),
    Bind.lazySingleton<HomeController>((i) => HomeController(i(), i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/homepage/createnewform', child: (_, args) => CreateNewForm()),
    ChildRoute('/homepage/historicform',
        child: (_, args) => HistoricForm(
              receveidHistoric: args.data,
            )),
    ChildRoute('/homepage/answerform',
        child: (_, args) => AnswerForm(
              receveidAnswers: args.data,
            ))
  ];
}
