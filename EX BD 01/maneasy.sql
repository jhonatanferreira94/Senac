create database maneaesy;

use maneaesy;

create table tb_profissional(
id_profissional varchar (6) primary key, 
nome_profissional varchar (50) not null,
email varchar (50) not null,
horas_contrato int (3) not null
);

create table tb_hardskill(
id_hardskill int primary key,
descricao varchar (20)
);

create table tb_profHard(
	id_prof varchar (6),
	id_hard int,
	foreign key tb_profHard1(id_prof) references tb_profissional(id_profissional),
	foreign key tb_profHard2(id_hard) references tb_hardskill(id_hardskill)
);

create table tb_projeto(
id_projeto int (4) auto_increment primary key,
nome_projeto varchar (100) not null,
duracao int (5) not null
);

create table tb_profProj(
id_projProf varchar (6) not null,
id_projHard int (4),
foreign key tb_profProj1(id_projProf) references tb_profissional(id_profissional),
foreign key tb_profProj2(id_projHard) references tb_projeto(id_projeto)
);

INSERT INTO tb_profissional (id_profissional, nome_profissional, email, horas_contrato) values
  ("277457","Joelle Preston","sem@hotmail.edu",220),
  ("754419","Minerva Herring","luctus.ut.pellentesque@protonmail.org",220),
  ("224895","Glenna Lawson","quisque.ac.libero@protonmail.com",220),
  ("224334","Buckminster Osborne","pharetra.felis@aol.net",220),
  ("900404","Cyrus Le","eros@protonmail.com",220),
  ("742257","Erica Roberts","integer.id.magna@hotmail.com",220),
  ("759243","Nomlanga Herman","in@google.com",220),
  ("593437","Brenden Bender","tellus.phasellus@aol.net",220),
  ("967030","Unity Mcdonald","in.condimentum.donec@icloud.edu",220),
  ("856138","Kelly Perez","vel.pede.blandit@outlook.com",220),
  ("785735","Francis Mccullough","nec.mauris@aol.edu",220),
  ("858314","Stella Mcguire","magna@yahoo.edu",220),
  ("647010","Yael Daniel","dignissim.maecenas.ornare@google.com",220),
  ("536742","Raphael Rosa","cursus@protonmail.ca",220),
  ("232245","Penelope Lowery","nulla@outlook.ca",220),
  ("319003","Walker Bowen","nunc.lectus.pede@hotmail.ca",220),
  ("244739","Gisela Lane","ullamcorper.duis@aol.com",220),
  ("624176","Damian Compton","vel@google.couk",220),
  ("824175","Caryn Lucas","id.libero@outlook.org",220),
  ("012869","Graiden Jensen","interdum.ligula@hotmail.edu",220),
   ("376236","Xaviera Kim","a.ultricies.adipiscing@yahoo.org",220),
  ("675117","Imogene Hanson","erat.volutpat@icloud.com",220),
  ("614354","Katelyn Alexander","bibendum.ullamcorper@google.org",220),
  ("262261","Callie Daniels","et.rutrum@yahoo.edu",220),
  ("326777","Howard Bradford","eros.nec.tellus@yahoo.com",220),
  ("104697","TaShya Mack","arcu@yahoo.org",220),
  ("633553","Regina Copeland","velit.sed@protonmail.net",220),
  ("784539","Flynn Pennington","nunc.id@google.couk",220),
  ("355788","Jesse Patton","nisl.nulla@google.couk",220),
  ("865105","Iola Robles","sagittis@yahoo.net",220);
  
  
select * from tb_profissional;

INSERT INTO tb_hardskill ( id_hardskill, descricao) VALUES 
(1, "Java"),
(2, "Python"),
(3, "Rails"),
(4, "C#"),
(5, "Swift"),
(6, "PHP"),
(7, "JavaScript"),
(8, "Ruby"),
(9, "HTML"),
(10, "CSS"),
(11, "React"),
(12, "Angular");

select * from tb_hardskill;

INSERT INTO tb_profHard (id_prof, id_hard) VALUES
("277457", 2),
("754419", 3),
("224895", 6),
("224334", 6),
("900404", 8),
("742257", 5),
("759243", 9),
("593437", 12),
("967030", 9),
("856138", 2),
("785735", 3),
("858314", 1),
("647010", 5),
("536742", 8),
("232245", 9),
("319003", 11),
("244739", 12),
("624176", 4),
("824175", 10),
("012869", 7),
("376236", 2),
("675117", 4),
("614354", 7),
("262261", 9),
("326777", 10),
("104697", 11),
("633553", 3),
("784539", 2),
("355788", 1),
("865105", 2);

select * from tb_profHard;

