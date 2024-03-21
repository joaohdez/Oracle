SELECT DISTINCT
       a.id                           cod_agenda
      ,a.cliente_id                   prontuario  
      ,g.nome                         agenda
      ,s.nome                         situacao_agenda 
      ,a.inicio                       inicio_agenda 
      ,a.fim                          fim_agenda  
      ,a.modified                     horario_alteracao_agenda
      ,u.nome                         usuario_criacao_agenda 
      ,ua.nome                        usuario_modificador_agenda 
      FROM agendas a INNER JOIN
      clientes c ON(a.cliente_id = c.id)
      INNER JOIN grupo_agendas g ON(g.id = a.grupo_id)
      INNER JOIN users u ON(u.id = a.user_id)
      INNER JOIN users ua ON(a.user_update  = ua.id)        
      INNER JOIN situacao_agendas s ON(s.id = a.situacao_agenda_id)
      WHERE a.situacao_agenda_id = 90
      AND a.cliente_id = 48504
      GROUP BY a.id ASC
      