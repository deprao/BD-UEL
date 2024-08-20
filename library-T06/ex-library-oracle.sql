--Aluno: Pedro Wendling Hernandes 201800560266
--Exercicios envolvendo funcoes, triggers, procedimentos e views

--definicao do esquema relacional library em Oracle Database
--em Oracle, esquemas sao definidos conforme o espaco de trabalho dado para o usuario pelo DBA,
--logo o usuario nao cria esquema; abaixo a definicao das tabelas

CREATE TABLE publisher(
    Name VARCHAR2(50),
    Address VARCHAR2(100),
    Phone VARCHAR2(20),
    CONSTRAINT pk_pubname PRIMARY KEY (Name)
);

CREATE TABLE book(
    Book_id INTEGER,
    Title VARCHAR2(100),
    Publisher_name VARCHAR2(50),
    CONSTRAINT pk_bookid PRIMARY KEY (Book_id),
    CONSTRAINT ref_pubname FOREIGN KEY (Publisher_name)
        REFERENCES publisher (Name) ON DELETE CASCADE
);

CREATE TABLE book_authors(
    Book_id INTEGER,
    Author_name VARCHAR2(100),
    CONSTRAINT pk_authorbook PRIMARY KEY (Book_id, Author_name),
    CONSTRAINT ref_bookid FOREIGN KEY (Book_id)
        REFERENCES book (Book_id) ON DELETE CASCADE
);

CREATE TABLE library_branch(
    Branch_id INTEGER,
    Branch_name VARCHAR2(50),
    Address VARCHAR2(100),
    CONSTRAINT pk_branid PRIMARY KEY (Branch_id)
);

CREATE TABLE book_copies(
    Book_id INTEGER,
    Branch_id INTEGER,
    No_of_copies INTEGER,
    CONSTRAINT pk_copyid PRIMARY KEY (Book_id, Branch_id),
    CONSTRAINT ref_bookidcopies FOREIGN KEY (Book_id)
        REFERENCES book (Book_id) ON DELETE CASCADE,
    CONSTRAINT ref_branidcopies FOREIGN KEY (Branch_id)
        REFERENCES library_branch (Branch_id) ON DELETE CASCADE
);

CREATE TABLE borrower(
    Card_no INTEGER,
    Name VARCHAR2(100),
    Address VARCHAR2(100),
    Phone VARCHAR2(20),
    CONSTRAINT pk_borrwnum PRIMARY KEY (Card_no)
);

CREATE TABLE book_loans(
    Book_id INTEGER,
    Branch_id INTEGER,
    Card_no INTEGER,
    Date_out DATE,
    Due_date DATE,
    CONSTRAINT pk_loanid PRIMARY KEY (Book_id, Branch_id, Card_no),
    CONSTRAINT ref_bookidloans FOREIGN KEY (Book_id)
        REFERENCES book (Book_id) ON DELETE CASCADE,
    CONSTRAINT ref_branidloans FOREIGN KEY (Branch_id)
        REFERENCES library_branch (Branch_id) ON DELETE CASCADE,
    CONSTRAINT ref_borrwnum FOREIGN KEY (Card_no)
        REFERENCES borrower (Card_no) ON DELETE CASCADE
);

COMMIT;

--populando o esquema
--dados retirados de github.com/scholachoi/library-database
--dados nao-chave de publisher retirados de geradores aleatorios
--alguns publishers em books nao possuiam inserts, sao inseridos com dados genericos


--PUBLISHER

