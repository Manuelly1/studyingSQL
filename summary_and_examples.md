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

    SELECT IdCliente, 
        sum(QtdePontos)

    FROM transacoes
    WHERE DtCriacao >= '2025-07-01' 
        AND DtCriacao < '2025-08-01'

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

    SELECT IdProduto, 
        COUNT(*)

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

    SELECT IdCliente, 
        sum(QtdePontos)

    FROM transacoes
    WHERE DtCriacao >= '2025-07-01' 
        AND DtCriacao < '2025-08-01'

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

    SELECT IdCliente, 
        sum(QtdePontos) AS TotalPontos

    FROM transacoes 
    WHERE DtCriacao >= '2025-07-01' 
        AND DtCriacao < '2025-08-01' 

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

    SELECT t1.*, 
        t2.DescDescricaoProduto

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

---

## Common Table Expressions (CTEs)

- As CTEs são **“tabelas temporárias nomeadas”** criadas dentro de uma consulta SQL;

- Elas permitem dividir consultas complexas em partes menores e mais legíveis, usando a cláusula **`WITH`**;

#### Sintaxe Básica:

```sql

    WITH nome_cte AS (

        SELECT ...

    )

    SELECT *
    FROM nome_cte;

```

#### Vantagens: 

- Deixa o código mais legível e organizado;

- Evita o uso excessivo de subqueries aninhadas;

- Facilita a reutilização de resultados intermediários;

- Permite criar várias CTEs na mesma consulta.

#### Exemplos Práticos com CTEs:

**Primeiro Exemplo**

```sql

    WITH tb_cliente_primeiro_dia AS (

        SELECT DISTINCT IdCliente
        FROM transacoes
        WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

    ),

    tb_cliente_ultimo_dia AS (

        SELECT DISTINCT IdCliente
        FROM transacoes
        WHERE substr(DtCriacao, 1, 10) = '2025-08-29'

    )

    SELECT *
    FROM tb_cliente_primeiro_dia AS t1

    LEFT JOIN tb_cliente_ultimo_dia AS t2
        ON t1.IdCliente = t2.IdCliente;

```

- **Objetivo:** Comparar os clientes que compraram no primeiro dia com os que compraram no último dia, identificando quais clientes do primeiro dia também aparecem (ou não) no último dia;

- **Explicação:** 

- O comando `WITH` é utilizado para criar uma "tabela temporária nomeada" que pode ser referenciada dentro da mesma consulta SQL;

- Neste exemplo foram criadas 2 `CTEs`:

    - `tb_cliente_primeiro_dia` → armazena os IDs dos clientes que realizaram transações no dia 2025-08-25 (primeiro dia);

    - `tb_cliente_ultimo_dia` → armazena os IDs dos clientes que realizaram transações no dia 2025-08-29 (último dia).

- Em seguida, a consulta principal faz um `LEFT JOIN` entre as duas `CTEs`, relacionando os clientes do primeiro dia (`t1`) com os do último dia (`t2`), com base no campo `IdCliente`;

- Dessa forma, é possível identificar quais clientes compraram no primeiro dia e verificar se também realizaram transações no último dia.

#### Por que é mais interessante usar CTEs do que subqueries?

- Porque as `CTEs` permitem dividir o problema em etapas lógicas: primeiro filtramos uma parte da base (clientes do primeiro dia), depois filtramos outra (clientes do último dia) e, por fim, cruzamos os resultados de forma organizada e legível. Além disso, o uso de `CTEs` torna o código mais limpo, fácil de manter e reutilizar em consultas mais complexas, em vez de aninhar várias subqueries difíceis de entender, conforme mencionado no subtópico **Vantagens**.

---

**Segundo Exemplo**

