# Pontos Importantes das Aulas e Exercícios de SQL

- **O que é um banco de dados?** É um repositório organizado que armazena e gerencia conjuntos de informações estruturadas em tabelas, representando elementos do mundo real. Uma coleção de entidades;

- **Entidade:** Representa um objeto ou conceito real que possui dados relevantes a serem armazenados, como um cliente ou produto (corresponde a uma tabela, no caso);

- **Atributos:** São as colunas da tabela, responsáveis por descrever as características de uma entidade;

- **Registros:** São as linhas da tabela, cada uma representando uma instância específica da entidade (ex.: um cliente ou produto).

---

## Comandos e Funções

- **SELECT:** É o comando que irá resgatar/selecionar as colunas de uma tabela;

---

- **FROM:** É o comando que irá indicar a tabela que os dados estão sendo resgatados;

---

- **WHERE:** É a cláusula que irá filtrar os dados com base em uma condição. Ex: deseja-se selecionar apenas a categoria RPG, portanto, aplica-se: 

    ```sql

    SELECT *
    FROM produtos
    WHERE DescCategoriaProduto = 'rpg';

---

- **ORDER BY:** É um comando usado para ordenar os dados de acordo com a ordenação especificada, podendo ser ASC (forma crescente) ou DESC (forma decrescente);

    ```sql

    SELECT *
    FROM clientes
    WHERE flTwitch = 1
    ORDER BY DtCriacao ASC, qtdePontos DESC;

---

-  **GROUP BY:** É um comando usado para "espremer"/agrupar os resultados de uma consulta de acordo com uma ou mais colunas. Assim, você pode aplicar funções de agregação (como COUNT, SUM, AVG, MAX, MIN) a cada grupo de registros. Em outras palavras, ele **agrupa os dados a partir de uma categoria ou campo em comum**;

    ```sql

    SELECT IdCliente, sum(QtdePontos)
    FROM transacoes
    WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
    GROUP BY IdCliente
    ORDER BY sum(QtdePontos) DESC

- No caso acima, foram selecionadas as colunas `IdCliente` e `QtdePontos` (esta última somada por meio da função SUM);

- O filtro no `WHERE` limita os registros às transações realizadas no mês de julho de 2025;

- O comando `GROUP BY IdCliente` foi aplicado para agrupar as transações de cada cliente, permitindo calcular o total de pontos acumulados por cliente;

    - **Mas qual a razão de ter aplicado esse comando?** A tabela transações provavelmente tem várias linhas por cliente, se você quiser saber quantos pontos cada cliente acumulou no mês, precisa somar os pontos de cada cliente. Mas se você fizer só a aplicação do SUM, o SQL não saberá como agrupar essas somas. Então, você usa o GROUP BY para que o banco entenda da seguinte forma: “Agrupe todas as transações do mesmo cliente (mesmo IdCliente) e, dentro de cada grupo, some os pontos.”;

    - Resumindo, o `GROUP BY` foi aplicado porque há várias transações por cliente, e queremos consolidar (somar) os pontos de cada um, em vez de ver linha por linha.

- Por fim, `ORDER BY SUM(QtdePontos) DESC` ordena os resultados em ordem decrescente, exibindo primeiro os clientes com maior quantidade total de pontos.

---

-  **HAVING:** É um comando conhecido como WHERE do GROUP BY. Ele filtra os grupos criados, ou seja, não aplica um filtro sobre as linhas individuais, como o WHERE, mas sim nos grupos que foram formados na agregação;

    ```sql

    SELECT IdCliente, sum(QtdePontos)
    FROM transacoes
    WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'
    GROUP BY IdCliente
    HAVING sum(QtdePontos) >= 4000
    ORDER BY sum(QtdePontos) DESC

- No exemplo acima, depois de agrupar as transações por cliente, o `HAVING` exibe somente os clientes que acumularam 4000 pontos ou mais no período de julho.

---

