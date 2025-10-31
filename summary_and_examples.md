# Pontos Importantes das Aulas e Exercícios de SQL

- **O que é um banco de dados?** É um repositório organizado que armazena e gerencia conjuntos de informações estruturadas em tabelas, representando elementos do mundo real. Uma coleção de entidades;

- **Entidade:** Representa um objeto ou conceito real que possui dados relevantes a serem armazenados, como um cliente ou produto (corresponde a uma tabela, no caso);

- **Atributos:** São as colunas da tabela, responsáveis por descrever as características de uma entidade;

- **Registros:** São as linhas da tabela, cada uma representando uma instância específica da entidade (ex.: um cliente ou produto).

---

## Comandos e Funções

- **`SELECT`:** É o comando que irá resgatar/selecionar as colunas de uma tabela

---

- **`FROM`:** É o comando que irá indicar a tabela que os dados estão sendo resgatados

---

- **`WHERE`:** É a cláusula que irá filtrar os dados com base em uma condição. Ex: deseja-se selecionar apenas a categoria RPG, portanto, aplica-se: 

    ```sql

    SELECT *
    FROM produtos
    WHERE DescCategoriaProduto = 'rpg';

---

- **`ORDER BY`:** É um comando usado para ordenar os dados de acordo com a ordenação especificada, podendo ser ASC (forma crescente) ou DESC (forma decrescente)

    ```sql

    SELECT *
    FROM clientes
    WHERE flTwitch = 1
    ORDER BY DtCriacao ASC, qtdePontos DESC;

---

-  **`GROUP BY`:** É um comando usado para "espremer"/agrupar os resultados de uma consulta de acordo com uma ou mais colunas. Assim, você pode aplicar funções de agregação (como COUNT, SUM, AVG, MAX, MIN) a cada grupo de registros. Em outras palavras, ele **agrupa os dados a partir de uma categoria ou campo em comum**

    ```sql

    SELECT IdCliente, sum(QtdePontos)
    FROM transacoes
    WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
    GROUP BY IdCliente
    ORDER BY sum(QtdePontos) DESC;

- No caso acima, foram selecionadas as colunas `IdCliente` e `QtdePontos` (esta última somada por meio da função SUM);

- O filtro no `WHERE` limita os registros às transações realizadas no mês de julho de 2025;

- O comando `GROUP BY IdCliente` foi aplicado para agrupar as transações de cada cliente, permitindo calcular o total de pontos acumulados por cliente;

    - **Mas qual a razão de ter aplicado esse comando?** A tabela transações provavelmente tem várias linhas por cliente, se você quiser saber quantos pontos cada cliente acumulou no mês, precisa somar os pontos de cada cliente. Mas se você fizer só a aplicação do SUM, o SQL não saberá como agrupar essas somas. Então, você usa o GROUP BY para que o banco entenda da seguinte forma: “Agrupe todas as transações do mesmo cliente (mesmo IdCliente) e, dentro de cada grupo, some os pontos.”;

    - Resumindo, o `GROUP BY` foi aplicado porque há várias transações por cliente, e queremos consolidar (somar) os pontos de cada um, em vez de ver linha por linha.

- Por fim, `ORDER BY SUM(QtdePontos) DESC` ordena os resultados em ordem decrescente, exibindo primeiro os clientes com maior quantidade total de pontos.

- **Entendendo o `GROUP BY` na Prática:**

    - O comando `GROUP BY` é utilizado para **espremer/agrupar registros** que possuem os mesmos valores em uma ou mais colunas. Contudo, **ele não faz cálculos automaticamente**, apenas separa os dados em grupos. Ex: deseja-se agrupar por IdProduto (como foi feito no arquivo `11_group_bt.sql`), ele separa por ID, gerando, assim, uma categorização. Porém, para obter informações resumidas sobre cada grupo, como a quantidade de registros, a média, o maior valor... Faz-se necessário o uso de **funções de agregação**, como `SUM()`, `COUNT()` e por aí vai.

- **Exemplo Prático:**

    Suponha que a tabela `transacao_produto` tenha os seguintes dados:

    | IdProduto | IdTransacao |
    |------------|--------------|
    | 11 | 1 |
    | 11 | 2 |
    | 12 | 3 |
    | 11 | 4 |
    | 12 | 5 |

---

- **Exemplo 1 — Apenas Agrupando:**

    ```sql

    SELECT IdProduto
    FROM transacao_produto
    GROUP BY IdProduto;

