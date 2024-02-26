SELECT 
b.nome          AS beneficiario
,b.cpf          AS cpf_beneficiario
,b.dtanasc      AS dt_nasc_beneficiario 
,b.endereco     AS endereco_beneficiario   
,b.email        AS email_beneficiario
,b.telefoneres  AS telefoneres_beneficiario
,b.telefonecel  AS telefonecel_beneficiario
,(SELECT nome FROM beneficiario WHERE id = b.beneftitular_id) AS Titular
,(SELECT cpf FROM beneficiario WHERE id = b.beneftitular_id)AS Cpf_titular
,(SELECT dtanasc FROM beneficiario WHERE id = b.beneftitular_id) AS dtanasc_titular
FROM beneficiario b
WHERE b.situacaocad = 'Ativo'
AND b.beneftitular_id IS NOT NULL
ORDER BY b.nome ASC
