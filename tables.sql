drop table if exists LOGICZNE;
drop table if exists LEKI;
drop table if exists ZALECENIA;
drop table if exists OPIEKA;
drop table if exists BADANIA;
drop table if exists ICD10;
drop table if exists WIDELKI;
drop table if exists PIELEGNIARKI;
drop table if exists ADRESY_PACJENTOW;
drop table if exists PACJENCI;
drop table if exists OSOBA_UPOWAZNIONA;
drop table if exists LEKARZE;
drop table if exists ODDZIALY;
drop table if exists ADRESY_PRACOWNIKOW;
drop table if exists PRACOWNICY;

create table if not exists PRACOWNICY
(
PRACOWNIK_ID int(5) not null auto_increment,
IMIE varchar(30) not null,
DRUGIE_IMIE varchar(30) null,
NAZWISKO varchar(30) not null,
PESEL bigint not null,
TELEFON varchar(14) not null,
EMAIL varchar(50) null,
primary key(PRACOWNIK_ID)
);

create table if not exists ADRESY_PRACOWNIKOW
(
ADRES_PRACOWNIKA_ID int(5) not null auto_increment,
PRACOWNIK_ID int(5) not null,
ULICA varchar(30) not null,
KOD_POCZTOWY varchar(6) not null,
MIASTO varchar(30) not null,
PANSTWO varchar(30) not null,
primary key(ADRES_PRACOWNIKA_ID),
constraint
foreign key(PRACOWNIK_ID)
references PRACOWNICY(PRACOWNIK_ID)
);

create table if not exists ODDZIALY
(
ODDZIAL_ID int(2) not null auto_increment,
NAZWA varchar(100) not null,
LOKALIZACJA varchar(30) not null,
primary key(ODDZIAL_ID)
);

create table if not exists LEKARZE
(
LEKARZ_ID int(5) not null,
DATA_URODZENIA date not null,
ADRES_LEKARZA_ID int(5) not null,
SPECJALIZACJA varchar(40) not null,
STOPIEN varchar(40) not null comment 'stopien naukowy',
NUMER_ZAWODU int(7) not null comment 'Numer prawa wykonywania zawodu',
DATA_ZATRUDNIENIA date not null,
ODDZIAL_ID int(2) not null,
primary key(LEKARZ_ID),
constraint
foreign key(LEKARZ_ID)
references PRACOWNICY(PRACOWNIK_ID),
constraint
foreign key(ODDZIAL_ID) 
references ODDZIALY(ODDZIAL_ID),
constraint
foreign key(ADRES_LEKARZA_ID) 
references ADRESY_PRACOWNIKOW(ADRES_PRACOWNIKA_ID)
);

create table if not exists OSOBA_UPOWAZNIONA			/*osoby upoważnione do bycia informowanym o stanie zdrowia pacjenta*/
(
UPOWAZNIONA_ID int(5) not null auto_increment,
RELACJA varchar(20) not null comment 'spowinowacenie z pacjentem',
IMIE varchar(30) not null,
DRUGIE_IMIE varchar(30) null,
NAZWISKO varchar(30) not null,
PESEL bigint null,
ULICA varchar(30) not null,
KOD_POCZTOWY varchar(6) not null,
MIASTO varchar(30) not null,
PANSTWO varchar(30) not null,
TELEFON varchar(14) not null,
EMAIL varchar(20) null,
primary key(UPOWAZNIONA_ID)
);

create table if not exists PACJENCI
(
PACJENT_ID int(5) not null auto_increment,
IMIE varchar(30) not null,
DRUGIE_IMIE varchar(30) null,
NAZWISKO varchar(30) not null,
PESEL bigint null,
DATA_URODZENIA date not null,
UBEZPIECZENIE tinyint(1) not null default 0 comment '0 - nie ma ubezpieczenia, 1 - ma ubezpieczenie,
mozliwe jest przyjecie pacjenta za oplata',
LEKARZ_ID int(5) not null,
DATA_PRZYJECIA date not null,
ZGODA_PRZYJECIA tinyint(1) not null default 0 comment '1 - ze zgodą, 0 - bez zgody',
PODMIOT_KIERUJACY varchar(15) not null comment 'oddzial kierujacy',
WAGA varchar(5) not null comment 'w kilogramach',
WZROST varchar(5) not null comment 'w cm',
ALERGIE tinyint(1) not null default 0 comment '0 - brak alergii, 1 - alergia',
OPIS_ALERGII text null,
UPOWAZNIONA_ID int(5) null comment 'konieczna przeważnie w przypadku osób o znacznym stopniu 
niepełnosprawności psychicznej',
TELEFON varchar(14) null comment 'nie dotyczny pacjentów o znacznym stopniu niepełnosprawności psychicznej',
EMAIL varchar(20) null comment 'nie dotyczny pacjentów o znacznym stopniu niepełnosprawności psychicznej',
CZY_PACJENT varchar(3) null,
primary key(PACJENT_ID),
constraint
foreign key(LEKARZ_ID) 
references LEKARZE(LEKARZ_ID),
constraint
foreign key(UPOWAZNIONA_ID)
references OSOBA_UPOWAZNIONA(UPOWAZNIONA_ID)
);

