# Alura_PostgreSQL
Repositório dedicado as notas de aulas do curso da alura: PostgreSQL. O curso faz parte da trilha de dados do programa Desenvolve 2023 do Grupo Boticário.

# PostgreSQL

# Link do Curso

[Curso Online PostgreSQL | Alura](https://cursos.alura.com.br/course/introducao-postgresql-primeiros-passos)

# Notas de Aula
[Códigos SQL](https://github.com/RSAmanda/Alura_PostgreSQL/blob/819fa8a04aa62c097df884369363716f7694af85/Notas_de_aulas_alura_postgreSQL.sql)

[Notas de Aula - PostgreSQL](https://github.com/RSAmanda/Alura_PostgreSQL/blob/819fa8a04aa62c097df884369363716f7694af85/Notas_de_Aula.md)

# Conteúdo por Aula

## Primeiros Passos com o PostgreSQL

- Como instalar o **PostgreSQL** e o **pgAdmin**
- Como conectar ao PostgreSQL, utilizando o **terminal** e o **pgAdmin**
- A criar o banco de dados pelo **terminal** e pelo **pgAdmin**
- Como apagar o banco de dados pelo **terminal** e pelo **pgAdmin**
- A criar tabela com os tipos de dados mais comuns:
    - `SERIAL`
    - `VARCHAR`
    - `CHAR`
    - `TEXT`
    - `INTEGER`
    - `NUMERIC`
    - `BOOLEAN`
    - `DATE`
    - `TIME`
    - `TIMESTAMP`

## Executando operações CRUD

- Como incluir um registro na tabela, entendendo a sintaxe de inclusão de cada tipo de campo
- A efetuar uma consulta simples, para listar os dados da tabela
- Como alterar um registro na tabela
- Como excluir um registro na tabela

## Consultas com filtros

- A selecionar campos específicos da tabela
- Como definir um *alias* para os nomes dos campos
- A filtrar registros, utilizando o `WHERE` para campos do tipo de texto
    - Operadores `=`, `!=`,`<>`, `LIKE` e `NOT LIKE`
    - A diferença entre `=` e `LIKE`
    - O funcionamento do caractere `%` no filtro com `LIKE` e `NOT LIKE`
    - O funcionamento do caractere `_` no filtro com `LIKE` e `NOT LIKE`
- Como filtrar utilizando `IS NULL` e `IS NOT NULL`
- Como filtrar registros para campos do tipos relacionados a números, datas e horas
    - `=`, `!=`, `<>`, `<`, `<=`, `>`, `>=`
    - `BETWEEN`
- Como filtrar registros para campos do tipo *booleano*
    - `=`, `!=`, `<>`
- Como funciona os operadores lógicos `AND` e `OR`

## Trabalhando com relacionamentos

- Como funciona a chave primária
- Como funciona os campos que aceitam `NULL` e que não aceitam `NULL` (`NOT NULL`)
- Como funciona um campo `UNIQUE`
- Como criar uma chave primária
- Como funciona a chave estrangeira
- Como criar uma chave estrangeira
- Como criar consultas com relacionamentos
    - `INNER JOIN`
    - `LEFT JOIN`
    - `RIGHT JOIN`
    - `FULL JOIN`
    - `CROSS JOIN`

## Usando CASCADE

- Como funciona as restrições de chave estrangeira
- A diferença entre `RESTRICT` e `CASCADE`
- Como aplicar tipos diferentes de restrições de chave estrangeira no `DELETE`
    - `RESTRICT`
    - `CASCADE`
- A aplicar tipos diferentes de restrições de chave estrangeira no `UPDATE`
    - `RESTRICT`
    - `CASCADE`

## Avançando com consultas

- Como ordenar uma consulta
    - Ordenar utilizando os nomes de campo
    - Ordenar com mais de um campo
    - Ordenar por posição do campo
    - Ordenar por ordem Crescente e Decrescente
    - Ordenar com campos de tabelas diferentes
- Como limitar quantidade e paginar registros de consulta
    - `LIMIT`
    - `OFFSET`
- Como funcionam as funções de agregação
    - `COUNT`
    - `SUM`
    - `MAX`
    - `MIN`
    - `AVG`
- Como funciona a função de arredondamento `ROUND`
- Como funciona o agrupamento de dados
    - A diferença entre `DISTINCT` e `GROUP BY`
    - Onde utilizar o `DISTINCT`
    - Onde utilizar o `GROUP BY`
    - Como utilizar o `GROUP BY` com os nomes de campo
    - Como utilizar o `GROUP BY` por posição
- Como funcionam os filtros por funções de agrupamento, utilizando `HAVING`
    - A diferença entre `WHERE` e `HAVING`
    - Como utilizar o `HAVING`
