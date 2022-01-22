import 'package:flutter_test/flutter_test.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/external/home_data_source_impl.dart';

main() {
  final homeDataSource = HomeDataSourceImpl();

  test('deve retonar uma lista de mock', () async {
    final result = await homeDataSource.fetchListMock();
    expect(result, isA<ListMockForm>());
  });
  test('deve retornar uma lista de historico mock', () async {
    final result = await homeDataSource.fetHistoricForm();
    expect(result, isA<ListOfHistoricForm>());
  });
}
