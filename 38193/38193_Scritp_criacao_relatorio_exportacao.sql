
SELECT
c.id                 prontuario
,c.nome              Nome 
,c.nascimento        Data_nasc  
,c.sexo              Sexo
,c.cpf               CPF
,p.nome              Procedimento
,at.created          Data_aplicacao_vacina
,at.atendimento_id   Atendimento
,m.nome              profissional
FROM atendimento_procedimentos AT
INNER JOIN atendimentos a ON (at.atendimento_id = a.id)
INNER JOIN clientes c ON(c.id = a.cliente_id)
LEFT JOIN 

SELECT *FROM clientes WHERE id =  86567

SELECT *FROM cliente_documentos WHERE tipo_id = 28

SELECT *FROM atendimento_modelo_documentos

Select *from cliente_documentos