- **LEFT JOIN:** Digamos que você tem 2 tabelas: VENDAS (esquerda) e CLIENTES, ao aplicar:

    ```sql

    SELECT * 
    FROM VENDAS 
    LEFT JOIN CLIENTES ON VENDAS.IdCliente = CLIENTES.IdCliente;

- Nesse exemplo, IdCliente é a chave primária da tabela CLIENTES, e `VENDAS.IdCliente` é a chave estrangeira que referencia essa chave primária. Ao usar o LEFT JOIN, a tabela da esquerda é aquela que aparece no FROM, neste caso, VENDAS;

- O SQL vai manter todos os registros da tabela da esquerda (VENDAS) e tentar combinar com os registros da tabela da direita (CLIENTES) com base na condição `ON VENDAS.IdCliente = CLIENTES.IdCliente`;

- Se existir um correspondente na tabela da direita, os dados serão incluídos. Caso contrário, os campos da tabela da direita aparecerão como `NULL`;

- Assim, o LEFT JOIN garante que todos os registros da tabela da esquerda sejam mantidos, e só “traz” os dados da tabela da direita quando houver correspondência. Registros sem correspondência recebem NULL nas colunas da direita.

---

- **INNER JOIN:** Digamos que você tem as mesmas 2 tabelas: VENDAS (esquerda) e CLIENTES, ao aplicar:

    ```sql

    SELECT *
    FROM VENDAS 
    INNER JOIN CLIENTES ON VENDAS.IdCliente = CLIENTES.IdCliente;

- O INNER JOIN retorna apenas os registros que possuem correspondência em ambas as tabelas.

- A tabela da esquerda (VENDAS) e a tabela da direita (CLIENTES) são comparadas com base na condição `ON VENDAS.IdCliente = CLIENTES.IdCliente`;

- Se não houver correspondência (por exemplo, se um `IdCliente` existir em VENDAS, mas não em CLIENTES), esse registro não aparecerá no resultado;

- Em outras palavras, o INNER JOIN só mantém os registros onde o "match" é perfeito entre as duas tabelas. Ele retorna apenas os dados que existem em ambas as tabelas, descartando qualquer registro sem correspondência.

---

- **RIGHT JOIN:** Digamos que você tem 2 tabelas: VENDAS (esquerda) e CLIENTES, ao aplicar:

    ```sql

    SELECT *
    FROM VENDAS 
    RIGHT JOIN CLIENTES ON VENDAS.IdCliente = CLIENTES.IdCliente;

- O RIGHT JOIN funciona de forma semelhante ao LEFT JOIN, mas a referência passa a ser a tabela da direita (CLIENTES);

- Isso significa que todos os registros da tabela da direita serão mantidos no resultado, mesmo que não existam correspondências na tabela da esquerda (VENDAS);

- Se não houver correspondência para um `IdCliente` da tabela da direita, os campos da tabela da esquerda (VENDAS) aparecerão como `NULL`;

- Logo, o RIGHT JOIN garante que todos os registros da tabela da direita sejam preservados, e só traz dados da tabela da esquerda quando houver correspondência.

---

- **FULL JOIN:** Suponha que você tenha duas tabelas: **VENDAS** (esquerda) e **CLIENTES** (direita).  

    ```sql

    SELECT * 
    FROM VENDAS
    FULL JOIN CLIENTES ON VENDAS.IdCliente = CLIENTES.IdCliente;

- O FULL JOIN combina o comportamento do LEFT JOIN e do RIGHT JOIN;

- Ele mantém todos os registros de ambas as tabelas, independentemente de haver correspondência;

- Quando não houver correspondência em uma tabela, os campos da outra tabela aparecerão como `NULL`.

---

- **Função `COUNT()`:** Serve para **contar registros** em uma tabela ou em um grupo.  

    - `COUNT(*)` → conta **todas as linhas**, inclusive com valores nulos;

    - `COUNT(1)` → também conta todas as linhas; é uma variação equivalente.  

- **`COUNT(DISTINCT coluna)`:** Conta **apenas os valores distintos** de uma coluna, ignorando duplicatas;

    - Exemplo: se a coluna `IdCliente` tiver valores repetidos, `COUNT(DISTINCT IdCliente)` contará **cada cliente uma única vez**, independentemente de quantas transações ele tenha.

---

- **Função `SUM()`:** Soma os valores de uma coluna numérica;

    ```sql
    
    SELECT SUM(QtdePontos) 
    FROM transacoes;

---

- **Função `AVG()`:** Calcula a média dos valores de uma coluna numérica;

    ```sql
    
    SELECT AVG(idade) 
    FROM clientes;

---

- **Função `MAX()`:** Retorna o maior valor de uma coluna;

    ```sql
    
    SELECT MAX(salario) 
    FROM funcionarios;

---

- **Função `MIN():`** Retorna o menor valor de uma coluna;

    ```sql
    
    SELECT MIN(salario) 
    FROM funcionarios;

---

- **Função: `substr():`(ou substring) serve para recortar uma parte de um texto (string):**  

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

- **Função `datetime():`**  
  Converte uma *string* formatada como data e hora em um tipo de dado **datetime** (data/hora reconhecida pelo banco).  

    - **Uso:**  
    Ao usar `datetime(substr(...))`, o objetivo é converter a *string* limpa em um valor de **data/hora real**.

