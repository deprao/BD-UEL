--****LOG DE EXECUÇÃO PARA O SELECT STAR SQL****-- Sumário: --Linha 5-> Beazley's Last Statement;
                                                            --Linha 40-> Claims of Innocence; 
                                                            --Linha 98-> The Long Tail;  
                                                            --Linha 172-> Execution Hiatuses;
--**Beazley's Last Statement**--                            --Linha 251-> Closing Remarks and Challenge Questions.
--"The SELECT Block"
SELECT first_name, last_name, last_statement -- o primeiro nome, o último nome e as últimas palavras dos três primeiros detentos do banco.
FROM executions
LIMIT 3;

--"The FROM Block"

--Retorna os três primeiros nomes da tabela; pede para arrumar o erro presente na consulta.
SELECT first_name FROM execution LIMIT 3; --erro: tabela "execution" não existe.

SELECT first_name FROM executions LIMIT 3; --correção da consulta acima.

--Consulta abaixo foi modificada para dividir 50 e 51 por 2 (demonstrar que não precisa do bloco FROM para obter resultados independentes de uma tabela).
SELECT 50 / 2, 51 / 2; --tanto 50/2 quanto 51/2 resultam em 25, já que ambos são assumidos como inteiros.

 SeLeCt   first_name,last_name --demonstração sobre como SQL não possui regras de capitalização e espaçamento, consulta retorna Karla Tucker.
  fRoM      executions
           WhErE ex_number = 145;

--"The WHERE Block"
SELECT first_name, last_name, ex_age FROM executions --nomes, sobrenomes e idade de execução dos detentos com 25 anos de idade ou menos ao serem executados.
WHERE ex_age <= 25;

SELECT first_name, last_name, ex_number --retorna Raymond Landry e seu número de execução, 29. Esta consulta demonstra o uso da cláusula LIKE.
FROM executions
WHERE first_name LIKE 'Ray%'
  AND last_name LIKE 'Lan%';

SELECT 0 AND (0 OR 1); --retorna 0, demonstração sobre operadores lógicos e parentização.

SELECT last_statement FROM executions  --retorna as últimas palavras de Napoleon Beazley: The act I committed to put me here was not just heinous, it was senseless. But the person that committed that act is no longer here - I am. I'm not going to struggle physically against any restraints. I'm not going to shout, use profanity or make idle threats. Understand though that I'm not only upset, but I'm saddened by what is happening here tonight. I'm not only saddened, but disappointed that a system that is supposed to protect and uphold what is just and right can be so much like me when I made the same shameful mistake. If someone tried to dispose of everyone here for participating in this killing, I'd scream a resounding, "No." I'd tell them to give them all the gift that they would not give me...and that's to give them all a second chance. I'm sorry that I am here. I'm sorry that you're all here. I'm sorry that John Luttig died. And I'm sorry that it was something in me that caused all of this to happen to begin with. Tonight we tell the world that there are no second chances in the eyes of justice...Tonight, we tell our children that in some instances, in some cases, killing is right. This conflict hurts us all, there are no SIDES. The people who support this proceeding think this is justice. The people that think that I should live think that is justice. As difficult as it may seem, this is a clash of ideals, with both parties committed to what they feel is right. But who's wrong if in the end we're all victims? In my heart, I have to believe that there is a peaceful compromise to our ideals. I don't mind if there are none for me, as long as there are for those who are yet to come. There are a lot of men like me on death row - good men - who fell to the same misguided emotions, but may not have recovered as I have. Give those men a chance to do what's right. Give them a chance to undo their wrongs. A lot of them want to fix the mess they started, but don't know how. The problem is not in that people aren't willing to help them find out, but in the system telling them it won't matter anyway. No one wins tonight. No one gets closure. No one walks away victorious. (porra, bonito hein)
WHERE first_name = 'Napoleon' AND last_name = 'Beazley';


--**Claims of Innocence**--

--"The COUNT Function"
SELECT COUNT(last_statement) FROM executions; --retorna o número de detentos que deram um último discurso logo antes de serem executados.

SELECT (0 IS NOT NULL) AND ('' IS NOT NULL); --demonstração que diz respeito sobre valores nulos, retorna verdadeiro em relação a falso e cadeia vazia não serem nulos.

SELECT COUNT(first_name) FROM executions; --retorna o número de detentos no banco, a coluna first_name nunca será nula.

