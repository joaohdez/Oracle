SELECT id
,procedimento_id
,atendimento_id
,valor_base
,valor_fatura
,quantidade
,medico_id
,situacao_id
,codigo
,total
,fatura_encerramento_id
,COUNT(*) AS quantidade
FROM atendimento_procedimentos a
WHERE fatura_encerramento_id = 3149
AND situacao_id = 1
AND atendimento_id NOT IN(324802,322481,326084,322462,325226,325817,324474,326441,325622)
GROUP BY 
procedimento_id
,atendimento_id
,valor_base
,valor_fatura
,quantidade
,medico_id
,situacao_id
,codigo
,total
,fatura_encerramento_id
HAVING COUNT(*) >1
