--****LOG DE EXECUÇÃO PARA O MURDER MYSTERY SQL****--
--****PULE PARA A LINHA 89 PARA ENCONTRAR A ASSASSINA EM UMA CONSULTA****--
SELECT description FROM crime_scene_report WHERE date = 20180115, type = 'murder', --erro #1 -> sintaxe de WHERE errada
city = 'SQL City';

SELECT description FROM crime_scene_report WHERE date = 20180115 AND type = 'murder' AND --a descrição do crime de assassinato de acordo com a data e cidade dadas
city = 'SQL City';                                                                       --(Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".)


SELECT name FROM person WHERE address_street_name = 'Northwestern Dr'; --todos os residentes de Northwestern Dr

SELECT name, address_number FROM person WHERE address_street_name = 'Northwestern Dr'; --acima, junto com seus respectivos números de endereço

SELECT name, address_number FROM person WHERE address_street_name = 'Northwestern Dr' --erro #2 -> sintaxe errada de ORDER BY
ORDER BY DESC;

SELECT name, address_number FROM person WHERE address_street_name = 'Northwestern Dr' --todos os residentes de Northwestern Dr, ordenados por endereço de maior número para menor
ORDER BY address_number DESC;                                                         --última casa: número 4919, residente Morty Schapiro (testemunha 1)

SELECT id FROM person WHERE name = 'Morty Schapiro'; --id da primeira testemunha (14887)

SELECT transcript FROM interview WHERE person_id = 14887; --entrevista com a primeira testemunha, Morty Schapiro (I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".)


--procurar o id da segunda testemunha para entrevistá-la
SELECT id FROM person WHERE address_street_name = 'Franklin Ave' AND name = 'Annabel'; --não retorna nada

SELECT id FROM person WHERE name = 'Annabel'; --não retorna nada, não há pessoas chamadas Annabel no banco


--continuar a procurar de acordo com o que foi dito pela primeira testemunha
SELECT person_id, name, membership_status FROM get_fit_now_member WHERE id LIKE '48Z%'; --retorna o id, nome e o tipo de membresia dos membros com id de membro começando com 48Z membros gold (suspeitos) =  28819, Joe Germuska e 67318, Jeremy Bowers

SELECT id FROM drivers_license WHERE plate_number LIKE '%H42W%'; --retorna os id's das habilitações de motorista que incluem H42W (183779, 423327, 664760)

SELECT id, name FROM person WHERE license_id IN (183779, 423327, 664760); --retorna os id's e nomes dos id's das habilitações encontradas acima (51739, 67318, 78193)

--as consultas coincidem em 67318, Jeremy Bowers, ele é o principal suspeito
--assumindo-o como o culpado
INSERT INTO solution VALUES (1, 'Jeremy Bowers'); --retorna-o como o assassino, porém há algo a mais, para isso o jogo recomenda o jogador a entrevistar o culpado (Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.)
        SELECT value FROM solution;

SELECT transcript FROM interview WHERE person_id = 67318; --entrevista com o assassino, que revela ter sido contratado (I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.)


SELECT id,name FROM person WHERE license_id IN (SELECT id FROM drivers_license WHERE height BETWEEN 65 AND 67 AND hair_color = 'red' AND gender = 'female' AND car_model = 'Tesla Model S')
												AND id IN (SELECT person_id FROM facebook_event_checkin WHERE event_name = 'SQL Symphony Concert' AND CAST(date as text) LIKE '201712%');
                                                --aqui tentei encontrar a verdadeira culpada em uma consulta só, porém não obtive resultado

--separando a consulta acima
SELECT person_id FROM facebook_event_checkin WHERE event_name = 'SQL Symphony Concert'  --retorna todos os id's que assistiram ao evento em dezembro de 2017
													AND CAST(date as text) LIKE '201712%';

SELECT person_id FROM facebook_event_checkin WHERE COUNT(event_name = 'SQL Symphony Concert'
													AND CAST(date as text) LIKE '201712%') = 3; --tentativa de filtrar 1 = erro #3 -> uso errado de COUNT()

SELECT COUNT(person_id) FROM facebook_event_checkin WHERE person_id IN (SELECT person_id FROM facebook_event_checkin
																		WHERE event_name = 'SQL Symphony Concert'
																		AND CAST(date as text) LIKE '201712%');  --tentativa de filtrar 2 = retorna quantas pessoas compareceram ao evento em dezembro de 2017

SELECT person_id,COUNT(person_id) FROM facebook_event_checkin WHERE person_id IN (SELECT person_id FROM facebook_event_checkin  --separa as pessoas por quantidade de vezes a comparecer na SQL Symphony Concert em 12/2017
																		WHERE event_name = 'SQL Symphony Concert'
																		AND CAST(date as text) LIKE '201712%')
																GROUP BY person_id;
                               
SELECT person_id,COUNT(person_id) FROM facebook_event_checkin WHERE person_id IN (SELECT person_id FROM facebook_event_checkin  --acima, porém apenas quem compareceu 3 vezes. Id's resultantes = 19260, 19292, 24556, 58898, 92343, 99716.
																		WHERE event_name = 'SQL Symphony Concert'
																		AND CAST(date as text) LIKE '201712%')
																GROUP BY person_id HAVING COUNT(person_id) = 3;

SELECT id, name FROM person WHERE license_id IN (SELECT id FROM drivers_license WHERE     --tentativa #1 de encontrar id's e nomes que coincidem com as informações de descrição da habilitação. Não retornou nada.                
												 hair_color = 'red' AND gender = 'female'
												 AND car_model = 'Tesla Model S' 
												 AND height BETWEEN 65 AND 67);

SELECT id, name FROM person WHERE license_id IN (SELECT id FROM drivers_license WHERE      --tentativa #2 de encontrar id's e nomes que coincidem com as informações de descrição da habilitação. Nome de modelo de carro estava escrito errado, desta vez temos 3 suspeitos (78881, Red Korb; 90700, Regina George; 99716, Miranda Priestly.)        
												 hair_color = 'red' AND gender = 'female'
												 AND car_model LIKE '%Model S' 
												 AND height BETWEEN 65 AND 67);


--id coincidente: 99716. Miranda Priestly é a verdadeira culpada.
INSERT INTO solution VALUES (1, 'Miranda Priestly'); --Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!
        
        SELECT value FROM solution;



--****SOLUÇÃO EM UMA CONSULTA -> CONTRATANTE DO ASSASSINO****--
SELECT * FROM (SELECT id AS person_id, name FROM person WHERE license_id IN (SELECT id FROM drivers_license WHERE                      
												 hair_color = 'red' AND gender = 'female'
												 AND car_model LIKE '%Model S' 
												 AND height BETWEEN 65 AND 67)) JOIN (SELECT person_id, event_name, COUNT(person_id) AS event_attendances, date AS event_date FROM facebook_event_checkin WHERE person_id IN (SELECT person_id FROM facebook_event_checkin
																		WHERE event_name = 'SQL Symphony Concert'                                                                                                                    
																		AND CAST(date as text) LIKE '201712%')
																GROUP BY person_id HAVING COUNT(person_id) = 3) USING(person_id); 
              