--"Variations on COUNT"
SELECT COUNT(*) FROM executions; --mesmo que acima, porém generalizado, já que nem sempre saberemos quais colunas nunca serão nulas.

SELECT                                         --retorna o número de execuções nos condados de Harris e Bexar, respectivamente. COUNT com CASE WHEN não possui ELSE senão conta a mais.
    COUNT(CASE WHEN county='Harris' THEN 1 END),
    COUNT(CASE WHEN county='Bexar' THEN 1 END)
FROM executions;

--"Practice"
SELECT COUNT(*) FROM executions WHERE ex_age > 50; --retorna o número de detentos que tinham mais de 50 anos de idade durante sua execução.

SELECT COUNT(*) FROM executions WHERE last_statement = null; --retornaria o número de detentos que não deram um último discurso, porém a atribuição se encontra errada e retorna 0.

SELECT COUNT(*) FROM executions WHERE last_statement IS null; --correção acima. Retorna 110.

SELECT                                                       --consulta acima, com CASE WHEN.
COUNT(CASE WHEN last_statement IS null THEN 1 END)
FROM executions;

SELECT COUNT(*) - COUNT(last_statement) FROM executions;   --consulta acima, com duas funções COUNT.

SELECT MIN(ex_age), MAX(ex_age), AVG(ex_age) FROM executions; --mínima, máxima e média de idade de todos os detentos na hora da execução.

SELECT AVG(length(last_statement)) FROM executions; --média de comprimento (em caracteres) dos últimos discursos de todos os detentos.

SELECT DISTINCT county FROM executions; --lista dos condados, sem duplicação.

--"A Strange Query"
SELECT first_name, COUNT(*) FROM executions; --retorna o primeiro nome da primeira linha no banco, junto com a quantidade de todos os detentos no banco.

SELECT COUNT(*)/COUNT(last_statement) FROM executions --retornaria a proporção de detentos que se denominariam inocente em seu último discurso, porém retorna rerrado por ser uma divisão de inteiros e com os operandos no local errado.
WHERE last_statement LIKE '%innocent%';

SELECT COUNT(*)*1.0/COUNT(last_statement) FROM executions --continua retornando errado, os operandos estão invertidos.
WHERE last_statement LIKE '%innocent%';

SELECT                                       --continua retornando errado, talvez seja um erro de cláusula. (WHERE vai depois do bloco de declaração do SELECT)
COUNT(last_statement)*1.0
/ COUNT(*)
FROM executions
WHERE last_statement LIKE '%innocent%';

SELECT 
COUNT(CASE WHEN last_statement              --correção acima, com CASE WHEN.
	  LIKE '%innocent%' THEN 1 END)*1.0
/ COUNT(*)
FROM executions;


--**The Long Tail**--

--"The GROUP BY Block"
SELECT                  --retorna a quantidade de execuções por condado.
  county,
  COUNT(*) AS county_executions
FROM executions
GROUP BY county;

SELECT                  --retornaria a quantidade de execuções com ou sem último discurso para cada condado, porém a consulta está incorreta. 
  county,
  COUNT(*)
FROM executions
GROUP BY county, last_statement;

SELECT                    --segunda tentativa acima, a consulta está errada pois deveria retornar duas linhas, não colunas.
  county,
  COUNT(last_statement),
  COUNT(*) - COUNT(last_statement)
FROM executions
GROUP BY county;

SELECT                    --terceira tentativa acima, não procede pois não retorna linhas sem último discurso nulo.
  county,
  COUNT(*)
FROM executions
GROUP BY county, CASE WHEN last_statement IS null
							THEN 1 ELSE 0 END;

SELECT                    --quarta tentativa acima, apenas inverte a posição das linhas.
  county,
  COUNT(*) AS last_statements
FROM executions
GROUP BY county, CASE WHEN last_statement IS null
							THEN 0 ELSE 1 END;

SELECT                    --fiquei confuso e recorri à solução, eram pra ser duas colunas mesmo.
  county,                                 
  last_statement IS NOT null AS has_last_statement,
  COUNT(*)
FROM executions
GROUP BY county, has_last_statement;

--"The HAVING Block"
SELECT county,COUNT(*) FROM executions WHERE ex_age >= 50   --retorna o número de detentos executados de 50 anos de idade ou mais para cada condado.
GROUP BY county;