- **Resultado:**

    | IdProduto | 
    |------------|
    | 11 |
    | 12 |

    Aqui o SQL apenas mostra os grupos, ele “espreme” a tabela, mas não conta nem calcula nada.

---

- **Exemplo 2 — Agrupando e Contando:**

    ```sql

    SELECT IdProduto, COUNT(*)
    FROM transacao_produto
    GROUP BY IdProduto;

- **Resultado:**

    | IdProduto | count(*) |
    |------------|-----------|
    | 11 | 3 |
    | 12 | 2 |

    Aqui, o `COUNT(*)` conta quantos registros existem em cada grupo criado pelo `GROUP BY`.

---

-  **`HAVING`:** É um comando conhecido como WHERE do GROUP BY. Ele filtra os grupos criados, ou seja, não aplica um filtro sobre as linhas individuais, como o WHERE, mas sim nos grupos que foram formados na agregação

    ```sql

    SELECT IdCliente, sum(QtdePontos)
    FROM transacoes
    WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
    GROUP BY IdCliente
    HAVING sum(QtdePontos) >= 4000
    ORDER BY sum(QtdePontos) DESC;

- No exemplo acima, depois de agrupar as transações por cliente, o `HAVING` exibe somente os clientes que acumularam 4000 pontos ou mais no período de julho.

---

- **`LEFT JOIN`:** Digamos que você tem 2 tabelas: VENDAS (esquerda) e CLIENTES (direita), ao aplicar:

    ```sql

    SELECT * 
    FROM VENDAS 
    LEFT JOIN CLIENTES 
        ON VENDAS.IdCliente = CLIENTES.IdCliente;

- Nesse exemplo, `IdCliente` é a chave primária da tabela CLIENTES, e `VENDAS.IdCliente` é a chave estrangeira que referencia essa chave primária. Ao usar o LEFT JOIN, **a tabela da esquerda é aquela que aparece no FROM**, neste caso, VENDAS;

- O SQL vai manter todos os registros da tabela da esquerda (VENDAS) e tentar combinar com os registros da tabela da direita (CLIENTES) com base na condição `ON VENDAS.IdCliente = CLIENTES.IdCliente`;

- Se existir um correspondente na tabela da direita, os dados serão incluídos. Caso contrário, os campos da tabela da direita aparecerão como `NULL`;

- Assim, o LEFT JOIN garante que todos os registros da tabela da esquerda sejam mantidos, e só “traz” os dados da tabela da direita quando houver correspondência.

---

- **`INNER JOIN`:** Digamos que você tem as mesmas 2 tabelas: VENDAS (esquerda) e CLIENTES (direita), ao aplicar:

    ```sql

    SELECT *
    FROM VENDAS 
    INNER JOIN CLIENTES 
        ON VENDAS.IdCliente = CLIENTES.IdCliente;

- O INNER JOIN retorna apenas os registros que possuem correspondência em ambas as tabelas;

- A tabela da esquerda (VENDAS) e a tabela da direita (CLIENTES) são comparadas com base na condição `ON VENDAS.IdCliente = CLIENTES.IdCliente`;

- Se não houver correspondência (por exemplo, se um `IdCliente` existir em VENDAS, mas não em CLIENTES), esse registro não aparecerá no resultado;

- Em outras palavras, o INNER JOIN só mantém os registros onde o "*match*" é perfeito entre as duas tabelas. Ele retorna apenas os dados que existem em ambas as tabelas, descartando qualquer registro sem correspondência.

---

