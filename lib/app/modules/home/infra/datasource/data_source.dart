import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';

abstract class HomeDataSource {
  Future<ListMockForm> fetchListMock();
  Future<ListOfHistoricForm> fetHistoricForm();
}
