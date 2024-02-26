
-- select *from convenios where situacao_id = 1
-- and id > 377
SELECT
a.artigo_id
,b.nome
,a.codigo
,a.valor
,a.convenio_id
,c.nome
,a.processamento_tipo_tabela_matmed
,a.numero_processamento
,a.matmed_especifico_importacao_id
FROM fatura_precoartigo a
INNER JOIN estq_artigos b ON(a.artigo_id = b.id)
INNER JOIN convenios c ON(a.convenio_id = c.id)
WHERE a.situacao_id = 1
AND a.convenio_id IN (378,379)
GROUP BY 
a.artigo_id
,b.nome
,a.codigo
,a.valor
,a.convenio_id
,c.nome
,a.processamento_tipo_tabela_matmed
,a.numero_processamento
,a.matmed_especifico_importacao_id