---

## Diferença entre UNION e JOIN

- Embora `UNION` e `JOIN` possam parecer semelhantes, já que ambos combinam dados de mais de uma tabela, eles **funcionam de formas bem diferentes**:

- **`JOIN` (INNER, LEFT, RIGHT, FULL):**  

  - É usado para **combinar colunas** de duas (ou mais) tabelas **relacionadas entre si** por uma chave comum;

  - As tabelas são unidas **lado a lado**, ou seja, o resultado mostra **mais colunas** (junção horizontal);

  - Exemplo:

    ```sql

        SELECT *
        FROM VENDAS
        INNER JOIN CLIENTES ON VENDAS.IdCliente = CLIENTES.IdCliente;

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

- **BETWEEN:** Filtra valores dentro de um intervalo;

    ```sql

    SELECT * 
    FROM PRODUTOS 
    WHERE preco BETWEEN 10 AND 50;

---

- **IN/NOT IN:** Compara com uma lista de valores;

    ```sql

    SELECT * 
    FROM CLIENTES 
    WHERE cidade IN ('Natal', 'Currais Novos');

---

- **LIKE:** Busca por padrões (com % e _);

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

- **DISTINCT:** Remove duplicatas.

    ```sql

    SELECT DISTINCT cidade 
    FROM CLIENTES;

---

## Comandos de Modificações de Dados

- **INSERT INTO:** Insere registros;

    ```sql

    INSERT INTO CLIENTES (nome, cidade, idade)
    VALUES ('Ana Souza', 'Natal', 25);

- No exemplo acima está sendo adicionado um novo cliente chamado Ana Souza, da cidade Natal, com 25 anos.

---

- **UPDATE:** Atualiza valores;

    ```sql

    UPDATE CLIENTES
    SET cidade = 'Mossoró'
    WHERE nome = 'Ana Souza';

- No exemplo acima está atualizando o campo cidade para Mossoró apenas no registro onde o nome é Ana Souza. 

---

- **DELETE:** Apaga registros.

    ```sql

    DELETE FROM CLIENTES
    WHERE nome = 'Ana Souza';

- No exemplo há a exclusão do registro da cliente Ana Souza da tabela CLIENTES.

---

## Extras

- **CASE WHEN:** Estrutura condicional;

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

        - Caso contrário (ELSE), o resultado será 'Menor'.

---

- **COALESCE():** Função que substitui valores nulos por outro valor;

    ```sql

    SELECT nome,
        COALESCE(email, 'sem email cadastrado') AS contato
    FROM CLIENTES;

- **Explicação da consulta acima:** 

    - A função verifica o valor da coluna email;
    
        - Se email tiver valor, ele é mostrado;
        
        - Se email for NULL, o texto "sem email cadastrado" será exibido no lugar.

---

- **LIMIT/TOP:** Restringe o número de linhas retornadas;

    ```sql

    SELECT t1.*, 
            t2.DescDescricaoProduto

    FROM transacao_produto AS t1

    LEFT JOIN produtos AS t2
            ON t1.IdProduto = t2.IdProduto

    LIMIT 10

- **Explicação da consulta acima:**

    - `FROM transacao_produto AS t1`: define a tabela principal da consulta e dá a ela um apelido (t1) para simplificar a escrita;

    - `LEFT JOIN produtos AS t2 ON t1.IdProduto = t2.IdProduto`: faz uma junção (LEFT JOIN) entre a tabela transacao_produto e produtos, conectando-as pela coluna IdProduto. Assim, cada transação é associada à descrição do produto correspondente;

    - `SELECT t1.*, t2.DescDescricaoProduto`: seleciona todas as colunas de transacao_produto (t1.*) e a coluna DescDescricaoProduto da tabela produtos (t2);

    - `LIMIT 10`: retorna apenas as 10 primeiras linhas desse resultado combinado.

---

- **CONCAT():** Junta textos.

    ```sql

    SELECT CONCAT(nome, ' - ', cidade) 
    FROM CLIENTES;

- **Explicação da consulta acima:**

    - Essa consulta irá retornar uma nova coluna resultante da junção dos valores das colunas nome e cidade, separados por " - " (um hífen com espaços), como: "Ana - Natal".

---

- **ALIAS (AS):** Usada para renomear/apelidar colunas ou tabelas;

---

- **ROUND():** Arredonda valores numéricos;

---

- **LENGTH() / CHAR_LENGTH():** Comprimento de texto;

---

- **UPPER() / LOWER():** Transforma em maiúsculas/minúsculas.