```sql

    WITH tb_clientes_dia1 AS (

        SELECT DISTINCT IdCliente

        FROM transacoes
        WHERE DtCriacao >= '2025-08-25'
            AND DtCriacao < '2025-08-26'

    )

    SELECT 
            substr(t2.DtCriacao, 1, 10) AS dtDia,
            count(DISTINCT t1.IdCliente) AS qtdeCliente,
            1.* count(DISTINCT t1.IdCliente) / (select count(*) from tb_clientes_dia1) AS pctRetencao,
            1 - 1.* count(DISTINCT t1.IdCliente) / (select count(*) from tb_clientes_dia1) AS pctChurn

    FROM tb_clientes_dia1 AS t1

    LEFT JOIN transacoes AS t2
        ON t1.IdCliente = t2.IdCliente

    WHERE t2.DtCriacao >= '2025-08-25'
        AND t2.DtCriacao < '2025-08-30'

    GROUP BY dtDia;

```

- **Objetivo:** Analisar a curva de Churn (cancelamento) do curso de SQL;

- **Explicação:** 

- Nesta query considera-se apenas os alunos que começaram no primeiro dia do curso, para, assim, poder observar o "cancelamento real" dos ingressantes ao longo dos dias de curso. O processo é dividido em duas partes:

    1. Seleção dos alunos que iniciaram no primeiro dia (CTE);
    
    2. Cálculo da curva de retenção/churn com base nesses alunos.

- A **primeira parte** resgata cada cliente que teve transação no primeiro dia, enquanto a **segunda parte** relaciona esses clientes às suas transações nos dias seguintes, contabilizando:

    - Quantos continuaram ativos em cada dia (coluna `qtdeCliente`);
    
    - E qual a proporção deles em relação ao total de alunos do primeiro dia (`pctRetencao`);

    - A primeira expressão (`pctRetencao`) calcula a proporção de alunos ativos em cada dia, dividindo o número de alunos do dia 1 que ainda tiveram transações (`count(DISTINCT t1.IdCliente)`) pelo total de alunos que começaram o curso (`select count(*) from tb_clientes_dia1`). Em outras palavras, mostra o percentual de alunos que permaneceram ativos até aquele dia;

    - A segunda expressão (`pctChurn`) faz o oposto: ela calcula a proporção de alunos que já abandonaram o curso, subtraindo a taxa de retenção de 1. Assim, `pctChurn = 1 - pctRetencao`. No exemplo anterior, se pctChurn = 0.2 (ou 20%), compreende-se que 20% dos alunos já deixaram de participar;
    
    - O uso de `1.*` antes da divisão serve para forçar o cálculo em formato decimal, evitando arredondamentos inteiros (como poderia ocorrer em alguns bancos de dados).

- A segunda parte utiliza um `LEFT JOIN` entre a lista de clientes do primeiro dia e todas as transações do período analisado. Dessa forma, é possível medir a taxa de permanência (retenção) ou, inversamente, identificar a taxa de cancelamento (churn) conforme a proporção de alunos ativos diminui ao longo dos dias;

- **Explicando de forma mais detalhada acerca do uso do `LEFT JOIN`:**

    - Ele mantém todos os registros da **tabela da esquerda (`tb_clientes_dia1`)** mesmo quando não há correspondência na tabela da direita (`transacoes`). Isso permite **contar também os alunos que pararam de ter transações** (aparecem com campos de `t2 = NULL`), informação essencial para medir churn.

- **Comportamento:**

- Para cada `IdCliente` em `tb_clientes_dia1`:

    - Se existir(s) transação(ões) correspondente(s) em `transacoes`, essas linhas aparecem normalmente;

    - Se não existir transação correspondente, o resultado terá uma linha com os campos de `transacoes = NULL`.

- Porque isso importa para churn/retenção:

    - Deseja-se saber, em cada dia, quantos dos ingressantes do dia 1 ainda estavam ativos;

    - Se um ingressante sumiu (não fez transações posteriores), precisamos que ele continue presente na base de análise para contabilizar a perda (aparência de NULLs indica inatividade).

---

**Terceiro Exemplo - Primeira Forma**

```sql

    WITH tb_clientes_janeiro AS (

        SELECT DISTINCT IdCliente

        FROM transacoes

        WHERE DtCriacao >= '2025-01-01' 
            AND DtCriacao < '2025-02-01'

    )

    SELECT count(DISTINCT t1.IdCliente),
        count(DISTINCT t2.IdCliente)

    FROM tb_clientes_janeiro AS t1

    LEFT JOIN transacoes AS t2
        ON t1.IdCliente = t2.IdCliente
        AND t2.DtCriacao >= '2025-08-25'
        AND t2.DtCriacao < '2025-08-30';

```

