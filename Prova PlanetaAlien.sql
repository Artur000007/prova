CREATE DATABASE avoltadoplanetaalien;
USE avoltadoplanetaalien;

CREATE TABLE verbo (
    id INT PRIMARY KEY auto_increment,
    nomeverbo VARCHAR(40),
    fk_bloom_id INT
);

CREATE TABLE bloom (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(40)
);


CREATE TABLE historia (
    id INT PRIMARY KEY auto_increment,
    titulo VARCHAR(150),
    descricao LONGTEXT,
    final VARCHAR(200)
);

CREATE TABLE competencia (
    id INT PRIMARY KEY auto_increment,
    descricao LONGTEXT,
    fk_verbo_id INT
);

CREATE TABLE etapa (
    id INT PRIMARY KEY auto_increment,
    instrucao LONGTEXT,
    ponto INT,
    tipo NCHAR(1),
    fk_verbo_id INT
);

CREATE TABLE Missao (
    id INT PRIMARY KEY auto_increment,
    hash nchar(22),
    titulo VARCHAR(80),
    forca INT,
    fk_competencia_id INT,
    fk_etapa_id INT
);

CREATE TABLE MissaoHistoria (
    id INT PRIMARY KEY auto_increment,
    fk_Missao_id INT,
    fk_historia_id INT
);
 
ALTER TABLE competencia ADD CONSTRAINT FK_competencia_2
    FOREIGN KEY (fk_verbo_id)
    REFERENCES verbo (id)
    ON DELETE CASCADE;
 
ALTER TABLE verbo ADD CONSTRAINT FK_verbo_2
    FOREIGN KEY (fk_bloom_id)
    REFERENCES bloom (id)
    ON DELETE CASCADE;
 
ALTER TABLE etapa ADD CONSTRAINT FK_etapa_2
    FOREIGN KEY (fk_verbo_id)
    REFERENCES verbo (id)
    ON DELETE CASCADE;
 
ALTER TABLE Missao ADD CONSTRAINT FK_Missao_2
    FOREIGN KEY (fk_competencia_id)
    REFERENCES competencia (id)
    ON DELETE CASCADE;
 
ALTER TABLE Missao ADD CONSTRAINT FK_Missao_3
    FOREIGN KEY (fk_etapa_id)
    REFERENCES etapa (id)
    ON DELETE CASCADE;
 
ALTER TABLE MissaoHistoria ADD CONSTRAINT FK_MissaoHistoria_2
    FOREIGN KEY (fk_Missao_id)
    REFERENCES Missao (id)
    ON DELETE CASCADE;
 
ALTER TABLE MissaoHistoria ADD CONSTRAINT FK_MissaoHistoria_3
    FOREIGN KEY (fk_historia_id)
    REFERENCES historia (id)
    ON DELETE CASCADE;
    /*-------------------------------------------------------------------------------------------------------------------------------------------*/
    
    insert into verbo(nomeverbo,fk_bloom_id)values('listar',1),('relembrar',1),('reconhcer',1),('identificar',1),('localizar',1),('descrever',1),('citar',1),
