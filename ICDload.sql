load data local infile '/Users/joannakonka/Studies-materials/Bazy/Projekt/ICD10/ICD10.csv' into table ICD10
	fields terminated by ',' enclosed by '"'
    LINES TERMINATED BY '\r\n';


/* aby wczytać plik należy ustawić odpowiednią ścieżkę do pliku np. dla pliku ICD10.csv, 
powyżej '/Users/joannakonka/Studies-materials/Bazy/Projekt/ICD10/ICD10.csv' */