- **`RIGHT JOIN`:** Digamos que você tem as mesmas 2 tabelas: VENDAS (esquerda) e CLIENTES (direita), ao aplicar:

    ```sql

    SELECT *
    FROM VENDAS 
    RIGHT JOIN CLIENTES 
        ON VENDAS.IdCliente = CLIENTES.IdCliente;

- O RIGHT JOIN funciona de forma semelhante ao LEFT JOIN, mas a referência passa a ser a tabela da direita (CLIENTES);

- Isso significa que todos os registros da tabela da direita serão mantidos no resultado, mesmo que não exista correspondência na tabela da esquerda (VENDAS);

- Se não houver correspondência para um `IdCliente` da tabela da direita, os campos da tabela da esquerda (VENDAS) aparecerão como `NULL`;

- Logo, o RIGHT JOIN garante que todos os registros da tabela da direita sejam preservados, e só "traz" dados da tabela da esquerda quando houver correspondência.

---

- **`FULL JOIN`:** Suponha que você tenha as mesmas duas tabelas: **VENDAS** (esquerda) e **CLIENTES** (direita), ao aplicar:

    ```sql

    SELECT * 
    FROM VENDAS
    FULL JOIN CLIENTES 
        ON VENDAS.IdCliente = CLIENTES.IdCliente;

- O FULL JOIN combina o comportamento do LEFT JOIN e do RIGHT JOIN;

- Ele mantém todos os registros de ambas as tabelas, independentemente de haver correspondência;

- Quando não houver correspondência em uma tabela, os campos da outra tabela aparecerão como `NULL`.

---

- **Função `COUNT()`:** Serve para **contar registros** em uma tabela ou em um grupo

    - `COUNT(*)` → conta **todas as linhas**, inclusive com valores nulos;

    - `COUNT(1)` → também conta todas as linhas; é uma variação equivalente.  

- **`COUNT(DISTINCT coluna)`:** Conta **apenas os valores distintos** de uma coluna, ignorando duplicatas

    - Exemplo: se a coluna `IdCliente` tiver valores repetidos, `COUNT(DISTINCT IdCliente)` contará **cada cliente uma única vez**, independentemente de quantas transações ele tenha.

---

- **Função `SUM()`:** Soma os valores de uma coluna numérica

    ```sql
    
    SELECT SUM(QtdePontos) 
    FROM transacoes;

---

- **Função `AVG()`:** Calcula a média dos valores de uma coluna numérica

    ```sql
    
    SELECT AVG(idade) 
    FROM clientes;

---

- **Função `MAX()`:** Retorna o maior valor de uma coluna

    ```sql
    
    SELECT MAX(salario) 
    FROM funcionarios;

---

- **Função `MIN():`** Retorna o menor valor de uma coluna

    ```sql
    
    SELECT MIN(salario) 
    FROM funcionarios;

---

- **Função `substr():`** Serve para recortar uma parte de um texto (string)  

    Sintaxe: `substr(campo, posição_inicial, quantidade_de_caracteres)`

    **Exemplo:**

    ```sql
    SELECT *, 
            DtCriacao,
            substr(DtCriacao, 1, 19) AS dtSubString,
            datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova,
            strftime('%W', datetime(substr(DtCriacao, 1, 19))) AS diaSemana 
    FROM clientes;

    ```

- Neste caso, ele pega os 19 primeiros caracteres da coluna `DtCriacao`, provavelmente porque `DtCriacao` está armazenada como uma string longa (por exemplo: `"2024-10-29 08:25:36.123Z"`) e o código quer remover milissegundos ou fuso horário, deixando só: `2024-10-29 08:25:36`.

---

- **Função `datetime():`** Converte uma *string* formatada como data e hora em um tipo de dado **datetime** (data/hora reconhecida pelo banco)

    - **Uso:** ao usar `datetime(substr(...))`, o objetivo é converter a *string* limpa em um valor de **data/hora real**.

---

## Diferença entre JOIN e UNION

- Embora `JOIN` e `UNION` possam parecer semelhantes, já que ambos combinam dados de mais de uma tabela, eles **funcionam de formas bem diferentes**:

- **`JOIN` (INNER, LEFT, RIGHT, FULL):**  

  - É usado para **combinar colunas** de duas (ou mais) tabelas **relacionadas entre si** por uma chave comum;

  - As tabelas são unidas **lado a lado**, ou seja, o resultado mostra **mais colunas** (junção horizontal);

  - Exemplo:

    ```sql

        SELECT *
        FROM VENDAS
        INNER JOIN CLIENTES 
            ON VENDAS.IdCliente = CLIENTES.IdCliente;

    ```

    - Combina informações de clientes e vendas que possuem o mesmo `IdCliente`.

- **`UNION` (ou `UNION ALL`):**  

  - É usado para **combinar resultados de duas consultas** que possuem **a mesma estrutura de colunas** (mesmo número e tipo de dados);

  - As consultas são unidas **uma embaixo da outra**, ou seja, o resultado mostra **mais linhas** (junção vertical);
    
  - Exemplo:

    ```sql

    SELECT nome, cidade FROM CLIENTES
    UNION
    SELECT nome, cidade FROM FORNECEDORES;

    ```
    - Junta os nomes e cidades de clientes e fornecedores em uma única lista.  

**Resumindo:**  
| Operação | Combina | Resultado | Exemplo prático |
|-----------|----------|------------|----------------|
| **JOIN** | Tabelas relacionadas (pelas colunas) | Mais **colunas** | Combinar informações de clientes e suas vendas |
| **UNION** | Consultas com estrutura idêntica | Mais **linhas** | Juntar clientes e fornecedores em uma lista única |

---

## Comandos de Filtragem (complementares ao WHERE)

- **`BETWEEN`:** Filtra valores dentro de um intervalo

    ```sql

    SELECT * 
    FROM PRODUTOS 
    WHERE preco BETWEEN 10 AND 50;

---

- **`IN/NOT IN`:** Compara com uma lista de valores

    ```sql

    SELECT * 
    FROM CLIENTES 
    WHERE cidade IN ('Natal', 'Currais Novos');

---

- **`LIKE`:** Busca por padrões (com % e _)

    ```sql

    SELECT * 
    FROM FUNCIONARIOS 
    WHERE nome LIKE 'M%';

### Caracteres Curingas

| Símbolo | Significado | Exemplo |
|----------|--------------|----------|
| `%` | Representa **qualquer sequência de caracteres** (inclusive nenhuma) | `'M%'` → começa com "M" |
| `_` | Representa **apenas um caractere** | `'M__'` → começa com "M" e tem 3 letras no total |

### Exemplos Práticos

| Padrão | Significado | Exemplos de resultados |
|---------|--------------|------------------------|
| `'M%'` | Começa com "M" | Manuelly, Mariana, Matheus |
| `'%a'` | Termina com "a" | Mariana, Rafaela |
| `'%an%'` | Contém "an" em qualquer posição | Mariana, Manuelly |
| `'_a%'` | Segunda letra é “a” | Maria, Carlos |
| `'M____'` | Nome com 5 letras começando com M | Maria |

---

- **`DISTINCT`:** Remove duplicatas

    ```sql

    SELECT DISTINCT cidade 
    FROM CLIENTES;

---

## Comandos de Modificações de Dados

- **`INSERT INTO`:** Insere registros

    ```sql

    INSERT INTO CLIENTES (nome, cidade, idade)
    VALUES ('Ana Souza', 'Natal', 25);

- No exemplo acima está sendo adicionado um novo cliente chamado Ana Souza, da cidade Natal, com 25 anos.

---

- **`UPDATE`:** Atualiza valores

    ```sql

    UPDATE CLIENTES
    SET cidade = 'Mossoró'
    WHERE nome = 'Ana Souza';

- No exemplo acima está atualizando o campo cidade para Mossoró apenas no registro onde o nome é Ana Souza. 

---

- **`DELETE`:** Apaga registros

    ```sql

    DELETE FROM CLIENTES
    WHERE nome = 'Ana Souza';

- No exemplo há a exclusão do registro da cliente Ana Souza da tabela CLIENTES.

---

## Extras

- **`CASE WHEN`:** Estrutura condicional

    ```sql

    SELECT nome,
        CASE 
            WHEN idade >= 18 THEN 'Adulto'
            ELSE 'Menor'
        END AS Categoria 
    FROM CLIENTES;

