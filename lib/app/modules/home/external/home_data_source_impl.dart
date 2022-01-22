import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/infra/datasource/data_source.dart';
import 'package:popquiz/app/modules/home/presenter/pages/answer_form_page.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final _listMockForm = ListMockForm();
  final _listHistoricForm = ListOfHistoricForm();
  @override
  Future<ListMockForm> fetchListMock() async {
    final result = await _listMockForm;
    return result;
  }

  @override
  Future<ListOfHistoricForm> fetHistoricForm() async {
    final result = await _listHistoricForm;
    return result;
  }
}
