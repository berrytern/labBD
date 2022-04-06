#e) 
SELECT laboratorio.nome, avaliacao.nota
FROM laboratorio
INNER JOIN avaliacao
ON avaliacao.referencia_laboratorio = laboratorio.referencia


#b) 
select laboratorio.referencia, laboratorio.nome
FROM laboratorio
INNER JOIN solicitacao
ON solicitacao.referencia_laboratorio = laboratorio.referencia

#g)
select laboratorio.referencia, solicitacao.status
from laboratorio
inner join solicitacao
on solicitacao.referencia_laboratorio = laboratorio.referencia
where solicitacao.status = 'aberto'


#h)
SELECT laboratorio.referencia, bancada.registro_mobilia as bancada, cadeira.registro_mobilia as cadeira 
FROM laboratorio
INNER JOIN mobilia
inner join bancada 
inner join cadeira
#on mobilia.referencia_laboratorio = laboratorio.referencia
#on bancada.registro_mobilia = mobilia.registro
on cadeira.registro_mobilia = mobilia.registro
WHERE bancada.registro_mobilia >= 10 AND cadeira.registro_mobilia >= 10
order by laboratorio.referencia


#a)
SELECT l.referencia AS id, CONCAT(l.rua ,' ', l.bloco, ' ',ca.bairro)AS localização, l.nome from laboratorio l join campus ca on ( ca.id = l.id_campus ) inner join computador c on (c.referencia_laboratorio = l.referencia) inner join instala i on (i.registro_computador = c.registro) inner join software s on (i.registro_software = s.registro) inner join responsavel_tecnico t on (t.matricula = i.matricula_tecnico) where s.nome LIKE '%Linux%' and l.data_criacao >='2000-01-01' and t.nome LIKE '%Pedro%' group by l.nome;

#f)
SELECT l.nome, count(distinct s.registro) as total_licencas FROM laboratorio l inner join computador c on (c.referencia_laboratorio = l.referencia) inner join instala i on (i.registro_computador = c.registro) inner join software s on (i.registro_software = s.registro)  where l.bloco like 'ciac' group by l.nome;


#c)
SELECT professor.matricula, professor.nome, responsavel_tecnico.nome, solicitacao.status
FROM professor	
INNER JOIN solicitacao
INNER JOIN responsavel_tecnico
where responsavel_tecnico.nome= 'Joao' AND solicitacao.status = 'aberto'
Group by solicitacao.status


#d)
SELECT responsavel_tecnico.nome, responsavel_tecnico.referencia_laboratorio, COUNT(solicitacao.referencia_laboratorio)
FROM responsavel_tecnico
INNER JOIN solicitacao
where responsavel_tecnico.referencia_laboratorio = solicitacao.referencia_laboratorio
group by responsavel_tecnico.nome



