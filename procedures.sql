start transaction;


delimiter //


drop procedure if exists nowy_lekarz; //
drop procedure if exists nowa_pielegniarka; //
drop procedure if exists nowa_upowazniona; //
drop procedure if exists nowy_pacjent; //
drop procedure if exists nowe_zarobki; //
drop procedure if exists zmien_zarobki_lekarza; //
drop procedure if exists zmien_zarobki_pielegniarki; //
drop procedure if exists nowe_badanie; //
drop procedure if exists usun_pacjenta; //


/*-----------------------------------------------------------*/


create procedure nowy_lekarz(imie varchar(30), drugie_imie varchar(30), nazwisko varchar(30), pesel2 bigint,
telefon varchar(14), email varchar(50), data_urodzenia date, ulica varchar(30), kod_pocztowy varchar(6),
miasto varchar(30), panstwo varchar(30), specjalizacja varchar(40), stopien varchar(40), numer_zawodu int(7), 
data_zatrudnienia date, oddzial_id int(2))

begin

declare ID_P int (5);
declare ID_A int (5);

insert into PRACOWNICY(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, TELEFON, EMAIL)
 values (imie, drugie_imie, nazwisko, pesel2, telefon, email);
 
set ID_P = (select PRACOWNIK_ID from PRACOWNICY where PESEL = pesel2);

insert into ADRESY_PRACOWNIKOW(PRACOWNIK_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
 values (ID_P, ulica, kod_pocztowy, miasto, panstwo);
 
set ID_A = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW where PRACOWNIK_ID = ID_P);

insert into LEKARZE(LEKARZ_ID, DATA_URODZENIA, ADRES_LEKARZA_ID, SPECJALIZACJA, STOPIEN, NUMER_ZAWODU, 
DATA_ZATRUDNIENIA, ODDZIAL_ID)
 values (ID_P, data_urodzenia, ID_A, specjalizacja, stopien, numer_zawodu, data_zatrudnienia, oddzial_id);
 
end; //


/*-----------------------------------------------------------*/


create procedure nowa_pielegniarka(imie varchar(30), drugie_imie varchar(30), nazwisko varchar(30), pesel2 bigint,
telefon varchar(14), email varchar(50), data_urodzenia date, ulica varchar(30), kod_pocztowy varchar(6),
miasto varchar(30), panstwo varchar(30), data_zatrudnienia date, oddzial_id int(2))

begin

declare ID_P int (5);
declare ID_A int (5);

insert into PRACOWNICY(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, TELEFON, EMAIL)
 values (imie, drugie_imie, nazwisko, pesel2, telefon, email);
 
set ID_P = (select PRACOWNIK_ID from PRACOWNICY where PESEL = pesel2);

insert into ADRESY_PRACOWNIKOW(PRACOWNIK_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
 values (ID_P, ulica, kod_pocztowy, miasto, panstwo);
 
set ID_A = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW where PRACOWNIK_ID = ID_P);

insert into PIELEGNIARKI(PIELEGNIARKA_ID, DATA_URODZENIA, ADRES_PIELEGNIARKI_ID, DATA_ZATRUDNIENIA, ODDZIAL_ID)
 values (ID_P, data_urodzenia, ID_A, data_zatrudnienia, oddzial_id);
 
end; //


/*-----------------------------------------------------------*/


create procedure nowa_upowazniona(relacja varchar(20), imie varchar(30), drugie_imie varchar(30), nazwisko varchar(30),
pesel bigint, ulica varchar(30), kod_pocztowy varchar(6), miasto varchar(30), panstwo varchar(30),telefon varchar(14),
email varchar(20))

begin

insert into OSOBA_UPOWAZNIONA(RELACJA, IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO,
TELEFON, EMAIL)
 values (relacja, imie, drugie_imie, nazwisko, pesel, ulica, kod_pocztowy, miasto, panstwo, telefon, email);
 
 end; //


/*-----------------------------------------------------------*/


create procedure nowy_pacjent(imie varchar(30), drugie_imie varchar(30), nazwisko varchar(30), pesel2 bigint,
data_urodzenia date, ulica varchar(30), kod_pocztowy varchar(6), miasto varchar(30), panstwo varchar(30),
ubezpieczenie tinyint(1), data_przyjecia date, zgoda_przyjecia tinyint(1), podmiot_kierujacy varchar(15), 
waga varchar(5), wzrost varchar(5), alergie tinyint(1), opis_alergii text, telefon varchar(14), 
email varchar(20), pesel_lekarza bigint, pesel_upowaznionej bigint)

