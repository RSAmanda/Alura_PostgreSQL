# Notas de Aula - PostgreSQL

# Link do Curso

[Curso Online PostgreSQL | Alura](https://cursos.alura.com.br/course/introducao-postgresql-primeiros-passos)

# Materiais de Apoio

## Site PostgreSQL - Download

[PostgreSQL](https://www.postgresql.org/)

## *Data types*

[Chapter 8. Data Types](https://www.postgresql.org/docs/12/datatype.html)

## INSERT

[INSERT](https://www.postgresql.org/docs/8.1/sql-insert.html)

## UPDATE

[UPDATE](https://www.postgresql.org/docs/12/sql-update.html)

## DELETE

[DELETE](https://www.postgresql.org/docs/current/sql-delete.html)

## Tabela Verdade

[Tabela-verdade](https://pt.wikipedia.org/wiki/Tabela-verdade)

## Chave Primária

[5.4. Constraints](https://www.postgresql.org/docs/12/ddl-constraints.html#DDL-CONSTRAINTS-PRIMARY-KEYS)

## Chave Estrangeira

[5.4. Constraints](https://www.postgresql.org/docs/12/ddl-constraints.html#DDL-CONSTRAINTS-FK)

## Funções de Agregação

[9.20. Aggregate Functions](https://www.postgresql.org/docs/12/functions-aggregate.html)

## Projetos:

- Aula 01:
    
    [1659-postgresql-primeiros-passos-aula-1.zip](Notas%20de%20Aula%20-%20PostgreSQL/1659-postgresql-primeiros-passos-aula-1.zip)
    
- Aula 02:
    
    [1659-postgresql-primeiros-passos-aula-2.zip](Notas%20de%20Aula%20-%20PostgreSQL/1659-postgresql-primeiros-passos-aula-2.zip)
    
- Aula 03:
    
    [1659-postgresql-primeiros-passos-aula-3.zip](Notas%20de%20Aula%20-%20PostgreSQL/1659-postgresql-primeiros-passos-aula-3.zip)
    
- Aula 04:
    
    [1659-postgresql-primeiros-passos-aula-4.zip](Notas%20de%20Aula%20-%20PostgreSQL/1659-postgresql-primeiros-passos-aula-4.zip)
    
- Aula 05:
    
    [1659-postgresql-primeiros-passos-aula-5.zip](Notas%20de%20Aula%20-%20PostgreSQL/1659-postgresql-primeiros-passos-aula-5.zip)
    
- Aula 06:
    
    [1659-postgresql-primeiros-passos-aula-6.zip](Notas%20de%20Aula%20-%20PostgreSQL/1659-postgresql-primeiros-passos-aula-6.zip)
    

# Aulas

## Primeiros Passos com o PostgreSQL

Instalação pelo site do postgreSQL

Verificação pelo psql:

![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled.png)

- Criando um novo servidor no pgAdmin

![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled%201.png)

- Para se conectar com o banco de dados:
    - "Servers > PostgreSQL 15 > Databases > postgres”
    
    ![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled%202.png)
    
    - Verificando a conexão:
    
    ![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled%203.png)
    
    - Podemos fazer a mesma verificação no sql shell
    
    ![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled%204.png)
    

### Criando um banco de dados:

- PGAdmin:
    
    ![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled%205.png)
    
    - Código
        
        ![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled%206.png)
        
- SQL Shell:
    
    ```sql
    CREATE DATABASE alura;
    ```
    
    - Para verificar os database criados:
        
        ```sql
        /*no SQL Shell*/
        \l
        ```
        
    - Visualização:
        
        ![Untitled](Notas%20de%20Aula%20-%20PostgreSQL/Untitled%207.png)
        
    - Deletar banco de dados
        
        ```sql
        DROP DATABASE teste
        ```
        

### Criando uma tabela

```sql
/* Exemplo */
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
```

## Executando operações CRUD

### Incluindo um registro na tabela - INSERT

```sql
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
```

### Atualização de Registro - UPDATE

```sql
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
```

Com isso, mudamos todos os campos possíveis do item id=1 da tabela ‘aluno’.

### Excluindo um registro - DELETE

É uma boa prática verificar previamente o registro a ser deletado:

```sql
SELECT *
FROM aluno
WHERE nome='Nico';
```

Em seguida, use o DELETE para excluir o registro

```sql
DELETE
FROM aluno
WHERE nome='Nico';
```

## Consultas com filtros

### Selecionando campos específicos da tabela

```sql
SELECT nome AS "nome do aluno", /*atribuindo um 'apelido' a tabela*/
	   idade,
	   matriculado_em AS quando_se_matriculou /*atribuindo um 'apelido' a tabela*/
FROM aluno;
```

> Os “apelidos” precisam estar entre aspas duplas
> 

### Pesquisas

```sql
/*Todos os registros de 'nome' que tenha apenas a palavra "Diogo" */
SELECT *
    FROM aluno
 WHERE nome = 'Diogo';

/*Todos os registros de 'nome' seja diferente de "Diogo" */
SELECT *
    FROM aluno
 WHERE nome != 'Diogo'; // ou <>
```

### Comando LIKE

Podemos utilizar dois caracteres especiais: _ e %

```sql
/* Caracter indefinido */
SELECT *
    FROM aluno
 WHERE nome LIKE 'Di_go';

/* RETORNA O OPOSTO DO LIKE */
SELECT *
    FROM aluno
 WHERE nome NOT LIKE 'Di_go';

/* Nomes que começam com D*/
SELECT *
    FROM aluno
 WHERE nome LIKE 'D%';

/* nomes que terminam com eira*/
SELECT *
    FROM aluno
 WHERE nome LIKE '%eira';

/* nomes que tenham espaço*/
SELECT *
    FROM aluno
 WHERE nome LIKE '% %';

/* nomes que tenham 'i' e 'a' (nesta ordem)*/
SELECT *
    FROM aluno
 WHERE nome LIKE '%i%a%';
```

### Comando IS

```sql
/* SELECIONANDO CPFs NULOS*/
SELECT *
    FROM aluno
 WHERE cpf IS NULL;

/* SELECIONANDO CPFs NÃO NULOS*/
SELECT *
    FROM aluno
 WHERE cpf IS NOT NULL;
```

### Comando BETWEEN … AND

```sql
/* selecionando aluno que começa com a letra D e tenha o cpf preenchido */
SELECT *
    FROM aluno
 WHERE nome LIKE 'D%' AND cpf IS NOT NULL

```

## Trabalhando com relacionamentos

### Chave Primária

> uma coluna, ou grupo de colunas, que pode ser usada para identificar uma linha da tabela
> 

```sql
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
```

### Chave Estrangeira

> uma limitação para especificar que o valor de uma coluna (ou múltiplas colunas) precisa corresponder a alguma linha de outra tabela
> 
- Criando uma tabela **aluno** para fazer uma relação com a tabela curso

```sql
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);
```

A chave estrangeira *aluno_id* referencia a coluna **id** da tabela **aluno.**

A chave estrangeira *curso_id* referencia a coluna **id** da tabela **curso.**

```sql
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
        curso_id INTEGER,
        PRIMARY KEY (aluno_id, curso_id),

        FOREIGN KEY (aluno_id)
         REFERENCES aluno (id),

        FOREIGN KEY (curso_id)
         REFERENCES curso (id)
);
```

Assim, na hora de criar uma linha na tabela *aluno_curso*, tem que respeitar a existência de alunos e cursos em suas respectivas tabelas.

Se não tiver aluno com id  = 3, não tem como criar uma relação entre qualquer curso e o aluno com id = 3.

### Consultas com relacionamento

```sql
/* Mostando o nome do curso e o nome do aluno*/
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso       ON curso.id             = aluno_curso.curso_id
```

### LEFT, RIGHT, CROSS e FULL JOINS

```sql
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
```

## Usando CASCADE

opções de restrição de chave estrangeira:

Quando criamos uma chave estrangeira, como padrão ela é ON DELETE RESTRICT, ou seja, a chave estrangeira restringe o apagamento de dados que estão em duas tabelas.

Ao trocarmos para ON DELETE CASCADE, sempre que apagarmos um dado de um banco, o restrito será apagado de todas as tabelas que o contém.

```sql
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
```

### UPDATE

Mudança de algum valor.

Configuração da tabela:

```sql
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
```

Para fazer o UPDATE:

```sql
UPDATE aluno
	SET id = 20
	WHERE id = 4;
```

## Avançando com consultas

### Ordenação Crescente

```sql
SELECT *
	FROM funcionarios
	ORDER BY nome

/*ou*/

SELECT *
	FROM funcionarios
	ORDER BY nome ASC
```

### Ordenação Decrescente

```sql
SELECT *
	FROM funcionarios
	ORDER BY nome, matricula DESC
```

### Ordenação pela posição da tabela usando mais de uma coluna (exemplo: colunas  - em ordem - 3,4,2)

```sql
SELECT *
	FROM funcionarios
	ORDER BY 3,4,2

SELECT *
	FROM funcionarios
	ORDER BY 3 DESC,4 DESC,2 ASC
```

### Limitando as consultas

```sql
SELECT *	FROM funcionarios LIMIT 5;
	
```

### Limitado e pulando os X primeiros registros (exemplo: mostrando a partir do terceiro registro)

```sql
SELECT *
	FROM funcionarios
LIMIT 5
OFFSET 2;
```

### Principais funções de agregação

```sql
SELECT COUNT(id), SUM(id), MAX(id), MIN(id), AVG(id), ROUND(AVG(id),0)
	FROM funcionarios;
```

### Agrupando consultas

```sql
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

SELECT curso.nome
        COUNT(aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1
```

### Filtros em consultas agrupadas

```sql
/*Filtrando consultas agrupadas*/
SELECT curso.nome,
	COUNT(aluno.id)
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
    --WHERE curso.nome = 'Javascritp'
GROUP BY 1
    HAVING COUNT (aluno.id) > 0
```

Conta-se quantos alunos têm por curso e filtra os cursos que tem alunos (>0 alunos).
