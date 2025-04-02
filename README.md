# 📊 Análise de Departamentos - PostgreSQL

**Consulta SQL para análise salarial por departamento**  

## 📋 Descrição
Este projeto contém uma consulta SQL avançada para PostgreSQL que analisa dados de departamentos, empregados e seus vencimentos, gerando um relatório completo com métricas salariais.

## ✨ Features
- Calcula média, maior e menor salário por departamento
- Contagem de empregados por setor
- Ordenação automática por média salarial
- Tratamento de valores nulos com `COALESCE`
- Arredondamento decimal para melhor visualização

## 🛠️ Como usar
1. Execute o script no PostgreSQL:
```sql
SELECT 
    d.nome AS departamento,
    COUNT(e.matr) AS quantidade_empregados,
    ROUND(COALESCE(AVG(v.valor), 0), 2) AS media_salarial,
    ROUND(COALESCE(MAX(v.valor), 0), 2) AS maior_salario,
    ROUND(COALESCE(MIN(v.valor), 0), 2) AS menor_salario
FROM departamento d
LEFT JOIN empregado e ON d.cod_dep = e.lotacao
LEFT JOIN emp_venc ev ON e.matr = ev.matr
LEFT JOIN vencimento v ON ev.cod_venc = v.cod_venc
GROUP BY d.cod_dep, d.nome
ORDER BY media_salarial DESC;