- **Objetivo:** Verificar, dentre os clientes que estavam ativos em janeiro/2025, quantos também assistiram (ou participaram de 
transações) no curso de SQL ocorrido entre 25 e 29 de agosto/2025;

- **Explicação:** 

- A CTE `tb_clientes_janeiro` seleciona todos os clientes que tiveram qualquer transação durante o mês de janeiro de 2025;

- No `SELECT` principal, aplica-se um `LEFT JOIN` entre os clientes de janeiro (`t1`) e a tabela de `transações` (`t2`), mas com uma condição adicional no `ON`:

    - `AND t2.DtCriacao >= '2025-08-25'` 
    - `AND t2.DtCriacao < '2025-08-30'`

- Isso significa que o `JOIN` só vai considerar as transações realizadas no período do curso de SQL;

- Dessa forma:

    - `count(DISTINCT t1.IdCliente)`: conta o total de clientes de janeiro;

    - `count(DISTINCT t2.IdCliente)`: conta quantos desses também tiveram transações (ou seja, participaram) no curso de SQL.

- O uso do `AND` dentro do `ON` é importante, pois ele filtra apenas o lado direito (`transações`) antes da junção, sem afetar a base da esquerda (`tb_clientes_janeiro`). Isso garante que apenas transações do curso sejam consideradas no cálculo.

--- 

**Terceiro Exemplo - Segunda Forma**

```sql

    WITH tb_clientes_janeiro AS (

        SELECT DISTINCT IdCliente

        FROM transacoes

        WHERE DtCriacao >= '2025-01-01' 
            AND DtCriacao < '2025-02-01'

    ),

    tb_clientes_curso AS (

        SELECT DISTINCT IdCliente

        FROM transacoes

        WHERE DtCriacao >= '2025-08-25'
            AND DtCriacao < '2025-08-30';

    )

    SELECT count(t1.IdCliente) AS clienteJaneiro,
        count(t2.IdCliente) AS clienteCurso

    FROM tb_clientes_janeiro AS t1

    LEFT JOIN tb_clientes_curso AS t2
        ON t1.IdCliente = t2.IdCliente;

```

- **Objetivo:** Verificar, dentre os clientes que estavam ativos em janeiro/2025, quantos também assistiram (ou participaram de 
transações) no curso de SQL ocorrido entre 25 e 29 de agosto/2025;

- **Explicação:** 

- Aqui, são criadas duas CTEs:

    - `tb_clientes_janeiro`: contém os clientes que tiveram transações em janeiro;

    - `tb_clientes_curso`: contém os clientes que participaram do curso de SQL em agosto.

- No `SELECT` final, aplica-se um `LEFT JOIN` entre as duas bases;

- Assim:

    - `count(t1.IdCliente)`: retorna o total de clientes em janeiro;

    - `count(t2.IdCliente)`: retorna quantos desses também estão na lista do curso.

- Essa abordagem é mais legível e modular, pois separa claramente os dois conjuntos de clientes (janeiro e agosto), evitando ambiguidades com condições dentro do `JOIN`.

--- 

## Window Functions

- As **Window Functions** (ou *funções de janela*) permitem realizar cálculos sobre um conjunto de linhas relacionadas à linha atual, **sem agrupar os resultados** como ocorre com o `GROUP BY`;

- Diferente do `GROUP BY`, que reduz os dados a um único resultado por grupo, as funções de janela criam uma **“janela” (ou partição)** dentro da qual o cálculo é aplicado, **mantendo o detalhamento de cada linha**.

---

### Sintaxe geral

```sql
    
    função() OVER (PARTITION BY coluna ORDER BY coluna)

```

- `PARTITION BY`: define como os dados serão divididos em grupos (semelhante ao GROUP BY, mas sem colapsar as linhas). Cada grupo é tratado como uma partição independente;

- `ORDER BY`: define a ordem dentro de cada partição, essencial para funções que dependem de sequência (como row_number, rank, lag etc);

