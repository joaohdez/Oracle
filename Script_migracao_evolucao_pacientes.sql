/* Script para migração de evoluções de pacientes   */

SELECT *FROM clientes WHERE id = 337676

SELECT *FROM atendimentos
WHERE id IN(240417,243107,244868,247216,249661)

SELECT id, cliente_id, DATA,internacao_data_hora_saida FROM atendimentos WHERE id = 249661    
SELECT *FROM clientes WHERE id  = 337676


UPDATE cliente_historicos
SET atendimento_id = 249661  
WHERE cliente_id = 337676 
AND created BETWEEN '2024-03-08 00:00:00' AND '2024-03-20 23:59:00'

SELECT *FROM atendimentos WHERE cliente_id = 337676
ORDER BY 1 DESC

-- order by 1 desc 

-- 240417 243107 244868 247216 249661 



-- 17

SELECT *FROM tipo_historias WHERE nome LIKE '%Medica%'

select date(now())