INSERT INTO tb_projeto (nome_projeto, duracao) VALUES
("Criação de landing page para padaria do João", 374),
("Correção dos erros no front end - Projeto João", 617),
("Correção dos erros no front end - Projeto João", 585),
("Melhorias no ecommerce - Projetos Maria", 270),
("Criação do sistemas para Genciamento do Antonio", 951),
("Correção dos erros no front end - Projeto João", 424),
("Melhorias no ecommerce - Projetos Maria", 518),
("Correção dos erros no front end - Projeto João", 622),
("Melhorias no ecommerce - Projetos Maria", 788),
("Correção dos erros no front end - Projeto João", 562),
("Criação de e commerce para Farmácia", 368),
("Correção dos erros no front end - Projeto João", 363),
("Melhorias no ecommerce - Projetos Maria",622),
("Criação de landing page para padaria do João",068),
("Criação de landing page para padaria do João",589),
("Correção dos erros no front end - Projeto João",436),
("Criação de landing page para padaria do João",740),
("Criação de landing page para padaria do João",666),
("Melhorias no ecommerce - Projetos Maria",477),
("Criação de e commerce para Farmácia da MarIa",883),
("Correção dos erros no front end - Projeto João",404),
("Criação de e commerce para Farmácia da MarIa",747),
("Melhorias no ecommerce - Projetos Maria",046),
("Criação de landing page para padaria do João",511),
("Criação do sistemas para Genciamento do Antonio",827),
("Criação do sistemas para Genciamento do Antonio",615),
("Criação de e commerce para Farmácia da MarIa",125),
("Melhorias no ecommerce - Projetos Maria",243),
("Melhorias no ecommerce - Projetos Maria",828),
("Melhorias no ecommerce - Projetos Maria",252);

select * from tb_projeto;

INSERT INTO tb_profProj ( id_projProf, id_projHard) VALUES 
("104697", "1");

select * from tb_profProj;

INSERT INTO tb_profProj ( id_projProf, id_projHard) VALUES 
("224334", "1"),
("224895", "2"),
("232245", "3"),
("244739", "9"),
("262261", "10"),
("277457", "6"),
("319003", "20"),
("326777", "5"),
("355788", "9"),
("376236", "8"),
("536742", "6"),
("593437", "11"),
("614354", "6"),
("624176", "12"),
("633553", "3"),
("647010", "30"),
("675117", "6"),
("742257", "7"),
("754419", "17"),
("759243", "19"),
("784539", "21"),
("785735", "22"),
("824175", "23"),
("856138", "26"),
("858314", "18"),
("865105", "11"),
("900404", "1"),
("967030", "14");

select * from tb_profProj;

SELECT * FROM tb_profissional
WHERE nome_profissional IN ("Cyrus Le");

SELECT * FROM tb_profissional
WHERE nome_profissional LIKE 'C%';

SELECT * FROM tb_profissional
WHERE nome_profissional LIKE '%C%';

SELECT * FROM tb_profissional
WHERE nome_profissional NOT LIKE '%C%';

SELECT * FROM tb_projeto  
WHERE duracao BETWEEN 270 AND 460;

SELECT *
FROM tb_profissional as pro
INNER JOIN tb_profHard as har
on pro.id_profissional = har.id_prof;

SELECT *
FROM tb_profissional as pro
INNER JOIN tb_profProj as proj
on pro.id_profissional = proj.id_projProf;

SELECT *
FROM tb_profissional as pro, tb_hardskill as har, tb_profHard as ph
where pro.id_profissional = ph.id_prof
and har.id_hardskill = ph.id_hard;

SELECT *
FROM tb_profissional as pro, tb_projeto as proj , tb_profproj as pp
where pro.id_profissional = pp.id_projProf
and pp.id_projHard = proj.id_projeto;

SELECT *
FROM tb_profissional as pro, tb_projeto as proj , tb_profproj as pp
where pro.id_profissional = pp.id_projProf
and pp.id_projHard = proj.id_projeto
and duracao BETWEEN 270 AND 460;

SELECT *
FROM tb_profissional as pro, tb_projeto as proj , tb_profproj as pp
where pro.id_profissional = pp.id_projProf
and pp.id_projHard = proj.id_projeto
and nome_projeto LIKE '%João%';

SELECT *
FROM tb_profissional as pro, tb_hardskill as har, tb_profHard as ph
where pro.id_profissional = ph.id_prof
and har.id_hardskill = ph.id_hard
and descricao LIKE '%Java';

SELECT *
FROM tb_profissional as pro, tb_hardskill as har, tb_profHard as ph
where pro.id_profissional = ph.id_prof
and har.id_hardskill = ph.id_hard
and descricao LIKE '%Java'
and nome_profissional LIKE '%Stella%';

SELECT *
FROM tb_profissional as pro, tb_projeto as proj , tb_profproj as pp
where pro.id_profissional = pp.id_projProf
and pp.id_projHard = proj.id_projeto
and duracao BETWEEN 270 AND 460
and nome_profissional LIKE '%Brenden%';

SELECT *
FROM tb_profissional as pro, tb_projeto as proj , tb_profproj as pp
where pro.id_profissional = pp.id_projProf
and pp.id_projHard = proj.id_projeto
and id_projeto BETWEEN 10 AND 15;

SELECT *
FROM tb_profissional as pro, tb_projeto as proj , tb_profproj as pp
where pro.id_profissional = pp.id_projProf
and pp.id_projHard = proj.id_projeto
and id_projeto=10;

























  

