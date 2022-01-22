class ListOfHistoricForm {
  List<Map> historicListForm = [
    {
      "questionario": {
        "id": 1,
        "titulo": "Preferências pessoais",
        "questoes": [
          {
            "id": 1,
            "titulo": "Livro favorito",
            "descricao": "Qual é o livro que você mais gostou até hoje?",
            "resposta": "Drácula"
          },
          {
            "id": 2,
            "titulo": "Filme favorito",
            "descricao": "Qual é o filme que você mais gostou até hoje?",
            "resposta": "Homem Aranha"
          }
        ]
      },
    },
    {
      "questionario": {
        "id": 2,
        "titulo": "Gostos Músicais",
        "questoes": [
          {
            "id": 1,
            "titulo": "Estilo de Musica",
            "descricao": "Qual estilo de Música você escuta?",
            "resposta": "Pop"
          },
          {
            "id": 2,
            "titulo": "Música Favorita",
            "descricao": "Qual a música você mais gostou até hoje?",
            "resposta": "Numb"
          }
        ]
      }
    }
  ];

  void saveListOfHistoricForm(var list) {
    historicListForm.add(list);
  }
}