SELECT county,COUNT(*) AS old_execs FROM executions WHERE ex_age >= 50 --retornaria os condados com mais de dois detentos executados de 50 anos de idade ou mais, porém há erro de sintaxe no HAVING.
GROUP BY county HAVING > 2;

SELECT county,COUNT(*) AS old_execs FROM executions         --segunda tentativa, incorreta.
WHERE ex_age >= 50 GROUP BY county HAVING old_execs > 2;

SELECT county FROM executions                               --a tentativa acima está correta, porém o enunciado pedia apenas a coluna de condados.
WHERE ex_age >= 50 GROUP BY county HAVING COUNT(*) > 2;

--"Practice"
SELECT county FROM executions GROUP BY county; --similar à SELECT DISTINCT county FROM executions.

--"Nested Queries"
SELECT first_name, last_name                --retorna o nome e último sobrenome do detento com o último discurso mais longo. (Gary Graham)
FROM executions                             --demonstra o uso de consultas aninhadas.
WHERE LENGTH(last_statement) =
    (SELECT MAX(length(last_statement)) FROM executions);

SELECT                                      --retorna a porcentagem de execuções para cada condado. (também demonstra o bloco ORDER BY)
  county,
  100.0 * COUNT(*) / (SELECT COUNT(county) FROM executions)
    AS percentage
FROM executions
GROUP BY county
ORDER BY percentage DESC;


--**Execution Hiatuses**--

--"Dates"
SELECT '1993-08-10' - '1989-07-07' AS day_difference; --retornaria a diferença entre duas datas mas não é possível no formato simples de string.

SELECT julianday('1993-08-10') - julianday('1989-07-07') AS day_difference; --acima corrigido, convertendo datas para data juliana.

--"Self Joins"
SELECT ex_number, ex_date as last_ex_date --produzir a tabela "previous", que contém os números de execução relacionados à última data da execução antes de seus detentos - primeira tentativa - não retornou nada.
FROM executions
WHERE CASE WHEN ex_number < 553 
THEN ex_number = ex_number + 1
ELSE 0 END;

SELECT CASE WHEN ex_number < 553 THEN     --segunda tentativa - retornou errado.
ex_number = ex_number + 1 ELSE 0 END,
ex_date as last_ex_date
FROM executions ORDER BY last_ex_date ASC;

SELECT CASE WHEN ex_number < 553 THEN  --terceira tentativa - GROUP BY não alterou o resultado.
ex_number = ex_number + 1 ELSE 0 END,
ex_date as last_ex_date
FROM executions GROUP BY ex_number ORDER BY last_ex_date ASC;

SELECT (CASE WHEN ex_number < 553 THEN      --quarta tentativa - continua errrada - resultado conflitante com o último ex_number.
ex_number + 1 ELSE null END) AS ex_number,
ex_date as last_ex_date
FROM executions ORDER BY last_ex_date ASC;

SELECT 
ex_number + 1 AS ex_number,               --quinta tentativa, ainda há o mesmo conflito.
ex_date as last_ex_date
FROM executions 
GROUP BY ex_number HAVING ex_number <= 553
ORDER BY last_ex_date ASC;

SELECT                                      --sexta tentativa, o conflito era resultado do apelido dado (por ser igual, as cláusulas levam em conta o padrão.), reduzir o limite de número de execução corrigiu.
ex_number + 1 AS ex_number,
ex_date as last_ex_date
FROM executions 
WHERE ex_number <= 552;

SELECT                              --aninhamento da consulta acima em um JOIN para mostrar hiatos entre execuções.
  last_ex_date AS start,
  ex_date AS end,
  JULIANDAY(ex_date) - JULIANDAY(last_ex_date)
    AS day_difference
FROM executions
JOIN (SELECT 
ex_number + 1 AS ex_number,
ex_date as last_ex_date
FROM executions 
WHERE ex_number <= 552) previous
  ON executions.ex_number = previous.ex_number
ORDER BY day_difference DESC
LIMIT 10;

SELECT                                  --refinamento da consulta acima - primeira tentativa - falhou.
  previous.ex_date AS start,
  executions.ex_date AS end,
  JULIANDAY(executions.ex_date) - JULIANDAY(previous.ex_date)
    AS day_difference
FROM executions
JOIN executions previous
  ON previous.ex_number = executions.ex_number + 1