begin

declare ID_P int(5);
declare ID_L int(5);
declare ID_U int(5);

set ID_L = (select PRACOWNIK_ID from PRACOWNICY where PESEL = pesel_lekarza);
set ID_U = (select UPOWAZNIONA_ID from OSOBA_UPOWAZNIONA where PESEL = pesel_upowaznionej);

insert into PACJENCI(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, DATA_URODZENIA, UBEZPIECZENIE, LEKARZ_ID, DATA_PRZYJECIA,
ZGODA_PRZYJECIA, PODMIOT_KIERUJACY, WAGA, WZROST, ALERGIE, OPIS_ALERGII, UPOWAZNIONA_ID, TELEFON, EMAIL)
 values (imie, drugie_imie, nazwisko, pesel2, data_urodzenia, ubezpieczenie, ID_L, data_przyjecia, zgoda_przyjecia,
 podmiot_kierujacy, waga, wzrost, alergie, opis_alergii, ID_U, telefon, email);
 
set ID_P = (select PACJENT_ID from PACJENCI where PESEL = pesel2); 
 
insert into ADRESY_PACJENTOW(PACJENT_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
 values (ID_P, ulica, kod_pocztowy, miasto, panstwo);

end; //


/*-----------------------------------------------------------*/


create procedure nowe_zarobki(pesel1 bigint, pensja int(6), premia int(3))

begin

declare ID_P int(5);

set ID_P = (select PRACOWNIK_ID from PRACOWNICY where PESEL = pesel1);

insert into WIDELKI(PRACOWNIK_ID, PENSJA, PREMIA)
 values(ID_P, pensja, premia);
 
end; //


/*-----------------------------------------------------------*/


create procedure zmien_zarobki_lekarza(pesel2 bigint, pensja_nowa int(6), premia_nowa int(3))

begin

declare ID int(5);
declare ID_newP int(5);
declare ID_A int(5);
declare ID_newA int(5);
declare ID_P int(5);
declare ID_AA int(5);

set ID = (select PRACOWNIK_ID from PRACOWNICY where PESEL = pesel2);
set ID_newP = (select PRACOWNIK_ID from PRACOWNICY order by PRACOWNIK_ID desc limit 1);

set SQL_SAFE_UPDATES = 0;

create temporary table TMP engine=memory select * from PRACOWNICY where PRACOWNIK_ID = ID;
 update TMP set PRACOWNIK_ID = (ID_newP + 1);
 insert into PRACOWNICY select * from TMP where PRACOWNIK_ID = (ID_newP + 1);

drop temporary table if exists TMP;

set ID_A = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW where PRACOWNIK_ID = ID);
set ID_newA = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW order by ADRES_PRACOWNIKA_ID desc limit 1);
set ID_P = (select PRACOWNIK_ID from PRACOWNICY order by PRACOWNIK_ID desc limit 1);

create temporary table TMP2 engine=memory select * from ADRESY_PRACOWNIKOW where ADRES_PRACOWNIKA_ID = ID_A;
 update TMP2 set ADRES_PRACOWNIKA_ID = (ID_newA + 1);
 insert into ADRESY_PRACOWNIKOW select * from  TMP2 where ADRES_PRACOWNIKA_ID = (ID_newA + 1);

drop temporary table if exists TMP2;

set ID_AA = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW order by ADRES_PRACOWNIKA_ID desc limit 1);

update ADRESY_PRACOWNIKOW set PRACOWNIK_ID = ID_P where ADRES_PRACOWNIKA_ID = ID_AA;

create temporary table TMP3 engine=memory select * from LEKARZE where LEKARZ_ID = ID;
 update TMP3 set LEKARZ_ID = ID_P;
 insert into LEKARZE select * from TMP3 where LEKARZ_ID = ID_P;

drop temporary table if exists TMP3;

update LEKARZE set ADRES_LEKARZA_ID = ID_AA where LEKARZ_ID = ID_P;

