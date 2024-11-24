drop table magasin; drop table client;
drop table ticket; drop table produit; drop table stock; drop table detail_ticket;  drop table adresse;
drop table categorie;  drop sequence ticket_seq;

drop table sta_magasin; drop table sta_produit ; drop table sta_detail_ticket;
drop table sta_client; 

drop table dim_age; drop table dim_sexe; 
drop table dim_produit; drop table dim_ville ;drop table dim_temps;  drop table vente ;

---------OLTP TABLES----------------------------
create table magasin( id_magasin int primary key, nom_magasin varchar(20), tel int, id_adr int);
create table adresse (id_adr int, rue varchar(20), numero int, ville varchar(20), region varchar(20));

create table client (id_client int primary key, nom_client varchar(20), prenom_client varchar(20), sexe varchar(10), datenaissance date);

create table produit (id_produit int primary key, nom_produit varchar(20), prix_achat float, prix_vente float,  
                      id_categorie int);
create table categorie(id_categorie int, categorie varchar(20));

create table ticket (id_ticket int primary key, id_magasin int, idc int, dateVente date, montant float);
create table detail_ticket( id_ticket int, id_produit int, qte int); 


create table stock(id_magasin int, id_produit int,  qte_disponible int);
                       

----------------Staging Area Table---------------------

create table sta_magasin(  id_magasin int primary key,  ville varchar(20), region varchar(20));
create table sta_produit (id_produit int primary key, nom_produit varchar(20),  categorie varchar(20),
	                            Prix_achat float, prix_vente float);

create table sta_detail_ticket( id_ticket int, id_magasin int, id_produit int, ID_CLIENT int, 
	                                        dateVente date, qte int,prix_achat float, prix_vente float); 

create table sta_client (id_client int primary key,  sexe varchar(10), datenaissance date);


---------OLAP TABLES----------------------------


create table dim_produit (id_produit int primary key, nom_produit varchar(20),  categorie varchar(20),
	                     Prix_achat float,  prix_vente float);
create table dim_ville( id_ville int primary key,  ville varchar(20), region varchar(20));
create table dim_temps (id_temps int primary key, semestre int, annee int);
create table dim_sexe(id_sexe int, sexe varchar(10));
create table dim_age(id_age int, age int);

create table vente (id_produit int, id_ville int ,id_temps int, id_sexe int, id_age int,
	                                           avg_qte_vendue int, benefice float,
                    primary key(id_produit, id_ville  ,id_temps, id_sexe, id_age));



insert into magasin values (1, 'magasin1',0791253637, 1);  insert into adresse values(1,'abbade',2,'oran','ouest');
insert into magasin values (2, 'magasin2',0790253937, 2);  insert into adresse values(2,'djamel',56,'sba','ouest');
insert into magasin values (3, 'magasin3',0590253017, 3);  insert into adresse values(3,'madina',10,'alger','centre');
insert into magasin values (4, 'magasin4',0988938933, 4);  insert into adresse values(4,'palce du pont',89,'blida','centre');
insert into magasin values (5, 'magasin5',0838839393, 5);  insert into adresse values(5,'sourouk',29,'annaba','est');
insert into magasin values (6, 'magas,in6',0388393993, 6);  insert into adresse values(6,'kaki',70,'adrar','sud');	

insert into categorie values (1,'boisson');  insert into categorie values (2,'cafe');
insert into categorie values (3,'Biscuits');  insert into categorie values (4,'laitier');

 



insert into produit values (1, 'coca', 110,120,1);
insert into produit values (2, 'pepsi', 125,130,1);
insert into produit values (3, 'kassera', 60,75,1);
insert into produit values (4, 'rami', 100,125,1);
insert into produit values (5, 'hamoud',130,150,1);
  
insert into produit values (6, 'aroma', 170,200,2);
insert into produit values (7, '1001', 168,195,2);
insert into produit values (8, 'dozia', 150,175,2);

insert into produit values (9, 'bimo', 80,100,3);
insert into produit values (10, 'prince', 116,135,3);
insert into produit values (11, 'maxon', 75,90,3);

