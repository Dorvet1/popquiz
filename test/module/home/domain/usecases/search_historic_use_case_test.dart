import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/domain/usecases/search_historic_list_mock_use_case.dart';

import 'search_list_mock_use_case_test.dart';

main() {
  final repository = HomeRepositoryMock();
  final useCase = SearchHistoricFormUseCaseImpl(repository);
  final _historicForm = ListOfHistoricForm();

  test('Deve retornar um use case de historicform', () async {
    when(useCase.call()).thenAnswer((_) async => Right(_historicForm));
    final result = await repository.searchHistoric();
    expect(result | null, isA<ListOfHistoricForm>());
  });
}
