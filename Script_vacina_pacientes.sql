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
,cd.descricao        documento_vacina
,cd.created           criacao_documento
,u.nome               criado_por

FROM atendimento_procedimentos AT
INNER JOIN atendimentos a ON (at.atendimento_id = a.id)
INNER JOIN clientes c ON(c.id = a.cliente_id)
INNER JOIN procedimentos p ON(p.id = at.procedimento_id)
INNER JOIN grupo_procedimentos gp ON(gp.id = p.grupo_id)
INNER JOIN medico_responsaveis m ON(m.id = at.medico_id)
LEFT JOIN cliente_documentos cd ON(cd.cliente_id = c.id)
LEFT JOIN tipo_documentos td ON(td.id = cd.tipo_id)
LEFT JOIN users u ON(u.id =cd.user_id)
WHERE gp.id = 23
AND cd.descricao LIKE '%Vacina%'