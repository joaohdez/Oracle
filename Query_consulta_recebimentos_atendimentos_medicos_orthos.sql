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

/*

atendimento_documentos


SELECT 
a.id              AS atendimento
,a.data           AS dt_atendimento
,c.nome           AS paciente
,c.cpf            AS cpf
,a.total_liquido  AS total_recebido
,ad.valor_total   AS valor_total
,ad.valor_parcela AS valor_parcela	
,ad.vencimento    AS vencimento
,ad.primeiro_pagamento AS primeiro_pagamento
,ad.data_emissao  AS data_emissao
,ad.texto_documento AS texto_recibo
,s.nome           AS medico
FROM atendimentos a
INNER JOIN atendimento_documentos
ad ON(a.id = ad.`atendimento_id`)
INNER JOIN clientes c 
ON(c.`id` = a.`cliente_id`)
INNER JOIN solicitante s
ON(s.id = a.`solicitante_id`)
WHERE a.`situacao_id` = 1
AND WHERE a.`data` BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY a.`data` ASC

SELECT *FROM atendimento_documentos
WHERE atendimento_id = 481807


SELECT *FROM atendimentos WHERE id = 481807

SELECT 
 ad.atendimento_id
,ad

FROM atendimento_documentos ad

SELECT *FROM 
*/
