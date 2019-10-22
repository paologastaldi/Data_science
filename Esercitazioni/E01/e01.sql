/*
Gastaldi Paolo
s277393
22-10-19
esercitazione 1
*/

-- query 1
SELECT Tariffa.Tipo_tariffa, Tempo.Anno, SUM(Fatti.Prezzo) AS Tot_tariffa_anno,
    SUM(SUM(Fatti.Prezzo)) OVER() AS Tot,
    SUM(SUM(Fatti.Prezzo)) OVER(PARTITION BY Tariffa.Tipo_tariffa) AS Tot_tariffa,
    SUM(SUM(Fatti.Prezzo)) OVER(PARTITION BY Tempo.Anno) AS Tot_anno
FROM Tariffa, Tempo, Fatti
WHERE Tariffa.Id_tar = Fatti.Id_tar
    AND Tempo.Id_tempo = Fatti.Id_tempo
GROUP BY Tariffa.tipo_tariffa, Tempo.Anno;

-- query 2
SELECT Tempo.Mese, SUM(Fatti.Chiamate) AS Num_tel, SUM(Fatti.Prezzo) AS Tot,
    DENSE_RANK() OVER (
        ORDER BY SUM(Fatti.Prezzo) DESC) AS Rank_prezzi
FROM Tempo, Fatti
WHERE Tempo.Id_tempo = Fatti.Id_tempo
GROUP BY Tempo.Mese;

-- query 3
SELECT Tempo.Mese, SUM(Fatti.Chiamate) AS Num_tel,
    DENSE_RANK() OVER (
        ORDER BY SUM(Fatti.Chiamate) DESC) AS Rank_tel
FROM Tempo, Fatti
WHERE Tempo.Id_tempo = Fatti.Id_tempo
    AND Tempo.Anno = 2003
GROUP BY Tempo.Mese;

-- query 4
/*DA VERIFICARE*/
SELECT Tempo.Data,
    AVG(Fatti.Chiamate) OVER(
        PARTITION BY Tempo.Data
        ORDER BY Tempo.Data
        RANGE BETWEEN INTERVAL '2' DAY PRECEDING AND CURRENT ROW) AS Tel_3_giorni
FROM Tempo, Fatti
WHERE Tempo.Id_tempo = Fatti.Id_tempo
    AND Tempo.Mese = '7-2003' 
GROUP BY Tempo.Data;

-- query 5
SELECT 

FROM

GROUP BY