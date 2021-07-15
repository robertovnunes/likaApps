
	/*Casos Clínicos*/
/*	INSERT INTO caso_clinico (id_caso_clinico, descricao) VALUES (1, 'Estudo de caso: paciente com diagnostico médico de arritmia cardíaca' ) ;*/

	/* Seções */
	INSERT INTO secao (id_secao, descricao) VALUES ( 1, 'Identificação' ) ;
	INSERT INTO secao (id_secao, descricao) VALUES ( 2, 'HDA' ) ;
	INSERT INTO secao (id_secao, descricao) VALUES ( 3, 'Histórico Familiar' ) ;
	INSERT INTO secao (id_secao, descricao) VALUES ( 4, 'Hábitos' ) ;
	INSERT INTO secao (id_secao, descricao) VALUES ( 5, 'Habitação' ) ;

	/* Tópicos */
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 1, 'nome', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 2, 'idade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 3, 'data nascimento', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 4, 'raça', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 5, 'sexo', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 6, 'procedência', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 7, 'nacionalidade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 8, 'naturalidade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 9, 'cidade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 10, 'bairro', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 11, 'estado civil', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 12, 'filhos quantidade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 13, 'filhos idade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 14, 'escolaridade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 15, 'profissão', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (1, 16, 'queixa do paciente', FALSE ) ;

	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (2, 1, 'doenças', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (2, 2, 'hospitalizações', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (2, 3, 'cirurgias', FALSE ) ;

	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (3, 1, 'histórico familiar', FALSE ) ;

	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (4, 1, 'moradores', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (4, 2, 'residência', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (4, 3, 'saneamento básico', FALSE ) ;

	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 1, 'família', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 2, 'religião', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 3, 'lazer', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 4, 'sexualidade', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 5, 'IST`s', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 6, 'tabagismo/alcoolismo', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 7, 'drogas', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 8, 'medicações', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 9, 'repouso', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 10, 'sono', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 11, 'sono/medicações', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 12, 'exercícios', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 13, 'estresse', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 14, 'alimentação', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 15, 'eliminações intestinais', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 16, 'eliminações urinárias', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 17, 'banho', FALSE ) ;
	INSERT INTO topico (id_secao, id_topico, descricao, ordenado) VALUES (5, 18, 'higiene oral', FALSE ) ;

	/* Questão */
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 1, 1, 'Como você se chama?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 1, 2, 'Como é seu nome?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 1, 3, 'Qual o seu nome?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 1, 4, 'Me diga seu nome completo.' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 1, 5, 'Me diga seu nome.' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 2, 1, 'Qual a sua idade?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 2, 2, 'Quantos anos você tem?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 2, 3, 'Me diga qual a sua idade?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 3, 1, 'Qual a data do seu nascimento?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 3, 2, 'Me diga a data do seu nascimento' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 3, 3, 'Quando você nasceu?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 4, 1, 'Você se considera de que raça?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 4, 2, 'Você se considera de que cor?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 4, 3, 'Você se considera negro, pardo, branco, índio ou asiático?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 5, 1, 'Sexo masculino ou feminino?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 5, 2, 'Sexo?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 6, 1, 'Você veio de sua residência?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 6, 2, 'Você veio de outro hospital?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 6, 3, 'O senhor foi referenciado de outro hospital?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 6, 4, 'O senhor veio de sua residencia?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 6, 5, 'De onde o senhor foi referenciado?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 6, 6, 'Você veio da sua casa?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 7, 1, 'Você nasceu aqui no Brasil?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 7, 2, 'Você é brasileiro?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 7, 3, 'Você é natuaral do Brasil?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 8, 1, 'Você nasceu em que cidade?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 8, 2, 'Em que cidade você nasceu?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 9, 1, 'Você vive em recife?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 10, 1, 'Qual o bairro?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 10, 2, 'Qual o seu bairro?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 10, 3, 'Em que bairro você reside?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 11, 1, 'Qual seu estado civil?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 11, 2, 'Diga-me seu estado civil.' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 11, 3, 'Você é casado, solteiro ou viúvo.' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 12, 1, 'Quantos filhos você tem?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 12, 2, 'Você tem quantos filhos?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 13, 1, 'Quantos anos seus filhos tem?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 13, 2, 'Qual é a idade dos seus filhos?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 14, 1, 'Você estudou até que serie?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 14, 2, 'O senhor estudou até que turma?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 15, 1, 'Qual o seu trabalho?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 15, 2, 'Qual sua profissão?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 15, 3, 'Qual o seu emprego?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 15, 4, 'Em que o senhor trabalha?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 15, 5, 'Qual a sua ocupação?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 16, 1, 'O que você esta sentindo?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 16, 2, 'O que você sente?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 16, 3, 'Como você está?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 16, 4, 'Como você está agora?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 16, 5, 'Diga-me o que você está sentindo?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 16, 6, 'O senhor tem alguma queixa?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (1, 16, 7, 'Qual sua queixa principal?' ) ;
	-- FIM - Identificação 

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 1, 1, 'O senhor já teve outras doenças?') ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 1, 2, 'O senhor já ficou doente antes?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 2, 1, 'O senhor já foi hospitalizado antes?') ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 2, 2, 'O senhor já foi internado?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 2, 3, 'Já foi internado?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 2, 4, 'Já teve alguma internação?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 3, 1, 'O senhor já fez alguma cirurgia?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 3, 2, 'O senhor já passou por alguma cirurgia?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (2, 3, 3, 'O senhor já passou por algum procedimento cirúrgico?' ) ;
	-- FIM - HDA 

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (3, 1, 1, 'Alguém da sua família tem diabetes, tuberculose, problemas no coração, hipertensão, AVC,Epilepsia, doença renal, câncer ou outras?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (3, 1, 2, 'Alguém da sua família tem diabetes, tuberculose, Cardiopatia, hipertensão arterial, Acidente Vascular Cerebral, Epilepsia, doença renal, câncer ou outras?' ) ;
	-- FIM - Histórico familiar

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 1, 1, 'Quantas pessoas moram com você?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 1, 2, 'Na sua casa moram quantas pessoas?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 1, 3, 'Moram quantas pessoas com você?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 2, 1, 'Qual o tipo da sua residencia?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 2, 2, 'Sua casa é de alvenaria?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 2, 3, 'Sua casa é de taipa?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 2, 4, 'Que tipo de casa é a sua?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 3, 1, 'Na sua casa tem água e esgoto?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 3, 2, 'Na sua casa tem saneamento básico?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (4, 3, 3, 'Recolhem o lixo na sua residencia?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 1, 1, 'Como você vê seu relacionamento com sua família?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 1, 2, 'Como é seu relacionamento com sua família?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 2, 1, 'Qual a sua religião?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 2, 2, 'Que religião você segue?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 2, 3, 'Que religião você acredita?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 2, 4, 'Que religião você pratica?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 2, 5, 'Você tem alguma religião?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 3, 1, 'O que você faz para se distrair?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 3, 2, 'Quais seus hábitos de lazer?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 3, 3, 'O que o senhor faz nas horas de lazer?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 4, 1, 'O senhor tem vida sexual ativa?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 4, 2, 'O senhor pratica sexo?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 4, 3, 'Você tem relações sexuais?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 5, 1, 'O senhor tem alguma doença sexualmente transmissível?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 5, 2, 'O senhor tem alguma DST?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 5, 3, 'O senhor tem alguma IST?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 5, 4, 'O senhor tem alguma infecção sexualmente transmissível?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 6, 1, 'O senhor bebe e fuma?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 6, 2, 'O senhor fuma?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 6, 3, 'O senhor bebe?' ) ;
																														
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 7, 1, 'O senhor já usou outro tipo de droga?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 7, 2, 'O senhor já usou droga?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 7, 3, 'Você já usou drogas ilícitas?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 8, 1, 'O senhor já fez uso de alguma medicação controlada?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 8, 2, 'O senhor faz uso de alguma medicação atualmente?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 8, 3, 'O senhor já fez uso de algum medicamento?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 8, 4, 'O senhor já fez uso de algum remédio?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 8, 5, 'O senhor faz uso de algum remédio atualmente?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 9, 1, 'Você acorda bem de manhã?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 9, 2, 'O senhor acorda repousado?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 9, 3, 'Você acorda descansado de manhã?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 10, 1, 'Você tem dificuldades para dormir?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 10, 2, 'Você dorme bem à noite?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 11, 1, 'O senhor usa medicamentos para dormir?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 11, 2, 'O senhor toma remédios para dormir?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 11, 3, 'O senhor toma medicações para dormir?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 12, 1, 'O senhor pratica atividades físicas?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 12, 2, 'O senhor pratica alguma física?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 12, 3, 'O senhor pratica quais atividades físicas?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 12, 4, 'Você pratica alguma atividade física?' ) ;
																														  
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 13, 1, 'O senhor se sente estressado?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 13, 2, 'O senhor se considera estressado?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 13, 3, 'Você se acha estressado?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 14, 1, 'Como o senhor se alimentava antes de ser internado?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 14, 2, 'Como o senhor comia antes de ser internado?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 15, 1, 'Com que freqüência você ia ao banheiro antes do seu internamento para fazer coco?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 15, 2, 'Quantas vezes o senhor ia ao banheiro antes do seu internamento para defecar?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 15, 3, 'Quantas vezes o senhor ia ao banheiro fazer coco antes da sua internação?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 16, 1, 'Quantas vezes o senhor ia ao banheiro fazer xixi antes da sua internação?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 16, 2, 'Quantas vezes o senhor ia ao banheiro antes do seu internamento para urinar?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 16, 3, 'Com que freqüência você ia ao banheiro antes do seu internamento para fazer xixi?' ) ;

	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 17, 1, 'O senhor toma banho sozinho?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 17, 2, 'O senhor precisa de ajuda para tomar banho?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 17, 3, 'O senhor toma quantos banhos por dia?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 17, 4, 'Quantos banhos o senhor toma?' ) ;
																														  
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 18, 1, 'O senhor escova os dentes todos os dias?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 18, 2, 'O senhor escova os dentes?' ) ;
	INSERT INTO questao (id_secao, id_topico, id_questao, texto) VALUES (5, 18, 3, 'Como esta sua higiene oral?' ) ;
	-- FIM Habitos