- **Explicação da consulta acima:** 

    - `CASE` funciona como um “if” dentro do SQL, permitindo criar condições diretamente na consulta. No exemplo, ele está criando uma nova coluna chamada Categoria;
    
    - Para cada linha da tabela CLIENTES: 

        - Se o valor da coluna idade for maior ou igual a 18, o resultado será 'Adulto';

        - Caso contrário (`ELSE`), o resultado será 'Menor'.

---

- **`COALESCE()`:** Função que substitui valores nulos por outro valor

    ```sql

    SELECT nome,
        COALESCE(email, 'sem email cadastrado') AS contato
    FROM CLIENTES;

- **Explicação da consulta acima:** 

    - A função verifica o valor da coluna email;
    
        - Se email tiver valor, ele é mostrado;
        
        - Se email for `NULL`, o texto "sem email cadastrado" será exibido no lugar.

---

- **`LIMIT/TOP`:** Restringe o número de linhas retornadas

    ```sql

    SELECT t1.*, 
            t2.DescDescricaoProduto

    FROM transacao_produto AS t1

    LEFT JOIN produtos AS t2
            ON t1.IdProduto = t2.IdProduto

    LIMIT 10;

- **Explicação da consulta acima:**

    - `FROM transacao_produto AS t1`: define a tabela principal da consulta e dá a ela um apelido (t1) para simplificar a escrita;

    - `LEFT JOIN produtos AS t2 ON t1.IdProduto = t2.IdProduto`: faz uma junção (LEFT JOIN) entre a tabela `transacao_produto` e `produtos`, conectando-as pela coluna `IdProduto`. Assim, cada transação é associada à descrição do produto correspondente;

    - `SELECT t1.*, t2.DescDescricaoProduto`: seleciona todas as colunas de `transacao_produto` (t1.*) e a coluna `DescDescricaoProduto` da tabela produtos (t2);

    - `LIMIT 10`: retorna apenas as 10 primeiras linhas desse resultado combinado.

---

- **`CONCAT()`:** Junta textos.

    ```sql

    SELECT CONCAT(nome, ' - ', cidade) 
    FROM CLIENTES;

- **Explicação da consulta acima:**

    - Essa consulta irá retornar uma nova coluna resultante da junção dos valores das colunas nome e cidade, separados por " - " (um hífen com espaços), como: "Ana - Natal".

---

- **`ALIAS (AS)`:** Usada para renomear/apelidar colunas ou tabelas

---

- **`ROUND()`:** Arredonda valores numéricos

---

- **`LENGTH()` / `CHAR_LENGTH()`:** Comprimento de texto

---

- **`UPPER()` / `LOWER()`:** Transforma em maiúsculas/minúsculas

---

### Exemplos Práticos

#### 1- Retornar os Clientes com mais Pontos em Julho de 2025

- **Código da query:**

     ```sql

    SELECT IdCliente, sum(QtdePontos) AS TotalPontos
    FROM transacoes 
    WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01' 
    GROUP BY IdCliente 
    ORDER BY sum(QtdePontos) DESC; 

---

#### Tabela original (`transacoes`): Com dados filtrados para julho (a partir do comando `WHERE`)

    | IdCliente | QtdePontos | DtCriacao   |
    |-----------|------------|-------------|
    | 1         | 100        | 2025-07-02  |
    | 2         | 150        | 2025-07-03  |
    | 1         | 200        | 2025-07-10  |
    | 3         | 80         | 2025-07-15  |
    | 2         | 50         | 2025-07-20  |
    | 4         | 300        | 2025-07-22  |
    | 3         | 100        | 2025-07-25  |
    | 1         | 150        | 2025-07-28  |

---

#### Passo 1a: Agrupar por `IdCliente` (sem soma ainda)

    | IdCliente | QtdePontos (lista)      |
    |-----------|-------------------------|
    | 1         | 100, 200, 150           |
    | 2         | 150, 50                 |
    | 3         | 80, 100                 |
    | 4         | 300                     |

- Neste momento, o `GROUP BY` apenas **organiza as transações em grupos** por cliente, sem realizar cálculos.

---