- **Exemplos:**

    ```sql

        ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY Data)

    ```

    - O exemplo acima numera as linhas de cada cliente, reiniciando a contagem a cada novo `IdCliente`.

    ```sql

        RANK() OVER (ORDER BY Nota DESC)

    ```

    - O segundo exemplo atribui posições conforme a nota, pulando empates.

    ```sql

        SUM(Vendas) OVER (PARTITION BY Vendedor ORDER BY Data)

    ```

    - O último exemplo calcula o total acumulado de vendas ao longo do tempo, por vendedor.

---

### Benefícios

- Mantém o nível de detalhe das linhas originais;

- Permite cálculos de ranking, totais acumulados e comparações entre linhas;

- Elimina a necessidade de subconsultas complexas;

- É amplamente utilizada em análises de dados, relatórios e BI.

---

### Exemplo com Window Fuctions

- **Objetivo:** Exibir o dia com maior engajamento de cada aluno que iniciou o curso no primeiro dia (no caso, 2025-08-25);

```sql

    WITH alunos_dia_01 AS (

        SELECT DISTINCT IdCliente
        FROM transacoes
        WHERE substr(DtCriacao, 1, 10) = '2025-08-25'

    ),

    tb_dia_cliente AS (

        SELECT t1.IdCliente,
               substr(t2.DtCriacao, 1, 10) AS dtDia,
               count(*) AS qtdeInteracoes

        FROM alunos_dia_01 AS t1

        LEFT JOIN transacoes AS t2
            ON t1.IdCliente = t2.IdCliente
            AND t2.DtCriacao >= '2025-08-25'
            AND t2.DtCriacao < '2025-08-30'

        GROUP BY t1.IdCliente,
                 substr(t2.DtCriacao, 1, 10)

        ORDER BY t1.IdCliente, dtDia

    ),

    tb_row_number AS (

        SELECT *,
            row_number() OVER (PARTITION BY IdCliente ORDER BY qtdeInteracoes DESC, dtDia) AS rowNumber

        FROM tb_dia_cliente

    )

    SELECT *

    FROM tb_row_number

    WHERE rowNumber = 1;

```

- **Explicações:**

    - Primeiramente, criou-se a CTE (`alunos_dia_01`) para selecionar apenas os alunos que tiveram sua primeira transação (ou início do curso) no dia **25 de agosto de 2025**;
    
    - Nesta etapa, o resultado esperado é algo como:

            | IdCliente | 
            |-----------|
            | 101       | 
            | 102       | 
            | 103       | 

    - Em seguida, a CTE `tb_dia_cliente` une os alunos filtrados na primeira etapa com todas as suas transações dentro de um intervalo de datas.  
      O resultado é uma tabela com a **quantidade de interações (`qtdeInteracoes`) por dia (`dtDia`) e por aluno (`IdCliente`)**;
      
    - Nesta parte, o resultado esperado é algo como:

            | IdCliente  | dtDia      | qtdeInteracoes |
            |------------|------------|----------------|
            | 101        | 2025-08-25 | 22             |
            | 101        | 2025-08-26 | 2              |
            | 101        | 2025-08-27 | 3              |
            | 102        | 2025-08-25 | 10             |
            | 102        | 2025-08-26 | 5              |
            | 103        | 2025-08-25 | 2              |
            | 103        | 2025-08-28 | 15             |

    - Na CTE `tb_row_number`, foi utilizada a **window function** `ROW_NUMBER()` para ordenar os dias de cada aluno conforme o nível de engajamento:

        - `PARTITION BY IdCliente`: cria uma “janela” para cada aluno;  

        - `ORDER BY qtdeInteracoes DESC, dtDia`: dentro de cada aluno, ordena do dia mais engajado para o menos engajado (em caso de empate, o dia mais antigo vem primeiro);  

        - `ROW_NUMBER()`: numera as linhas dentro de cada aluno (1, 2, 3…).  

    - O resultado é que o dia com maior engajamento de cada aluno recebe o número **1**;
    
    - Nesta etapa, a consulta retornará algo como:

            | IdCliente  | dtDia      | qtdeInteracoes | rowNumber |
            |------------|------------|----------------|-----------|
            | 101        | 2025-08-25 | 22             | 1         |
            | 101        | 2025-08-27 | 3              | 2         |
            | 101        | 2025-08-26 | 2              | 3         |
            | 102        | 2025-08-25 | 10             | 1         |
            | 102        | 2025-08-26 | 5              | 2         |
            | 103        | 2025-08-28 | 15             | 1         |
            | 103        | 2025-08-25 | 2              | 2         |

    - Por fim, o `WHERE` filtra para retornar apenas as linhas com `rowNumber = 1`, ou seja, o **dia em que cada aluno teve o maior número de interações**;
    
    - O resultado final será algo como:

            | IdCliente  | dtDia      | qtdeInteracoes | rowNumber |
            |------------|------------|----------------|-----------|
            | 101        | 2025-08-25 | 22             | 1         |
            | 102        | 2025-08-25 | 10             | 1         |
            | 103        | 2025-08-28 | 15             | 1         |

    - A função `ROW_NUMBER()` é essencial neste caso, pois permite **classificar registros dentro de um grupo (aluno)** sem precisar agrupar os dados ou perder o detalhamento de cada linha.

