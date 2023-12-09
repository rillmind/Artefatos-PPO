Recurso: Post

	Atributos:
		_ID <gerado> <leitura>
		USUARIO <gerado> <leitura>
		ANIMAL <opções> <opcional>
		DESCRICAO <opcional>
		IMG <opcional>
		LIKE <opcional>
	
	JSON SCHEMAS (DTOs):
		Schema:
			Identificador: Get_schema_post
			Propriedades:
				{
					“_id”: {“type”: “ObjectId”},
					"usuario": {"type": "ObjectId"},
					"animal": {"type": "ObjectId"},
					"descricao": {"type": "string"},
					"img": {"type": "?"},
					"like": {"type": "boolean"},
				}
		
		Schema:
			Identificador: Post_schema_post
			Propriedades:
				{
					"descricao": {"type": "string"},
					"img": {"type": "?"},
				}

	PATHS:
		Path: /post
			GET
				Sumário: Sumário: Listar posts
				Segurança: BearerAuth: [Admin]
				Responses:
					200
						Descrição: OK
						Body: Array<Get_schema_post>
					401
						Descrição: Unauthorized
						Body:
							{
								“status”: 401,
								“mensagem”: “Usuário não logado!”
							}
					403
						Descrição: Forbidden
						Body:
							{
								“status”: 403,
								“mensagem”: “Usuário não tem permissão!”
							}

			POST
				Sumário: Criar post
				Segurança: BearerAuth: [User, Admin]
				Body: 
					Post_schema_post
				Respostas:
					201
						Descrição: Created
						Body: 
							{
								“status”: 201,
								“mensagem”: “post criado!”
							}
					401
						Descrição: Unauthorized
						Body:
							{
								“status”: 401,
								“mensagem”: “Usuário não logado!”
							}
					403
						Descrição: Forbidden
						Body:
							{
								“status”: 403,
								“mensagem”: “Usuário não tem permissão!”
							}
							
		Path: /post/:id
			GET
				Sumário: Post pelo Id
				Segurança: BearerAuth: [Owner, Admin]
				Respostas:
					200
						Descrição: OK
						Body:
							Get_schema_post
					401
						Descrição: Unauthorized
						Body:
							{
								“status”: 401,
								“mensagem”: “Usuário não logado!”
							}
					403
						Descrição: Forbbiden
						Body
							{
								“status”: 403,
								“mensagem”: “Usuário não tem permissão!”
							}

			DELETE
				Sumário: Remover usuário
				Segurança: BearerAuth: [Admin]
				Respostas:
					204
						Descrição: No Content
					401
						Descrição: Unauthorized
						Body:

							{
								“status”: 401,
								“mensagem”: “Usuário não logado!”
							}
					403
						Descrição: Forbbiden
						Body:
							{
								“status”: 403,
								“mensagem”: “Usuário não tem permissão!”
							}