update WIDELKI set AKTUALNOSC = 'nieaktualne' where PRACOWNIK_ID = ID;
insert into WIDELKI(PRACOWNIK_ID, PENSJA, PREMIA)
 values(ID_P, pensja_nowa, premia_nowa);
 
end; //


/*-----------------------------------------------------------*/


create procedure zmien_zarobki_pielegniarki(pesel2 bigint, pensja_nowa int(6), premia_nowa int(3))

begin

declare ID int(5);
declare ID_newP int(5);
declare ID_A int(5);
declare ID_newA int(5);
declare ID_P int(5);
declare ID_AA int(5);

set ID = (select PRACOWNIK_ID from PRACOWNICY where PESEL = pesel2);
set ID_newP = (select PRACOWNIK_ID from PRACOWNICY order by PRACOWNIK_ID desc limit 1);

set SQL_SAFE_UPDATES = 0;

create temporary table TMP engine=memory select * from PRACOWNICY where PRACOWNIK_ID = ID;
 update TMP set PRACOWNIK_ID = (ID_newP + 1);
 insert into PRACOWNICY select * from TMP where PRACOWNIK_ID = (ID_newP + 1);

drop temporary table if exists TMP;

set ID_A = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW where PRACOWNIK_ID = ID);
set ID_newA = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW order by ADRES_PRACOWNIKA_ID desc limit 1);
set ID_P = (select PRACOWNIK_ID from PRACOWNICY order by PRACOWNIK_ID desc limit 1);

create temporary table TMP2 engine=memory select * from ADRESY_PRACOWNIKOW where ADRES_PRACOWNIKA_ID = ID_A;
 update TMP2 set ADRES_PRACOWNIKA_ID = (ID_newA + 1);
 insert into ADRESY_PRACOWNIKOW select * from  TMP2 where ADRES_PRACOWNIKA_ID = (ID_newA + 1);

drop temporary table if exists TMP2;

set ID_AA = (select ADRES_PRACOWNIKA_ID from ADRESY_PRACOWNIKOW order by ADRES_PRACOWNIKA_ID desc limit 1);

update ADRESY_PRACOWNIKOW set PRACOWNIK_ID = ID_P where ADRES_PRACOWNIKA_ID = ID_AA;

create temporary table TMP3 engine=memory select * from PIELEGNIARKI where PIELEGNIARKA_ID = ID;
 update TMP3 set PIELEGNIARKA_ID = ID_P;
 insert into PIELEGNIARKI select * from TMP3 where PIELEGNIARKA_ID = ID_P;

drop temporary table if exists TMP3;

update PIELEGNIARKI set ADRES_PIELEGNIARKI_ID = ID_AA where PIELEGNIARKA_ID = ID_P;

update WIDELKI set AKTUALNOSC = 'nieaktualne' where PRACOWNIK_ID = ID;
insert into WIDELKI(PRACOWNIK_ID, PENSJA, PREMIA)
 values(ID_P, pensja_nowa, premia_nowa);
 
end; //


/*-----------------------------------------------------------*/


create procedure nowe_badanie(pesel_lekarz bigint, pesel_pacjent bigint, data_badania date, tryb_przyjecia varchar(7), 
rozpoznanie text, icd10 varchar(10))

begin

declare ID_L int(5);
declare ID_P int(5);

set ID_L = (select PRACOWNIK_ID from PRACOWNICY PR where PR.PESEL = pesel_lekarz);
set ID_P = (select PACJENT_ID from PACJENCI P where P.PESEL = pesel_pacjent);

if (curdate() <= data_badania) then
 
 insert into BADANIA(LEKARZ_ID, PACJENT_ID, DATA_BADANIA, TRYB_PRZYJECIA, ROZPOZNANIE, ICD10_ID)
  values (ID_L, ID_P, data_badania, tryb_przyjecia, rozpoznanie, icd10);
 
else select 'Error: Nie można zapisać badania na datę minioną';
end if;

end; //
 

/*-----------------------------------------------------------*/
 
 
create procedure usun_pacjenta(pesel2 bigint)

begin

declare ID int(5);

set ID = (select PACJENT_ID from PACJENCI where PESEL = pesel2);

update PACJENCI set CZY_PACJENT = 'Nie' where PACJENT_ID = ID;

end;//
 

 
delimiter ;



commit;