ORDER BY day_difference DESC
LIMIT 10;

SELECT                                  --correção acima.
  previous.ex_date AS start,
  executions.ex_date AS end,
  JULIANDAY(executions.ex_date) - JULIANDAY(previous.ex_date)
    AS day_difference
FROM executions
JOIN executions previous
  ON previous.ex_number = executions.ex_number - 1
ORDER BY day_difference DESC
LIMIT 10;

--**Closing Remarks and Challenge Questions**--

--"Senate Cosponsorship Dataset"

--1) Encontre o senador com mais co-patrocínios mútuos

SELECT MAX(COUNT(cosponsor_name)) FROM cosponsors; --primeira tentativa - uso errado de COUNT() e MAX().

SELECT COUNT(cosponsor_name) FROM cosponsors --consulta para visualização melhor.
GROUP BY sponsor_name;

SELECT sponsor_name,                          --segunda tentativa, erro de sintaxe no aninhamento.
MAX(SELECT COUNT(cosponsor_name) FROM cosponsors)
	AS cosponships FROM cosponsors;

SELECT sponsor_name, COUNT(cosponsor_name) AS cosponships --terceira tentativa, incorreta.
FROM cosponsors
GROUP BY sponsor_name ORDER BY cosponships DESC LIMIT 1;

SELECT sponsor_name FROM cosponsors         --quarta tentativa, incorreta.
GROUP BY sponsor_name 
HAVING COUNT(cosponsor_name)
ORDER BY COUNT(cosponsor_name) DESC LIMIT 1;

WITH mutuals AS (                               --fiquei confuso, solução do problema dada pelo tutorial;
  SELECT DISTINCT                               --antes de selecionar, utiliza-se o WITH para criar uma tabela temporária que indica os patrocínios mútuos utilizando um self join;
    c1.sponsor_name AS senator,                 --com a tabela de patrocínios mútuos construída, basta apenas organizar uma seleção que ordene os senadores pela quantidade decrescente de linhas da tabela associadas a eles;
    c2.sponsor_name AS senator2                 --limitando a seleção para apenas uma linha obtém o resultado.
  FROM cosponsors c1
  JOIN cosponsors c2
    ON c1.sponsor_name = c2.cosponsor_name
    AND c2.sponsor_name = c1.cosponsor_name
)

SELECT senator, COUNT(*) AS mutual_count
FROM mutuals
GROUP BY senator
ORDER BY mutual_count DESC
LIMIT 1;

--2) Encontre o senador com mais co-patrocínios mútuos para cada estado

WITH mutuals AS (                                     --não consigo saber se esta primeira tentativa está errada ou não, ela derruba a página não importa o limite de linhas (muito provavelmente que sim).
  SELECT DISTINCT
    c1.sponsor_name AS senator,
    c2.sponsor_name AS senator2
  FROM cosponsors c1
  JOIN cosponsors c2
    ON c1.sponsor_name = c2.cosponsor_name
    AND c2.sponsor_name = c1.cosponsor_name
)

SELECT senator, COUNT(*) AS mutuals_count FROM mutuals
JOIN (SELECT sponsor_state FROM cosponsors)
GROUP BY sponsor_state, senator LIMIT 50;

WITH mutuals AS (                                   --segunda tentativa, retornou o número de patrocínios mútuos para cada senador em cada estado
  SELECT DISTINCT
    c1.sponsor_name AS senator,
  	c1.sponsor_state AS state,
    c2.sponsor_name AS senator2,
  	c2.sponsor_state AS state2
  FROM cosponsors c1
  JOIN cosponsors c2
    ON c1.sponsor_name = c2.cosponsor_name
  	AND c1.sponsor_state = c2.cosponsor_state
    AND c2.sponsor_name = c1.cosponsor_name
  	AND c2.sponsor_state = c1.cosponsor_state
)

SELECT state, senator, COUNT(*) AS mutuals_count FROM mutuals
GROUP BY state, senator LIMIT 50;

WITH mutuals AS (                                  --terceira tentativa, mesmo resultado que a segunda.
  SELECT DISTINCT
    c1.sponsor_name AS senator,
  	c1.sponsor_state AS state,
    c2.sponsor_name AS senator2,
  	c2.sponsor_state AS state2
  FROM cosponsors c1
  JOIN cosponsors c2
    ON c1.sponsor_name = c2.cosponsor_name
  	AND c1.sponsor_state = c2.cosponsor_state
    AND c2.sponsor_name = c1.cosponsor_name
  	AND c2.sponsor_state = c1.cosponsor_state
),