insert into produit values (12, 'candia', 75,90,4);
insert into produit values (13, 'soummam', 70,85,4);
insert into produit values (14, 'jnina', 26,30,4);
insert into produit values (15, 'bnina', 18,20,4);
insert into produit values (16, 'fort', 18,20,4);
insert into produit values (17, 'kiri', 120,140,4);
insert into produit values (18, 'vache-kiri', 90,100,4);
insert into produit values (19, 'cheezy', 75,85,4);



Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (1,'bdokiynch','SOUMIA','Femme',to_date('03-10-1979','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (2,'oqpzpjguv','Abdelaziz','Homme',to_date('25-11-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (3,'bbjky','ABDELKADIR','Homme',to_date('19-06-1981','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (4,'zinlfaj','MOHAMED ZOHEIR','Homme',to_date('03-06-1998','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (5,'rbntozeqn','AMEUR','Homme',to_date('01-12-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (6,'wirj','ALI','Homme',to_date('31-05-1970','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (7,'ajcvhq','BENYAMINA','Homme',to_date('09-08-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (8,'trywayb','HAYAT','Femme',to_date('07-03-1995','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (9,'gbeb','ABDELFETAH','Homme',to_date('24-08-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (10,'snejz','MHAMED','Homme',to_date('06-05-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (11,'svlrayd','GACEM','Homme',to_date('28-10-1983','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (12,'mczlxok','BRAHIM','Homme',to_date('18-03-1991','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (13,'fscoiody','SOFIANE','Homme',to_date('05-12-1995','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (14,'hobwh','YOUSSOUF','Homme',to_date('10-09-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (15,'ofyfjdgdt','Nacira','Femme',to_date('08-01-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (16,'rtxats','Bachir','Homme',to_date('02-08-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (17,'wkigo','TAYEB','Homme',to_date('20-04-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (18,'kilxbtq','LAAREDJ','Homme',to_date('27-12-1980','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (19,'cmimdf','MOHAMED RABIE','Homme',to_date('28-02-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (20,'adrifcigc','BACHIR','Homme',to_date('21-03-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (21,'nxwsyfdj','Fatima','Femme',to_date('27-02-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (22,'jzvkbhm','SOFIANE','Homme',to_date('12-07-1987','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (23,'zvyzcpbtc','Talia','Femme',to_date('27-06-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (24,'eyiab','HABIB','Homme',to_date('09-09-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (25,'edtfyxdjm','Abdelhamid','Homme',to_date('11-09-1981','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (26,'hpcqjs','MOHAMED','Homme',to_date('21-08-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (27,'uegurt','TAYEB','Homme',to_date('18-08-1994','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (28,'fgthqw','ABDELKADER','Homme',to_date('30-11-1976','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (29,'hrmwufoor','HANANE','Femme',to_date('20-09-1986','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (30,'oeoiic','MOHAMED','Homme',to_date('08-10-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (31,'yozwvhhf','ALI','Homme',to_date('04-11-1994','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (32,'kvmnxabb','MOHAMED ABDELDJALIL','Homme',to_date('30-06-1970','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (33,'nrobzesj','OMAR','Homme',to_date('26-06-1995','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (34,'uknbnn','Chahrazad','Femme',to_date('22-11-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (35,'qedflg','ABDELKADER','Homme',to_date('04-12-1992','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (36,'ioixet','Houaria','Femme',to_date('27-05-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (37,'inwdaoiin','MILOUD','Homme',to_date('04-03-1973','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (38,'cnfrsa','DJAMEL','Homme',to_date('10-02-1975','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (39,'shurkeshy','SOFIANE','Homme',to_date('07-07-1973','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (40,'xbrrgc','Hocine','Homme',to_date('24-02-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (41,'cuzzaqtr','BENAMER','Homme',to_date('09-12-1982','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (42,'oyfsdacg','Nacira','Femme',to_date('04-11-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (43,'fpprakn','MEDJAHED','Homme',to_date('02-12-1986','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (44,'bjoowmvk','Abdelkrim','Homme',to_date('14-03-1975','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (45,'dgzgprw','LAKHDER','Homme',to_date('22-06-1983','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (46,'jigiy','BOUALEM','Homme',to_date('17-12-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (47,'ysxbdcm','Fatiha','Femme',to_date('04-04-1980','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (48,'sjvfzfj','ARBA','Femme',to_date('22-04-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (49,'tcgeix','FATIHA','Femme',to_date('10-09-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (50,'eugx','ABDELKARIM','Homme',to_date('16-04-1982','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (51,'dlwwdlsel','Abdelkadr','Homme',to_date('24-09-1975','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (52,'jwvuhdaa','Abdelkader','Homme',to_date('25-10-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (53,'zzstv','BENAOUDA','Homme',to_date('24-09-1980','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (54,'mnrgbnd','NOUREDDINE','Homme',to_date('29-06-1991','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (55,'oqfodddu','MOHAMED','Homme',to_date('28-04-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (56,'kwrhlu','MOHAMED','Homme',to_date('02-02-1978','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (57,'kzpiw','MOHAMED','Homme',to_date('31-05-1991','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (58,'mdasyleca','Abdelhalim','Homme',to_date('31-01-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (59,'gvknjp','MOHAMED','Homme',to_date('22-10-1970','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (60,'kbhisp','BENAMEUR','Homme',to_date('20-12-1996','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (61,'lrhbxzjt','MUSTAPHA','Homme',to_date('09-04-1991','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (62,'maiu','MILOUD','Homme',to_date('26-04-1998','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (63,'hlthgg','ZOHIR','Homme',to_date('02-07-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (64,'hralc','AHMED','Homme',to_date('31-03-1976','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (65,'srnfy','MALIKA','Homme',to_date('01-04-1995','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (66,'rahfbi','Ameur','Homme',to_date('01-03-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (67,'iohm','ICHERAK NOUR ELIMANE','Femme',to_date('28-08-1972','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (68,'fpepnmdh','NOUREDDIN','Homme',to_date('18-09-1995','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (69,'qarodi','HADJ','Homme',to_date('31-12-1998','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (70,'dzgki','REKAI','Femme',to_date('31-07-1980','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (71,'pcfhhagcw','Tayeb','Homme',to_date('24-05-1992','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (72,'qnriufp','NOUREDDINE','Homme',to_date('21-02-1973','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (73,'rxfllc','M HAMED','Homme',to_date('12-05-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (74,'yywd','ALI','Homme',to_date('17-03-1981','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (75,'bnzvs','OUMELKHEIR','Femme',to_date('22-08-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (76,'igoad','KHALDIA','Femme',to_date('10-11-1992','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (77,'yqauitlox','MOHAMMED','Homme',to_date('14-09-1991','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (78,'ehnov','Kheira','Femme',to_date('28-10-1976','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (79,'ncbpvxc','BENAOUDA','Homme',to_date('17-05-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (80,'zlxzyzuqw','HOUCINE','Homme',to_date('14-10-1994','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (81,'ehfhe','Kadda','Homme',to_date('15-10-1974','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (82,'ocusavkif','YOUCEF','Homme',to_date('05-12-1993','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (83,'ksxjuyj','KARIMA','Femme',to_date('01-10-1975','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (84,'uudwisaiw','ZOHRA','Femme',to_date('17-02-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (85,'rpgpletlv','NORREDDINE','Homme',to_date('21-12-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (86,'czwrb','KHEDIDJA','Homme',to_date('17-08-1972','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (87,'xknpd','YOUCEF','Homme',to_date('09-05-1980','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (88,'glls','LARBI','Homme',to_date('29-08-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (89,'axxg','ABDELKADER','Homme',to_date('14-08-1996','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (90,'beuxcvkia','Fatima','Femme',to_date('30-03-1983','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (91,'bluvyw','YOUSSEF','Homme',to_date('02-06-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (92,'odwzbjh','ABBES','Homme',to_date('11-04-1993','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (93,'hvmtyjjz','AMER','Homme',to_date('30-10-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (94,'zwqfyute','KOUIDER','Homme',to_date('26-01-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (95,'kwwrjowuc','AMEL','Femme',to_date('27-09-1991','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (96,'hovr','MEROUANE','Homme',to_date('10-02-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (97,'korlqxo','Ahmed','Homme',to_date('15-10-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (98,'zywbbhno','MAAMAR','Homme',to_date('20-10-1993','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (99,'ulsalw','RACHID','Homme',to_date('20-01-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (100,'iktd','BENAHMED','Homme',to_date('09-10-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (101,'hjodrd','AMER','Homme',to_date('21-05-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (102,'hmanpjcfu','ABDELKRIM','Homme',to_date('02-11-1987','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (103,'zpoewg','MILOUD','Homme',to_date('30-03-1995','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (104,'hsbwoms','Abdelhamid','Homme',to_date('19-12-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (105,'anwd','HANANE','Homme',to_date('25-07-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (106,'gqmw','Ameur','Homme',to_date('14-08-1979','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (107,'bzbyq','Mohamed kamal','Homme',to_date('09-12-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (108,'iohctiayo','MOHAMED','Homme',to_date('03-04-1994','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (109,'xkdax','Ali','Homme',to_date('27-11-1975','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (110,'oxkao','ABDELKADER','Homme',to_date('17-10-1987','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (111,'gvchk','Yamina','Femme',to_date('22-06-1974','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (112,'zupka','BAKHTA','Femme',to_date('30-07-1979','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (113,'bdpfmhoxd','KADDOUR','Homme',to_date('21-03-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (114,'wpxil','Abdelkader','Homme',to_date('30-06-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (115,'umectl','MOHAMED','Homme',to_date('26-08-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (116,'tjdfeq','MOHAMED','Homme',to_date('02-10-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (117,'whfqni','HOUARIA','Femme',to_date('23-09-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (118,'deanaoq','Hadda','Femme',to_date('20-03-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (119,'cfwh','Nacera','Femme',to_date('31-03-1998','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (120,'dzrhikgt','KHALFALLAH','Homme',to_date('20-05-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (121,'zepodyu','Boumediene','Homme',to_date('19-09-1970','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (122,'zgwa','MOHAMED','Homme',to_date('23-11-1970','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (123,'zygsszh','KHEIRA','Femme',to_date('14-12-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (124,'armjbn','MOHAMED ALI','Homme',to_date('17-04-1983','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (125,'hxyfmkze','OUM EL KHEIR','Femme',to_date('06-06-1993','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (126,'xqsbxpn','MAAMAR','Homme',to_date('23-11-1976','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (127,'ycufgl','Soraya','Femme',to_date('25-02-1972','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (128,'trcujum','Khadidja','Femme',to_date('23-06-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (129,'ihwpp','AMEUR','Homme',to_date('30-09-1979','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (130,'zinx','NOUREDDINE','Homme',to_date('17-07-1980','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (131,'gltqsknc','Mokhtaria','Femme',to_date('16-09-1981','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (132,'bsawrpw','Larbi','Homme',to_date('23-04-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (133,'ogzvc','Fatima','Femme',to_date('22-08-1993','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (134,'huooaol','NADIR','Homme',to_date('16-06-1983','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (135,'ozjw','AMER','Homme',to_date('07-05-1998','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (136,'mpmqcs','AMER','Homme',to_date('02-09-1976','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (137,'fccfkr','LAMRI','Homme',to_date('23-08-1975','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (138,'xuzcxirkl','SACI','Homme',to_date('21-10-1986','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (139,'jjkpewab','Kods cheima','Femme',to_date('05-12-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (140,'eldzs','SABAH','Femme',to_date('08-06-1998','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (141,'ywak','MOHAMED SALAH','Homme',to_date('12-06-1970','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (142,'yxpkpkomp','SIHEM','Femme',to_date('05-05-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (143,'vetwt','NOUR EL HOUDA','Femme',to_date('06-04-1976','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (144,'iykc','Mohammed','Homme',to_date('20-04-1979','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (145,'ddavvml','IMAD','Homme',to_date('08-05-1972','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (146,'clndasbn','ABDELKARIM','Homme',to_date('23-08-1981','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (147,'tlrcz','YAZID','Homme',to_date('30-08-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (148,'kocpovzq','CHAMSEDDINE','Homme',to_date('24-07-1983','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (149,'tgdvew','DJEMAI','Homme',to_date('13-12-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (150,'gfgqxc','Farid','Homme',to_date('10-06-1975','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (151,'bxxjwsbd','ABDERZAK','Homme',to_date('10-04-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (152,'vmpmcncfk','MALEK RAYAN','Femme',to_date('23-12-1982','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (153,'vkglx','HALIMA','Femme',to_date('08-10-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (154,'ehofrf','HAMZA','Homme',to_date('16-03-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (155,'jfezuqf','HADDA','Femme',to_date('29-05-1978','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (156,'grkfjmda','KHAYRI','Homme',to_date('04-07-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (157,'pfhvqori','Djemoui','Homme',to_date('12-05-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (158,'bfawi','ABDESSELAM','Homme',to_date('27-01-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (159,'cgnvdeyua','AMINE','Homme',to_date('11-11-1988','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (160,'tcqoueqo','FARES','Homme',to_date('05-03-1999','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (161,'iwzw','SALAH','Homme',to_date('07-03-1980','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (162,'kavjjjvzq','OUSSAMA','Homme',to_date('19-09-1986','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (163,'hdvijbc','LAMIS','Homme',to_date('18-12-1979','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (164,'qifu','SOFIANE','Homme',to_date('21-11-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (165,'ecyzfsrtq','ABDELFATEH','Homme',to_date('03-10-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (166,'ktlrvy','Abdelouahab','Homme',to_date('09-09-1977','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (167,'efmwqxxr','SOUFIANE','Homme',to_date('25-05-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (168,'xiilcxbpr','NAWAL','Femme',to_date('13-11-1972','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (169,'mflwfclr','HAMZA','Homme',to_date('13-12-1974','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (170,'ttmeso','SALIM','Homme',to_date('27-03-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (171,'gbyc','Abdellatif','Homme',to_date('25-12-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (172,'yyuwvfkv','KHEMISSI','Homme',to_date('08-11-1976','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (173,'lbkjcoy','Zidane','Homme',to_date('28-04-1974','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (174,'xnbxmi','LOUARDI','Homme',to_date('11-04-1983','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (175,'mocnive','KHALISSA','Femme',to_date('06-05-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (176,'sawdtu','MOHAMED','Homme',to_date('21-04-1993','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (177,'wupxor','LYES','Homme',to_date('07-09-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (178,'pmcxvzk','IBTISSEM','Femme',to_date('25-03-1991','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (179,'fpaz','Rabie','Homme',to_date('16-11-1997','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (180,'iynao','Malek','Homme',to_date('22-12-1982','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (181,'xvmfis','FOUZI','Homme',to_date('21-10-1993','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (182,'jyhdfr','WAFA','Femme',to_date('22-05-1974','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (183,'cwiwnqfz','ABDELWAHAB','Homme',to_date('19-12-1979','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (184,'fwozqfd','OUSSAMA','Homme',to_date('16-02-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (185,'wkmohday','IMANE','Femme',to_date('28-04-1987','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (186,'zmemhkna','Ibtissem','Femme',to_date('24-10-1989','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (187,'flez','ALI','Homme',to_date('21-12-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (188,'amjip','MOURAD','Homme',to_date('26-05-1990','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (189,'vhbsrblbk','RIDHA','Homme',to_date('06-03-1998','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (190,'wkags','ABDELHAMID','Homme',to_date('01-08-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (191,'earjhdf','MERIEM','Femme',to_date('12-08-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (192,'stjvmrg','Lazhar','Homme',to_date('19-05-1984','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (193,'qfbd','RACHID','Homme',to_date('25-09-1973','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (194,'ftrucc','HALIM','Homme',to_date('09-01-1986','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (195,'ayvwjmtz','HANANE','Homme',to_date('28-03-1985','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (196,'qlgcise','FAROUK','Homme',to_date('22-01-1978','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (197,'lmmzfk','RAWIYA','Femme',to_date('24-12-1971','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (198,'awskwn','SAMRA','Homme',to_date('23-10-1981','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (199,'ixaxkbvyx','Youcef','Homme',to_date('29-12-1994','DD-MM-YYYY'));
Insert into CLIENT (ID_CLIENT,NOM_CLIENT,PRENOM_CLIENT,SEXE,DATENAISSANCE) values (200,'xqxhx','BOUCHERA','Femme',to_date('12-04-1990','DD-MM-YYYY'));


create sequence ticket_seq;
/
declare
 nbpostes number; poste varchar(20); 
date_enreg date;  j number; i number;  k number;
nb_ticket number; m number; c number;  id_ticket number; qte number;
nb_p number; p number; montant number ;prix_vente number;

begin

FOR j IN 1..6 LOOP
   for i in 1..19 loop
      qte:= trunc(dbms_random.value(1,100));
      insert into stock values (j,i,qte);
   end loop;
end loop;


date_enreg:=to_date('01-01-2010','DD-MM-YYYY');

--select sysdate into date_enreg from dual;

  FOR j IN 1..200 LOOP
     date_enreg:=(date_enreg+1);
     nb_ticket:= trunc(dbms_random.value(1,20));
     
     for i IN 1.. nb_ticket LOOP
        m:=trunc(dbms_random.value(1,7));
        c:=trunc(dbms_random.value(1,201));
        id_ticket:=ticket_seq.nextval;
        
        
        nb_p:= trunc(dbms_random.value(1,8));
        montant:=0;

        for k IN 1.. nb_p LOOP
          
             p:= trunc(dbms_random.value(1,20));
             qte:= trunc(dbms_random.value(1,4));
             insert into detail_ticket values(id_ticket, p, qte);

              select prix_vente into prix_vente from produit  where id_produit=p;
              montant:=montant+(qte*prix_vente);
        end loop ;

        insert into ticket values ( id_ticket, m, c,  date_enreg, montant);
        
     end loop ;
   
   end loop;

 end;
 
 /
 
 commit;