create table if not exists ADRESY_PACJENTOW /*adresy pacjentów*/
(
PACJENT_ID int(5) not null,
ULICA varchar(30) not null,
KOD_POCZTOWY varchar(6) not null,
MIASTO varchar(30) not null,
PANSTWO varchar(30) not null,
primary key(PACJENT_ID),
constraint
foreign key(PACJENT_ID) 
references PACJENCI(PACJENT_ID)
);

create table if not exists PIELEGNIARKI
(
PIELEGNIARKA_ID int(5) not null,
DATA_URODZENIA date not null,
ADRES_PIELEGNIARKI_ID int(5) not null,
DATA_ZATRUDNIENIA date not null,
ODDZIAL_ID int(2) not null,
primary key(PIELEGNIARKA_ID),
constraint
foreign key(PIELEGNIARKA_ID)
references PRACOWNICY(PRACOWNIK_ID),
constraint
foreign key(ODDZIAL_ID) 
references ODDZIALY(ODDZIAL_ID),
constraint
foreign key(ADRES_PIELEGNIARKI_ID) 
references ADRESY_PRACOWNIKOW(ADRES_PRACOWNIKA_ID)
);

create table if not exists WIDELKI
(
PRACOWNIK_ID int(5) not null,
PENSJA int(6) not null comment 'pensja w złotówkach',
PREMIA int(3) not null comment 'premia roczna w złotówkach',
AKTUALNOSC varchar(11) not null default 'aktualne',
constraint
foreign key(PRACOWNIK_ID)
references PRACOWNICY(PRACOWNIK_ID)
);

create table if not exists ICD10
(
ICD10_ID varchar(10) not null,
CHOROBA text not null,
primary key(ICD10_ID)
);

create table if not exists BADANIA
(
BADANIE_ID int(10) not null auto_increment,
LEKARZ_ID int(5) not null,
PACJENT_ID int(5) not null,
DATA_BADANIA date not null,
TRYB_PRZYJECIA varchar(7) not null default 'nagły',
ROZPOZNANIE text null comment 'w razie uzycia tylko ICD10 to pole moze pozostac puste 
lub gdy jest to kontrolna wizyta i stan zdrowia pacjenta nie uległ zmianie',
ICD10_ID varchar(10) not null,
primary key(BADANIE_ID),
constraint
foreign key(LEKARZ_ID)
references LEKARZE(LEKARZ_ID),
constraint
foreign key(PACJENT_ID)
references PACJENCI(PACJENT_ID),
constraint
foreign key(ICD10_ID)
references ICD10(ICD10_ID)
);

create table if not exists OPIEKA		/*opieka pielęgniarek nad pacjentami*/
(
OPIEKA_ID int(5) not null auto_increment,
PIELEGNIARKA_ID int(5) not null,
PACJENT_ID int(5) not null,
DZIEN datetime not null default now(),
STOLEC tinyint(1) not null default 0 comment '0 oznacza brak oddania stolca, 1 to wystapienie wyprozenienia danego dnia',
TEMPERATURA float(3,1) not null comment 'temperatura ciala pacjenta w celcjuszach',
LEKI tinyint(1) not null default 0 comment '0 - nie podano żadnego leku, 1 - podano lek (w kolumnie OPIS elaboracja)',
OPIS text null,
primary key(OPIEKA_ID),
constraint
foreign key(PIELEGNIARKA_ID) 
references PIELEGNIARKI(PIELEGNIARKA_ID),
constraint
foreign key(PACJENT_ID) 
references PACJENCI(PACJENT_ID)
);

create table if not exists ZALECENIA
(
BADANIE_ID int(10) not null,
LEK varchar(150) null,
DAWKOWANIE text null,
constraint
foreign key(BADANIE_ID) 
references BADANIA(BADANIE_ID)
);

create table if not exists LEKI
(
LEKI_ID tinyint(1) not null,
WYDARZENIE varchar(10) not null
);

create table if not exists LOGICZNE
(
LOGICZNE_ID tinyint(1) not null,
WYDARZENIE varchar(3) not null
);