mut_count AS ( SELECT state AS most_state, 
senator AS most_senator, COUNT(*) AS mutuals_count
FROM mutuals GROUP BY most_state, most_senator)

SELECT most_state, most_senator, MAX(mutuals_count)
FROM mut_count GROUP BY most_state, most_senator;

WITH mutuals AS (                               --quarta tentativa, ainda incorreta.
  SELECT DISTINCT
    c1.sponsor_name AS senator,
  	c1.sponsor_state AS state,
    c2.sponsor_name AS senator2,
  	c2.sponsor_state AS state2
  FROM cosponsors c1
  JOIN cosponsors c2
    ON c1.sponsor_name = c2.cosponsor_name
  	AND c1.sponsor_state = c2.cosponsor_state
    AND c2.sponsor_name = c1.cosponsor_name
  	AND c2.sponsor_state = c1.cosponsor_state
),

mut_count AS (SELECT COUNT(*) AS mutuals_count 
			  FROM mutuals),
max_mutuals AS (SELECT MAX(mutuals_count) 
				FROM mut_count)

SELECT state, senator FROM mutuals
JOIN max_mutuals					  
GROUP BY state, senator LIMIT 50;

WITH mutuals AS (                               --quinta tentativa, continua falhando.
  SELECT DISTINCT
    c1.sponsor_name AS senator,
  	c1.sponsor_state AS state,
    c2.sponsor_name AS senator2,
  	c2.sponsor_state AS state2
  FROM cosponsors c1
  JOIN cosponsors c2
    ON c1.sponsor_name = c2.cosponsor_name
  	AND c1.sponsor_state = c2.cosponsor_state
    AND c2.sponsor_name = c1.cosponsor_name
  	AND c2.sponsor_state = c1.cosponsor_state
),

mut_count AS (SELECT state, senator, COUNT(*) AS mutuals_count 
			  FROM mutuals GROUP BY state, senator),
max_mutuals AS (SELECT state, MAX(mutuals_count) AS max_count
				FROM mut_count GROUP BY state)

SELECT mut_count.state, mut_count.senator,
mut_count.mutuals_count FROM mut_count 
JOIN max_mutuals
ON mut_count.state = max_mutuals.state
AND mut_count.mutuals_count = max_mutuals.max_count LIMIT 50;

WITH mutuals AS (                               --sexta tentativa, sucesso. A falha anterior foi devido pela consulta ter limite de linhas de saída.
  SELECT DISTINCT
    c1.sponsor_name AS senator,
  	c1.sponsor_state AS state,
    c2.sponsor_name AS senator2,
  	c2.sponsor_state AS state2
  FROM cosponsors c1
  JOIN cosponsors c2
    ON c1.sponsor_name = c2.cosponsor_name
  	AND c1.sponsor_state = c2.cosponsor_state
    AND c2.sponsor_name = c1.cosponsor_name
  	AND c2.sponsor_state = c1.cosponsor_state
),

mut_count AS (SELECT state, senator, COUNT(*) AS mutuals_count 
			  FROM mutuals GROUP BY state, senator),
max_mutuals AS (SELECT state, MAX(mutuals_count) AS max_count
				FROM mut_count GROUP BY state)

SELECT mut_count.state, mut_count.senator,
mut_count.mutuals_count FROM mut_count 
JOIN max_mutuals
ON mut_count.state = max_mutuals.state
AND mut_count.mutuals_count = max_mutuals.max_count;

--3) Encontre os senadores que não protagonizaram no patrocínio de cartas

WITH names AS (SELECT sponsor_name, cosponsor_name FROM cosponsors) --primeira tentativa, não retorna nada.

SELECT cosponsors.cosponsor_name FROM cosponsors
JOIN names ON CASE WHEN names.sponsor_name IS null THEN
cosponsors.cosponsor_name = names.cosponsor_name END
LIMIT 50;

SELECT cosponsor_name FROM cosponsors             --segunda tentativa, sucesso! *a solução dada pelo select star demonstra o uso de LEFT JOIN com NULL para excluir linhas.
EXCEPT 
SELECT sponsor_name FROM cosponsors WHERE sponsor_name 
IS NOT cosponsor_name;