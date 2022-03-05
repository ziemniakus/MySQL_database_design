/*W KOMENTATRZACH NAZWY TABELEK*/

/*PRACOWNICY*/


insert into PRACOWNICY(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, TELEFON, EMAIL)
values ('Geralt','Wiedźmin','Rivii','64072699455','12 420-46-23','km.kowalska@szpitalp.krakow.pl');				/*LEKARZ*/

insert into PRACOWNICY(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, TELEFON, EMAIL)
values ('Agata','Joanna','Lisowska','76081767980','12 420-46-26','aj.lisowska@szpitalp.krakow.pl');				/*PIELĘGNIARKA*/

insert into PRACOWNICY(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, TELEFON, EMAIL)
values ('Krzysztof','Dobromir','Pędziwiatr','68031478996','12 420-46-33','kd.pedziwiatr@szpitalp.krakow.pl');	/*LEKARZ*/

insert into PRACOWNICY(IMIE, NAZWISKO, PESEL, TELEFON, EMAIL)
values ('Sędzimir','Dobrewieści','83071543389','12 420-46-36','s.dobrewiesci@szpitalp.krakow.pl');				/*PIELĘGNIARKA*/


/*-----------------------------------------------------------*/


/*ADRESY PRACOWNIKÓW*/

insert into ADRESY_PRACOWNIKOW(PRACOWNIK_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
values ('1','Wyszyńskiego 9','31-344','Kraków','Polska');		/*LEKARZ*/

insert into ADRESY_PRACOWNIKOW(PRACOWNIK_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
values ('2','Poniatowskiego 4','30-050','Kraków','Polska');		/*PIELĘGNIARKA*/

insert into ADRESY_PRACOWNIKOW(PRACOWNIK_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
values ('3','Żeromskiego 41A','31-971','Kraków','Polska');		/*LEKARZ*/

insert into ADRESY_PRACOWNIKOW(PRACOWNIK_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
values ('4','Moniuszki 18','31-524','Kraków','Polska');			/*PIELĘGNIARKA*/


/*-----------------------------------------------------------*/


/*ODDZIAŁY*/

insert into ODDZIALY(NAZWA, LOKALIZACJA)
values ('Psychiatryczny Ogólny','Wadowice');

insert into ODDZIALY(NAZWA, LOKALIZACJA)
values ('Leczenia Zaburzeń Nerwicowych','Kraków');

insert into ODDZIALY(NAZWA, LOKALIZACJA)
values ('Psychosomatyczny','Wadowice');

insert into ODDZIALY(NAZWA, LOKALIZACJA)
values ('Rehabilitacji Neurologicznej','Kraków');

insert into ODDZIALY(NAZWA, LOKALIZACJA)
values ('Leczenia Alkoholowych Zespołów Abstynencyjnych','Kraków');

insert into ODDZIALY(NAZWA, LOKALIZACJA)
values ('Terapii Uzależnienia od Używek','Kraków');


/*-----------------------------------------------------------*/


/*LEKARZE*/


insert into LEKARZE(LEKARZ_ID, DATA_URODZENIA, ADRES_LEKARZA_ID, SPECJALIZACJA, STOPIEN, NUMER_ZAWODU, DATA_ZATRUDNIENIA, ODDZIAL_ID)
values ('1','1964-07-26','1','Psychiatra','dr n. med.','5425740','2010-05-01','1');

insert into LEKARZE(LEKARZ_ID, DATA_URODZENIA, ADRES_LEKARZA_ID, SPECJALIZACJA, STOPIEN, NUMER_ZAWODU, DATA_ZATRUDNIENIA, ODDZIAL_ID)
values ('3','1968-03-14','3','Psychiatra','prof. dr hab. n. med.','6253781','2013-01-01','6');


/*-----------------------------------------------------------*/


/*OSOBA UPOWAŻNIONA*/


insert into OSOBA_UPOWAZNIONA(RELACJA, IMIE, NAZWISKO, PESEL, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO, TELEFON, EMAIL)
values ('Ojciec','Andrzej','Kmicic','65021850623','Liryczna 21','44-212','Rudziniec','Polska','48 602543253','ahkmicic@gmail.com');

insert into OSOBA_UPOWAZNIONA(RELACJA, IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO, TELEFON, EMAIL)
values ('Matka','Anna','Julia', 'Miła','58062409054','Kościelna 18','33-102','Kraków','Polska','48 613250089','amila@gmail.com');


/*-----------------------------------------------------------*/


/*PACJENCI*/


insert into PACJENCI(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, DATA_URODZENIA, UBEZPIECZENIE, LEKARZ_ID, DATA_PRZYJECIA, PODMIOT_KIERUJACY, WAGA, WZROST, UPOWAZNIONA_ID)
values ('Karolina','Magdalena','Kowalska','93040503843','1993-04-05','1','1','2016-05-24','samodzielnie','60','165','1');

insert into PACJENCI(IMIE, DRUGIE_IMIE, NAZWISKO, PESEL, DATA_URODZENIA, UBEZPIECZENIE, LEKARZ_ID, DATA_PRZYJECIA, ZGODA_PRZYJECIA, PODMIOT_KIERUJACY, WAGA, WZROST, ALERGIE, OPIS_ALERGII, UPOWAZNIONA_ID)
values ('Katarzyna','Aneta','Jóźwik','96120944897','1996-12-09','1','3','2016-06-15','1','samodzielnie','60','178','1','Penicylina','2');


/*-----------------------------------------------------------*/


/*ADRESY PACJENTÓW*/


insert into ADRESY_PACJENTOW(PACJENT_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
values ('1','Liryczna 21','44-212','Rudziniec','Polska');

insert into ADRESY_PACJENTOW(PACJENT_ID, ULICA, KOD_POCZTOWY, MIASTO, PANSTWO)
values ('2','Kościelna 18','33-102','Kraków','Polska');


/*-----------------------------------------------------------*/


/*PIELĘGNIARKI*/


insert into PIELEGNIARKI(PIELEGNIARKA_ID, DATA_URODZENIA, ADRES_PIELEGNIARKI_ID, DATA_ZATRUDNIENIA, ODDZIAL_ID)
values ('2','1976-08-17','2','2013-02-01','1');

insert into PIELEGNIARKI(PIELEGNIARKA_ID, DATA_URODZENIA, ADRES_PIELEGNIARKI_ID, DATA_ZATRUDNIENIA, ODDZIAL_ID)
values ('4','1983-07-15','4','2006-08-01','6');


/*-----------------------------------------------------------*/


/*WIDELKI*/


insert into WIDELKI(PRACOWNIK_ID, PENSJA, PREMIA)
values ('1','6500','800');

insert into WIDELKI(PRACOWNIK_ID, PENSJA, PREMIA)
values ('2','2800','400');

insert into WIDELKI(PRACOWNIK_ID, PENSJA, PREMIA)
values ('3','8000','950');

insert into WIDELKI(PRACOWNIK_ID, PENSJA, PREMIA)
values ('4','2350','200');


/*-----------------------------------------------------------*/


/*BADANIA*/


insert into BADANIA(LEKARZ_ID, PACJENT_ID, DATA_BADANIA, ROZPOZNANIE, ICD10_ID)
values ('1','1','2016-05-24','Schizofrenia paranoidalna','F200');

insert into BADANIA(LEKARZ_ID, PACJENT_ID, DATA_BADANIA, TRYB_PRZYJECIA, ICD10_ID)
values ('1','1','2016-06-24','planowy','F200');

insert into BADANIA(LEKARZ_ID, PACJENT_ID, DATA_BADANIA, TRYB_PRZYJECIA, ROZPOZNANIE, ICD10_ID)
values ('3','2','2016-07-01','planowy','Uzależnienie od kokainy po odstawieniu','F1423');


/*-----------------------------------------------------------*/


/*OPIEKA*/


insert into OPIEKA(PIELEGNIARKA_ID, PACJENT_ID, TEMPERATURA, LEKI, OPIS)
values ('2','1','36.7','1','Pacjentka dobrze reaguje na podawane leki');


/*-----------------------------------------------------------*/


/*ZALECENIA*/


insert into ZALECENIA(BADANIE_ID, LEK, DAWKOWANIE)
values ('1','Risperidon Vipharm, 2mg','Jedna tabletka rano i wieczorem');

insert into ZALECENIA(BADANIE_ID, LEK, DAWKOWANIE)
values ('2','Risperidon Vipharm, 1mg','Jedna tabletka rano i wieczorem');

insert into ZALECENIA(BADANIE_ID, LEK, DAWKOWANIE)
values ('3','Metadon, syrop','Dwie łyżki doustnie raz dziennie');


/*-----------------------------------------------------------*/


/*TABELE POMOCNICZE*/

insert into LEKI(LEKI_ID, WYDARZENIE)
values ('0', 'Nie podano');

insert into LEKI(LEKI_ID, WYDARZENIE)
values ('1', 'Podano');

insert into LOGICZNE(LOGICZNE_ID, WYDARZENIE)
values ('0', 'Nie');

insert into LOGICZNE(LOGICZNE_ID, WYDARZENIE)
values ('1', 'Tak');