#### Passo 1b: Aplicar a soma (`SUM(QtdePontos)`)

    | IdCliente | TotalPontos |
    |-----------|-------------|
    | 1         | 450         |
    | 2         | 200         |
    | 3         | 180         |
    | 4         | 300         |

- Agora, a função de agregação `SUM()` soma os pontos de cada cliente, produzindo um valor total por grupo.

---

#### Passo 2: Ordenar do maior para o menor (`ORDER BY SUM(QtdePontos) DESC`)

    | IdCliente | TotalPontos |
    |-----------|-------------|
    | 1         | 450         |
    | 4         | 300         |
    | 2         | 200         |
    | 3         | 180         |

---

#### 2- Retornar as transações de produtos, mostrando todas as informações da transação e o nome do produto associado (ou `NULL` se não houver correspondência)

- **Código da query:**

     ```sql

    SELECT t1.*, t2.DescDescricaoProduto
    FROM transacao_produto AS t1
    LEFT JOIN produtos AS t2
        ON t1.IdProduto = t2.IdProduto;
    
---

#### Tabela `transacao_produto` (`t1`):

    | IdTransacao | IdProduto | Quantidade |
    |-------------|-----------|------------|
    | 1           | 11        | 2          |
    | 2           | 12        | 1          |
    | 3           | 13        | 4          |
    | 4           | 99        | 3          |

---

#### Tabela `produtos` (`t2`):

    | IdProduto | DescDescricaoProduto |
    |-----------|----------------------|
    | 11        | Presente             |
    | 12        | Caneca               |
    | 13        | Camiseta             |

---

#### Resultado do `LEFT JOIN`:

    | IdTransacao | IdProduto | Quantidade | DescDescricaoProduto |
    |-------------|-----------|------------|----------------------|
    | 1           | 11        | 2          | Presente             |
    | 2           | 12        | 1          | Caneca               |
    | 3           | 13        | 4          | Camiseta             |
    | 4           | 99        | 3          | NULL                 |


- As três primeiras linhas encontraram correspondência na tabela produtos, retornando o nome do produto. A última linha (`IdProduto = 99`) não existe em produtos, portanto o valor da coluna `DescDescricaoProduto` é `NULL`.

---

## Subqueries

- As **subqueries** são consultas SQL **aninhadas dentro de outra consulta**. Elas são usadas quando você precisa utilizar o **resultado de uma query como condição para outra**, geralmente dentro de um `WHERE`, `FROM` ou `SELECT`.

#### Quando usar

- As subqueries são úteis quando:

    - É necessário buscar informações que dependem de outra tabela;

    - Você quer evitar junções muito complexas (`JOIN`);

    - Precisa filtrar registros com base em resultados derivados.

- **Atenção:** apesar de úteis, **elas podem ser mais lentas** do que joins em bases de dados grandes, pois o banco precisa executar primeiro a consulta interna (a subquery) para depois aplicar o resultado na consulta principal.

#### Exemplo Prático

```sql

    SELECT *
    FROM transacao_produto AS t1
    WHERE t1.IdProduto IN (
        SELECT IdProduto
        FROM produtos
        WHERE DescDescricaoProduto = 'Resgatar Pônei'
    );

```

- **Explicação:** 

- A subquery busca na tabela `produtos` o `IdProduto` correspondente ao produto com a descrição **"Resgatar Pônei"**. O resultado pode ser apenas:

    | IdProduto |
    |-----------|
    | 15        | 

- Já a query principal vai procurar na tabela `transacao_produto` todas as transações cujo `IdProduto` esteja entre os valores retornados pela subquery, neste caso, onde `IdProduto = 15`. **Resultado final:**

    | IdTransacao | IdProduto | Quantidade |
    |-------------|-----------|------------|
    | 8           | 15        | 2          |
    | 12          | 15        | 5          |
   

- **Em resumo:**

    - A subquery roda primeiro;

    - O resultado dela é usado como filtro na consulta principal;

    - É uma forma de consultar tabelas relacionadas sem precisar usar `JOIN`.

---

### O Exemplo Anterior com `JOIN`:

```sql

    SELECT t1.*, t2.DescDescricaoProduto
    FROM transacao_produto AS t1
    INNER JOIN produtos AS t2
        ON t1.IdProduto = t2.IdProduto
    WHERE t2.DescDescricaoProduto = 'Resgatar Pônei';

