import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/domain/error/home_failure.dart';
import 'package:popquiz/app/modules/home/infra/datasource/data_source.dart';
import 'package:popquiz/app/modules/home/infra/repository/home_repoository_impl.dart';

class HomeDataSourceMock extends Mock implements HomeDataSource {}

main() {
  final dataSource = HomeDataSourceMock();
  final repository = HomeRepositoryImpl(dataSource);
  final _listMockForm = ListMockForm();
  final _listHistoricForm = ListOfHistoricForm();

  test('deve retornar uma lista de questionario', () async {
    when(dataSource.fetchListMock()).thenAnswer((_) async => _listMockForm);
    final result = await repository.searchList();
    expect(result.fold(id, id), isA<ListMockForm>());
  });
  test('deve retornar um HomeDatSourceErro para lista de questionario',
      () async {
    when(dataSource.fetchListMock()).thenThrow(Exception());
    final result = await repository.searchList();
    expect(result.fold(id, id), isA<HomeDataSourceErro>());
  });
  test('deve retornar uma lista de historico do questionario respondido',
      () async {
    when(dataSource.fetHistoricForm())
        .thenAnswer((_) async => _listHistoricForm);
    final result = await repository.searchHistoric();
    expect(result.fold(id, id), isA<ListOfHistoricForm>());
  });
  test('deve retonar um caso de HomeDataSourceError para lista de historico',
      () async {
    when(dataSource.fetHistoricForm()).thenThrow(Exception());
    final result = await repository.searchHistoric();

    expect(result.fold(id, id), isA<HomeDataSourceErro>());
  });
}
