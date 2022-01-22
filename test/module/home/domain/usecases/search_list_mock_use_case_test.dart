import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/repositories/home_repository.dart';
import 'package:popquiz/app/modules/home/domain/usecases/search_mock_list_use_case.dart';
import 'package:popquiz/app/modules/home/presenter/pages/home_page.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

main() {
  final repository = HomeRepositoryMock();
  final useCase = SearchMockListUseCaseImpl(repository);
  final listMockForms = ListMockForm();
  test('Deve retornar um caso de uso mock', () async {
    when(useCase.call()).thenAnswer((_) async => Right(listMockForms));

    final result = await repository.searchList();
    expect(result | null, isA<ListMockForm>());
  });
}
