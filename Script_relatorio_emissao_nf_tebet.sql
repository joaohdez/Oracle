SELECT n.atendimento_id
,n.paciente_id      
,cl.nome
,n.nf_numero
,n.nf_data_emissao
,c.valor
,c.data_pagamento
,c.vencimento
,c.valor_recebido
,u.nome usuario_emitente
FROM atendimento_solicitacao_nf n
INNER JOIN fin_contas_receber c 
ON(c.atendimento_id = n.atendimento_id)
INNER JOIN clientes cl ON(cl.id = n.paciente_id)
INNER JOIN users u ON(u.id = n.user_created)
WHERE n.user_created = 170
-- and n.atendimento_id = 458064
 AND DATE(nf_data_emissao) BETWEEN '2023-12-01' AND '2023-12-31'
ORDER BY nf_data_emissao DESC