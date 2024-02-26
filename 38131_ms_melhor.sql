SELECT *FROM empresa
WHERE situacaocad IN('Inativo')
ORDER BY nomefantasia	ASC

SELECT *FROM financeiro_forma_quitacao

SELECT *FROM movimentoempresa

SELECT *FROM financeiro_contasreceber
WHERE data_recebimento = '2024-02-15' AND quitado_por IS NULL