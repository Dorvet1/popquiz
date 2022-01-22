// ignore_for_file: prefer_const_constructors

import 'package:mobx/mobx.dart';
import 'package:popquiz/app/modules/home/domain/usecases/search_historic_list_mock_use_case.dart';
import 'package:popquiz/app/modules/home/domain/usecases/search_mock_list_use_case.dart';
import 'package:popquiz/app/modules/home/presenter/states/home_states.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final SearchHistoricFormUseCase searchHistoricFormUseCase;
  final SearchMockListUseCase searchMockListUseCase;
  HomeControllerBase(
      this.searchMockListUseCase, this.searchHistoricFormUseCase);
  @observable
  HomeState homeState = StartHomeState();

  @action
  _changeState(HomeState state) => homeState = state;

  searchListMock() async {
    final result = await searchMockListUseCase.call();
    result.fold((l) => (_changeState(SearchListMockFailed(l))),
        (r) => _changeState(SearhcListMockSucess(r)));
  }

  searchListHistoricForm() async {
    final result = await searchHistoricFormUseCase.call();
    result.fold((l) => (_changeState(SearchHistoricFormFailed(l))),
        (r) => (_changeState(SearchHistoricFormSucess(r))));
  }
}
