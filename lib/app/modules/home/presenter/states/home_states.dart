import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/domain/error/home_failure.dart';

abstract class HomeState {}

class StartHomeState implements HomeState {
  const StartHomeState();
}

class SearhcListMockSucess implements HomeState {
  final ListMockForm listMockForm;
  SearhcListMockSucess(this.listMockForm);
}

class SearchListMockFailed implements HomeState {
  final HomeFailure failure;
  SearchListMockFailed(this.failure);
}

class SearchHistoricFormSucess implements HomeState {
  final ListOfHistoricForm listOfHistoricForm;
  SearchHistoricFormSucess(this.listOfHistoricForm);
}

class SearchHistoricFormFailed implements HomeState {
  final HomeFailure failure;
  SearchHistoricFormFailed(this.failure);
}