```

- Aplica-se o `INNER JOIN` nesse caso, porque deseja-se o match perfeito, ou seja, que só apareçam os registros que existem nas duas tabelas. Se existir uma transação com `IdProduto = 15`, mas esse produto não existir na tabela produtos, essa linha não aparecerá no resultado, uma vez que queremos apenas transações que tenham um produto válido;

- No exemplo acima, a subquery pode ser mais intuitiva, pois primeiro filtra os produtos pelo nome (`WHERE DescDescricaoProduto = 'Resgatar Pônei'`) e depois usa o resultado dessa filtragem na consulta principal (`transacao_produto`).

---

#### 3- Retornar a quantidade de Clientes que participaram do "primeiro dia" (2025-08-25) e que voltaram no "quinto dia" (2025-08-29)

- **Código da query:**

     ```sql

    SELECT COUNT(DISTINCT IdCliente)
    FROM transacoes AS t1
    WHERE t1.IdCliente IN (

        SELECT DISTINCT IdCliente
        FROM transacoes
        WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

    )
    AND substr(t1.DtCriacao, 1, 10) = '2025-08-29';

    ```

- **Explicação:** 

- A subquery retorna quem esteve no primeiro dia;

    - A `substr(DtCriacao, 1, 10)` extrai a parte da string representando a data (formato YYYY-MM-DD), assumindo que `DtCriacao` esteja como string;

    - Essa consulta retorna a lista de IDs de clientes únicos (`DISTINCT IdCliente`) que tiveram alguma transação em `2025-08-25`, ou seja, os que "compareceram" no primeiro dia.

- Já a consulta externa conta quantos desses voltaram no quinto dia;

    - `t1.IdCliente IN (...)` filtra as transações para apenas os clientes que constam na lista da subquery (os que estavam no primeiro dia);

    - `AND substr(t1.DtCriacao, 1, 10) = '2025-08-29'` restringe o conjunto para as transações ocorridas no quinto dia;

    - `COUNT(DISTINCT IdCliente)` conta quantos clientes distintos aparecem nesse resultado. A quantidade de clientes que estiveram no primeiro dia e que também apareceram no quinto dia.

---

### O Exemplo Anterior com `JOIN`:

```sql

    SELECT COUNT(DISTINCT t1.IdCliente) AS qtd_clientes_retornaram
    FROM transacoes t1
    JOIN (

        SELECT DISTINCT IdCliente
        FROM transacoes
        WHERE substr(DtCriacao,1,10) = '2025-08-25'

    ) first_day ON t1.IdCliente = first_day.IdCliente

    WHERE substr(t1.DtCriacao,1,10) = '2025-08-29';

```

- **Explicação:**

- Também temos 2 partes principais: 

    - Uma subquery (tabela derivada) chamada `first_day`, que pega os clientes do primeiro dia;

    - A tabela principal `transacoes t1`, que é comparada (`JOIN`) com essa lista para verificar quem voltou no quinto dia.

- A subquery:

    - Seleciona todos os clientes distintos (`DISTINCT`);

    - Filtra apenas as linhas em que a data (`DtCriacao`) é 25/08/2025;

    - O `substr(DtCriacao,1,10)` pega só a parte da data (excluindo hora/minutos, caso existam).

- O `JOIN`: cruza com as transações do quinto dia

    - O `JOIN` conecta cada registro de `t1` com o conjunto de clientes `first_day`;

    - Só entram no resultado os registros onde o `IdCliente` aparece nas duas tabelas. Ou seja, clientes que estão na lista do primeiro dia e também têm transações registradas em `transacoes t1`.

- Depois do `JOIN`, o filtro restringe `t1` apenas às transações feitas em 29/08/2025;

- Por fim, `COUNT(DISTINCT a.IdCliente)` conta quantos clientes diferentes aparecem no resultado.

    - Isso evita duplicar clientes que possam ter feito mais de uma transação no quinto dia.