---

## Teste da Amazon 2025

### Primeira Questão:

- Objetivo: **"Find customers who purchased more than 3 times in the last month"***;

```sql

    SELECT IdCliente,
           substr(DtCriacao, 1, 10) AS data,
           COUNT(*) AS totalCompras

    FROM transacoes

    WHERE DtCriacao >= date('now', 'start of month', '-1 month')
        AND DtCriacao < date('now', 'start of month')

    GROUP BY IdCliente
    HAVING COUNT(*) > 3;

```

- **Explicações:** 

    - **Observação:** A ordem em que escrevemos uma query SQL é diferente da ordem lógica de execução. Internamente, o banco de dados executa mais ou menos nesta sequência:

        1. FROM → lê a tabela;
        
        2. WHERE → filtra as linhas individuais (antes de qualquer agrupamento);

        3. GROUP BY → agrupa as linhas que sobraram;

        4. HAVING → filtra os grupos resultantes (já agregados);

        5. SELECT → seleciona e calcula colunas (como COUNT(*));

        6. ORDER BY / LIMIT, se houver.

    - No caso da query apresentada, primeiramente a tabela `transacoes` é lida;

    - Em seguida, ocorre a filtragem das transações do último mês (iniciando no mês anterior ao atual), utilizando a função `date` para tornar o processo dinâmico;

    - Depois disso, os registros são agrupados por cliente (`IdCliente`), de modo que não haja repetições, uma vez que o `GROUP BY` agrupa todas as transações que têm o mesmo `IdCliente`;

    - Na etapa seguinte, o `HAVING` é aplicado para filtrar apenas os grupos cuja contagem total de transações seja superior a 3;

    - Por fim, o `SELECT` retorna as colunas desejadas: `IdCliente`, `data` (extraída via substr) e `totalCompras` (calculado com `COUNT(*)`). O `COUNT(*)` conta quantas linhas existem dentro de cada grupo que foi formado pelo `GROUP BY`.

---

### Segunda Questão:

- Objetivo: **"Write a query to find the second highest salary"*** → foi adaptada para retornar o segundo cliente com a maior quantidade de pontos;

```sql

    SELECT IdCliente, 
           QtdePontos

    FROM clientes

    WHERE QtdePontos < (

        SELECT MAX(QtdePontos)
        FROM clientes

    )

    ORDER BY QtdePontos DESC
    LIMIT 1;

```

- **Explicações:**

    - Primeiramente, a subconsulta localizada dentro do `WHERE` retorna o valor máximo de pontos existente na tabela, ou seja, o maior número de pontos entre todos os clientes;

    - Em seguida, a condição no `WHERE` faz com que o SQL desconsidere o cliente que possui a maior quantidade de pontos, restando apenas os demais clientes com valores inferiores;

    - Posteriormente, a cláusula `ORDER BY QtdePontos DESC` ordena os clientes restantes em ordem decrescente de pontos, e o `LIMIT 1` retorna apenas o primeiro registro, aquele que corresponde ao cliente com a **segunda maior quantidade de pontos**. 

