class ListMockForm {
  List<dynamic> exemploOfListMock = [
    {
      "questionario": {
        "id": 1,
        "titulo": "Preferências pessoais",
        "questoes": [
          {
            "id": 1,
            "titulo": "Livro favorito",
            "descricao": "Qual é o livro que você mais gostou até hoje?",
            "resposta": ""
          },
          {
            "id": 2,
            "titulo": "Filme favorito",
            "descricao": "Qual é o filme que você mais gostou até hoje?",
            "resposta": ""
          }
        ]
      }
    },
    {
      "questionario": {
        "id": 2,
        "titulo": "Gostos Músicais",
        "questoes": [
          {
            "id": 1,
            "titulo": "Música Favorita",
            "descricao": "Qual estilo de Música você escuta?",
            "resposta": ""
          },
          {
            "id": 2,
            "titulo": "Música Favorita",
            "descricao": "Qual a música você mais gostou até hoje?",
            "resposta": ""
          }
        ]
      }
    },
    {
      "questionario": {
        "id": 2,
        "titulo": "Jogos",
        "questoes": [
          {
            "id": 1,
            "titulo": "Jogo favorito",
            "descricao": "Qual seu jogo favorito?",
            "resposta": ""
          },
          {
            "id": 2,
            "titulo": "Jogo favorito",
            "descricao": "Qual a jofo você mais gostou até hoje?",
            "resposta": ""
          }
        ]
      }
    },
    {
      "questionario": {
        "id": 2,
        "titulo": "Esporte",
        "questoes": [
          {
            "id": 1,
            "titulo": "Esporte",
            "descricao": "Qual esporte você pratica?",
            "resposta": ""
          },
          {
            "id": 2,
            "titulo": "Esporte",
            "descricao": "Qual esporte você mais gosta?",
            "resposta": ""
          }
        ]
      }
    },
    {
      "questionario": {
        "id": 2,
        "titulo": "Series",
        "questoes": [
          {
            "id": 1,
            "titulo": "Series",
            "descricao": "Você assiste alguma serie?",
            "resposta": ""
          },
          {
            "id": 2,
            "titulo": "Serie",
            "descricao": "Qual a sua serie preferida?",
            "resposta": ""
          }
        ]
      }
    }
  ];
  void addNewForm(var list) {
    exemploOfListMock.add(list);
  }
}
