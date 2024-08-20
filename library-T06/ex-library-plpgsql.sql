--Aluno: Pedro Wendling Hernandes 201800560266
--Exercícios envolvendo funções, triggers, procedimentos e views

--definição do esquema relacional library em PostgreSQL
CREATE SCHEMA library;

CREATE TABLE library.publisher(
	Name VARCHAR,
	Address VARCHAR,
	Phone VARCHAR,
	CONSTRAINT pk_pubname PRIMARY KEY (Name)
);

CREATE TABLE library.book(
	Book_id INTEGER,
	Title VARCHAR,
	Publisher_name VARCHAR,
	CONSTRAINT pk_bookid PRIMARY KEY (Book_id),
	CONSTRAINT ref_pubname FOREIGN KEY (Publisher_name)
		REFERENCES library.publisher (Name) ON DELETE CASCADE
);

CREATE TABLE library.book_authors(
	Book_id INTEGER,
	Author_name VARCHAR,
	CONSTRAINT pk_authorbook PRIMARY KEY (Book_id, Author_name),
	CONSTRAINT ref_bookid FOREIGN KEY (Book_id)
		REFERENCES library.book (Book_id) ON DELETE CASCADE
);

CREATE TABLE library.library_branch(
	Branch_id INTEGER,
	Branch_name VARCHAR,
	Address VARCHAR,
	CONSTRAINT pk_branid PRIMARY KEY (Branch_id)
);

CREATE TABLE library.book_copies(
	Book_id INTEGER,
	Branch_id INTEGER,
	No_of_copies INTEGER,
	CONSTRAINT pk_copyid PRIMARY KEY (Book_id, Branch_id),
	CONSTRAINT ref_bookid FOREIGN KEY (Book_id)
		REFERENCES library.book (Book_id) ON DELETE CASCADE,
	CONSTRAINT ref_branid FOREIGN KEY (Branch_id)
		REFERENCES library.library_branch (Branch_id) ON DELETE CASCADE
);

CREATE TABLE library.borrower(
	Card_no INTEGER,
	Name VARCHAR,
	Address VARCHAR,
	Phone VARCHAR,
	CONSTRAINT pk_borrwnum PRIMARY KEY (Card_no)
);

CREATE TABLE library.book_loans(
	Book_id INTEGER,
	Branch_id INTEGER,
	Card_no INTEGER,
	Date_out date,
	Due_date date,
	CONSTRAINT pk_loanid PRIMARY KEY (Book_id, Branch_id, Card_no),
	CONSTRAINT ref_bookid FOREIGN KEY (Book_id)
		REFERENCES library.book (Book_id) ON DELETE CASCADE,
	CONSTRAINT ref_branid FOREIGN KEY (Branch_id)
		REFERENCES library.library_branch (Branch_id) ON DELETE CASCADE,
	CONSTRAINT ref_borrwnum FOREIGN KEY (Card_no)
		REFERENCES library.borrower (Card_no) ON DELETE CASCADE
);


--populando o esquema
--dados retirados de github.com/scholachoi/library-database
--dados não-chave de library.publisher retirados de geradores aleatórios
--alguns publishers em books não possuíam inserts, são inseridos com dados genéricos


--PUBLISHER

INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Singer','Bayernstraße 23, 97292  Uettingen, Germany','03621 41 11 90');
INSERT INTO library.publisher (Name, Address, Phone) 
VALUES ('Newton','183 COMMONWEALTH AVE BOSTON MA 02116-2209 USA','617-555-0138');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('GST','31 Griffin Circle Buffalo, NY 14221','212-555-0109');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Loyly','24 SAINT ALBANS RD BOSTON MA 02115-6141 USA','617-555-0174');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Mews','1500 HENRY ST BERKELEY CA 94709-2008 USA','510-555-0159');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Manx','78 Place de la Madeleine, PARIS, Île-de-France(IL), 75012','93 005 3869');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Barr','33 Greystone Dr. Bay Shore, NY 11706','212-555-0148');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Higham','31 Park Avenue London EC56 2MQ','020 7946 0568');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Ten Ton','9204 Peach St Oakland, California(CA), 94603','510-555-0170');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Cosmo','90 Parsons Rd Portland, Maine(ME), 04103','207-555-0141');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Hello','794 Mcallister St San Francisco, California(CA), 94102','415-555-0110');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('ANAA','2600 S Hoover St Los Angeles, California(CA), 90007','213-555-0137');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Chance','7976 Rockland Ave. Middletown, NY 10940','212-555-0160');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Biz','318 Wentworth Rd. New York, NY 10025','212-555-0126');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Famous','201 50th Ave Long Island City, New York(NY), 11101','718-802-2331');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('North','12 Pine St East Hartford, Connecticut(CT), 06108','860-555-0192');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Bibi','2 E Oak St Chicago, Illinois(IL), 60611','312-555-0185');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('1999','20 N State St Chicago, Illinois(IL), 60602','312-555-0173');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Yaya','2139 Sacramento St Berkeley, California(CA), 94702','510-555-0103');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Sunshine','665 Channing Ave Palo Alto, California(CA), 94301','650-555-0111');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Jungle','jungle_address','junglefone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Dada','dada_address','dadafone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('BizBooks','BizBooks_address','bizfone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('OOL','OOL_address','oolfone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Hatha','Hatha_address','hathafone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('JKL','JKL_address','jklfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Phantom','Phantom_address','phantomfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Trope','Trope_address','tropefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Pops','Pops_address','popsfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Glass','Glass_address','glassfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Grub','Grub_address','grubfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Hart','Hart_address','hartfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Bangkok','Bangkok_address','bangkokfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Pullen','Pullen_address','pullenfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Ocean','Ocean_address','oceanfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Pup','Pup_address','pupfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Combs','Combs_address','combsfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('HDT','HDT_address','hdtfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Whitehead','Whitehead_address','whiteheadfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Daily','Daily_address','dailyfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Park','Park_address','parkfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Best','Best_address','bestfone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Wolfe','Wolfe_address','wolfefone');


--BOOK

INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (1,'The Lost Tribe','Jungle');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (2,'How to Sew Buttons','Singer');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (3,'The Terrible Night','GST');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (4,'Mindy''s Mittens','Newton');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (5,'Pizza and Donuts Diet','Loyly');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (6,'101 Cat House Plans','Mews');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (7,'Self-Help for Dummies','Dada');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (8,'Land of Lemurs','Barr');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (9,'Go For It!','Higham');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (10,'Farming for Nerds','Ten Ton');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (11,'They Are Us','Cosmo');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (12,'Here We Go!','Hello');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (13,'Spanish for Nurses','ANAA');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (14,'Tacos Everyday','Chance');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (15,'One Minute Rule','BizBooks');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (16,'Apples to Oranges','Famous');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (17,'Tiger Mountain','North');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (18,'How Cookies Crumble','Bibi');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (19,'Bridge to Yesterday','1999');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (20,'The Lemonade Stand','Yaya');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (21,'Hello World','OOL');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (22,'Yoga for Moms','Hatha');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (23,'The Red Balloon','JKL');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (24,'Make Art Not War','Phantom');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (25,'War of Words','Trope');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (26,'Green Smoothies for Kids','Pops');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (27,'History of Jars','Glass');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (28,'365 Dinner Ideas','Grub');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (29,'Untitled Champion','Hart');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (30,'Running in Thailand','Bangkok');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (31,'Swimming After Dark','Pullen');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (32,'Don''t Pet the Shark','Ocean');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (33,'Is Your Dog Walking You?','Pup');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (34,'Tips for Success','Combs');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (35,'Learn to Type','HDT');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (36,'Tennis for Seniors','Whitehead');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (37,'Zumba at the Zoo','Daily');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (38,'Xavier and the Zebra','Park');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (39,'You Can Do It!','Best');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (40,'The Best Day Ever','Wolfe');

--BOOK_AUTHORS

INSERT INTO library.book_authors (Book_id, Author_name) VALUES (1,'John Smyth');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (2,'Jane Do');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (3,'Eleanor Mellors');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (4,'Heidi Holly');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (5,'Chef Jeff');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (6,'Bart Brat');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (7,'Jen Jones');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (8,'Carol Sims');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (9,'Li Li');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (10,'Dr. Dirt');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (11,'Mantek Klem');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (12,'Kit Townsend');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (13,'Laura Lloras');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (14,'Sara Carr');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (15,'Jens Kopek');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (16,'Jim Jordan');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (17,'Silas Lambert');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (18,'Barbara Bull');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (19,'Dan Bland');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (20,'Stephen King');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (21,'A. Nonymous');

--LIBRARY_BRANCH

INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (1,'Central','10 Main St');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (2,'Sharpstown','25 Pine St');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (3,'River','333 River Rd');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (4,'Field','45 Field St');

--BOOK_COPIES

INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (1,2,5);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (1,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (2,2,4);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (3,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (4,4,7);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (5,1,1);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (6,2,3);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (7,3,8);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (8,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (9,1,4);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (10,2,5);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (11,3,9);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (12,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (13,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (14,2,6);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (15,3,8);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (16,4,4);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (17,1,5);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (18,2,3);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (19,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (20,4,1);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (21,1,7);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (22,2,4);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (23,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (24,4,8);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (25,1,9);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (26,2,5);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (27,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (28,4,3);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (29,1,6);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (30,2,6);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (31,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (32,4,1);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (33,1,8);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (34,2,4);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (35,3,7);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (36,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (37,1,9);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (38,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (39,3,5);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (40,4,4);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (20,1,4);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (5,3,5);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (32,1,7);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (31,4,3);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (12,2,4);

--BORROWER

INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (1,'Charlie Brown','27 Main St','555-5123');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (2,'Rachel Rigby','101 Hwy 22','688-7711');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (3,'Nancy Drew','5678 Oak St','555-3467');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (4,'Derek Jones','6789 Ritmo Cir','222-1234');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (5,'Howie Han','111 First Ave','234-5678');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (6,'Tim Tegulpas','432 Nebraska Ave','987-6543');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (7,'Sam Semel','7688 Hedge Ct','777-9898');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (8,'Evan Mann','4545 Court St','899-9090');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (9,'Sally Short','323 Remington St','767-8991');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (10,'Bob Biggs','227 South St', 'telefone');

--BOOK_LOANS

INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (1,1,4,'2016-07-19','2016-09-29');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (2,2,4,'2016-08-19','2016-09-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (3,3,4,'2016-08-19','2016-10-15');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (4,4,4,'2016-08-19','2016-09-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (5,1,4,'2016-08-19','2016-09-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (6,2,2,'2016-09-18','2016-09-30');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (7,3,2,'2016-09-18','2016-11-18');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (8,4,2,'2016-09-18','2016-10-17');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (9,1,2,'2016-09-18','2016-10-18');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (10,2,2,'2016-09-18','2016-10-18');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (11,3,5,'2016-09-11','2016-10-02');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (12,4,5,'2016-09-11','2016-10-09');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (13,1,5,'2016-09-11','2016-10-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (14,2,3,'2016-09-13','2016-12-13');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (15,3,9,'2016-09-11','2016-10-05');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (16,4,1,'2016-05-12','2016-05-22');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (17,1,6,'2016-09-13','2016-09-20');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (18,2,6,'2016-09-13','2016-10-15');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (19,3,6,'2016-09-13','2016-10-12');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (20,4,7,'2016-09-12','2016-10-13');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (21,1,7,'2016-09-13','2016-10-13');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (1,2,7,'2016-09-13','2016-10-13');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (2,3,7,'2016-09-13','2016-10-13');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (4,4,9,'2016-09-09','2016-10-09');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (5,1,9,'2016-09-09','2016-10-02');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (6,2,9,'2016-09-09','2016-10-16');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (7,3,8,'2016-09-10','2016-10-01');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (8,4,8,'2016-09-10','2016-10-11');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (9,1,4,'2016-09-08','2016-10-08');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (10,2,4,'2016-09-08','2016-09-15');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (11,3,4,'2016-09-08','2016-10-08');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (12,4,4,'2016-09-08','2016-10-08');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (13,1,3,'2016-09-07','2016-09-28');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (15,3,3,'2016-09-07','2016-10-09');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (16,4,2,'2016-09-05','2016-09-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (17,1,2,'2016-09-05','2016-10-05');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (18,2,2,'2016-09-05','2016-10-10');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (19,3,5,'2016-09-04','2016-09-11');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (20,4,5,'2016-09-04','2016-10-04');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (21,1,5,'2016-09-04','2016-09-25');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (22,2,5,'2016-09-04','2016-10-09');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (23,3,5,'2016-09-04','2016-10-11');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (24,4,8,'2016-09-03','2016-10-03');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (25,1,8,'2016-09-03','2016-10-03');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (26,2,8,'2016-09-03','2016-09-17');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (27,3,1,'2016-05-12','2016-06-12');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (28,4,1,'2016-05-12','2016-06-26');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (29,1,1,'2016-05-12','2016-06-05');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (30,2,1,'2016-05-12','2016-05-19');


--exercício 1

--cria a view materializada library.month_borrowers

CREATE MATERIALIZED VIEW library.month_borrowers 
(card_no, name, address, phone, loan_length, book_title, branch_name)
AS SELECT bw.card_no, name, address, phone, (due_date - date_out) AS loan_length,
book_title, branch_name FROM library.borrower AS bw 

JOIN (SELECT book_title, lbr.branch_name, card_no, date_out, due_date FROM
(SELECT bk.title AS book_title, branch_id, card_no, date_out, due_date FROM
library.book_loans AS bkl JOIN library.book AS bk ON bkl.book_id = bk.book_id)
AS bklt JOIN library.library_branch AS lbr ON bklt.branch_id = lbr.branch_id) AS bkltbr
ON bw.card_no = bkltbr.card_no WHERE due_date - date_out >= 30;


--consultas para verificar atualização da view

--inserts
INSERT INTO library.book_loans (book_id, branch_id, card_no, date_out, due_date)
VALUES (13, 3, 10, '2022-12-15', '2023-01-29');
INSERT INTO library.book_loans (book_id, branch_id, card_no, date_out, due_date)
VALUES (23, 3, 10, '2022-11-07', '2022-12-14'); --entram na view

INSERT INTO library.book_loans (book_id, branch_id, card_no, date_out, due_date)
VALUES (6, 1, 7, '2023-01-09', '2023-02-03'); --nao entra na view

--confere
REFRESH MATERIALIZED VIEW library.month_borrowers;

SELECT * FROM library.month_borrowers;

--updates
--update que tira da view
UPDATE library.book_loans SET due_date = '2022-12-01'
WHERE book_id = 23 AND branch_id = 3 AND card_no = 10;

--update que coloca na view
UPDATE library.book_loans SET due_date = '2023-02-10'
WHERE book_id = 6 AND branch_id = 1 AND card_no = 7;

--confere
REFRESH MATERIALIZED VIEW library.month_borrowers;

SELECT * FROM library.month_borrowers;


--exercicio 2

--criar tabela temporária que armazena os dados da tabela book_copies
CREATE TEMPORARY TABLE book_copies_temp AS TABLE library.book_copies;


--criar tabela nova de cópias de livros
CREATE TABLE library.book_copies_new (
	Copy_id SERIAL,
	Book_id INTEGER,
	Branch_id INTEGER,
	Acquisition_date date,
	Copy_condition VARCHAR,
	CONSTRAINT pk_newcopyid PRIMARY KEY (Copy_id),
	CONSTRAINT ref_newbookid FOREIGN KEY (Book_id)
		REFERENCES library.book (Book_id) ON DELETE CASCADE,
	CONSTRAINT ref_newbranid FOREIGN KEY (Branch_id)
		REFERENCES library.library_branch (Branch_id) ON DELETE CASCADE
);


--referência inidividual de cópia para library.book_loans
ALTER TABLE library.book_loans ADD COLUMN copy_id INT,
	ADD CONSTRAINT ref_copyid FOREIGN KEY (copy_id) 
	REFERENCES library.book_copies_new (Copy_id) ON DELETE CASCADE;
	

--verificar inconsistencias de cópias
--SELECT book_id, branch_id, COUNT(book_id) AS copies_no FROM library.book_copies_new GROUP BY book_id, branch_id;
--equivalente de SELECT * FROM book_copies_temp; acima, para a tabela book_copies_new

--abaixo, duas funções que geram dados aleatórios, de modo a facilitar a inserção na tabela library.book_copies_new

--função que gera data aleatória para o atributo acquisition_date, situando de 2010 até 01/01/2016
CREATE OR REPLACE FUNCTION library.acquisition_date_gen() RETURNS DATE AS $$
DECLARE
	acdate date;
BEGIN
	SELECT ('2010-01-01'::date + random() * '6 years'::interval)::date INTO acdate;
	RETURN acdate;
END; $$ LANGUAGE PLPGSQL;

--função que gera valor aleatório para o atributo copy_condition, de acordo com o escopo dado
CREATE OR REPLACE FUNCTION library.condition_gen() RETURNS VARCHAR AS $$
DECLARE
	copy_cond VARCHAR;
BEGIN
	SELECT (array['fine', 'good', 'fair', 'poor'])[ceiling(random()*4)] INTO copy_cond;
	RETURN copy_cond;
END; $$ LANGUAGE PLPGSQL;


--função que compara as quantidades de cópias, notifica inconsistências e preenche a tabela nova de acordo
CREATE OR REPLACE FUNCTION library.book_copy_compare_and_fill() RETURNS VARCHAR AS $$
DECLARE
	old_copycount INT;
	new_copycount INT;
	branch_count INT;
	book_count INT;
	copydiff INT;
BEGIN
	SELECT COUNT(*) FROM library.library_branch INTO branch_count;
	SELECT COUNT(*) FROM library.book INTO book_count;
	
	FOR i IN 1..branch_count LOOP --utilizar da contagem de livros e ramos para selecionar as cópias
		FOR j IN 1..book_count LOOP      --de cada livro por ramo, agrupando pelos id's respectivos
			SELECT no_of_copies FROM book_copies_temp WHERE book_id = j AND branch_id = i INTO old_copycount;
			SELECT copies_no FROM (SELECT book_id, branch_id, COUNT(book_id) AS copies_no
								   FROM library.book_copies_new GROUP BY book_id, branch_id) AS bkcnewcount
							 WHERE book_id = j AND branch_id = i INTO new_copycount;
			
			--tratamento de nulos
			IF old_copycount IS NULL THEN --pode retornar nulo por selecionar atributo ao invés de contagem por agregação
				old_copycount := 0; 
			END IF;
			IF new_copycount IS NULL THEN --tratamento de valores de contagem nulos para id's não encontrados pelo where 
				new_copycount := 0; 
			END IF;
			copydiff := old_copycount - new_copycount;
			
			
			IF copydiff != 0 THEN --notifica inconsistência de cópias e insere na tabela nova os dados que faltam
				RAISE NOTICE 'Inconsistent amount of copies. % copies missing for book % in branch %.
Missing data will be inserted.', copydiff, j, i;
				FOR k IN 1..copydiff LOOP --preenche com id's respectivos e dados restantes gerados aleatoriamente
					INSERT INTO library.book_copies_new (Book_id, Branch_id, acquisition_date, copy_condition) 
								VALUES (j, i, library.acquisition_date_gen(), library.condition_gen());
				END LOOP;
				
				ELSIF copydiff = 0 AND old_copycount > 0 THEN --notifica caso não há inconsistência de cópias, tratando combinações de id inexistentes
					RAISE INFO 'Book % in branch % with matching amount of copies.', j, i;	
			END IF;
			
		END LOOP;
	END LOOP;
	RETURN 'VIEW MESSAGES TAB IF IN PGADMIN'; --varchar dummy de retorno, solicita ao usuário que verifique
END; $$ LANGUAGE PLPGSQL;						--a aba de mensagens caso esteja no pgadmin, para visualizar as notificações

SELECT library.book_copy_compare_and_fill(); --chama a função

--reinicia a sequência do atributo copy_id. Parâmetro arbitrário, ação recomendada caso delete tuplas
ALTER SEQUENCE library.book_copies_new_copy_id_seq RESTART WITH 1;

SELECT * FROM library.book_copies_new; --confere

DROP TABLE book_copies_temp; --drop tabela temporária
DROP TABLE library.book_copies; --drop tabela de cópias antiga


--definição da view book_copies, a partir da tabela book_copies_new
CREATE OR REPLACE VIEW library.book_copies AS SELECT book_id, branch_id, COUNT(book_id)::int AS no_of_copies
FROM library.book_copies_new GROUP BY book_id, branch_id;

--função com as especificações interativas entre view e tabela nova
CREATE OR REPLACE FUNCTION library.manipulate_book_copies() RETURNS TRIGGER AS $$
DECLARE 
	book_copycount INT;
	book_copydiff INT;
BEGIN
	SELECT COUNT(*) FROM library.book_copies_new WHERE book_id = OLD.book_id
	AND branch_id = OLD.branch_id INTO book_copycount; --armazena quantidade de cópias de livro em filial de acordo com consulta
	
	IF book_copycount IS NULL THEN
		book_copycount = 0;
	END IF;
	
	book_copydiff := NEW.no_of_copies - book_copycount; --armazena a quantidade de cópias de livro a serem inseridas, caso tenha sido atualizada
	
	IF TG_OP = 'DELETE' THEN --deletar tuplas na view deve deletar na tabela nova
		DELETE FROM library.book_copies_new WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id;
		
	ELSIF TG_OP = 'UPDATE' THEN
		UPDATE library.book_copies_new SET book_id = NEW.book_id, branch_id = NEW.branch_id
		WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id; --atualização de id's na view para a tabela nova
	
		IF book_copydiff < 0 THEN --book_copydiff negativo indica que houve tentativa de redução do número de cópias de um livro, que é proibido
			RAISE EXCEPTION 'Reducing the number of copies is forbidden!';
		ELSIF book_copydiff > 0 THEN
			FOR i IN 1..book_copydiff LOOP --inserts para casar com aumento de número de cópias
				INSERT INTO library.book_copies_new (book_id, branch_id, acquisition_date, copy_condition)
				VALUES (NEW.book_id, NEW.branch_id, CURRENT_DATE, library.condition_gen());
			END LOOP;
		END IF;
	
	ELSIF TG_OP = 'INSERT' THEN --insert na view deve inserir cópias de acordo com o atributo no_of_copies na tabela nova
		FOR i IN 1..book_copydiff LOOP
			INSERT INTO library.book_copies_new (book_id, branch_id, acquisition_date, copy_condition)
			VALUES (NEW.book_id, NEW.branch_id, CURRENT_DATE, library.condition_gen());
		END LOOP;
	END IF;
	
	RETURN NEW;
END; $$ LANGUAGE PLPGSQL;

--trigger que aplica a função acima
CREATE OR REPLACE TRIGGER tg_book_copies INSTEAD OF INSERT OR DELETE OR UPDATE ON library.book_copies
FOR EACH ROW EXECUTE FUNCTION library.manipulate_book_copies();

--testes do trigger tg_book_copies

--delete
SELECT * FROM library.book_copies WHERE book_id = 32;
SELECT * FROM library.book_copies_new WHERE book_id = 32;

DELETE FROM library.book_copies WHERE book_id = 32 AND branch_id = 1;

SELECT * FROM library.book_copies_new WHERE book_id = 32;

--update id
SELECT * FROM library.book_copies WHERE book_id = 1 AND branch_id = 1;
SELECT * FROM library.book_copies WHERE book_id = 1 AND branch_id = 2;
SELECT * FROM library.book_copies_new WHERE book_id = 1 AND branch_id = 1;
SELECT * FROM library.book_copies_new WHERE book_id = 1 AND branch_id = 2;

UPDATE library.book_copies SET branch_id = 3 WHERE book_id = 1 AND branch_id = 1;

SELECT * FROM library.book_copies WHERE book_id = 1 AND branch_id = 3;
SELECT * FROM library.book_copies_new WHERE book_id = 1 AND branch_id = 3;

--update no_of_copies
SELECT * FROM library.book_copies WHERE book_id = 1 AND branch_id = 2;
SELECT * FROM library.book_copies_new WHERE book_id = 1 AND branch_id = 2;

UPDATE library.book_copies SET no_of_copies = 3 WHERE book_id = 1 AND branch_id = 2; --exception nesta linha
UPDATE library.book_copies SET no_of_copies = 7 WHERE book_id = 1 AND branch_id = 2;

SELECT * FROM library.book_copies WHERE book_id = 1 AND branch_id = 2;
SELECT * FROM library.book_copies_new WHERE book_id = 1 AND branch_id = 2;

--insert
INSERT INTO library.book_copies VALUES (32, 1, 7);
SELECT * FROM library.book_copies_new WHERE book_id = 32 AND branch_id = 1;