INSERT INTO publisher (Name, Address, Phone)
VALUES ('Singer','Bayernstraï¿œe 23, 97292  Uettingen, Germany','03621 41 11 90');
INSERT INTO publisher (Name, Address, Phone) 
VALUES ('Newton','183 COMMONWEALTH AVE BOSTON MA 02116-2209 USA','617-555-0138');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('GST','31 Griffin Circle Buffalo, NY 14221','212-555-0109');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Loyly','24 SAINT ALBANS RD BOSTON MA 02115-6141 USA','617-555-0174');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Mews','1500 HENRY ST BERKELEY CA 94709-2008 USA','510-555-0159');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Manx','78 Place de la Madeleine, PARIS, ï¿œle-de-France(IL), 75012','93 005 3869');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Barr','33 Greystone Dr. Bay Shore, NY 11706','212-555-0148');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Higham','31 Park Avenue London EC56 2MQ','020 7946 0568');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Ten Ton','9204 Peach St Oakland, California(CA), 94603','510-555-0170');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Cosmo','90 Parsons Rd Portland, Maine(ME), 04103','207-555-0141');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Hello','794 Mcallister St San Francisco, California(CA), 94102','415-555-0110');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('ANAA','2600 S Hoover St Los Angeles, California(CA), 90007','213-555-0137');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Chance','7976 Rockland Ave. Middletown, NY 10940','212-555-0160');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Biz','318 Wentworth Rd. New York, NY 10025','212-555-0126');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Famous','201 50th Ave Long Island City, New York(NY), 11101','718-802-2331');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('North','12 Pine St East Hartford, Connecticut(CT), 06108','860-555-0192');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Bibi','2 E Oak St Chicago, Illinois(IL), 60611','312-555-0185');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('1999','20 N State St Chicago, Illinois(IL), 60602','312-555-0173');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Yaya','2139 Sacramento St Berkeley, California(CA), 94702','510-555-0103');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Sunshine','665 Channing Ave Palo Alto, California(CA), 94301','650-555-0111');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Jungle','jungle_address','junglefone');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Dada','dada_address','dadafone');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('BizBooks','BizBooks_address','bizfone');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('OOL','OOL_address','oolfone');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('Hatha','Hatha_address','hathafone');
INSERT INTO publisher (Name, Address, Phone)
VALUES ('JKL','JKL_address','jklfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Phantom','Phantom_address','phantomfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Trope','Trope_address','tropefone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Pops','Pops_address','popsfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Glass','Glass_address','glassfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Grub','Grub_address','grubfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Hart','Hart_address','hartfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Bangkok','Bangkok_address','bangkokfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Pullen','Pullen_address','pullenfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Ocean','Ocean_address','oceanfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Pup','Pup_address','pupfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Combs','Combs_address','combsfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('HDT','HDT_address','hdtfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Whitehead','Whitehead_address','whiteheadfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Daily','Daily_address','dailyfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Park','Park_address','parkfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Best','Best_address','bestfone');
INSERT INTO publisher (Name, Address, Phone)
 VALUES ('Wolfe','Wolfe_address','wolfefone');

COMMIT;

--BOOK

INSERT INTO book (Book_id, Title, Publisher_name) VALUES (1,'The Lost Tribe','Jungle');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (2,'How to Sew Buttons','Singer');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (3,'The Terrible Night','GST');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (4,'Mindy''s Mittens','Newton');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (5,'Pizza and Donuts Diet','Loyly');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (6,'101 Cat House Plans','Mews');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (7,'Self-Help for Dummies','Dada');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (8,'Land of Lemurs','Barr');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (9,'Go For It!','Higham');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (10,'Farming for Nerds','Ten Ton');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (11,'They Are Us','Cosmo');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (12,'Here We Go!','Hello');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (13,'Spanish for Nurses','ANAA');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (14,'Tacos Everyday','Chance');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (15,'One Minute Rule','BizBooks');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (16,'Apples to Oranges','Famous');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (17,'Tiger Mountain','North');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (18,'How Cookies Crumble','Bibi');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (19,'Bridge to Yesterday','1999');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (20,'The Lemonade Stand','Yaya');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (21,'Hello World','OOL');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (22,'Yoga for Moms','Hatha');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (23,'The Red Balloon','JKL');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (24,'Make Art Not War','Phantom');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (25,'War of Words','Trope');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (26,'Green Smoothies for Kids','Pops');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (27,'History of Jars','Glass');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (28,'365 Dinner Ideas','Grub');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (29,'Untitled Champion','Hart');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (30,'Running in Thailand','Bangkok');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (31,'Swimming After Dark','Pullen');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (32,'Don''t Pet the Shark','Ocean');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (33,'Is Your Dog Walking You?','Pup');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (34,'Tips for Success','Combs');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (35,'Learn to Type','HDT');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (36,'Tennis for Seniors','Whitehead');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (37,'Zumba at the Zoo','Daily');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (38,'Xavier and the Zebra','Park');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (39,'You Can Do It!','Best');
INSERT INTO book (Book_id, Title, Publisher_name) VALUES (40,'The Best Day Ever','Wolfe');

COMMIT;

--BOOK_AUTHORS

INSERT INTO book_authors (Book_id, Author_name) VALUES (1,'John Smyth');
INSERT INTO book_authors (Book_id, Author_name) VALUES (2,'Jane Do');
INSERT INTO book_authors (Book_id, Author_name) VALUES (3,'Eleanor Mellors');
INSERT INTO book_authors (Book_id, Author_name) VALUES (4,'Heidi Holly');
INSERT INTO book_authors (Book_id, Author_name) VALUES (5,'Chef Jeff');
INSERT INTO book_authors (Book_id, Author_name) VALUES (6,'Bart Brat');
INSERT INTO book_authors (Book_id, Author_name) VALUES (7,'Jen Jones');
INSERT INTO book_authors (Book_id, Author_name) VALUES (8,'Carol Sims');
INSERT INTO book_authors (Book_id, Author_name) VALUES (9,'Li Li');
INSERT INTO book_authors (Book_id, Author_name) VALUES (10,'Dr. Dirt');
INSERT INTO book_authors (Book_id, Author_name) VALUES (11,'Mantek Klem');
INSERT INTO book_authors (Book_id, Author_name) VALUES (12,'Kit Townsend');
INSERT INTO book_authors (Book_id, Author_name) VALUES (13,'Laura Lloras');
INSERT INTO book_authors (Book_id, Author_name) VALUES (14,'Sara Carr');
INSERT INTO book_authors (Book_id, Author_name) VALUES (15,'Jens Kopek');
INSERT INTO book_authors (Book_id, Author_name) VALUES (16,'Jim Jordan');
INSERT INTO book_authors (Book_id, Author_name) VALUES (17,'Silas Lambert');
INSERT INTO book_authors (Book_id, Author_name) VALUES (18,'Barbara Bull');
INSERT INTO book_authors (Book_id, Author_name) VALUES (19,'Dan Bland');
INSERT INTO book_authors (Book_id, Author_name) VALUES (20,'Stephen King');
INSERT INTO book_authors (Book_id, Author_name) VALUES (21,'A. Nonymous');

COMMIT;

--LIBRARY_BRANCH

INSERT INTO library_branch (Branch_id, Branch_name, Address) VALUES (1,'Central','10 Main St');
INSERT INTO library_branch (Branch_id, Branch_name, Address) VALUES (2,'Sharpstown','25 Pine St');
INSERT INTO library_branch (Branch_id, Branch_name, Address) VALUES (3,'River','333 River Rd');
INSERT INTO library_branch (Branch_id, Branch_name, Address) VALUES (4,'Field','45 Field St');

COMMIT;

--BOOK_COPIES

INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (1,2,5);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (1,1,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (2,2,4);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (3,3,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (4,4,7);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (5,1,1);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (6,2,3);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (7,3,8);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (8,4,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (9,1,4);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (10,2,5);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (11,3,9);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (12,4,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (13,1,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (14,2,6);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (15,3,8);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (16,4,4);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (17,1,5);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (18,2,3);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (19,3,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (20,4,1);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (21,1,7);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (22,2,4);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (23,3,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (24,4,8);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (25,1,9);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (26,2,5);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (27,3,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (28,4,3);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (29,1,6);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (30,2,6);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (31,3,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (32,4,1);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (33,1,8);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (34,2,4);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (35,3,7);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (36,4,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (37,1,9);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (38,2,2);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (39,3,5);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (40,4,4);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (20,1,4);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (5,3,5);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (32,1,7);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (31,4,3);
INSERT INTO book_copies (Book_id, Branch_id, No_of_copies) VALUES (12,2,4);

COMMIT;

--BORROWER

INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (1,'Charlie Brown','27 Main St','555-5123');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (2,'Rachel Rigby','101 Hwy 22','688-7711');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (3,'Nancy Drew','5678 Oak St','555-3467');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (4,'Derek Jones','6789 Ritmo Cir','222-1234');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (5,'Howie Han','111 First Ave','234-5678');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (6,'Tim Tegulpas','432 Nebraska Ave','987-6543');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (7,'Sam Semel','7688 Hedge Ct','777-9898');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (8,'Evan Mann','4545 Court St','899-9090');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (9,'Sally Short','323 Remington St','767-8991');
INSERT INTO borrower (Card_no, Name, Address, Phone) VALUES (10,'Bob Biggs','227 South St', 'telefone');

COMMIT;

--BOOK_LOANS

INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (1,1,4,'19-07-2016','29-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (2,2,4,'19-08-2016','19-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (3,3,4,'19-08-2016','15-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (4,4,4,'19-08-2016','19-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (5,1,4,'19-08-2016','19-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (6,2,2,'18-09-2016','30-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (7,3,2,'18-09-2016','18-11-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (8,4,2,'18-09-2016','17-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (9,1,2,'18-09-2016','18-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (10,2,2,'18-09-2016','18-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (11,3,5,'11-09-2016','02-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (12,4,5,'11-09-2016','09-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (13,1,5,'11-09-2016','19-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (14,2,3,'13-09-2016','13-12-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (15,3,9,'11-09-2016','05-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (16,4,1,'12-05-2016','22-05-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (17,1,6,'13-09-2016','20-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (18,2,6,'13-09-2016','15-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (19,3,6,'13-09-2016','12-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (20,4,7,'12-09-2016','13-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (21,1,7,'13-09-2016','13-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (1,2,7,'13-09-2016','13-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (2,3,7,'13-09-2016','13-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (4,4,9,'09-09-2016','09-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (5,1,9,'09-09-2016','02-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (6,2,9,'09-09-2016','16-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (7,3,8,'10-09-2016','01-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (8,4,8,'10-09-2016','11-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (9,1,4,'08-09-2016','08-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (10,2,4,'08-09-2016','15-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (11,3,4,'08-09-2016','08-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (12,4,4,'08-09-2016','08-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (13,1,3,'07-09-2016','28-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (15,3,3,'07-09-2016','09-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (16,4,2,'05-09-2016','19-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (17,1,2,'05-09-2016','05-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (18,2,2,'05-09-2016','10-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (19,3,5,'04-09-2016','11-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (20,4,5,'04-09-2016','04-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (21,1,5,'04-09-2016','25-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (22,2,5,'04-09-2016','09-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (23,3,5,'04-09-2016','11-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (24,4,8,'03-09-2016','03-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (25,1,8,'03-09-2016','03-10-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (26,2,8,'03-09-2016','17-09-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (27,3,1,'12-05-2016','12-06-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (28,4,1,'12-05-2016','26-06-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (29,1,1,'12-05-2016','05-06-2016');
INSERT INTO book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (30,2,1,'12-05-2016','19-05-2016');

COMMIT;

--exercicio 1

--cria a view materializada month_borrowers

CREATE MATERIALIZED VIEW month_borrowers
(card_no, name, address, phone, loan_length, book_title, branch_name)
AS SELECT bw.card_no, name, address, phone, (due_date - date_out) AS loan_length,
book_title, branch_name FROM borrower bw

JOIN (SELECT book_title, lbr.branch_name, card_no, date_out, due_date FROM
(SELECT bk.title AS book_title, branch_id, card_no, date_out, due_date FROM
book_loans bkl JOIN book bk ON bkl.book_id = bk.book_id)
bklt JOIN library_branch lbr ON bklt.branch_id = lbr.branch_id) bkltbr
ON bw.card_no = bkltbr.card_no WHERE due_date - date_out >= 30;

COMMIT;

--consultas para verificar atualizacao da view

--inserts
INSERT INTO book_loans (book_id, branch_id, card_no, date_out, due_date)
VALUES (13, 3, 10, '15-12-2022', '29-01-2023');
INSERT INTO book_loans (book_id, branch_id, card_no, date_out, due_date)
VALUES (23, 3, 10, '07-11-2022', '14-12-2022'); --entram na view

INSERT INTO book_loans (book_id, branch_id, card_no, date_out, due_date)
VALUES (6, 1, 7, '09-01-2023', '03-02-2023'); --nao entra na view

--confere
EXECUTE DBMS_MVIEW.REFRESH('month_borrowers');

SELECT * FROM month_borrowers;

--updates
--update que tira da view
UPDATE book_loans SET due_date = '01-12-2022'
WHERE book_id = 23 AND branch_id = 3 AND card_no = 10;

--update que coloca na view
UPDATE book_loans SET due_date = '10-02-2023'
WHERE book_id = 6 AND branch_id = 1 AND card_no = 7;

--confere
EXECUTE DBMS_MVIEW.REFRESH('month_borrowers');

SELECT * FROM month_borrowers;

--exercicio 2

--criar tabela temporaria que armazena os dados da tabela book_copies
CREATE GLOBAL TEMPORARY TABLE book_copies_temp AS SELECT * FROM book_copies;
--INSERT INTO book_copies_temp SELECT * FROM book_copies; caso a tabela ja esteja presente por conta da clausula ON COMMIT PRESERVE ROWS

--criar tabela nova de copias de livros
CREATE TABLE book_copies_new (
    Copy_id INTEGER GENERATED BY DEFAULT AS IDENTITY START WITH 1,
    Book_id INTEGER,
    Branch_id INTEGER,
    Acquisition_date DATE,
    Copy_condition VARCHAR2(255),
    CONSTRAINT pk_newcopyid PRIMARY KEY (Copy_id),
    CONSTRAINT ref_newbookid FOREIGN KEY (Book_id)
        REFERENCES book (Book_id) ON DELETE CASCADE,
    CONSTRAINT ref_newbranid FOREIGN KEY (Branch_id)
        REFERENCES library_branch (Branch_id) ON DELETE CASCADE
);

--referencia individual de copia para book_loans
ALTER TABLE book_loans ADD copy_id INTEGER;
ALTER TABLE book_loans ADD CONSTRAINT ref_copyid FOREIGN KEY (copy_id)
        REFERENCES book_copies_new (Copy_id) ON DELETE CASCADE;

COMMIT;

-- verificar inconsistencias de copias
--SELECT book_id, branch_id, COUNT(book_id) AS copies_no FROM book_copies_new GROUP BY book_id, branch_id;
--equivalente de SELECT * FROM book_copies_temp; acima, para a tabela book_copies_new

--abaixo, duas funcoes que geram dados aleatorios, de modo a facilitar a insercao na tabela book_copies_new

-- funcao que gera data aleatoria para o atributo acquisition_date, situando de 2010 ate 01/01/2016
CREATE OR REPLACE FUNCTION acquisition_date_gen RETURN DATE AS
    acdate date;
BEGIN                                               --2192 eh a quantidade de dias de 01/01/2010 ate 01/01/2016
    SELECT (TO_DATE('01-01-2010', 'DD-MM-YYYY') + DBMS_RANDOM.VALUE(0, 2192)) INTO acdate FROM dual;
    RETURN acdate;
END;

-- funcao que gera valor aleatorio para o atributo copy_condition, de acordo com o escopo dado
CREATE OR REPLACE FUNCTION condition_gen RETURN VARCHAR2 AS 
    copy_cond VARCHAR(10);
BEGIN
    SELECT column_value INTO copy_cond
    FROM TABLE(
        CAST(
            MULTISET(SELECT 'fine' FROM dual 
            UNION ALL SELECT 'good' FROM dual 
            UNION ALL SELECT 'fair' FROM dual 
            UNION ALL SELECT 'poor' FROM dual
            ) AS SYS.ODCIVARCHAR2LIST
        )
    )   ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
    RETURN copy_cond;
END;

COMMIT;

CREATE OR REPLACE PROCEDURE book_copy_compare_and_fill AS
	old_copycount INTEGER;
	new_copycount INTEGER;
	branch_count INTEGER;
	book_count INTEGER;
	copydiff INTEGER;
BEGIN
	SELECT COUNT(*) INTO branch_count FROM library_branch;
	SELECT COUNT(*) INTO book_count FROM book;
	
	FOR i IN 1..branch_count LOOP --utilizar da contagem de livros e ramos para selecionar as cï¿œpias
		FOR j IN 1..book_count LOOP      --de cada livro por ramo, agrupando pelos id's respectivos
            SELECT no_of_copies INTO old_copycount FROM book_copies_temp WHERE book_id = j AND branch_id = i UNION ALL SELECT 0 FROM dual
                                FETCH FIRST 1 ROW ONLY; --em Oracle, valores nulos sao diferentes de tabelas vazias, logo utiliza-se UNION ALL SELECT 0
                                                                    --para garantir que o acesso a uma tabela vazia armazene 0 na variavel
            
			SELECT copies_no INTO new_copycount FROM (SELECT book_id, branch_id, COUNT(book_id) AS copies_no
								   FROM book_copies_new GROUP BY book_id, branch_id) bkcnewcount WHERE book_id = j AND branch_id = i
                                   UNION ALL SELECT 0 FROM dual FETCH FIRST 1 ROW ONLY;

			copydiff := old_copycount - new_copycount;		
			
			IF copydiff != 0 THEN --notifica inconsistencia de copias
				DBMS_OUTPUT.PUT('Inconsistent amount of copies. ' || copydiff || ' copies missing for book ' || j || ' in branch ' || i || '.' || CHR(10) || 'Missing data will be inserted.');
                DBMS_OUTPUT.NEW_LINE;
				FOR k IN 1..copydiff LOOP --preenche com id's respectivos e dados restantes gerados aleatoriamente
                    INSERT INTO book_copies_new (book_id, branch_id, acquisition_date, copy_condition)
                        VALUES (j, i, acquisition_date_gen, condition_gen);
				END LOOP;
				
            ELSIF copydiff = 0 AND old_copycount > 0 THEN --notifica caso nao ha inconsistencia de copias, tratando combinacoes de id inexistentes
                DBMS_OUTPUT.PUT('Book ' || j || ' in branch ' || i || ' with matching amount of copies.');
                DBMS_OUTPUT.NEW_LINE;
			END IF;
            
		END LOOP;
	END LOOP;
END;

SET SERVEROUTPUT ON SIZE 500000; --liga o buffer de saida do SGBD
--rodar como script (F5)
BEGIN
    book_copy_compare_and_fill;
END;

--reset sequencia de id
ALTER TABLE book_copies_new MODIFY copy_id GENERATED BY DEFAULT AS IDENTITY START WITH 1;

SELECT * FROM book_copies_new; --confere

DROP TABLE book_copies_temp; --drop tabela temporaria
DROP TABLE book_copies; --drop tabela de copias antiga

COMMIT;

--definicao da view book_copies, a partir da tabela book_copies_new
CREATE OR REPLACE VIEW book_copies AS SELECT book_id, branch_id, CAST(COUNT(book_id) AS NUMBER(10)) AS no_of_copies
FROM book_copies_new GROUP BY book_id, branch_id;

SELECT * FROM book_copies;

COMMIT;

--trigger que aplica as especificacoes requisitadas
CREATE OR REPLACE TRIGGER tg_book_copies INSTEAD OF INSERT OR DELETE OR UPDATE ON book_copies
FOR EACH ROW
DECLARE
    book_copycount INTEGER;
    book_copydiff INTEGER;
BEGIN
    SELECT COUNT(*) INTO book_copycount FROM book_copies_new WHERE book_id = :OLD.book_id
    AND branch_id = :OLD.branch_id; --armazena quantidade de copias de livro em filial de acordo com consulta
    
    IF book_copycount IS NULL THEN
	    book_copycount := 0;
    END IF;

    book_copydiff := :NEW.no_of_copies - book_copycount; --armazena a quantidade de copias de livro a serem inseridas, caso tenha sido atualizada

    IF DELETING THEN --deletar tuplas na view deve deletar na tabela nova
	    DELETE FROM book_copies_new WHERE book_id = :OLD.book_id AND branch_id = :OLD.branch_id;
	
    ELSIF UPDATING THEN
	    UPDATE book_copies_new SET book_id = :NEW.book_id, branch_id = :NEW.branch_id
	    WHERE book_id = :OLD.book_id AND branch_id = :OLD.branch_id; --atualizacao de id's na view para a tabela nova

	    IF (book_copydiff < 0) THEN --book_copydiff negativo indica que houve tentativa de reducao do numero de copias de um livro, que e proibido
		RAISE_APPLICATION_ERROR(-20001, 'Reducing the number of copies is forbidden!');
	    ELSIF (book_copydiff > 0) THEN
		    FOR i IN 1..book_copydiff LOOP --inserts para casar com aumento de numero de copias
			    INSERT INTO book_copies_new (book_id, branch_id, acquisition_date, copy_condition)
			    VALUES (:NEW.book_id, :NEW.branch_id, SYSDATE, condition_gen());
		    END LOOP;
	    END IF;

    ELSIF INSERTING THEN --loop de insert na view deve inserir copias de acordo com o atributo no_of_copies na tabela nova
	    FOR i IN 1..book_copydiff LOOP
		    INSERT INTO book_copies_new (book_id, branch_id, acquisition_date, copy_condition)
		    VALUES (:NEW.book_id, :NEW.branch_id, SYSDATE, condition_gen());
	    END LOOP;
    END IF;
END;

COMMIT;

--testes do trigger tg_book_copies

--delete
SELECT * FROM book_copies WHERE book_id = 32;
SELECT * FROM book_copies_new WHERE book_id = 32;

DELETE FROM book_copies WHERE book_id = 32 AND branch_id = 1;

SELECT * FROM book_copies_new WHERE book_id = 32;

--update id
SELECT * FROM book_copies WHERE book_id = 1 AND branch_id = 1;
SELECT * FROM book_copies_new WHERE book_id = 1 AND branch_id = 1;

UPDATE book_copies SET branch_id = 3 WHERE book_id = 1 AND branch_id = 1;

SELECT * FROM book_copies WHERE book_id = 1 AND branch_id = 3;
SELECT * FROM book_copies_new WHERE book_id = 1 AND branch_id = 3;

--update no_of_copies
SELECT * FROM book_copies WHERE book_id = 1 AND branch_id = 2;
SELECT * FROM book_copies_new WHERE book_id = 1 AND branch_id = 2;

UPDATE book_copies SET no_of_copies = 3 WHERE book_id = 1 AND branch_id = 2; --exception nesta linha
UPDATE book_copies SET no_of_copies = 7 WHERE book_id = 1 AND branch_id = 2;

SELECT * FROM book_copies WHERE book_id = 1 AND branch_id = 2;
SELECT * FROM book_copies_new WHERE book_id = 1 AND branch_id = 2;

--insert
INSERT INTO book_copies(book_id, branch_id, no_of_copies) VALUES (32, 1, 7);
SELECT * FROM book_copies_new WHERE book_id = 32 AND branch_id = 1;


--exercicio 3

--funcao que identifica qual o nome de autoria mais frequente entre dois: retorna 1 pra name1 e 2 pra name2
CREATE OR REPLACE FUNCTION most_freq_author(name1 VARCHAR, name2 VARCHAR) 
RETURN INTEGER AS
		c_author1 INTEGER;
		c_author2 INTEGER;
BEGIN
	SELECT COUNT(*) INTO c_author1 FROM book_authors WHERE author_name = name1;
	SELECT COUNT(*) INTO c_author2 FROM book_authors WHERE author_name = name2;
	IF c_author1 > c_author2 THEN
		RETURN 1;
	END IF;
	RETURN 2;
END;

--funcao para separar as strings de nomes de autores - recebe string, delimitador (geralmente caracter de espaço vazio) e numero que indica posição de string a ser manuseada
CREATE OR REPLACE FUNCTION split_part(pstr VARCHAR2, pdelim VARCHAR2, partnum INTEGER) RETURN VARCHAR2 DETERMINISTIC IS
  vstart NUMBER; 
  vend   NUMBER;
BEGIN
  IF partnum <> 0 AND pdelim IS NOT NULL THEN --instr procura substring dentro de string dada, vstart sendo a posicao do primeiro nome e vend o ultimo nome
    vstart := instr(pdelim||pstr||pdelim, pdelim, sign(partnum), abs(partnum));
    vend   := instr(pdelim||pstr||pdelim, pdelim, sign(partnum), abs(partnum) + 1);
  END IF;
  RETURN CASE         
           WHEN pdelim IS NULL AND abs(partnum) = 1 THEN pstr --retorna string dada caso seja apenas uma palavra
           WHEN partnum > 0 THEN substr(pstr, vstart, vend - vstart - length(pdelim)) --substr retorna uma porcao de caracteres de acordo com parametros                      
           WHEN partnum < 0 THEN substr(pstr, vend, vstart - vend - length(pdelim))    -- partnum > 0 retorna contando a partir do inicio de pstr, < 0  a partir do fim      
           ELSE NULL
         END;
END;

--verifica se string coincide sendo inicial de nome abreviado: 1 - sim; 0 - nao
CREATE OR REPLACE FUNCTION is_initial(name VARCHAR)
RETURN INTEGER AS
BEGIN
	IF (LENGTH(split_part(name, ' ', 2)) = 2 AND substr(split_part(name, ' ', 2), -1) = '.') THEN
		RETURN 1;
	END IF;
	RETURN 0;
END;

--retorna uma string que seria uma inicial de nome abreviado
CREATE OR REPLACE FUNCTION get_initial(name VARCHAR)
RETURN VARCHAR AS
BEGIN
	RETURN
		(split_part(name, ' ', 1) ||
		' ' ||
		substr(split_part(name, ' ', 2),1,1) ||
		'. ' ||
		split_part(name, ' ', 3));
END;

--tabela de nomes duplicados
CREATE TABLE log_duplicate(
	book_id INTEGER,
	old_name VARCHAR(50),
	new_name VARCHAR(50),
	update_time TIMESTAMP
);

--procedimento para eliminar duplicados
CREATE OR REPLACE PROCEDURE eliminate_duplicates AS
	k INTEGER;
	init VARCHAR(50);
BEGIN
	FOR i IN (SELECT * FROM book_authors) LOOP --loop percorrendo a tabela book_authors
		IF is_initial(i.author_name) = 1 THEN --ignora nome de autor se for uma inicial
			CONTINUE;
		END IF;
		SELECT COUNT(*) INTO k FROM log_duplicate
		WHERE book_id = i.book_id AND old_name = i.author_name;
		IF k > 0 THEN --se nome de autor em analise ja estiver no log, ignorar
			CONTINUE;
		END IF;
                                                    --EDIT_DISTANCE retorna a distancia levenshtein (DL) entre duas strings, sendo ela o numero de caracteres inconsistentes entre as entradas
		FOR j IN (SELECT * FROM book_authors WHERE UTL_MATCH.EDIT_DISTANCE(i.author_name, author_name) <= 2
		AND UTL_MATCH.EDIT_DISTANCE(i.author_name, author_name) > 0) LOOP --loop que percorre novamente a tabela book_authors, verificando se dois nomes de autores
			IF most_freq_author(i.author_name, j.author_name) = 1 THEN          --sao erros de digitacao (0 < DL <= 2) de acordo com o enunciado do problema
                DELETE FROM book_authors WHERE book_id = j.book_id AND author_name = j.author_name;   --verifica se author_name do primeiro acesso na tabela eh mais frequente e corrige
					
				INSERT INTO log_duplicate(book_id,old_name, new_name, update_time) --relata atualizacao no log
					VALUES(j.book_id, j.author_name, i.author_name, SYSDATE);
			ELSE
                 DELETE FROM book_authors WHERE book_id = i.book_id AND author_name = i.author_name; --se nao, significa que author_name do segundo acesso eh mais frequente, entao corrige de acordo
					
				INSERT INTO log_duplicate(book_id,old_name, new_name, update_time) --relata atualizacao no log
					VALUES(i.book_id, i.author_name, j.author_name, SYSDATE);
			END IF;
		END LOOP;
			
		init := get_initial(i.author_name);
		FOR j IN (SELECT * FROM book_authors
		WHERE author_name = init) LOOP  --se nome de autor em analise tiver uma inicial no meio, book_authors sera percorrida pra encontrar nomes coincidentes
            DELETE FROM book_authors WHERE book_id = j.book_id AND author_name = j.author_name;   --corrige na tabela e relata no log
                
			INSERT INTO log_duplicate(book_id,old_name, new_name, update_time)
				VALUES(j.book_id, j.author_name, i.author_name, SYSDATE);
		END LOOP;
	END LOOP;
END;

--inserts para botar em pr�tica eliminate_duplicates
INSERT INTO book_authors (book_id, author_name) VALUES (20, 'Stephen Kign');
INSERT INTO book_authors (book_id, author_name) VALUES (17, 'Silas Lamber');
INSERT INTO book_authors (book_id, author_name) VALUES (30, 'John Joseph Powell');
INSERT INTO book_authors (book_id, author_name) VALUES (30, 'John Joseph Poewll');
INSERT INTO book_authors (book_id, author_name) VALUES (30, 'John J. Powell');

SELECT DISTINCT * FROM book_authors;

BEGIN
    eliminate_duplicates;
END;

SELECT DISTINCT author_name FROM book_authors;
SELECT * from log_duplicate;

--segundo teste
INSERT INTO book_authors (book_id, author_name) VALUES (17, 'Silas Lamber');
INSERT INTO book_authors (book_id, author_name) VALUES (30, 'John J. Powell');

SELECT DISTINCT author_name FROM book_authors;

BEGIN
    eliminate_duplicates;
END;

SELECT DISTINCT author_name FROM book_authors;
SELECT * from log_duplicate;



