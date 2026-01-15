-- 1) Buscar o nome e ano dos filmes
SELECT Nome, Ano FROM Filmes;

-- 2) Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, ANo, Duracao FROM Filmes ORDER BY Ano ASC;

-- 3) Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome like '%De Volta para o Futuro%';

-- 4) Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano = 1997;

-- 5) Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao FROM Filmes WHERE Ano > 2000;

-- 6) Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao FROM Filmes WHERE (Duracao > 100 AND Duracao < 150) ORDER BY Duracao ASC;

-- 7) Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT * FROM (SELECT Ano, Count(*) 'quantidade'
               FROM Filmes
               GROUP BY Ano) QtdFilmesPorAno ORDER BY quantidade DESC;

-- 8) Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT Id, PrimeiroNome, UltimoNome,Genero FROM Atores WHERE Genero = 'M';

-- 9) Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT Id, PrimeiroNome, UltimoNome, Genero FROM Atores WHERE Genero = 'F' ORDER BY PrimeiroNome;

-- 10) Buscar o nome do filme e o gênero
SELECT
    tb1.Nome, tb3.Genero
FROM
    Filmes tb1
JOIN FilmesGenero tb2
    ON tb1.Id = tb2.IdFilme
JOIN Generos tb3 ON
        tb2.IdGenero = tb3.Id

-- 11) Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT
    tb1.Nome, tb3.Genero
FROM
    Filmes tb1
JOIN FilmesGenero tb2
    ON tb1.Id = tb2.IdFilme
JOIN Generos tb3 ON
        tb2.IdGenero = tb3.Id
WHERE tb3.Genero = 'Mistério'

-- 12) Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT
    tb3.Nome, tb2.PrimeiroNome, tb2.UltimoNome, tb1.Papel
FROM
    ElencoFilme tb1
JOIN Atores tb2
ON tb1.IdAtor = tb2.Id
JOIN Filmes tb3
ON tb1.IdFilme = tb3.Id
