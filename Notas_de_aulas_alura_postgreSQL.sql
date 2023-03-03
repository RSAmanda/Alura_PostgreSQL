CREATE TABLE aluno(
    id SERIAL, /*número inteiro com incremento automático*/
        nome VARCHAR(255),
        cpf CHAR(11),
        observacao TEXT, /* texto com tamanho indefinido */
        idade INTEGER,
        dinheiro NUMERIC(10,2),
        altura REAL,
        ativo BOOLEAN,
        data_nascimento DATE,
        hora_aula TIME,
        matriculado_em TIMESTAMP
);
/*incluindo registro na tabela*/
INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

/* Atualizando registro na tabela */
UPDATE aluno
    SET nome = 'Nico',
    cpf = '10987654321',
    observacao = 'Teste',
    idade = 38,
    dinheiro = 15.23,
    altura = 1.90,
    ativo = FALSE,
    data_nascimento = '1980-01-15',
    hora_aula = '13:00:00',
    matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1;

SELECT * FROM aluno;

/* deletando um linha da tabela

é interessante verificar a existência do dado a ser excluído */

SELECT *
FROM aluno
WHERE nome='Nico';

/*DELETANDO ... */

DELETE
FROM aluno
WHERE nome='Nico';


/*Inserindo dados a tabela*/
INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

/*Inserindo novos registros, não é necessário completar todos os campos*/
INSERT INTO aluno (nome) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

/* Selecionando campos específicos */
SELECT nome,
	   idade,
	   matriculado_em AS quando_se_matriculou /*atribuindo um 'apelido' a tabela*/
FROM aluno;

/* Aula 3 */

/* Criando tabela com chave primária */

DROP TABLE curso

/*Tabela de cursos*/
CREATE TABLE curso (
    /*id INTEGER NOT NULL UNIQUE
	 Característica de uma chave primária:
	  - tem que ser única
	  - Não pode ser nula*/
	ID INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

SELECT * FROM curso;
DROP TABLE aluno;
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinícius');

/* Criando uma tabela que relaciona um curso a um aluno*/
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
        curso_id INTEGER,
        PRIMARY KEY (aluno_id, curso_id),

        FOREIGN KEY (aluno_id)
         REFERENCES aluno (id),

        FOREIGN KEY (curso_id)
         REFERENCES curso (id)

);
/* Testando... */
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);
/*Consultas com relacionamentos*/
SELECT *  FROM aluno
SELECT *  FROM curso
/* Mostando o nome do curso e o nome do aluno*/
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso       ON curso.id             = aluno_curso.curso_id

/* LEFT, RIGHT, CROSS e FULL JOINS */

/* Inserindo dados para testes */
INSERT INTO aluno (nome) VALUES ('Nico');
INSERT INTO aluno (nome) VALUES ('Diego');
INSERT INTO curso (id, nome) VALUES (3,'CSS');

/*
LEFT JOIN:
Conseguimos listar aluno que não está matriculado em nenhum curso
*/
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
     FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id

/*
RIGHT JOIN:
Conseguimos listar cursos mesmo que não tenha aluno matriculado
*/
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
     FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON curso.id = aluno_curso.curso_id

/*
FULL JOIN:
Conseguimos listar aluno que não está matriculado em nenhum curso
E
Conseguimos listar cursos mesmo que não tenha aluno matriculado
*/
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
     FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id

/*
CROSS JOIN:
Cruzar todos os dados de cada tabela com a outra
cada aluno será relacionado com todos os cursos
*/
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
CROSS JOIN curso

/*Aula 05*/

/*cascade*/
DROP TABLE aluno_curso;
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

    FOREIGN KEY (aluno_id)
     REFERENCES aluno (id)
     ON DELETE CASCADE,

    FOREIGN KEY (curso_id)
     REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

/*conferindo... */
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
	
DELETE FROM aluno WHERE id = 1 /*conseguimos deletar aluno id = 1*/

/*UPDATE CASCADE*/
DROP TABLE aluno_curso;
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
        curso_id INTEGER,
        PRIMARY KEY (aluno_id, curso_id),

        FOREIGN KEY (aluno_id)
         REFERENCES aluno (id)
         ON DELETE CASCADE
         ON  UPDATE CASCADE,

        FOREIGN KEY (curso_id)
         REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id

UPDATE aluno
SET id = 10
WHERE id =2;


/*AULA 06*/
/*Ordenando as consultas*/

/*Conjuntos de dados que serão utilizados*/
CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

SELECT *
	FROM funcionarios
	ORDER BY nome, matricula
	
/*ordenado e limitado*/
SELECT *
	FROM funcionarios
	ORDER BY nome
LIMIT 5;

/*Principais funções de agregação:
- CONTAR,
- SOMAR, 
- MÁXIMO,
- MÍNIMO,
- MÉDIA*/
SELECT COUNT(id), SUM(id), MAX(id), MIN(id), AVG(id), ROUND(AVG(id),0)
	FROM funcionarios;
	
/*Agrupando consultas*/	
SELECT DISTINCT /*sem repetição de nome*/
        nome
  FROM funcionarios
  ORDER BY nome;
  
  
SELECT
       nome,
       sobrenome,
       COUNT(*) /*contando com o agrupamento*/
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;


/*Filtrando consultas agrupadas*/
SELECT curso.nome,
	COUNT(aluno.id)
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
    --WHERE curso.nome = 'Javascritp'
GROUP BY 1
    HAVING COUNT (aluno.id) > 0