---

### Terceira Questão:

- Objetivo: **"What is the difference between RANK(), DENSE_RANK(), and ROW_NUMBER()?"**

    - `RANK()`: atribui uma classificação a cada linha com base na ordenação definida, mas pula a numeração em caso de empate. Exemplo: se dois valores empatarem em 2º lugar, o próximo será 4º;

    - `DENSE_RANK()`: atribui classificação considerando empates e não pula a numeração. Dessa forma, se dois valores empatarem em 1º lugar, o próximo será 2º;

    - `ROW_NUMBER()`: atribui um número único e sequencial para cada linha. Não considera empates, cada linha recebe um número distinto. 

    - Exemplo:

        IdCliente | Pontos
        ----------|--------
        1         | 100
        2         | 90
        3         | 90
        4         | 80

    - Resultado ao aplicar cada função (`ORDER BY Pontos DESC`):

        - `RANK()` → 1, 2, 2, 4;
        
        - `DENSE_RANK()` → 1, 2, 2, 3;

        - `ROW_NUMBER()` → 1, 2, 3, 4.

---

### Quarta Questão:

- Objetivo: **"Find duplicate records in a table"**;

```sql

    SELECT IdCliente, 
           COUNT(*)

    FROM clientes

    GROUP BY IdCliente
    HAVING COUNT(*) > 1;

```

- **Explicações:**

    - Primeiramente, na tabela `clientes`, a cláusula `GROUP BY IdCliente` agrupa todas as linhas que possuem o mesmo identificador de cliente. Isso faz com que cada grupo represente um cliente distinto (ou um mesmo cliente repetido várias vezes);

    - Em seguida, a função `COUNT(*)` é usada para contar quantas ocorrências existem de cada `IdCliente`. Assim, se um cliente aparece mais de uma vez na tabela, o `COUNT(*)` retornará um valor maior que 1;

    - Logo após, a cláusula `HAVING COUNT(*) > 1` é aplicada sobre o resultado do agrupamento, filtrando apenas os grupos (clientes) que possuem mais de uma ocorrência, ou seja, os duplicados;

    - Assim, o resultado final exibirá apenas os clientes repetidos, juntamente com a quantidade de vezes que cada um aparece na tabela.

---

### Quinta Questão:

- Objetivo: **"What's the difference between WHERE and HAVING?**;

    - Ambos são usados para filtrar dados, mas atuam em momentos diferentes da execução da consulta:

    - `WHERE` filtra as linhas antes da agregação (ou seja, atua sobre os registros individuais);

    - `HAVING` filtra os resultados depois da agregação (ou seja, atua sobre os grupos formados pelo `GROUP BY`).

---

### Sexta Questão:

- Objetivo: **"Get the average order value for each customer"**;

```sql

    SELECT t2.IdCliente,
           AVG(t1.QtdeProduto * t1.vlProduto) AS ValorMedio

    FROM transacao_produto AS t1

    INNER JOIN transacoes AS t2
        ON t1.IdTransacao = t2.IdTransacao

    GROUP BY t2.IdCliente;

```

- **Explicações:** 

    - Primeiramente, a tabela `transacao_produto` (apelidada como `t1`) contém os produtos vinculados às transações e, dessa forma, as colunas `QtdeProduto` (quantidade) e `vlProduto` (valor unitário);

    - Já a tabela `transacoes` (apelidada como `t2`) armazena as informações gerais das transações, incluindo o identificador do cliente (`IdCliente`);

    - A junção `INNER JOIN` é utilizada para relacionar as duas tabelas por meio do campo `IdTransacao`. Isso garante que sejam combinados apenas os registros que possuem transações correspondentes em ambas as tabelas;

    - Em seguida, a expressão `t1.QtdeProduto * t1.vlProduto` calcula o **valor total de cada item vendido** (quantidade × preço). A função de agregação `AVG()` é aplicada sobre esse resultado para obter a **média dos valores** das transações de cada cliente;

    - Por fim, o `GROUP BY t2.IdCliente` agrupa as informações por cliente, garantindo que o cálculo da média (`AVG`) seja feito individualmente para cada um deles.

---

