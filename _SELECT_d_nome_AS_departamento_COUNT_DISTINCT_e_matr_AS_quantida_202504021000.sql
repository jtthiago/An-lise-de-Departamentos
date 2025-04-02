INSERT INTO "SELECT 
    d.nome AS departamento,
    COUNT(DISTINCT e.matr) AS quantidade_empregados,
    ROUND(AVG(COALESCE(v.valor, 0)), 2) AS media_salarial,
    MAX(COALESCE(v.valor, 0)) AS maior_salario,
    MIN(COALESCE(v.valor, 0)) AS menor_salario
FROM 
    departamento d
LEFT JOIN 
    divisao di ON d.cod_dep = di.cod_dep
LEFT JOIN 
    empregado e ON di.cod_divisao = e.lotacao_div
LEFT JOIN 
    emp_venc ev ON e.matr = ev.matr
LEFT JOIN 
    vencimento v ON ev.cod_venc = v.cod_venc
WHERE 
    v.tipo = 'V' OR v.tipo IS NULL
GROUP BY 
    d.cod_dep, d.nome
ORDER BY 
    media_salarial DESC" (departamento,quantidade_empregados,media_salarial,maior_salario,menor_salario) VALUES
	 ('Engenharia',6,2719.23,4500.00,300.00),
	 ('TI',9,2469.57,5000.00,0),
	 ('Contabilidade',6,1968.75,3750.00,300.00);