('esquematizar',2),('relacionar',2),('explicar',2),('demonstrar',2),('parafrasear',2),('associar',2),('converter',2),
('utilizar',3),('emplementar',3),('modificar',3),('experimentar',3),('calcular',3),('demonstrar',3),('classificar',3),
('resolver',4),('categorizar',4),('diferenciar',4),('comparar',4),('explicar',4),('integrar',4),('investigar',4),
('defender',5),('delimitar',5),('estimar',5),('selecionar',5),('justificar',5),('comparar',5),('explicar',5),
('elaborar',6),('desenhar',6),('produzir',6),('prototipar',6),('traçar',6),('idear',6),('inventar',6);
    /*------------------------------------------------------------------------------------------------------------------------------------------*/
    select * from verbo;
    
    drop table verbo;
    
    SELECT competencia.descricao, verbo.nomeverbo
    FROM competencia
    INNER JOIN verbo ON competencia.fk_verbo_id= verbo.id;
    
    
    /*------------------------------------------------------------------------------------------------------------------------------------------*/
    insert into bloom(nome)values('memorizar');
     insert into bloom(nome)values('compreender');
      insert into bloom(nome)values('aplicar');
       insert into bloom(nome)values('analisar');
        insert into bloom(nome)values('avaliar');
         insert into bloom(nome)values('criar');
         
         delete from bloom where id >6;
         select * from bloom;
   /*--------------------------------------------------------------------------------------------------------------------------------------------*/      
   
   insert into historia(titulo,descricao,final)values('Planeta Alien',
'No ano de 3250 a terra foi destruída por alienígenas do Planeta Alien. Esses extraterrestes
eram desenvolvedores de tecnologia avançada em seu planeta, mas aprenderam com os
humanos a linguagem de marcação HTML, a linguagem de estilização CSS e a linguagem de
programação Java Script.
Antes de destruir a terra por inteiro, escolheu um casal de cada Mamífero e fez uma mutação
genética com a tecnologia do planeta Alien e as tecnologias aprendidas no planeta Terra:
HTML, CSS e Java Script.
Todos os Mamíferos mutantes, aceitaram tranquilamente a mutação genética, mas um e
apenas um, chamado de Furão Mutante Guerreiro, não aceitou. Ele foi levado para o Planeta
Alien, mas a sua memória ainda continuou na terra. Um dia essas memórias se misturaram
com sua mutação genética e ele se revoltou contra os aliens.
A revolta fez nascer missões. E cada missão ganha um nível de força que o torna mais poderoso
aumentando a possibilidade de destruir mais aliens e assim salvar também os seus amigos
terrestres.
O jogo possuirá 10 missões:
1. Encontrar Tags (força nível 1)
a. O furão deve encontrar as principais “tags html” para matar um inimigo.
2. Encontrar “Selectores” (força nível 2)
3. Encontrar “Scripts” (força nível 3)
4. Encontrar “Exceptions” (força nível 4)
5. Encontrar “Conditions” (força nível 5)
6. Encontrar “Loops” (força nível 6)
7. Encontrar “Arrays” (força nível 7)
8. Encontrar “Functions” (força nível 8)
9. Encontrar “Objects” (força nível 9)
10. Encontrar “Databases” (força nível 10)',

'Ao final de todas as missões, todos os “Aliens” serão destruídos e o Furão irá resgatar seus
amigos e construir um novo planeta com justiça e paz.');

select * from historia;

delete from historia where id >1;

update historia set descricao = 'No ano de 3250 a terra foi destruída por alienígenas do Planeta Alien. Esses extraterrestes
eram desenvolvedores de tecnologia avançada em seu planeta, mas aprenderam com os
humanos a linguagem de marcação HTML, a linguagem de estilização CSS e a linguagem de
programação Java Script.
Antes de destruir a terra por inteiro, escolheu um casal de cada Mamífero e fez uma mutação
genética com a tecnologia do planeta Alien e as tecnologias aprendidas no planeta Terra:
HTML, CSS e Java Script.
Todos os Mamíferos mutantes, aceitaram tranquilamente a mutação genética, mas um e
apenas um, chamado de Furão Mutante Guerreiro, não aceitou. Ele foi levado para o Planeta
Alien, mas a sua memória ainda continuou na terra. Um dia essas memórias se misturaram
com sua mutação genética e ele se revoltou contra os aliens.
A revolta fez nascer missões. E cada missão ganha um nível de força que o torna mais poderoso
aumentando a possibilidade de destruir mais aliens e assim salvar também os seus amigos
terrestres.'; 


select * from missaohistoria;
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

insert into competencia(descricao)values('a competência usa o verbo bloom para poder executar alguma missão, você pode usar a tabela bloom ao seu favor para poder executar tal');
   delete from competencia where id >1;

select * from competencia;

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


insert into etapa(instrucao,ponto,tipo)values
('Encontrar Tags',1,'H'),
('Encontrar “Selectores”',2,'H'),
('Encontrar “Scripts”',3,'H'),
('Encontrar “Exceptions”',4,'H'),
('Encontrar “Conditions”',5,'H'),
('Encontrar “Loops”',6,'H'),
('Encontrar “Arrays”',7,'H'),
('Encontrar “Functions”',8,'H'),
('Encontrar “Objects”',9,'H'),
('Encontrar “Databases”',10,'H');

select * from etapa;
delete from etapa where id = 2;

update etapa set fk_verbo_id = 226 where id = 1;
update etapa set fk_verbo_id = 238 where id = 12;
update etapa set fk_verbo_id = 241 where id = 3;
update etapa set fk_verbo_id = 244 where id = 4;
update etapa set fk_verbo_id = 254 where id = 5;
update etapa set fk_verbo_id = 265 where id = 6;
update etapa set fk_verbo_id = 233 where id = 7;
update etapa set fk_verbo_id = 242 where id = 8;
update etapa set fk_verbo_id = 252 where id = 9;
update etapa set fk_verbo_id = 260 where id = 11;



/*----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

insert into missao(titulo,forca)values('Encontrar Tags',1),
('Encontrar “Selectores”',2),
('Encontrar “Scripts”',3),
('Encontrar “Exceptions”',4),
('Encontrar “Conditions”',5),
('Encontrar “Loops”',6),
('Encontrar “Arrays”',7),
('Encontrar “Functions”',8),
('Encontrar “Objects”',9),
('Encontrar “Databases”',10);

select * from missaohistoria;

update missao set fk_etapa_id = 1 where id = 1;
update missao set fk_etapa_id = 3 where id = 2;
update missao set fk_etapa_id = 4 where id = 3;
update missao set fk_etapa_id = 5 where id = 4;
update missao set fk_etapa_id = 6 where id = 5;
update missao set fk_etapa_id = 7 where id = 6;
update missao set fk_etapa_id = 8 where id = 7;
update missao set fk_etapa_id = 9 where id = 8;
update missao set fk_etapa_id = 10 where id = 9;
update missao set fk_etapa_id = 11 where id = 10;
update missao set fk_etapa_id = 12 where id = 1;

DELETE FROM missao where id >10;
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

show tables;

desc etapa;

