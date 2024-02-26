SELECT
a.id               AS atendimento
,a.data            AS dt_atendimento 
,c.nome            AS paciente 
,c.cpf             AS cpf  
,a.total_liquido   AS total_recebido
,s.nome            AS medico
FROM atendimentos  a INNER JOIN clientes c
ON(a.`cliente_id` = c.`id`)
INNER JOIN solicitantes s
ON(s.`id` = a.`solicitante_id`)
WHERE a.`data` BETWEEN '2023-01-01' AND '2023-12-31'
AND a.`situacao_id` = 1
ORDER BY a.`data` ASC