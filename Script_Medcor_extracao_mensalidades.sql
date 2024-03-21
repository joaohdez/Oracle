
SELECT `a`.`id` AS `Atendimento`,
CAST(CONCAT(`a`.`data`,' ',`a`.`hora`) AS DATETIME) AS `DiaHora`,
`a_tipo`.`nome` AS `TipoAtendimento`,
`a`.`data` AS `DtFicha`,
DAYOFWEEK(`a`.`data`) AS `DiaDaSemana`,
`a`.`hora` AS `TempoAtendimento`,
`a`.`hora` AS `Hora`,
CAST(CONCAT(`a`.`data`,' ',`a`.`hora`) AS DATETIME) AS `dtHora`,
`ap`.`id` AS `id`,
`ap`.`quantidade` AS `quantidade`,
`ap`.`valor_caixa` AS `vl_caixa`,
`ap`.`total` AS `vl_faturar`,
`ap`.`valor_material` + `ap`.`valor_caixa` AS `vl_matmed`,
`ap`.`total` + `ap`.`valor_caixa` + `ap`.`valor_material` AS `vl_cx_fatura_matmed`,
`ap`.`total` + `ap`.`valor_caixa` + `ap`.`valor_material` + `ap`.`virtual_total_equipe` AS `vl_cx_fatura_matmed_equipe`,
`ap`.`virtual_total_equipe` AS `vl_equipe`,
`ap`.`digitado` AS `digitado`,
`ap`.`situacao_id` AS `situacao_id`,
`ap`.`user_id` AS `user_id`,
`ap`.`created` AS `created`,
`ap`.`medico_id` AS `Revisor`,
IF(`conve`.`tipo_id` = 1,'Conferidas',`situacao_faturas`.`nome`) AS `FaturaSituacao`,
`ap`.`recebido_total` AS `FaturaRecebidoVl`,
`ap`.`recebido_total_dt` AS `FaturaRecebidoDt`,
IF(`conve`.`tipo_id` = 1,
'Recebido',IF(`situacao_recebimentos`.`nome` IS NULL,'Nao Recebido',
`situacao_recebimentos`.`nome`)) AS `FaturaRecebidoSituacao`,
`a`.`cliente_id` AS `PacienteId`,
`conve`.`tipo_id` AS `ConvenioTipo`,
`cli`.`nome` AS `PacienteNome`,
`proc`.`nome` AS `ExameNome`,
`gruproc`.`id` AS `GrupoExame`,
`gruproc`.`nome` AS `GrupoNome`,
`conve`.`nome` AS `ConvenioNome`,
`med`.`nome` AS `ProfissionalNome`,
`solic`.`nome` AS `Solicitante`,
`users`.`nome` AS `UsuarioNome`,
`a`.`unidade_id` AS `UnidadeID`,
`unidades`.`nome` AS `UnidadeNome`,
`a`.`agenda_id` AS `AgendaID`
 FROM ((((((((((((`atendimento_procedimentos` `ap` 
 JOIN `atendimentos` `a` ON(`ap`.`atendimento_id` = `a`.`id`))
 JOIN `tipo_atendimentos` `a_tipo` ON(`a`.`tipo` = `a_tipo`.`id`))
 JOIN `clientes` `cli` ON(`cli`.`id` = `a`.`cliente_id`))
 JOIN `procedimentos` `proc` ON(`proc`.`id` = `ap`.`procedimento_id`))
 JOIN `grupo_procedimentos` `gruproc` ON(`gruproc`.`id` = `proc`.`grupo_id`))
 JOIN `convenios` `conve` ON(`a`.`convenio_id` = `conve`.`id`))
 JOIN `medico_responsaveis` `med` ON(`med`.`id` = `ap`.`medico_id`)) 
 JOIN `solicitantes` `solic` ON(`solic`.`id` = `ap`.`solicitante_id`))
 JOIN `users` ON(`users`.`id` = `a`.`user_id`))
 JOIN `situacao_faturas` ON(`situacao_faturas`.`id` = `ap`.`situacao_fatura_id`))
 JOIN `unidades` ON(`a`.`unidade_id` = `unidades`.`id`))
 LEFT JOIN `situacao_recebimentos` ON(`situacao_recebimentos`.`id` = `ap`.`recebimento_total_situacao_id`)) 
 WHERE `a`.`situacao_id` = 1 
 AND `ap`.`situacao_id` = 1
 AND `a`.`data` BETWEEN '2024-02-01' AND '2024-02-29')
