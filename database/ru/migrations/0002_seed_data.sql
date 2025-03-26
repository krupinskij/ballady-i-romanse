-- Migration number: 0002 	 2025-03-26T21:24:43.112Z
DELETE FROM Note;
DELETE FROM Annotation;
DELETE FROM Content;
DELETE FROM Motto;
DELETE FROM Ballad;

INSERT INTO Ballad (id, title, ordinal, link)
	VALUES
		("pierwiosnek", "Первоцвет", 0, "https://ru.wikisource.org/wiki/Первоцвет_(Мицкевич;_Н._П._Семёнов)"),
		("romantycznosc", "Романтизм", 1, "https://ru.wikisource.org/wiki/Романтизм_(Мицкевич;_Минаев)"),
		("switez", "Свитязь", 2, "https://ru.wikisource.org/wiki/Свитязь_(Мицкевич;_Минаев,_Бенедиктов)"),
		("switezianka", "Свитязанка", 3, "https://ru.wikisource.org/wiki/Свитезянка_(Мицкевич;_Мей)"),
		("rybka", "Рыбка", 4, "https://ru.wikisource.org/wiki/Рыбка_(Мицкевич;_Бенедиктов)"),
		("powrot-taty", "Возвращение тяти", 5, "https://ru.wikisource.org/wiki/Возвращение_тяти_(Мицкевич;_Бенедиктов)"),
		("kurhanek-maryli", "Курган Мариси", 6, "https://ru.wikisource.org/wiki/Курган_Мариси_(Мицкевич;_Минаев)"),
		("do-przyjaciol", "К друзьям", 7, "https://ru.wikisource.org/wiki/К_друзьям_(Мицкевич;_Бенедиктов)"),
		("to-lubie", "{{1:Вот люблю!}}", 8, "https://ru.wikisource.org/wiki/Вот_люблю!_(Мицкевич;_Бенедиктов)"),
		("rekawiczka", "Перчатка", 9, "https://ru.wikisource.org/wiki/Перчатка_(Шиллер;_Жуковский)"),
		("pani-twardowska", "Пани Твардовская", 10, "https://ru.wikisource.org/wiki/Пани_Твардовская_(Мицкевич;_Мей)"),
		("tukaj-albo-proby-przyjazni", "Тукай, или испытания дружбы", 11, "https://ru.wikisource.org/wiki/Тукай_или_испытания_дружбы_(Мицкевич;_Бенедиктов)"),
		("lilje", "Лилии", 12, "https://ru.wikisource.org/wiki/Лилии_(Мицкевич;_И._В._Фёдоров)"),
		("dudarz", "Гудочник", 13, "https://ru.wikisource.org/wiki/Гудочник_(Мицкевич;_Бенедиктов)");

UPDATE Ballad
SET
	nextId = "romantycznosc"
WHERE id = "pierwiosnek";

UPDATE Ballad
SET
	prevId = "pierwiosnek",
	nextId = "switez"
WHERE id = "romantycznosc";

UPDATE Ballad
SET
	prevId = "romantycznosc",
	nextId = "switezianka"
WHERE id = "switez";

UPDATE Ballad
SET
	prevId = "switez",
	nextId = "rybka"
WHERE id = "switezianka";

UPDATE Ballad
SET
	prevId = "switezianka",
	nextId = "powrot-taty"
WHERE id = "rybka";

UPDATE Ballad
SET
	prevId = "rybka",
	nextId = "kurhanek-maryli"
WHERE id = "powrot-taty";

UPDATE Ballad
SET
	prevId = "powrot-taty",
	nextId = "do-przyjaciol"
WHERE id = "kurhanek-maryli";

UPDATE Ballad
SET
	prevId = "kurhanek-maryli",
	nextId = "to-lubie"
WHERE id = "do-przyjaciol";

UPDATE Ballad
SET
	prevId = "do-przyjaciol",
	nextId = "rekawiczka"
WHERE id = "to-lubie";

UPDATE Ballad
SET
	prevId = "to-lubie",
	nextId = "pani-twardowska"
WHERE id = "rekawiczka";

UPDATE Ballad
SET
	prevId = "rekawiczka",
	nextId = "tukaj-albo-proby-przyjazni"
WHERE id = "pani-twardowska";

UPDATE Ballad
SET
	prevId = "pani-twardowska",
	nextId = "lilje"
WHERE id = "tukaj-albo-proby-przyjazni";

UPDATE Ballad
SET
	prevId = "tukaj-albo-proby-przyjazni",
	nextId = "dudarz"
WHERE id = "lilje";

UPDATE Ballad
SET
	prevId = "lilje"
WHERE id = "dudarz";