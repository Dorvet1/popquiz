import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:popquiz/app/app_module.dart';

import 'package:popquiz/app/modules/home/domain/usecases/search_mock_list_use_case.dart';
import 'package:popquiz/app/modules/home/home_module.dart';
import 'package:popquiz/app/modules/home/presenter/controller/home_controller.dart';
import 'package:popquiz/app/modules/home/presenter/states/home_states.dart';

class SearchMockListUseCaseMock extends Mock implements SearchMockListUseCase {}

main() {
  initModule(AppModule());
  initModule(HomeModule());
  final homeController = Modular.get<HomeController>();
  // final useCase = SearchMockListUseCaseMock();
  // final controlle = HomeController(useCase);
  // final _listMock = ListMockForm();
  test('Deve retonar true para a controladora de searchListMock', () async {
    await homeController.searchListMock();
    expect(homeController.homeState is SearhcListMockSucess, true);
  });
  test('deve retornar true para controlladora de searchHistoricForm', () async {
    await homeController.searchListHistoricForm();
    expect(homeController.homeState is SearchHistoricFormSucess, true);
  });
}
