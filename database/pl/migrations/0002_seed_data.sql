-- Migration number: 0002 	 2025-03-26T20:37:40.989Z
DELETE FROM Note;
DELETE FROM Annotation;
DELETE FROM Content;
DELETE FROM Motto;
DELETE FROM Ballad;

INSERT INTO Ballad (id, title, ordinal, link)
	VALUES
		("pierwiosnek", "Pierwiosnek", 0, "https://wolnelektury.pl/katalog/lektura/mickiewicz-ballady-i-romanse-pierwiosnek.html"),
		("romantycznosc", "Romantyczność", 1, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-romantycznosc.html"),
		("switez", "Świteź", 2, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-switez.html"),
		("switezianka", "{{1:Świtezianka}}", 3, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-switezianka.html"),
		("rybka", "Rybka", 4, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-rybka.html"),
		("powrot-taty", "Powrót taty", 5, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-powrot-taty.html"),
		("kurhanek-maryli", "{{1:Kurhanek}} Maryli", 6, "https://wolnelektury.pl/katalog/lektura/mickiewicz-ballady-i-romanse-kurhanek-maryli.html"),
		("do-przyjaciol", "Do przyjaciół", 7, "https://wolnelektury.pl/katalog/lektura/mickiewicz-ballady-i-romanse-do-przyjaciol.html"),
		("to-lubie", "To lubię", 8, "https://wolnelektury.pl/katalog/lektura/mickiewicz-ballady-i-romanse-to-lubie.html"),
		("rekawiczka", "Rękawiczka", 9, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-rekawiczka.html"),
		("pani-twardowska", "Pani Twardowska", 10, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-pani-twardowska.html"),
		("tukaj-albo-proby-przyjazni", "Tukaj albo próby przyjaźni", 11, "https://wolnelektury.pl/katalog/lektura/mickiewicz-tukaj.html"),
		("lilje", "{{1:Lilje}}", 12, "https://wolnelektury.pl/katalog/lektura/ballady-i-romanse-lilje.html"),
		("dudarz", "Dudarz", 13, "https://wolnelektury.pl/katalog/lektura/mickiewicz-dudarz.html");

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

INSERT INTO Content (balladId, ordinal, speaker, body)
	VALUES
		("pierwiosnek", 0, null, "Z niebieskich najrańszą piosnek
Ledwie zadzwonił skowronek,
Najrańszy kwiatek pierwiosnek
Błysnął ze złotych obsłonek."),
		("pierwiosnek", 1, "Ja", "Za wcześnie, kwiatku, za wcześnie,
Jeszcze północ mrozem dmucha,
Z gór białe nie zeszły {{1:pleśnie}},
Dąbrowa jeszcze nie sucha."),
		("pierwiosnek", 2, null, "Przymruż złociste światełka,
Ukryj się pod matki rąbek,
Nim cię zgubi śronu ząbek
Lub chłodnej rosy perełka."),
		("pierwiosnek", 3, "Kwiatek", "Dni nasze jak dni motylka,
Życiem wschód, śmiercią południe;
Lepsza w kwietniu jedna chwilka
Niż w jesieni całe grudnie."),
		("pierwiosnek", 4, null, "Czy dla bogów szukasz datku,
Czy dla druha lub kochanki,
Upleć wianek z mego kwiatku,
Wianek to będzie nad wianki."),
		("pierwiosnek", 5, "Ja", "W podlej trawce, w dzikim lasku
Urosleś, o kwiatku luby!
Mało wzrostu, mało blasku,
Cóż ci daje tyle chluby?"),
		("pierwiosnek", 6, null, "Ni to kolory jutrzenki,
Ni zawoje tulipana,
Ni lilijowe sukienki,
Ni róży pierś malowana."),
		("pierwiosnek", 7, null, "Uplatam ciebie do wianka;
Lecz skądże ufności tyle!
Przyjaciele i kochanka
Czy cię powitają mile?"),
		("pierwiosnek", 8, "Kwiatek", "Powitają przyjaciele
Mnie, wiosny młodej aniołka;
Przyjaźń ma blasku niewiele
I cień lubi jak me ziołka."),
		("pierwiosnek", 9, null, "Czym kochanki godzien rączek,
Powiedz, niebieska Marylko!
Za pierwszy młodości pączek
Zyskam pierwszą… ach! łzę tylko."),
		("romantycznosc", 0, null, "Słuchaj dzieweczko!
— Ona nie słucha. —
To dzień biały! to miasteczko!
Przy tobie nie ma żywego ducha,
Co tam wkoło siebie chwytasz?
Kogo wołasz, z kim się witasz?
— Ona nie słucha. —"),
		("romantycznosc", 1, null, "To jak martwa opoka
Nie zwróci w stronę oka,
To strzela wkoło oczyma,
To się łzami zaleje,
Coś niby chwyta, coś niby trzyma,
Rozpłacze się i zaśmieje."),
		("romantycznosc", 2, null, "— „Tyżeś to w nocy? to ty Jasieńku!
Ach! i po śmierci kocha!
Tutaj, tutaj, pomaleńku,
{{2:Czasem}} usłyszy macocha!…"),
		("romantycznosc", 3, null, "Niech sobie słyszy… już nie ma ciebie,
Już po twoim pogrzebie!
Ty już umarłeś? Ach! ja się boję!…
Czego się boję mego Jasieńka?
Ach, to on! lica twoje, oczki twoje!
Twoja biała sukienka!"),
		("romantycznosc", 4, null, "I sam ty biały jak chusta,
Zimny… jakie zimne dłonie!
Tutaj połóż, tu na łonie,
Przyciśnij mnie, do ust usta!…"),
		("romantycznosc", 5, null, "Ach, jak tam zimno musi być w grobie!
Umarłeś, tak, dwa lata!
Weź mię, ja umrę przy tobie,
Nie lubię świata."),
		("romantycznosc", 6, null, "Źle mnie w złych ludzi tłumie:
Płaczę, a oni szydzą;
Mówię, nikt nie rozumie:
Widzę, oni nie widzą!"),
		("romantycznosc", 7, null, "Śród dnia przyjdź kiedy… To może we śnie?
Nie, nie… trzymam ciebie w ręku,
Gdzie znikasz, gdzie mój Jasieńku?
Jeszcze wcześnie, jeszcze wcześnie!"),
		("romantycznosc", 8, null, "Mój Boże! {{3:kur się odzywa}},
Zorza błyska w okienku.
Gdzie znikłeś! ach! stój Jasieńku!
Ja nieszczęśliwa!” —"),
		("romantycznosc", 9, null, "Tak się dziewczyna z kochankiem pieści,
Bieży za nim, krzyczy, pada;
Na ten upadek, na krzyk boleści,
Skupia się ludzi gromada."),
		("romantycznosc", 10, null, "„Mówcie pacierze! — krzyczy prostota —
Tu jego dusza być musi.
Jasio być musi przy swej Karusi,
On ją kochał za żywota!”"),
		("romantycznosc", 11, null, "I ja to słyszę, i ja tak wierzę,
Płaczę i mówię pacierze.
— „Słuchaj dzieweczko!” — krzyknie śród zgiełku
Starzec, i na lud zawoła:
„Ufajcie memu oku i szkiełku,
Nic tu nie widzę dokoła."),
		("romantycznosc", 12, null, "— {{4:Duchy karczemnej tworem gawiedzi,
W głupstwa wywarzone kuźni}};
Dziewczyna {{5:duby smalone}} bredzi,
A gmin rozumowi bluźni”."),
		("romantycznosc", 13, null, "„Dziewczyna czuje, — odpowiadam skromnie —
A gawiedź wierzy głęboko:
Czucie i wiara silniej mówi do mnie,
Niż mędrca szkiełko i oko."),
		("romantycznosc", 14, null, "Martwe znasz prawdy, nieznane dla ludu,
Widzisz świat w proszku, w każdej gwiazd iskierce;
Nie znasz prawd żywych, nie obaczysz cudu!
Miej serce i patrzaj w serce!”"),
		("switez", 0, null, "Ktokolwiek będziesz w Nowogródzkiej stronie,
Do Płużyn ciemnego boru
Wjechawszy, pomnij zatrzymać twe konie,
By się przypatrzyć jezioru."),
		("switez", 1, null, "Świteź tam jasne rozprzestrzenia łona,
W wielkiego kształcie obwodu,
Gęstą po bokach puszczą oczerniona,
A gładka jak szyba lodu."),
		("switez", 2, null, "Jeżeli nocną przybliżysz się dobą
I zwrócisz ku wodom lice:
Gwiazdy nad tobą i gwiazdy pod tobą
I dwa obaczysz księżyce."),
		("switez", 3, null, "Niepewny, czyli szklanna spod twej stopy
Pod niebo idzie równina,
Czyli też niebo swoje szklanne stropy
Aż do nóg twoich ugina;"),
		("switez", 4, null, "Gdy oko brzegów przeciwnych nie sięga,
Dna nie odróżnia od szczytu:
Zdajesz się wisieć w środku niebokręga,
W jakiejś otchłani błękitu."),
		("switez", 5, null, "Tak w noc, pogodna jeśli służy pora,
Wzrok się przyjemnie ułudzi…
Lecz, żeby w nocy jechać do jeziora,
Trzeba być najśmielszym z ludzi."),
		("switez", 6, null, "Bo jakie szatan wyprawia tam harce!
Jakie się {{1:larwy}} szamocą!
Drżę cały, kiedy bają o tém starce,
I strach wspominać przed nocą."),
		("switez", 7, null, "Nieraz śród wody gwar jakoby w mieście,
Ogień i dym bucha gęsty,
I zgiełk walczących i wrzaski niewieście
I dzwonów gwałt i zbrój chrzęsty."),
		("switez", 8, null, "Nagle dym spada, hałas się uśmierza,
Na brzegach tylko szum jodły,
W wodach gadanie cichego pacierza,
I dziewic żałośne modły."),
		("switez", 9, null, "Co to ma znaczyć? różni różnie plotą:
Cóż, kiedy nie był nikt na dnie;
Biegają wieści pomiędzy prostotą,
Lecz któż z nich prawdę odgadnie?"),
		("switez", 10, null, "Pan na Płużynach, którego pradziady
Były Świtezi dziedzice,
Z dawna przemyślał i zasięgał rady,
Jak te zbadać tajemnice."),
		("switez", 11, null, "Kazał przybory w bliskiem robić mieście,
I wielkie sypał wydatki:
Związano niewód, głęboki stóp dwieście,
Budują czółny i statki."),
		("switez", 12, null, "Ja ostrzegałem: że w tak wielkiem dziele
Dobrze, kto z Bogiem poczyna;
Dano więc na mszę w niejednym kościele,
I ksiądz przyjechał z {{2:Cyryna}}."),
		("switez", 13, null, "Stanął na brzegu, ubrał się w ornaty,
Przeżegnał, pracę pokropił;
Pan daje hasło: odbijają {{3:baty}},
Niewód się z szumem zatopił."),
		("switez", 14, null, "Topi się, {{4:pławki}} na dół z sobą spycha,
Tak przepaść wody głęboka;
Prężą się liny, niewód idzie z cicha,
{{5:Pewnie nie złowią ni oka.}}"),
		("switez", 15, null, "Na brzeg oboje wyjęto już skrzydło,
Ciągną ostatek więcierzy:
Powiemże jakie złowiono straszydło?
Choć powiem, nikt nie uwierzy."),
		("switez", 16, null, "Powiem jednakże. Nie straszydło wcale,
Żywa kobieta w niewodzie,
Twarz miała jasną, usta jak korale,
Włos biały skąpany w wodzie."),
		("switez", 17, null, "Do brzegu dąży. A gdy jedni z trwogi
Na miejscu stanęli głazem,
Drudzy zwracają ku ucieczce nogi,
Łagodnym rzecze wyrazem:"),
		("switez", 18, null, "„Młodzieńcy! wiecie, że tutaj bezkarnie
Dotąd nikt statku nie spuści:
Każdego śmiałka jezioro zagarnie
Do nieprzebrnionych czeluści."),
		("switez", 19, null, "I ty, zuchwały, i twoja gromada
Wraz byście poszli w {{6:głębinie}}:
Lecz, że to kraj był twojego pradziada,
Że w tobie nasza krew płynie;"),
		("switez", 20, null, "Choć godna kary jest ciekawość pusta,
Lecz, żeście z Bogiem poczęli,
Bóg wam przez moje opowiada usta,
Dzieje tej cudnej topieli."),
		("switez", 21, null, "Na miejscach, które dziś piaskiem zaniosło,
Gdzie {{7:car}} i trzcina zarasta,
Po których teraz wasze biega wiosło,
Stał okrąg pięknego miasta."),
		("switez", 22, null, "Świteź, i w sławne orężem ramiona
I w kraśne twarze bogata,
Niegdyś {{8:od książąt Tuhanów}} rządzona,
Kwitnęła przez długie lata."),
		("switez", 23, null, "Nie ćmił widoku ten ostęp ponury:
Przez żyzne wskroś okolice
Widać stąd było Nowogródzkie mury,
Litwy naówczas stolicę."),
		("switez", 24, null, "Raz niespodzianie obiegł tam Mendoga
Potężnem wojskiem car z Rusi;
Na całą Litwę wielka padła trwoga,
Że Mendog poddać się musi."),
		("switez", 25, null, "Nim ściągnął wojsko z odległej granicy,
Do ojca mego napisze:
— »Tuhanie! w tobie obrona stolicy,
Śpiesz, zwołaj twe towarzysze«. —"),
		("switez", 26, null, "Skoro przeczytał Tuhan list książęcy
I wydał rozkaz do wojny,
Stanęło zaraz mężów pięć tysięcy,
A każdy konny i zbrojny."),
		("switez", 27, null, "Uderzą w trąby, rusza młódź, już w bramie
Błyska Tuhana proporzec,
Lecz Tuhan stanie i ręce załamie,
I znowu jedzie na dworzec."),
		("switez", 28, null, "I mówi do mnie: — »Jaż własnych mieszkańców
Dla obcej zgubię odsieczy?
Wszak wiesz, że Świteź nie ma innych szańców,
Prócz naszych piersi i mieczy."),
		("switez", 29, null, "Jeśli rozdzielę szczupłe wojsko moje,
Krewnemu nie dam obrony;
A jeśli wszyscy pociągniem na boje,
Jak będą córy i żony?«"),
		("switez", 30, null, "— »Ojcze, odpowiem, lękasz się niewcześnie,
Idź, kędy sława cię woła,
Bóg nas obroni: dziś nad miastem we śnie,
Widziałam jego anioła."),
		("switez", 31, null, "Okrążył Świteź miecza błyskawicą,
I nakrył złotemi pióry,
I rzekł mi: »póki męże za granicą,
Ja bronię żony i córy« «."),
		("switez", 32, null, "Usłuchał Tuhan, i za wojskiem goni;
Lecz gdy noc spada ponura,
Słychać gwar z dala, szczęk i tętent koni,
I zewsząd straszny wrzask: »ura!«"),
		("switez", 33, null, "Zagrzmią tarany, padły bram ostatki,
Zewsząd pocisków grad leci,
Biegą na dworzec starce, nędzne matki,
Dziewice i drobne dzieci."),
		("switez", 34, null, "»Gwałtu! wołają, zamykajcie bramę,
Tuż, tuż, za nami Ruś wali.
Ach! zgińmy lepiej, zabijmy się same,
Śmierć nas od hańby ocali«"),
		("switez", 35, null, "Natychmiast wściekłość bierze miejsce strachu;
Miecą bogactwa na stosy,
Przynoszą żagwie i płomień do gmachu,
I krzyczą strasznemi głosy:"),
		("switez", 36, null, "»Przeklęty będzie, kto się nie dobije!«
Broniłam, lecz próżny opór:
Klęczą, na progach wyciągają szyje,
A drugie przynoszą topór."),
		("switez", 37, null, "Gotowa zbrodnia… Czyli wezwać hordy
I podłe przyjąć kajdany,
Czy bezbożnemi wytępić się mordy?…
Panie, zawołam, nad pany:"),
		("switez", 38, null, "Jeśli nie możem ujść nieprzyjaciela,
O śmierć błagamy u Ciebie,
Niechaj nas lepiej Twój piorun wystrzela,
Lub żywych ziemia pogrzebie!"),
		("switez", 39, null, "Wtem, jakaś białość nagle mnie otoczy,
Dzień zda się spędzać noc ciemną:
Spuszczam ku ziemi przerażone oczy…
Już ziemi nie ma pode mną!…"),
		("switez", 40, null, "Takeśmy uszły zhańbienia i rzezi.
Widzisz to ziele dokoła,
To są małżonki i córki Świtezi,
Które Bóg przemienił w zioła."),
		("switez", 41, null, "Białawem kwieciem, jak białe motylki,
Unoszą się nad topielą;
{{9:List}} ich zielony, jak jodłowe szpilki,
Kiedy je śniegi pobielą."),
		("switez", 42, null, "Za życia cnoty niewinnej obrazy,
Jej barwę mają po zgonie,
W ukryciu żyją i nie cierpią skazy,
Śmiertelne nie tkną ich dłonie."),
		("switez", 43, null, "Doświadczył tego car i ruska zgraja,
Gdy piękne ujrzawszy kwiecie,
Ten rwie i szyszak stalony umaja,
Ten wianki na skronie plecie:"),
		("switez", 44, null, "Kto tylko ściągnął do głębini ramie,
Tak straszna jest kwiatów władza,
Że go natychmiast choroba wyłamie,
I śmierć gwałtowna ugadza."),
		("switez", 45, null, "Choć czas te dzieje wymazał z pamięci,
Pozostał sam odgłos kary,
Dotąd w swych baśniach prostota go święci,
I kwiaty nazywa Cary”. —"),
		("switez", 46, null, "To mówiąc, pani z wolna się oddala,
Topią się statki i sieci,
Szum słychać w puszczy, poburzona fala
Z łoskotem na brzegi leci."),
		("switez", 47, null, "Jezioro do dna pękło na kształt rowu,
Lecz próżno za nią wzrok goni,
Wpadła i falą nakryła się znowu,
I więcej nie słychać o niéj."),
		("switezianka", 0, null, "Jakiż to chłopiec piękny i młody?
Jaka to obok dziewica?
Brzegami sinej {{2:Świtezi}} wody
Idą przy świetle księżyca."),
		("switezianka", 1, null, "Ona mu z kosza daje maliny,
A on jej kwiatki do wianka;
Pewnie kochankiem jest tej dziewczyny,
Pewnie to jego kochanka."),
		("switezianka", 2, null, "Każdą noc prawie, o jednej porze,
Pod tym się widzą modrzewiem.
Młody jest strzelcem w tutejszym borze;
Kto jest dziewczyna? ja nie wiem."),
		("switezianka", 3, null, "Skąd przyszła? darmo śledzić kto pragnie,
Gdzie uszła? nikt jej nie zbada.
Jak mokry jaskier wschodzi na bagnie,
Jak ognik nocny przepada."),
		("switezianka", 4, null, "— „Powiedz mi piękna, luba dziewczyno,
Na co nam te tajemnice —
Jaką przybiegłaś do mnie drożyną?
Gdzie dom twój, gdzie są rodzice?"),
		("switezianka", 5, null, "Minęło lato, zżółkniały {{3:liścia}}
I dżdżysta nadchodzi pora:
Zawsze mam czekać twojego przyścia
Na dzikich brzegach jeziora?"),
		("switezianka", 6, null, "Zawszeż po kniejach jak sarna płocha,
Jak upiór błądzisz w noc ciemną?
Zostań się lepiej z tym, kto cię kocha,
Zostań się, o luba, ze mną!"),
		("switezianka", 7, null, "Chateczka moja stąd niedaleka
Pośrodku gęstej leszczyny;
Jest tam dostatkiem owoców, mleka,
Jest tam dostatkiem źwierzyny”."),
		("switezianka", 8, null, "— „Stój, stój, odpowie, hardy młokosie,
Pomnę, co ojciec rzekł stary;
Słowicze wdzięki w mężczyzny głosie,
A w sercu lisie zamiary."),
		("switezianka", 9, null, "Więcej się waszej obłudy boję,
Niż w zmienne ufam zapały;
Możebym prośby przyjęła twoje:
Ale czy będziesz mnie stały?” —"),
		("switezianka", 10, null, "{{4:Chłopiec przyklęknął, chwycił w dłoń piasku}},
Piekielne wzywał potęgi,
Klął się przy świętym księżyca blasku…
Lecz czy dochowa przysięgi?"),
		("switezianka", 11, null, "„Dochowaj, strzelcze, to moja rada:
Bo kto przysięgę naruszy,
Ach, biada jemu, za życia biada!
I biada jego złej duszy!” —"),
		("switezianka", 12, null, "To mówiąc, dziewka więcej nie czeka,
Wieniec włożyła na skronie,
I pożegnawszy strzelca z daleka,
Na zwykłe uchodzi błonie."),
		("switezianka", 13, null, "Próżno się za nią strzelec pomyka,
Rączym wybiegom nie sprostał;
Znikła jak lekki powiew wietrzyka,
A on sam jeden pozostał."),
		("switezianka", 14, null, "Sam został, dziką powraca drogą,
Ziemia uchyla się grząska.
Cisza wokoło, tylko pod nogą
Zwiędła szeleszcze gałązka."),
		("switezianka", 15, null, "Idzie nad wodą, błędny krok niesie,
Błędnemi strzela oczyma:
Wtem wiatr zaszumiał po gęstym lesie,
Woda się burzy i wzdyma."),
		("switezianka", 16, null, "Burzy się, wzdyma, pękają tonie,
O niesłychane zjawiska!
Ponad srebrzyste Świtezi błonie
Dziewicza piękność wytryska."),
		("switezianka", 17, null, "Jej twarz, jak róży bladej zawoje,
Skropione jutrzenki łezką:
Jako mgła lekka, tak lekkie stroje
Obwiały postać niebieską."),
		("switezianka", 18, null, "— „Chłopcze mój piękny, chłopcze mój młody,
Zanuci czule dziewica —
Po co wokoło Świteziu wody
Błądzisz przy świetle księżyca?"),
		("switezianka", 19, null, "Po co żałujesz dzikiej wietrznicy,
Która cię zwabia w te knieje,
Zawraca głowę, rzuca w tęsknicy,
I może jeszcze się śmieje?"),
		("switezianka", 20, null, "Daj się namówić czułym wyrazem:
Porzuć wzdychania i żale,
Do mnie tu, do mnie, tu będziem razem
Po wodnym pląsać krysztale."),
		("switezianka", 21, null, "Czy zechcesz, niby jaskółka chybka,
Oblicze tylko wód muskać,
Czy zdrów jak rybka, wesół jak rybka,
Cały dzień ze mną się pluskać,"),
		("switezianka", 22, null, "A na noc w łożu srebrnej topieli,
Pod namiotami źwierciadeł,
Na miękkiej wodnych lilijek bieli,
Śród boskich usnąć widziadeł”. —"),
		("switezianka", 23, null, "Wtem z zasłon błysną piersi łabędzie…
Strzelec w ziemię patrzy skromnie,
Dziewica w lekkim zbliża się pędzie,
I — „do mnie, woła, pójdź do mnie!”"),
		("switezianka", 24, null, "I na wiatr lotne rzuciwszy stopy,
Jak tęcza śmiga w krąg wielki,
To znowu siekąc wodne zatopy,
Srebrnemi pryska kropelki."),
		("switezianka", 25, null, "Podbiega strzelec… i staje w biegu…
I chciałby skoczyć i nie chce;
Wtem modra fala, prysnąwszy z brzegu,
Z lekka mu w stopy załechce."),
		("switezianka", 26, null, "I tak go łechce i tak go znęca,
Tak się w nim serce rozpływa,
Jak gdy tajemnie rękę młodzieńca
Ściśnie kochanka wstydliwa."),
		("switezianka", 27, null, "Zapomniał strzelec o swej dziewczynie,
Przysięgą pogardził świętą,
Na zgubę oślep bieży w głębinie,
Nową zwabiony ponętą."),
		("switezianka", 28, null, "Bieży i patrzy, patrzy i bieży,
Niesie go wodne przestworze,
Już z dala suchych odbiegł wybrzeży,
Na średnim igra jeziorze."),
		("switezianka", 29, null, "I już dłoń śnieżną w swej ciśnie dłoni,
W pięknych licach topi oczy,
Ustami usta różane goni,
I skoczne okręgi toczy:"),
		("switezianka", 30, null, "Wtem wietrzyk świsnął, obłoczek pryska,
Co ją w łudzącym krył blasku…
Poznaje strzelec dziewczynę z bliska…
Ach, to dziewczyna spod lasku!"),
		("switezianka", 31, null, "— „A gdzie przysięga? gdzie moja rada?
Wszak kto przysięgę naruszy,
Ach, biada jemu, za życia biada!
I biada jego złej duszy!"),
		("switezianka", 32, null, "Nie tobie igrać przez srebrne tonie,
Lub nurkiem pluskać w głąb jasną,
Surowa ziemia ciało pochłonie,
Oczy twe żwirem zagasną."),
		("switezianka", 33, null, "A dusza przy tem {{5:świadomem drzewie}}
Niech lat doczeka tysiąca,
Wiecznie piekielne cierpiąc zarzewie
Nie ma czem zgasić gorąca”. —"),
		("switezianka", 34, null, "Słyszy to strzelec, błędny krok niesie,
Błędnemi rzuca oczyma;
A wicher szumi po gęstym lesie,
Woda się burzy i wzdyma."),
		("switezianka", 35, null, "Burzy się, wzdyma i wre aż do dna,
Kręconym nurtem pochwyca.
Roztwiera paszczę otchłań podwodna,
Ginie z młodzieńcem dziewica."),
		("switezianka", 36, null, "Woda się dotąd burzy i pieni;
Dotąd przy świetle księżyca
Snuje się para znikomych cieni:
Jest to z młodzieńcem dziewica."),
		("switezianka", 37, null, "Ona po srebrnym pląsa jeziorze,
On pod tym jęczy modrzewiem.
Któż jest młodzieniec? Strzelcem był w borze.
A kto dziewczyna? Ja nie wiem."),
		("rybka", 0, null, "Od dworu, spod lasa, z wioski,
Smutna wybiega dziewica,
Rozpuściła na wiatr włoski
I łzami skropiła lica."),
		("rybka", 1, null, "Przybiega na koniec łączki,
Gdzie w jezioro wpada rzeka;
Załamuje białe rączki
I tak żałośnie narzeka:"),
		("rybka", 2, null, "„O wy, co mieszkacie w wodzie,
Siostry moje, Świtezianki,
Słuchajcie w ciężkiej przygodzie
Głosu zdradzonej kochanki."),
		("rybka", 3, null, "Kochałam pana tak szczerze,
On mię przysięgał zaślubić;
Dziś księżnę za żonę bierze,
Krysię ubogą chce zgubić."),
		("rybka", 4, null, "Niechże sobie żyją młodzi,
Niech się z nią obłudnik pieści,
Niech tylko tu nie przychodzi
{{1:Urągać}} się z mych boleści."),
		("rybka", 5, null, "Dla opuszczonej kochanki
Cóż pozostało na świecie?
Przyjmijcie mię, Świtezianki:
Lecz moje dziecię… ach dziecię!”"),
		("rybka", 6, null, "To mówiąc rzewnie zapłacze,
Rączkami oczy zasłoni,
I z brzegu do wody skacze,
I w bystrej nurza się toni."),
		("rybka", 7, null, "Wtem z lasu, gdzie się dwór bieli,
Tysiączne świecą kagańce,
Zjeżdżają goście weseli,
Muzyka, hałas i tańce."),
		("rybka", 8, null, "Lecz mimo tego hałasu
Płacz dziecięcia słychać w lesie;
Wierny sługa wyszedł z lasu,
I dziecię na ręku niesie."),
		("rybka", 9, null, "Ku wodzie obraca kroki,
Gdzie łoza gęsto spleciona
Wzdłuż wykręconej zatoki
Okryła rzeki ramiona."),
		("rybka", 10, null, "Tam staje w ciemnym zakątku,
Płacze i woła: — „Niestety!
Ach! któż da piersi dzieciątku?
Ach! gdzie ty, Krysiu, ach, gdzie ty?”"),
		("rybka", 11, null, "— „Tu jestem, w rzece, u spodu, —
Cichy mu głos odpowiada —
Tutaj drżę cała od chłodu,
A żwir mnie oczki wyjada."),
		("rybka", 12, null, "Przez żwir, przez ostre kamuszki
Fale mnie gwałtowne niosą;
Pokarm mój koralki, muszki,
A zapijam zimną rosą”."),
		("rybka", 13, null, "Lecz sługa jak na początku,
Tak {{2:wszystko woła}}: — „Niestety!
Ach! któż da piersi dzieciątku?
Ach! gdzież ty, Krysiu, ach, gdzie ty?”"),
		("rybka", 14, null, "Wtem się coś z lekka potrąci
Śród kryształowej przeźroczy,
Woda się z lekka zamąci,
Rybka nad wodę podskoczy;"),
		("rybka", 15, null, "I jak {{3:skałka}} płaskim bokiem,
Gdy z lekkich rąk chłopca pierzchnie,
Tak nasza rybka podskokiem
Mokre całuje powierzchnie."),
		("rybka", 16, null, "Złotemi plamki nadobna,
Kraśne ma po bokach piórka,
Główka jak naparstek drobna,
Oczko drobne jak paciórka."),
		("rybka", 17, null, "Wtem rybią łuskę odwinie,
Spojrzy dziewicy oczyma;
Z głowy jasny włos wypłynie,
Szyjka cieniuchna się wzdyma."),
		("rybka", 18, null, "Na licach różana krasa,
Piersi jak jabłuszka mleczne,
Rybią ma płetwę do pasa,
Płynie pod chrusty nadrzeczne."),
		("rybka", 19, null, "I dziecię bierze do ręki,
U łona białego tuli:
— „Luli, woła, mój maleńki,
Luli, mój maleńki, luli”. —"),
		("rybka", 20, null, "Gdy dziecię płakać przestało,
Zawiesza kosz na gałęzi,
I znowu ściska swe ciało,
I główkę nadobną zwęzi."),
		("rybka", 21, null, "Znowu ją łuski powleką,
Od boków wyskoczą skrzelki,
Plusła, i tylko nad rzeką
Kipiące pękły bąbelki."),
		("rybka", 22, null, "Tak co wieczora, co ranka,
Gdy sługa stanie w zakątku,
Wraz wypływa Świtezianka,
Żeby dać piersi dzieciątku."),
		("rybka", 23, null, "Za cóż jednego wieczora
Nikt nie przychodzi na smugi?
Już zwykła przemija pora:
Nie widać z dziecięciem sługi."),
		("rybka", 24, null, "Nie może on przyjść tą stroną,
Musi zaczekać troszeczkę,
Bo właśnie teraz pan z żoną
Poszli przechadzką nad rzeczkę."),
		("rybka", 25, null, "Wrócił się, czekał z daleka,
Za gęstym usiadłszy krzakiem:
Lecz próżno czeka i czeka,
Nikt nie powracał tym szlakiem."),
		("rybka", 26, null, "Wstaje, i {{4:dłoń w trąbkę zwinął}},
I patrzył przez palców szparę,
Ale i dzień już przeminął,
I mroki padają szare."),
		("rybka", 27, null, "Czekał długo po zachodzie,
A gdy noc gwiazdy zapala,
Zbliża się z lekka ku wodzie
I śledzi oczyma z dala."),
		("rybka", 28, null, "Przebóg! cudy, czy moc piekła?
Uderza go widok nowy:
Gdzie pierwej rzeczułka ciekła,
Tam suchy piasek i rowy."),
		("rybka", 29, null, "Na brzegach porozrzucana
Wala się odzież bez ładu;
Ani pani, ani pana,
Nie widać nigdzie ni śladu."),
		("rybka", 30, null, "Tylko {{5:z zatoki połową}}
Sterczał wielki głazu kawał,
I dziwną kształtu budową,
Dwa ludzkie ciała udawał."),
		("rybka", 31, null, "Zdumiewa się wierny sługa,
Rozpierzchłych myśli nie złowił;
Przeszła godzina, i druga,
Nim wreszcie słówko przemówił."),
		("rybka", 32, null, "„Krysiu, o Krysiu!” zawoła:
Echo mu „Krysiu” odpowie;
Lecz próżno patrzy dokoła,
Nikt nie pokazał się w rowie."),
		("rybka", 33, null, "Patrzy na rów i na głazy,
Otrze pot na licu zbladłem,
I kiwnie głową trzy razy,
Jakby chciał mówić: już zgadłem."),
		("rybka", 34, null, "Dzieciątko na ręce bierze,
Śmieje się dzikim uśmiechem,
I odmawiając pacierze,
Wraca do domu z pośpiechem."),
		("powrot-taty", 0, null, "„Pójdźcie, o dziatki, pójdźcie wszystkie razem
Za miasto, pod słup, na wzgórek;
Tam przed cudownym klęknijcie obrazem,
Pobożnie zmówcie paciórek."),
		("powrot-taty", 1, null, "Tato nie wraca: ranki i wieczory
We łzach go czekam i trwodze;
Rozlały rzeki, pełne zwierza bory,
I pełno zbójców na drodze”."),
		("powrot-taty", 2, null, "Słysząc to dziatki, biegą wszystkie razem,
Za miasto, pod słup, na wzgórek;
Tam przed cudownym klękają obrazem,
I zaczynają paciórek."),
		("powrot-taty", 3, null, "Całują ziemię, potem: w imie Ojca,
Syna i Ducha Świętego,
Bądź pochwalona przenajświętsza Trojca
Teraz i czasu wszelkiego."),
		("powrot-taty", 4, null, "Potem: Ojcze nasz i Zdrowaś i Wierzę,
Dziesięcioro i koronki,
A kiedy całe zmówili pacierze,
Wyjmą książeczkę z kieszonki:"),
		("powrot-taty", 5, null, "I litaniją do Najświętszej Matki
Starszy brat śpiewa, a z bratem:
„Najświętsza Matko, przyśpiewują dziatki,
Zmiłuj się, zmiłuj nad tatem!”"),
		("powrot-taty", 6, null, "Wtem słychać tarkot, wozy jadą drogą,
I wóz znajomy na przedzie;
Skoczyły dzieci, i krzyczą, jak mogą:
„Tato, ach tato nasz jedzie!”"),
		("powrot-taty", 7, null, "Obaczył kupiec, łzy radośne leje,
Z wozu na ziemię wylata:
„Ha, jak się macie, co się u was dzieje?
Czyście tęskniły do tata?"),
		("powrot-taty", 8, null, "Mama czy zdrowa? ciotunia? domowi?
A ot! rozynki w koszyku…”
Ten sobie mówi, a ten sobie mówi,
Pełno radości i krzyku."),
		("powrot-taty", 9, null, "„Ruszajcie! kupiec na sługi zawoła,
Ja z dziećmi pójdę ku miastu”.
Idzie… aż zbójcy obskoczą dokoła,
A zbójców było dwunastu."),
		("powrot-taty", 10, null, "Brody ich długie, kręcone wąsiska,
Wzrok dziki, suknia plugawa;
Noże za pasem, miecz u boku błyska,
W ręku ogromna buława."),
		("powrot-taty", 11, null, "Krzyknęły dziatki, do ojca przypadły,
Tulą się pod płaszcz na łonie,
Truchleją sługi, struchlał pan wybladły,
Drżące ku zbójcom wzniósł dłonie:"),
		("powrot-taty", 12, null, "„Ach! bierzcie wozy, ach! bierzcie dostatek,
Tylko puszczajcie nas zdrowo,
Nie róbcie małych sierotami dziatek,
I młodej małżonki wdową”."),
		("powrot-taty", 13, null, "Nie słucha zgraja, ten już wóz wyprzęga,
Zabiera konie, a drugi:
„Pieniędzy” krzyczy, i buławą sięga;
Ów z mieczem wpada na sługi."),
		("powrot-taty", 14, null, "Wtem: „Stójcie, stójcie!” krzyknie starszy zbójca,
I spędza bandę precz z drogi,
A wypuściwszy i dzieci i ojca,
„Idźcie, rzekł, dalej bez trwogi”."),
		("powrot-taty", 15, null, "Kupiec dziękuje, a zbójca odpowie:
„Nie dziękuj! wyznam ci szczerze,
Pierwszybym pałkę strzaskał na twej głowie,
Gdyby nie dziatek pacierze."),
		("powrot-taty", 16, null, "Dziatki sprawiły, że uchodzisz cało,
Darzą cię życiem i zdrowiem;
Im więc podziękuj za to, co się stało,
A jak się stało, opowiem:"),
		("powrot-taty", 17, null, "Z dawna już słysząc o przejeździe kupca,
I ja i moje kamraty,
Tutaj za miastem, przy wzgórku, u słupca,
Zasiadaliśmy na czaty."),
		("powrot-taty", 18, null, "Dzisiaj nadchodzę, patrzę między chrusty:
Modlą się dziatki do Boga;
Słucham, z początku porwał mię śmiech pusty,
A potem litość i trwoga."),
		("powrot-taty", 19, null, "Słucham, ojczyste przyszły na myśl strony,
Buława upadła z ręki:
Ach! ja mam żonę, i u mojej żony
Jest synek taki maleńki."),
		("powrot-taty", 20, null, "Kupcze, jedź w miasto; ja do lasu muszę.
Wy, dziatki, na ten pagórek
Biegajcie sobie, i za moją duszę
Zmówcie też czasem paciórek”."),
		("kurhanek-maryli", 0, "Cudzy człowiek", "Tam u Niemnowej odnogi,
Tam u zielonej rozłogi,
Co to za piękny kurhanek?
Spodem uwieńczon jak w wianek,
W maliny, ciernie i głogi;
Boki ma strojne murawą,
Głowę ukwieconą w kwiaty,
A na niej czeremchy drzewo,
A od niej idą trzy drogi:
Jedna droga na prawo,
Druga droga do chaty,
Trzecia droga na lewo.
Ja tędy płynę z wiciną,
Pytam się ciebie dziewczyno,
Co to za piękny kurhanek?"),
		("kurhanek-maryli", 1, "Dziewczyna", "W całej wsi pytaj się, bracie,
A cała wieś powie tobie:
Maryla żyła w tej chacie,
A teraz leży w tym grobie.
Na prawej stronie te śladki
Ubite nogą pastuszka;
To jest drożyna jej matki,
A stąd przychodzi jej drużka.
Lecz oto błysnął poranek,
Przyjdą oni na kurhanek;
Ukryj się tu za stos łomu,
Sam ich posłuchasz niedoli,
Własne twe oczy zobaczą.
Patrz w prawo… idzie kochanek.
Patrz, matka idzie z domu,
Patrz w lewo, przyjaciółka.
Wszyscy idą powoli,
I niosą ziółka,
I płaczą."),
		("kurhanek-maryli", 2, "Kochanek", "Marylo! o tej porze
Jeszcześmy się nie widzieli,
Jeszcześmy się nie ścisnęli.
Marylo! zaszło zorze!
Tu czeka twój kochanek:
Czy ty przespałaś ranek?
Czyś na mnie zagniewana?
Ach! Marylo kochana!
Gdzież się ty dotąd kryjesz?
Nie, nie przespałaś ranka,
Nie gniewasz się na Janka:
Lecz nie żyjesz, nie żyjesz!
Więzi cię ten kurhanek,
Nie ujrzysz już kochanka,
Nie ujrzy cię kochanek!
Dawniej, kiedy spać szedłem, tym słodziłem chwile,
Że skoro się obudzę, obaczę Marylę,
I dawniej spałem mile!
Teraz, tutaj spać będę, od ludzi daleki,
Może ją we śnie ujrzę, gdy zamknę powieki;
Może zamknę na wieki!
Byłem ja gospodarny, gdy byłem szczęśliwy;
Chwalili mnie sąsiedzi,
Chwalił mnie ojciec siwy:
Teraz się ojciec biedzi;
A ja ni ludziom, ni Bogu!
Niech ziarno w polu przepadnie,
Niech ginie siano ze stogu,
Niech sąsiad kopy rozkradnie,
Niech trzodę wyduszą wilki!
Nie masz, nie masz Marylki!
Daje mi ojciec chaty,
Daje mi sprzęt bogaty.
Bym wziął w dom gospodynię,
Namawiali mię swaty,
Nie masz, nie masz Maryli!
Swaty nie namówili:
Nie mogę, nie, nie mogę!
Wiem ojcze, co uczynię:
Pójdę w daleką drogę,
Więcej mnie nie znajdziecie,
Choćbyście i szukali.
Nie będę już na świecie,
Przystanę do Moskali,
Żeby mnie wraz zabili.
Nie masz, nie masz Maryli!"),
		("kurhanek-maryli", 3, "Matka", "Czemuż nie wstałam zrana?
Już w polu pełno ludzi.
Nie masz cię, nie masz, kochana
Marylo, któż mię obudzi?
Płakałam przez noc całą,
Zasnęłam kiedy dniało.
Mój Szymon gdzieś już w polu,
Wyprzedził on świtania,
Nie budził mię, mojego litując się bólu,
Poszedł z kosą bez śniadania;
Koś ty dzień cały, koś sobie,
Ja tutaj leżę na grobie.
Czegóż mam iść do domu?
Kto nas na obiad zawoła?
Kto z nami siądzie do stoła?
Nie masz, ach! nie masz komu!
Pókiśmy mieli ciebie,
W domu było jak w niebie.
U nas i wieczorynki,
Z całej wsi chłopcy, dziewki,
Najweselsze zażynki,
Najchuczniejsze dosiewki.
Nie masz cię! w domu pustynie!
Każdy kto idzie, minie.
Zawiasy rdzewieją w sieni,
Mchem się dziedziniec zieleni:
Bóg nas opuścił, ludzie opuścili,
Nie masz, nie masz Maryli!"),
		("kurhanek-maryli", 4, "Przyjaciółka", "Tutaj bywało z ranku
Nad wodą sobie stoim,
Ja o twoim kochanku,
Ty mnie mówisz o moim.
Już więcej z sobą nie będziem mówili,
Nie masz, nie masz Maryli!
Któż mi zwierzy się szczerze,
Komuż się ja powierzę?
Ach, gdy z tobą, kochanie,
Smutku i szczęścia nie dzielę,
Smutek smutkiem zostanie,
Weselem nie jest wesele."),
		("kurhanek-maryli", 5, null, "***"),
		("kurhanek-maryli", 6, null, "Słyszy to cudzy człowiek,
Wzdycha i łzy mu płyną.
Westchnął, otarł łzy z powiek,
I dalej poszedł z wiciną."),
		("do-przyjaciol", 0, null, "Bije raz, dwa, trzy… już północna pora:
Głuche wokoło zacisze,
Wiatr tylko szumi po murach klasztora
I psów szczekanie gdzieś słyszę."),
		("do-przyjaciol", 1, null, "Świeca w lichtarzu dopala się na dnie:
Raz w głębi tłumi ogniska,
Znowu się wzmoże i znowu opadnie,
Błyska, zagasa i błyska."),
		("do-przyjaciol", 2, null, "Straszno!… Nie była straszną ta godzina,
Gdy były nieba łaskawsze;
Ileż mi słodkich chwilek przypomina!
Precz! To już znikło na zawsze!"),
		("do-przyjaciol", 3, null, "Teraz ja szczęścia szukam, ot w tej księdze…
Księga znudziła, porzucam;
Znowu ku lubym przedmiotom myśl pędzę,
To marzę, to się ocucam."),
		("do-przyjaciol", 4, null, "Czasem, gdy słodkie zbudzi zachwycenie,
Kochankę widzę lub braci;
Zrywam się, patrzę; aż tylko po ścienie,
Biega cień własnej postaci."),
		("do-przyjaciol", 5, null, "Ot, lepiej pióro wezmę i śród ciszy,
Gdy się bez ładu myśl plącze,
Zacznę coś pisać dla mych towarzyszy,
Zacznę, bo nie wiem, czy skończę."),
		("do-przyjaciol", 6, null, "Może też pamięć o minionej wiośnie
Zimowy wierszyk umili;
Chcę coś okropnie, coś pisać miłośnie,
O strachach i o Maryli."),
		("do-przyjaciol", 7, null, "Kto pragnie pędzlem swe rozsławić imię,
Niech jej maluje portrety;
Wieszcz w nieśmiertelnym niech opiewa rymie
Serca, rozumu zalety;"),
		("do-przyjaciol", 8, null, "Mnie, choć to wszystko w umyśle przytomne,
Pociechy szukam, nie sławy:
Lepiej wam powiem, jeżeli przypomnę,
Jakie z nią miałem zabawy."),
		("do-przyjaciol", 9, null, "Maryla słodkie miłości wyrazy
Dzieliła skąpo w rachubie:
Choć jej kto kocham mówił po sto razy
Nie rzekła nawet i lubię."),
		("do-przyjaciol", 10, null, "Za to więc w Rucie, pod północną chwilę,
Kiedy się wszyscy spać kładą,
Ja na dobranoc żegnając Marylę,
Taką straszyłem balladą:"),
		("to-lubie", 0, null, "Spojrzyj, Marylo, gdzie się kończą gaje:
W prawo {{1:łóz}} gęsty zarostek,
W lewo się piękna dolina {{2:podaje}},
Przodem rzeczułka i mostek."),
		("to-lubie", 1, null, "Tuż stara cerkiew; w niej puszczyk i sowy,
Obok dzwonnicy zrąb zgniły,
A za dzwonnicą {{3:chróśniak}} malinowy,
A w tym chróśniaku mogiły."),
		("to-lubie", 2, null, "Czy tam bies siedział, czy dusza zaklęta,
Że o północnej godzinie,
Nikt, jak najstarszy człowiek zapamięta,
Miejsc tych bez trwogi nie minie."),
		("to-lubie", 3, null, "Bo skoro północ nawlecze zasłony,
Cerkiew się z trzaskiem {{3:odmyka}},
W pustej zrąbnicy dzwonią same dzwony,
W chróstach coś huczy i ksyka."),
		("to-lubie", 4, null, "Czasami płomyk okaże się blady,
Czasem grom trzaska po gromie,
Same się z mogił ruszają pokłady,
I larwy stają widomie."),
		("to-lubie", 5, null, "Raz trup po drodze bez głowy się toczy,
To znowu głowa bez ciała,
Roztwiera gębę i wytrzeszcza oczy,
W gębie i w oczach żar pała."),
		("to-lubie", 6, null, "Albo wilk bieży: pragniesz go odegnać,
Aż orlem skrzydłem wilk macha…
Dość „zgiń, przepadnij!” wyrzec i przeżegnać,
Wilk zniknie wrzeszcząc: cha, cha, cha!"),
		("to-lubie", 7, null, "Każdy podróżny oglądał te zgrozy,
I każdy musiał kląć drogę;
Ten złamał {{5:dyszel}}, ten wywrócił wozy,
Innemu zwichnął koń nogę."),
		("to-lubie", 8, null, "Ja, chociaż pomnę, nieraz Andrzej stary
Zaklinał, nieraz przestrzegał:
Śmiałem się z {{6:djabłów}}, nie wierzyłem w czary,
Tamtędym jeździł i biegał."),
		("to-lubie", 9, null, "Raz, gdy do Ruty jadę w czas noclegu,
Na moście z końmi wóz staje;
Próżno woźnica przynagla do biegu,
Hej! krzyczy, biczem {{7:zadaje}}."),
		("to-lubie", 10, null, "Stoją, a potem skoczą z całej mocy,
Dyszel przy samej pękł {{8:szrubie}};
Zostać na polu, samemu i w nocy,
To lubię, rzekłem, to lubię!"),
		("to-lubie", 11, null, "Ledwiem dokończył, aż straszna {{9:martwica}}
Wypływa z {{10:blizkich}} wód toni;
Białe jej szaty, jak śnieg białe lica,
Ognisty wieniec na skroni."),
		("to-lubie", 12, null, "Chciałem uciekać, padłem zalękniony,
Włos dębem stanął na głowie;
Krzyknę: niech będzie Chrystus pochwalony:
„Na wieki wieków” odpowie."),
		("to-lubie", 13, null, "„Ktokolwiek jesteś poczciwy człowieku,
Coś mię zachował od męki,
Dożyj ty szczęścia i późnego wieku,
I pokój tobie i dzięki.”"),
		("to-lubie", 14, null, "„Widzisz przed sobą obraz grzesznej duszy, —
Wkrótce się niebem pochlubię;
Boś ty {{11:czyścowej}} zbawił mię katuszy
Tem jednem słówkiem: To lubię."),
		("to-lubie", 15, null, "Dopóki gwiazdy zejdą i dopóki
We wsi kur pierwszy zapieje,
Opowiem tobie, a ty dla nauki
Opowiedz innym me dzieje."),
		("to-lubie", 16, null, "Onego czasu żyłam ja na świecie,
Marylą zwana przed laty;
Ojciec mój, pierwszy urzędnik w powiecie,
Możny, poczciwy, bogaty."),
		("to-lubie", 17, null, "Za życia pragnął sprawić mi wesele;
A żem dostatnia i młoda,
Zbiegło się zewsząd zalotników wiele,
Posag wabił i uroda."),
		("to-lubie", 18, null, "{{12:Mnóztwo}} ich marnej pochlebiało dumie,
I to mi było do smaku,
Że kiedy w licznym kłaniano się tłumie,
Tłumem gardziłam {{13:bez braku}}."),
		("to-lubie", 19, null, "Przybył i Józio; dwudziestą miał wiosnę,
Młody, cnotliwy, nieśmiały:
Obce dla niego wyrazy miłosne,
Choć czuł miłosne zapały."),
		("to-lubie", 20, null, "Lecz próżno nędzny w oczach prawie znika,
Próżno i dzień i noc płacze;
W boleściach jego dla mnie radość dzika,
Śmiech obudzały rozpacze."),
		("to-lubie", 21, null, "»Ja pójdę!« mówił ze łzami — »Idź sobie!«
Poszedł i umarł z miłości…
Tu nad rzeczułką, w tym zielonym grobie,
Złożone jego są kości."),
		("to-lubie", 22, null, "Odtąd mi życie stało się nielube,
Późne uczułam wyrzuty;
Lecz ani sposób wynagrodzić zgubę,
Ani czas został pokuty."),
		("to-lubie", 23, null, "Raz, gdy się w północ z rodzicami bawię,
Wzmaga się hałas, szum, świsty:
Przyleciał Józio, w straszliwej postawie,
Jak potępieniec ognisty."),
		("to-lubie", 24, null, "Porwał, udusił gęszczą dymnych kłębów,
W czyścowe rzucił potoki,
Gdzie pośród jęku i zgrzytania zębów,
Takie słyszałam wyroki:"),
		("to-lubie", 25, null, "»Wiedziałaś, że się spodobało Panu
Z męża ród tworzyć niewieści,
Na osłodzenie mężom złego stanu,
Na rozkosz, nie na boleści."),
		("to-lubie", 26, null, "Ty, jakbyś w piersiach miała serce z głazu,
Ani cię jęki ubodły,
Nikt nie uprosił słodkiego wyrazu,
Przez łzy, cierpienia i modły."),
		("to-lubie", 27, null, "Za taką srogość, długie, długie lata,
Dręcz się w czyścowej zagubie;
Póki mąż jaki z {{14:tamecznego}} świata,
Nie powie na cię choć: lubię"),
		("to-lubie", 28, null, "Prosił i Józio niegdyś o to słowo
Gorzkie łzy lał nieszczęśliwy:
Prośże ty teraz nie łzą, nie namową,
Ale przez strachy i dziwy.«"),
		("to-lubie", 29, null, "Rzekł. Mnie natychmiast porwały złe duchy:
Odtąd już setny rok minie,
W dzień męczą, na noc zdejmują łańcuchy,
Rzucam ogniste głębinie."),
		("to-lubie", 30, null, "I w cerkwi, albo na Józia mogile
Niebu i ziemi obrzydła,
Muszę podróżnych trwożyć w nocne chwile.
Różne udając straszydła."),
		("to-lubie", 31, null, "Idących w błota zawiodę lub w gaje,
Jadącym konia uskubię;
A każdy naklnie, nafuka, nałaje —
Tyś pierwszy wyrzekł: to lubię."),
		("to-lubie", 32, null, "Za to ci spadnie wyroków zasłona,
Przyszłość z pod ciemnych wskażę chmur.
Ach! {{15:i ty poznasz Marylę, lecz ona…}}”
Wtem na nieszczęście zapiał kur."),
		("to-lubie", 33, null, "Skinęła tylko, widać radość z oczek,
Mieni się w parę cieniuchną,
Ginie, jak ginie bladawy obłoczek,
Kiedy zefiry nań dmuchną…"),
		("to-lubie", 34, null, "Patrzę — aż cały wóz stoi na łące.
Siadam, powoli strach mija;
Proszę za dusze w czyścu bolejące,
Zmówić trzy Zdrowaś {{16:Marya}}."),
		("rekawiczka", 0, null, "Chcąc być widzem dzikich bojów,
Już u zwierzyńca {{2:podwojów}}
Król zasiada.
Przy nim książęta i {{3:panowie Rada}};
A gdzie {{4:wzniosły}} krążył ganek,
Rycerze obok kochanek."),
		("rekawiczka", 1, null, "Król skinął palcem, zaczęto igrzysko,
Spadły {{5:wrzeciądze}}: ogromne lwisko
Z wolna się toczy;
Podnosi czoło,
Milczkiem obraca oczy
Wokoło;
I ziewy rozdarł straszliwie,
I kudły zatrząsł na grzywie,
I wyciągnął cielska brzemię,
I obalił się na ziemię."),
		("rekawiczka", 2, null, "Król skinął znowu.
Znowu przemknie się krata:
Szybkiemi skoki, chciwy połowu
Tygrys wylata.
Spoziera z dala,
I kłami błyska,
Język wywala,
Ogonem ciska,
I lwa dokoła obiega;
Topiąc wzrok jaszczurczy,
Wyje i burczy;
Burcząc, na stronie przylega."),
		("rekawiczka", 3, null, "Król skinął znowu:
Znowu podwój otwarty:
I z jednego {{6:zachowu}}
Dwa wyskakują lamparty.
Łakoma boju, para zajadła
Już tygrysa opadła,
Już się tygrys z niemi drapie,
Już obydwu trzyma w łapie:
Wtem lew podniósł łeb do góry,
Zagrzmiał — i znowu cisze —
A dzicz z krwawemi pazury
Obiega, za mordem dysze,
Dysząc, na stronie przylega."),
		("rekawiczka", 4, null, "Wtem leci rękawiczka z krużganków pałacu,
Z rączek nadobnej Marty,
Pada między tygrysa i między lamparty
Na środek placu."),
		("rekawiczka", 5, null, "Marta z uśmiechem rzecze do Emroda:
„Kto mię tak kocha, jak po tysiąc razy
Czułemi przysiągł wyrazy,
Niechaj mi teraz rękawiczkę poda”."),
		("rekawiczka", 6, null, "Emrod przeskoczył zapory,
Idzie pomiędzy potwory,
Śmiało rękawiczkę bierze.
Dziwią się panie, dziwią się rycerze;
A on w zwycięskiej chwale
Wstępuje na krużganki.
Tam, {{7:od radosnej witany kochanki}},
Rycerz jej w oczy rękawiczkę rzucił:
„Pani, twych dzięków nie trzeba mi wcale”.
To rzekł i poszedł, i więcej nie wrócił."),
		("pani-twardowska", 0, null, "Jedzą, piją, lulki palą,
Tańce, hulanka, swawola;
Ledwie karczmy nie rozwalą,
Ha, ha! Hi, hi! hejże! hola!"),
		("pani-twardowska", 1, null, "Twardowski siadł w końcu stoła,
Podparł się w boki jak basza:
„Hulaj dusza! hulaj!” woła,
Śmieszy, tumani, przestrasza."),
		("pani-twardowska", 2, null, "Żołnierzowi, co grał zucha,
Wszystkich {{1:łaje}} i potrąca,
Świsnął szablą koło ucha:
Już z żołnierza masz zająca."),
		("pani-twardowska", 3, null, "Na {{2:patrona}} z trybunału,
Co milczkiem wypróżniał rondel,
Zadzwonił {{3:kieską}}, pomału:
Z patrona robi się {{4:kondel}}."),
		("pani-twardowska", 4, null, "{{5:Szewcu}} w nos wyciął trzy szczutki,
Do łba przymknął trzy rureczki,
Cmoknął: cmok! i gdańskiej wódki
Wytoczył ze łba pół beczki."),
		("pani-twardowska", 5, null, "Wtem, gdy wódkę pił z kielicha,
Kielich zaświstał, zazgrzytał;
Patrzy na dno: — „Co u licha?
Po coś tu, kumie, zawitał?”"),
		("pani-twardowska", 6, null, "Diablik to był w wódce na dnie:
Istny Niemiec, sztuczka kusa;
Skłonił się gościom układnie,
Zdjął kapelusz i dał susa."),
		("pani-twardowska", 7, null, "Z kielicha aż na podłogę
Pada, rośnie na dwa łokcie,
Nos jak haczyk, kurzą nogę,
I krogulcze ma paznokcie."),
		("pani-twardowska", 8, null, "„A, Twardowski… witam bracie!”
To mówiąc, {{6:bieży}} {{7:obcesem}}:
„Cóż to, czyliż mię nie znacie?
Jestem Mefistofelesem."),
		("pani-twardowska", 9, null, "{{8:Wszak ze mnąś}} na Łysej Górze
Robił o duszę zapisy:
{{9:Cyrograf}} na byczej skórze
Podpisałeś ty i biésy."),
		("pani-twardowska", 10, null, "Miały słuchać twego rymu;
Ty, {{10:jak dwa lata przebiegą}},
Miałeś pojechać do Rzymu,
By cię tam porwać jak swego."),
		("pani-twardowska", 11, null, "Już i siedem lat uciekło,
Cyrograf nadal nie służy:
Ty, czarami dręcząc piekło,
Ani myślisz o podróży."),
		("pani-twardowska", 12, null, "Ale zemsta, choć leniwa,
Nagnała cię w nasze sieci:
Ta karczma Rzym się nazywa…
Kładę areszt na waszeci”."),
		("pani-twardowska", 13, null, "Twardowski ku drzwiom się {{11:kwapił}}
Na takie {{12:dictum acerbum}};
Diabeł za kontusz ułapił:
„A gdzie jest {{13:nobile verbum}}?”"),
		("pani-twardowska", 14, null, "Co tu począć? kusa rada,
Przyjdzie już nałożyć głową…
Twardowski na koncept wpada
I zadaje trudność nową."),
		("pani-twardowska", 15, null, "„Patrz w kontrakt, Mefistofilu,
Tam warunki takie stoją:
Po latach tylu a tylu,
Gdy przyjdziesz brać duszę moją,"),
		("pani-twardowska", 16, null, "Będę miał prawo trzy razy
Zaprząc ciebie do roboty,
A ty najtwardsze rozkazy
Musisz spełnić co do joty."),
		("pani-twardowska", 17, null, "Patrz, oto jest karczmy godło,
Koń malowany na płótnie;
Ja chcę mu wskoczyć na siodło,
A koń niech z kopyta utnie."),
		("pani-twardowska", 18, null, "Skręć mi przy tym biczyk z piasku,
Żebym miał czym konia chłostać;
I wymuruj gmach w tym lasku,
Bym miał gdzie na popas zostać."),
		("pani-twardowska", 19, null, "Gmach będzie z ziarnek orzecha,
Wysoki pod szczyt {{14:Krępaku}},
Z bród żydowskich ma być strzecha,
Pobita nasieniem z maku."),
		("pani-twardowska", 20, null, "Patrz, oto na miarę {{15:ćwieczek}},
{{16:Cal}} gruby, długi trzy cale:
W każde z makowych {{17:ziareczek}}
Wbij mnie takie trzy {{18:bretnale}}”."),
		("pani-twardowska", 21, null, "Mefistofil duchem skoczy,
Konia czyści, karmi, poi,
Potem bicz z piasku utoczy,
I już w gotowości stoi."),
		("pani-twardowska", 22, null, "Twardowski dosiadł biegusa,
Probuje podskoków, zwrotów,
Stępa, galopuje, kłusa —
Patrzy, aż i gmach już gotów."),
		("pani-twardowska", 23, null, "„No! wygrałeś, panie biésie,
Lecz druga rzecz nieskończona:
Trzeba skąpać się w tej misie —
A to jest woda święcona”."),
		("pani-twardowska", 24, null, "Diabeł kurczy się i krztusi,
Aż zimny pot na nim bije:
Lecz pan każe, sługa musi,
Skąpał się biedak po szyję."),
		("pani-twardowska", 25, null, "Wyleciał potem jak z procy,
Otrząsł się, dbrum! parsknął raźnie:
„Teraz jużeś w naszej mocy,
{{19:Najgorętsząm odbył}} łaźnię”."),
		("pani-twardowska", 26, null, "„Jeszcze jedno, będzie kwita:
Zaraz pęknie moc czartowska! —
Patrzaj, oto jest kobiéta,
Moja żoneczka, Twardowska."),
		("pani-twardowska", 27, null, "Ja na rok u Belzebuba
Przyjmę za ciebie mieszkanie;
Niech przez ten rok moja luba
Z tobą jak z mężem zostanie."),
		("pani-twardowska", 28, null, "{{20:Przysiąż}} jej miłość, szacunek
I posłuszeństwo bez granic;
Złamiesz choć jeden warunek,
Już cała ugoda na nic”."),
		("pani-twardowska", 29, null, "Diabeł do niego pół ucha,
Pół oka zwrócił do {{21:samki}},
Niby patrzy, niby słucha —
Tymczasem już blisko klamki."),
		("pani-twardowska", 30, null, "Gdy mu Twardowski dokucza,
Od drzwi, od okien odpycha,
Czmychnąwszy dziurką od klucza,
Dotąd, jak czmycha, tak czmycha."),
		("tukaj-albo-proby-przyjazni", 0, "I", "„Ja umieram. — Ja nie płaczę,
I wy chciejcie ulżyć sobie;
Prędzej, później legniem w grobie.
Nie wrócą na świat rozpacze.
Byłem panem mnogich włości,
Sławny potęgą i zbiorem;
Zamki me stały otworem
Dla przyjaciół i dla gości.
O potęgo! o człowieku!
Wielkie zamki, wielkie {{2:imie}},
Wielkie nic! Wielkość, czczy dymie!
Ja umieram w kwiecie wieku!
Gdy za mądrości widziadłem
Goniąc, zbiegam kraje cudze,
Gdy wzrok nad księgami trudzę,
Skarbnice nauk posiadłem:
O nauki! o człowieku!
Wielka mądrość, wielkie imie,
Wielkie nic! rozum, czczy dymie!
Ja umieram w kwiecie wieku!
Strzegłem ustaw świętej wiary
W duchu i serca prostocie;
Hojnie nagradzałem cnocie,
Kościołom niosłem ofiary.
O pobożności! człowieku!
Święta wiaro, święte imie,
Święte nic! cnoto, czczy dymie!
Ja umieram w kwiecie wieku!
Twórco, jakże igrasz srodze!
Kiedy mi dasz wiek niedługi,
Cóż, że mi dasz wierne sługi?
Czymże za wierność nagrodzę?
Dasz kochankę kochankowi,
Śmierć truje ślubów słodycze.
I tylu przyjaciół liczę!
Bądźcie zdrowi, bądźcie zdrowi!”"),
		("tukaj-albo-proby-przyjazni", 1, null, "Tak na domowników ręku
Tukaj, pośród skarg i jęku,
Pożegnawszy świat na wieki,
Gasnące zamknął powieki."),
		("tukaj-albo-proby-przyjazni", 2, null, "Wtem grom łamie szczyty dachu,
Zadrżały zamkowe ściany,
Jakowyś starzec nieznany
Wlatuje na środek gmachu.
Siwy włos okrył mu skronie,
Twarz marszczkami rozorana,
Broda długa za kolana,
Na {{3:kosturze}} wsparte dłonie.
„Tukaju!” Porwał z pościeli
I wraz za sobą iść każe;
Już {{4:wierzchne}} sale minęli,
Minęli wały i straże.
Idą — ciemno, deszczyk kropi;
A {{5:srebrzysta twarz miesiąca}},
To grubawe mgły roztrąca,
To się znowu we mgle topi.
Idą ponad {{6:trzęskie}} kępy,
Mijają bagna, głębinie,
Hnilicy ciemnej ostępy,
{{7:Kołdyczewa}} nurty {{8:sinie}}.
Gdzie puszcza zarosła wkoło,
Spodem czarna, z wierzchu płowa,
Żwirami {{9:nasute}} czoło
wynosi góra Żarnowa,
Tam szli. Starzec kląkł na grobie,
Rozwarł usta, okiem błysnął,
Podniósł w górę ręce obie,
Trzykroć krzyknął, trzykroć świsnął.
„Tukaju, patrz, oto ścieżka!
Za ścieżką chatka na bagnie,
W chatce mędrzec {{10:Polel}} mieszka:
Mędrzec mędrca wspomóc pragnie.
Znana twa nauka, cnota;
Znam, że Bóg, węzły lubemi
Przywiązawszy cię do ziemi,
Długiego nie da żywota.
Ale rzucaj przestrach płony,
Mych sposobów uznaj {{11:dzielność}};
Żyj dla sług, przyjaciół, żony,
Lata, wieki, nieśmiertelność.
Ja pierwszy ziemskiemu oku
Śmiem do niej pokazać drogę;
Lecz podług ustaw wyroku
Dwom tylko pokazać mogę.
Wybierz drugiego człowieka,
Człowieka doznanej {{12:wiary}},
Któremu byś w każdej probie
Tak zaufał, jak sam sobie;
Trafisz — nieśmiertelność czeka!
Chybisz — śmierć i wieczne kary!”
— „Starcze! twe zjawienie wieszcze
Ciemna zasłona powleka,
Powiedz…” — „Powiadam ci jeszcze,
Wybierz drugiego człowieka.
Radź się twej głowy i serca,
Idzie o ciało i duszę!
Wierny albo przeniewierca,
Nieśmiertelność lub katusze!…
Czy mógłbyś {{13:zwierzyć się}} słudze?”"),
		("tukaj-albo-proby-przyjazni", 3, null, "Tukaj nic nie odpowiada,
Bo któż zgadnie myśli cudze?
Bo zbyt częsta w sługach zdrada.
„Może kochance lub żonie?”
— „Tak…” wtem uciął, patrzy smutnie;
„Tak” rzecze i znowu utnie.
Myśli, sam się z sobą biedzi,
„Tak jest, kochance… tak, żonie!”
I wierzy, i strach nań pada,
I wątpi, i wstydem płonie;
Myśli, sam się z sobą biedzi,
Umyślił, już w odpowiedzi,
Już… i nic nie odpowiada.
— „Umrzyj więc! ty śmiałeś żądać?
Daj pokój żądaniom dzikim!
Ty nie masz ufności w nikim.
Wartoż dłużej świat oglądać?”
On myśli… — „Nikogoż z wiela?
Sługi, żony, przyjaciela?”
— On myśli… Tu w mgnieniu oka
Czerni się niebios sklepienie,
Słychać grzmienie, ziemi drżenie,
Kipią bagna, lasy gorą,
Niknie w płomieniach opoka,
I doliny, i jezioro.
Śród gromów, świstu i szczęku,
Czy to zły duch, czy moc Boża,
Tukaj znalazł się śród łoża,
Na swych domowników ręku.
Głos tylko zagrzmiał z daleka:
„Nie masz drugiego człowieka,
Któremu byś w każdej probie
Tak zaufał, jak sam sobie”."),
		("tukaj-albo-proby-przyjazni", 4, "II", "„Ja mam, ja mam przyjaciela!”
Konający Tukaj woła.
Wraz uchodzi bladość z czoła,
Iskrą zdrowia oko strzela;
Tukaj wydarty mogile,
Wstaje, dziwią się doktory;
Wstaje, chodzi o swej sile,
Jakby nigdy nie był chory.
A wtem, na poduszce z boku,
Ujrzy z wolej skóry karty,
Gdzie tajemnice wyroku
Przeklęte spisały czarty.
Tukaj z ciekawością chwyta,
Siada, podparł się, i czyta:"),
		("tukaj-albo-proby-przyjazni", 5, null, "„Kiedy {{14:miesiąc na młodziku}},
Idź za górę do gaiku,
Znajdziesz kamień, spod kamienia
Białego urwij korzenia,
Kiedy będziesz bliski śmierci,
Każ ciało posiec na ćwierci,
W wodzie zgotować korzonki,
Pocięte namaścić członki:
Znowu się duch z ciałem zrośnie,
W młodocianej wstaniesz wiośnie,
I możesz, skutkiem tych leków,
Umierać, wstawać, wiek wieków”."),
		("tukaj-albo-proby-przyjazni", 6, null, "Dalej tam były przestrogi:
Jak siekać głowę, jak nogi,
W jakiej wodzie smażyć trunek,
Po jakiej brać zioła szczypcie;
Ale na końcu w {{15:post-skrypcie}},
Taki dodano warunek:"),
		("tukaj-albo-proby-przyjazni", 7, null, "„Jeśli użyty ktoś drugi
Do namaszczalnej posługi,
Zwiedzion przez nasze {{16:fortele}},
Innemu pokaże ziele
Lub w oznaczonej godzinie
Twego ciała nie namaści:
Wtenczas skutek zioła zginie,
Wtenczas piekło czeka waści.
Jeśli na to się ośmielisz,
Dla znaku, że zaszła zgoda,
Nasz poseł Mefistofelisz
Do wymiany traktat poda.
Ostrzegliśmy o fortelach,
Strzeż się; potem próżny {{17:kweres}}.
Dan w {{18:Erebie}}, w szabas rano;
{{19:Własną ręką podpisano:
Tak ma stać się: Lucyferes,
A za zgodność: Hadramelach}}»."),
		("tukaj-albo-proby-przyjazni", 8, null, "Tukaj trochę się zagniewał,
Warunku się nie spodziewał.
Brodę na ręku podpiera,
Potarł czoło, skrzywił nosa,
Na kontrakt spojrzał z ukosa:
Tabaczki dwa razy zażył,
To na ziemię spuszcza oczy,
To po {{20:stolowaniu}} toczy.
Wziął {{21:pargamin}}, w ręku zważył;
Znowu nań zezem poziera,
Znowu czytał i odczytał,
Znowu zważył, znowu zmierzył,
{{22:Kułakiem}} o stół uderzył,
Westchnął, mruczał, zębem zgrzytał,
Ręce nad czoło zakłada,
Skoczył raptem i w zapędzie
Machnął ręką: „Niech tak będzie!”
Znowu umilkł, znowu siada,
Znowu myśli, znowu wstaje,
Znowu chodzi, znowu siada.
Niech go za to nikt nie łaje,
Bo z diabłami rzecz nie lada."),
		("tukaj-albo-proby-przyjazni", 9, null, "Myśli: albo wieczne życie,
Albo wiecznie diabłu dusza.
Nic nie mówi, myśli skrycie,
Tylko trochę wargą rusza."),
		("tukaj-albo-proby-przyjazni", 10, null, "Nadszedł już czas odpowiedzi.
Tukaj oddala się z tłumu
I do pracowni rozumu
Zamknąwszy się, jeden siedzi.
I tam swój traktat raz jeszcze,
Nim stempel przyjęcia zyska,
W surowej uwagi kleszcze
Bierze i porządnie ściska.
Tam myśl rozmaita ścieka
W jedne podobieństwa {{23:tygle}};
Tam jednę myśl niedościgle
Różnicy nożykiem sieka;
Sieka, topi na kształt wosku,
Aż wycisnął ekstrakt wniosku.
Obejrzawszy wniosek ściśle,
Tak rzekł po długim namyśle:
„Jakieżkolwiek to fortele,
O których słyszałem z góry,
Czy ich niewiele, czy wiele,
Trojakiej będą natury.
Chcąc kogo przywieść do zdrady,
Trzeba siły albo rady;
Albo podarunkiem skusić,
Albo strwożyć, albo zmusić.
Toż samo krótszymi słowy,
Będzie {{24:sylogizm}} takowy:
Trojaka do zguby droga,
Ciekawość, łakomstwo, trwoga.
Więc kto w tym trojakim względzie
Twardej nie ulegnie probie,
Takiemu już można będzie
Ufać jak samemu sobie”."),
		("tukaj-albo-proby-przyjazni", 11, null, "Tukaj, {{25:kontent}} z wynalazku,
Szuka atramentu, piasku,
Idzie kreślić pismo grzechu,
Ale idzie bez pośpiechu.
Już ciemno, pisać {{26:niewcześnie}},
W atramencie jakieś pleśnie;
Dwie świece musiał zapalać
I dwa kałamarze nalać.
Coś mu zabolało w łokciu;
Wziął pióro — na piórze włosek
I bardzo spisany nosek;
Otrząsł, przyciął na paznokciu.
{{26:Po długim względzie, rozględzie}},
Wreszcie pisze: NIECH TAK BĘDZIE.
Chciał dołożyć i nazwisko:
Lecz nim pierwsze T napisał,
Myślał pół godziny blisko,
Głową i piórem kołysał,
I nic więcej nie napisał;
Tylko do pierwszej litery,
Dodał małe kropki.... cztery."),
		("tukaj-albo-proby-przyjazni", 12, null, "Gdy już napisano widzi,
Jeszcze patrzy, jeszcze bada;
Niechaj z tego nikt nie szydzi,
Bo z diabłami rzecz nie lada."),
		("tukaj-albo-proby-przyjazni", 13, null, "Lecz jakże się musiał zdumieć,
Gdy głoska «B» w słowie BĘDZIE,
Zaczęła brzęczeć i szumieć,
I wzdymać wszystkie krawędzie.
Kręci się, beczy, podrasta
Jak na drożdżach kawał ciasta;
Dolna litery połowa
Wykurcza się w brzuch i żebra,
U zwierzchniej wypukła głowa,
Na kształt ogromnego cebra.
Szyjka jak u osy wąska,
{{28:Nosik}} orła, bródka kozła,
A z jednej go strony końska,
Z drugiej kurza łapka wiozła;
Pogląda okiem wołowem,
Skrzydła na kształt młyńskich wioseł…
Był to diabeł jednym słowem,
Był to Miefistofel poseł."),
		("tukaj-albo-proby-przyjazni", 14, null, "Jeszcze Tukaj nie mógł wiedzieć,
Czy żegnać, czy prosić siedzieć,
Kiedy przyskoczył zuchwalec,
Porwał za maleńki palec,
Zasadził nożyk pod skórką,
I umoczył we krwi piórko;
Piórko wścibił, ścisnął w ręku,
Ręką wodzi pomaleńku,
Gdy już U, K, A, J minął,
Zrobiło się całkiem TUKAJ.
Djabeł świsnął, czmychnął, zginął…
Terazże z nim ładu szukaj!"),
		("lilje", 0, null, "Zbrodnia to niesłychana,
Pani zabija pana.
Zabiwszy grzebie w gaju,
Na łączce przy ruczaju,
Grób liliją zasiewa,
Zasiewając tak śpiewa:
„Rośnij kwiecie wysoko,
Jak pan leży głęboko;
Jak pan leży głęboko,
Tak ty rośnij wysoko”."),
		("lilje", 1, null, "Potem cała skrwawiona,
Męża zbójczyni żona,
Bieży przez łąki, przez knieje,
I górą, i dołem, i górą.
Zmrok pada, wietrzyk wieje;
Ciemno, wietrzno, ponuro.
Wrona gdzieniegdzie kracze,
I puchają puchacze."),
		("lilje", 2, null, "Bieży w dół do strumyka,
Gdzie stary rośnie buk,
Do chatki pustelnika
Stuk stuk, stuk stuk!"),
		("lilje", 3, null, "„Kto tam?” Spadła zapora,
Wychodzi starzec, świeci;
Pani na kształt upiora
Z krzykiem do chatki leci.
Ha! ha! zsiniałe usta,
Oczy przewraca w słup,
Drżąca, zbladła jak chusta:
„Ha! mąż, ha! trup!”"),
		("lilje", 4, null, "„Niewiasto, Pan Bóg z tobą!
Co ciebie tutaj niesie?
Wieczorną, słotną dobą,
Co robisz sama w lesie?”"),
		("lilje", 5, null, "— „Tu za lasem, za stawem,
Błyszczą mych zamków ściany,
Mąż z królem Bolesławem
Poszedł na Kijowiany."),
		("lilje", 6, null, "Lato za latem bieży,
Nie masz go z bojowiska,
Ja młoda śród młodzieży,
{{2:A droga cnoty śliska!
Nie dochowałam wiary}},
Ach! biada mojej głowie!
Król srogie głosi kary;
Powrócili mężowie."),
		("lilje", 7, null, "Ha! ha! mąż się nie dowie!
Oto krew! oto nóż!
Po nim już, po nim już!
Starcze: wyznałam szczerze,
Ty głoś świętemi usty,
Jakie mówić pacierze,
Gdzie mam iść na odpusty?
Ach! pójdę aż do piekła,
Zniosę bicze, pochodnie,
{{3:Byleby moję zbrodnię
Wieczysta noc powlekła}}”."),
		("lilje", 8, null, "„Niewiasto — rzecze stary —
Więc ci nie żal rozboju,
Ale tylko strach kary?
Idźże sobie w pokoju,
Rzuć bojaźń, rozjaśń lica,
Wieczna twa tajemnica.
Bo takie sądy Boże,
Iż co ty zrobisz skrycie,
Mąż tylko wydać może,
A mąż twój stracił życie”."),
		("lilje", 9, null, "Pani z wyroku rada,
Jak wpadła, tak wypada.
Bieży nocą do domu,
Nic nie mówiąc nikomu.
Stoją dzieci przed bramą:
„Mamo — wołają — mamo!
A gdzie został nasz tato?”
„Nieboszczyk? co? wasz tato?”
— Nie wie, co mówić na to —
„Został w lesie za dworem,
Powróci dziś wieczorem”."),
		("lilje", 10, null, "Czekają wieczór dzieci;
Czekają drugi, trzeci,
Czekają tydzień cały;
Nareszcie zapomniały."),
		("lilje", 11, null, "Pani zapomnieć trudno,
Nie wygnać z myśli grzechu,
Zawsze na sercu nudno,
Nigdy na ustach śmiechu,
Nigdy snu na źrenicy!
Bo często w nocnej porze,
Coś stuka się na dworze,
Coś chodzi po świetlicy:
„Dzieci — woła — to ja to,
To ja, dzieci, wasz tato!”"),
		("lilje", 12, null, "Noc przeszła, zasnąć trudno;
Nie wygnać z myśli grzechu,
Zawsze na sercu nudno,
Nigdy na ustach śmiechu!"),
		("lilje", 13, null, "„Idź, Hanko, przez dziedziniec:
Słyszę tętent na moście,
I kurzy się gościniec:
Czy nie jadą tu goście?
Idź na gościniec i w las,
Czy kto nie jedzie do nas?” —"),
		("lilje", 14, null, "— „Jadą, jadą w tę stronę,
Tuman na drodze wielki,
Rżą, rżą {{4:koniki wrone}},
Ostre błyszczą szabelki,
Jadą, jadą panowie,
Nieboszczyka bratowie!” —"),
		("lilje", 15, null, "— „A witajże, czy zdrowa?
Witajże nam, bratowa.
Gdzie brat?» — „Nieboszczyk brat,
Już pożegnał ten świat”.
— „Kiedy?” — „Dawno, rok minął,
Umarł… na wojnie zginął”.
— „To kłamstwo, bądź spokojna,
Już skończyła się wojna;
Brat zdrowy i ochoczy,
Ujrzysz go na twe oczy”."),
		("lilje", 16, null, "Pani ze strachu zbladła,
Zemdlała i upadła;
Oczy przewraca w słup,
Z trwogą dokoła rzuca:
„Gdzie on? gdzie mąż? gdzie trup?”
Powoli się ocuca;
Mdlała niby z radości
I pytała u gości:
„Gdzie mąż, gdzie me kochanie,
Kiedy przede mną stanie?”"),
		("lilje", 17, null, "— „Powracał razem z nami,
Lecz przodem chciał pospieszyć,
Nas przyjąć z rycerzami,
I twoje łzy pocieszyć.
Dziś, jutro, pewnie będzie,
Pewnie kędyś {{5:w obłędzie}}
Ubite minął szlaki.
Zaczekajmy dzień jaki,
Poszlemy szukać wszędzie,
Dziś, jutro, pewnie będzie”."),
		("lilje", 18, null, "Posłali wszędzie sługi,
Czekali dzień i drugi;
Gdy nic nie doczekali,
Z płaczem chcą jechać daléj."),
		("lilje", 19, null, "Zachodzi drogę pani:
„Bracia moi kochani,
Jesień zła do podróży,
Wiatry, słoty i deszcze,
Wszak czekaliście dłużéj,
Czekajcie trochę jeszcze”."),
		("lilje", 20, null, "Czekają. Przyszła zima,
Brata nié ma i nié ma.
Czekają; myślą sobie:
Może powróci z wiosną?
A on już leży w grobie,
A nad nim kwiatki rosną,
A rosną tak wysoko,
Jak on leży głęboko.
I wiosnę przeczekali,
I już nie jadą daléj."),
		("lilje", 21, null, "Do smaku im gospoda,
Bo gospodyni młoda;
Że chcą jechać, udają,
A tymczasem czekają,
Czekają aż do lata,
Zapominają brata."),
		("lilje", 22, null, "Do smaku im gospoda,
I gospodyni młoda.
Jak dwaj u niej gościli,
Tak ją dwaj polubili.
Obu nadzieja łechce,
Obadwaj zjęci trwogą,
Żyć bez niej żaden nie chce,
Żyć z nią obaj nie mogą.
Wreszcie, na jedno zdani,
Idą razem do pani."),
		("lilje", 23, null, "— „Słuchaj, pani bratowo,
Przyjm dobrze nasze słowo:
My tu próżno siedzimy,
Brata nie zobaczymy.
Ty jeszcze jesteś młoda,
Młodości twojej szkoda,
Nie wiąż dla siebie świata,
Wybierz brata za brata”."),
		("lilje", 24, null, "To rzekli i stanęli.
Gniew ich i zazdrość piecze,
Ten, to ów okiem strzeli,
Ten, to ów słówko rzecze;
Usta sine przycięli,
W ręku ściskają miecze."),
		("lilje", 25, null, "Pani ich widzi w gniewie,
Co mówić, sama nie wie.
Prosi o chwilkę czasu,
Bieży zaraz do lasu.
Bieży w dół do strumyka,
Gdzie stary rośnie buk,
Do chatki pustelnika
Stuk stuk, stuk stuk!
Całą mu rzecz wykłada,
Pyta się, co za rada?"),
		("lilje", 26, null, "„Ach, jak pogodzić braci?
Chcą mojej ręki oba;
Ten i ten się podoba,
Lecz kto weźmie? kto straci?
Ja mam maleńkie dziatki,
I wioski i dostatki;
Dostatek {{6:się zmitręża}},
Gdy zostałam bez męża."),
		("lilje", 27, null, "Lecz ach! nie dla mnie szczęście!
Nie dla mnie już zamęście!
Boża nade mną kara,
Ściga mnie nocna mara:"),
		("lilje", 28, null, "Zaledwie przymknę oczy,
Traf, traf, klamka odskoczy;
Budzę się: widzę, słyszę,
Jak idzie i jak dysze,
Jak dysze i jak tupa,
Ach, widzę, słyszę trupa!
Skrzyp, skrzyp, i już nad łożem
Skrwawionym sięga nożem,
I iskry z gęby sypie,
I ciągnie mnie i szczypie.
Ach! dosyć, dosyć strachu,
Nie siedzieć mnie w tym gmachu,
Nie dla mnie świat i szczęście,
Nie dla mnie już zamęście!”
„Córko — rzecze jej stary —
Nie masz zbrodni bez kary,
Lecz jeśli szczera skrucha,
Zbrodniarzów Pan Bóg słucha.
Znam ja tajnie wyroku,
Miłą ci rzecz obwieszczę:
Choć mąż zginął od roku,
Ja go wskrzeszę dziś jeszcze”"),
		("lilje", 29, null, "— „Co, co? jak, jak? mój ojcze!
Nie czas już, ach, nie czas!
To żelazo zabójcze
Na wieki dzieli nas!
Ach {{7:znam}}, żem warta kary,
I zniosę wszelkie kary,
Byle się pozbyć mary.
Zrzekę się mego zbioru
I pójdę do klasztoru,
I pójdę w ciemny las.
Nie, nie wskrzeszaj, mój ojcze!
Nie czas już, ach, nie czas!
To żelazo zabójcze
Na wieki dzieli nas!”"),
		("lilje", 30, null, "Starzec westchnął głęboko,
I łzami zalał oko,
Oblicze skrył w zasłonie,
Drżące załamał dłonie:
„Idź za mąż, póki pora,
Nie lękaj się upiora.
Martwy się nie ocuci,
Twarda wieczności brama;
I mąż twój nie powróci,
{{8:Chyba zawołasz sama}}”."),
		("lilje", 31, null, "— „Lecz jak pogodzić braci?
Kto weźmie, a kto straci?…”
— „Najlepsza będzie droga,
Zdać się na los i Boga.
Niechajże z ranną rosą
Pójdą i kwiecia zniosą.
Niech każdy weźmie kwiecie,
I wianek tobie splecie,
I niechaj doda znaki,
Żeby poznać, czyj jaki?
I pójdzie w kościół Boży,
I na ołtarzu złoży:
Czyj pierwszy weźmiesz wianek,
Ten mąż twój, ten kochanek”."),
		("lilje", 32, null, "Pani z przestrogi rada,
Już do małżeństwa skora,
Nie boi się upiora;
Bo w myśli swej układa,
Nigdy w żadnej potrzebie
Nie wołać go do siebie.
I z tych układów rada,
Jak wpadła, tak wypada.
Bieży prosto do domu,
Nic nie mówiąc nikomu.
Bieży przez łąki, przez gaje,
I bieży i staje
I staje i myśli i słucha:
Zda się, że ją ktoś goni,
I że coś szepce do niéj
(Wokoło ciemność głucha):
„To ja, twój mąż, twój mąż!”"),
		("lilje", 33, null, "I staje i myśli i słucha;
Słucha, zrywa się, bieży,
Włos się na głowie jeży,
W tył obejrzeć się lęka,
Coś wciąż po krzakach stęka,
Echo powtarza wciąż:
„To ja, twój mąż, twój mąż!”"),
		("lilje", 34, null, "Lecz zbliża się niedziela,
Zbliża się czas wesela.
Zaledwie słońce wschodzi,
Wybiegają dwaj młodzi.
Pani, śród dziewic grona
Do ślubu prowadzona,
Wystąpi śród kościoła
I bierze pierwszy wianek,
Obnosi go dokoła:
„Oto w wieńcu lilije,
Ach! czyjeż to są, czyje?
Kto mój mąż, kto kochanek?”"),
		("lilje", 35, null, "Wybiega starszy brat,
Radość na licach płonie,
Skacze i klaszcze w dłonie:
„Tyś moja, mój to kwiat!
Między liliji kręgi
Uplotłem wstążek zwój:
To znak, to moje wstęgi!
To mój, to mój, to mój!”"),
		("lilje", 36, null, "„Kłamstwo! — drugi zawoła —
Wyjdźcie tylko z kościoła,
Miejsce widzieć możecie,
Kędy rwałem to kwiecie.
Rwałem na łączce, w gaju,
Na grobie przy ruczaju,
Okażę grób i zdrój:
To mój, to mój, to mój!”"),
		("lilje", 37, null, "Kłócą się źli młodzieńce,
Ten mówi, ten zaprzecza;
Dobyli z pochew miecza,
Wszczyna się srogi bój,
Szarpią do siebie wieńce:
„To mój, to mój, to mój!”"),
		("lilje", 38, null, "Wtem drzwi kościoła trzasły
Wiatr zawiał, świece zgasły,
Wchodzi osoba w bieli:
Znany chód, znana zbroja…
Staje, wszyscy zadrżeli,
Staje, patrzy ukosem,
Podziemnym woła głosem:
„{{9:Mój wieniec i ty moja!
Kwiat na mym rwany grobie}}:
Mnie, księże, stułą wiąż;
Zła żono, biada tobie!
To ja, twój mąż, twój mąż!
Źli bracia! biada obu!
Z mego rwaliście grobu,
Zawieście krwawy bój!
To ja, twój mąż, wasz brat,
Wy moi, wieniec mój,
Daléj na tamten świat!”"),
		("lilje", 39, null, "Wstrzęsła się cerkwi posada,
Z zrębu wysuwa się zrąb,
Sklep trzeszczy, w głąb zapada,
Cerkiew zapada w głąb.
Ziemia ją z wiérzchu kryje,
Na niéj rosną lilije,
A rosną tak wysoko,
Jak pan leżał głęboko."),
		("dudarz", 0, null, "Jakiż to dziadek, jak gołąb siwy,
Z siwą aż do pasa brodą?
Dwaj go chłopczyki pod rękę wiodą,
Wiodą mimo naszej niwy."),
		("dudarz", 1, null, "Starzec na lirze brząka i nuci,
Chłopcy dmą w dudeczki z piórek.
Zawołam starca, niech się zawróci
I przyjdzie pod ten pagórek."),
		("dudarz", 2, null, "„Zawróć się, starcze, tu na igrzysko,
Tu się po {{1:siewbie}} weselim;
Co nam dał Pan Bóg, tem się podzielim,
I do wsi na noc stąd blisko”."),
		("dudarz", 3, null, "Posłuchał, przyszedł, skłonił się nisko
I usiadł sobie pod miedzą;
Przy nim po bokach chłopczyki siedzą,
Patrząc na wiejskie igrzysko."),
		("dudarz", 4, null, "Tu brzmią piszczałki, biją bębenki,
Płoną stosy suchych drewek;
Piją staruszki, skaczą panienki,
Obchodząc {{2:święto dosiewek}}."),
		("dudarz", 5, null, "Milczą piszczałki, głuchną bębenki,
Porzuca ogień gromadka;
Biegą staruszki, biegą panienki,
Biegą do dudarza dziadka."),
		("dudarz", 6, null, "„Witaj, dudarzu, witamy radzi,
W wesołej przychodzisz dobie;
Pewnie z daleka Pan Bóg prowadzi,
Pogrzej się i spocznij sobie”."),
		("dudarz", 7, null, "Wiodą, gdzie ogień, gdzie stół z murawy,
Sadzą dudarza pośrodku:
„Może pozwolisz na trochę strawy,
Albo na szklaneczkę miodku?"),
		("dudarz", 8, null, "Widzim i lirę, widzim piszczałki:
Zagraj co nam {{3:samotrzeci}};
Napełnim za to tłomok, kobiałki,
I będziem wdzięczni waszeci”."),
		("dudarz", 9, null, "„No, stójcież cicho, — rzekł do gromadki —
Cicho, — powtarza, w dłoń klaska —
Jeżeli chcecie, zagram wam, dziatki,
A cóż wam zagrać?” — „Co łaska”."),
		("dudarz", 10, null, "Wziął w ręce lirę i szklankę sporą,
Miodem pierś starą zagrzewa:
Mrugnął na chłopców, ci dudki biorą;
Brząknął, nastroił i śpiewa:"),
		("dudarz", 11, null, "„Idę ja Niemnem, jak Niemen długi,
Od wioseczki do wioseczki,
Z borku do borku, z smugów na smugi,
Śpiewając moje piosneczki."),
		("dudarz", 12, null, "Wszyscy się zbiegli, wszyscy słuchali,
Ale nikt mię nie rozumie!
Ja łzy ocieram, westchnienia tłumię,
I idę daléj a daléj."),
		("dudarz", 13, null, "Kto mię zrozumie, ten się użali,
I w białe uderzy dłonie;
Uroni łezkę, i ja uronię,
Ale już nie pójdę daléj”."),
		("dudarz", 14, null, "A wtem grać przestał. Nim znowu zacznie,
Przelotem spojrzał po błoniu:
Lecz w jednę stronę spoziera bacznie;
Któż tam stoi na ustroniu?"),
		("dudarz", 15, null, "Stała pasterka i plotła wieniec,
To uplecie, to rozplecie,
A obok przy niej stoi młodzieniec,
I splecione przyjął kwiecie."),
		("dudarz", 16, null, "Spokojność duszy z jej widać czoła,
Ku ziemi spuszczone oko;
Nie była smutna ani wesoła,
Tylko coś myśli głęboko."),
		("dudarz", 17, null, "Jak puszkiem chwieje trawka zielona,
Choć wiatr przestanie oddychać:
Tak się na piersiach chwieje zasłona,
Chociaż westchnienia nie słychać."),
		("dudarz", 18, null, "Wtem z piersi {{4:listek}} zżółkły odepnie,
Listek nieznanego drzewa;
Spójrzy nań, rzuci i z cicha szepnie,
Jakby się na listek gniewa."),
		("dudarz", 19, null, "Odwraca głowę, odeszła nieco,
Podniosła w niebo źrenice;
Nagle na oczach łezki zaświecą
I róż wystąpił na lice."),
		("dudarz", 20, null, "A dudarz milczy, brząka powoli,
A wzrok utopił w pasterce,
Utopił w licu, lecz wzrok sokoli
Zdał się przedzierać aż w serce."),
		("dudarz", 21, null, "Znowu wziął lirę i spory dzbanek,
Miodem pierś starą zagrzewa,
Skinął na chłopców, ci do {{5:multanek}},
Brząknął, nastroił i śpiewa:"),
		("dudarz", 22, null, "„Komu ślubny splatasz wieniec
Z róż, liliji i tymianka?
Ach, jak szczęśliwy młodzieniec,
Komu ślubny splatasz wieniec!"),
		("dudarz", 23, null, "Pewnie dla twego kochanka?
Wydają łzy i rumieniec,
Komu ślubny splatasz wieniec
Z róż, liliji i tymianka?"),
		("dudarz", 24, null, "Jednemu oddajesz wieniec
Z róż, liliji i tymianka;
Kocha cię drugi młodzieniec:
Ty jednemu oddasz wieniec,"),
		("dudarz", 25, null, "Zostawże łzy i rumieniec
Dla nieszczęsnego kochanka,
Gdy szczęśliwy bierze wieniec
{{6:Z róż, liliji i tymianka}}”."),
		("dudarz", 26, null, "Na to szmer powstał; różne pogłoski
Pomiędzy ciżbą przytomną:
Tę piosnkę śpiewał ktoś z naszej wioski;
Lecz kto i kiedy — nie pomną."),
		("dudarz", 27, null, "Starzec ucisza, podnosi rękę:
„Słuchajcie, dzieci, — zawoła —
Powiem, od kogo mam tę piosenkę,
Może on był z tego sioła."),
		("dudarz", 28, null, "Kiedym wędrując przez kraje cudze
Królewiec zwiedził przechodem,
Wtenczas przypłynął z Litwy na {{7:strudze}}
Pasterz jakiś z tych stron rodem."),
		("dudarz", 29, null, "Smutny był bardzo, ale przyczyny
Smutku nie mówił nikomu,
Odbił się potem od swej drużyny
I nie powrócił do domu."),
		("dudarz", 30, null, "Często widziałem, czy świecą zorza,
Czyli księżyc w pełnym blasku,
Jak on po błoniach, albo u morza
Po nadbrzeżnym błądził piasku."),
		("dudarz", 31, null, "Posród skał nieraz, podobny skale,
Na deszczu, wietrze i chłodzie,
Odludny dumał, wiatrom swe żale,
A łzy powierzając wodzie."),
		("dudarz", 32, null, "Szedłem ku niemu; spozierał smutnie,
Ale ode mnie nie stronił;
Jam, nic nie mówiąc, nastroił lutnię,
Zaśpiewał, w struny zadzwonił."),
		("dudarz", 33, null, "Łzy mu się rzucą; lecz skinął czołem,
Że się to granie podoba;
Ścisnął za rękę, ja go ścisnąłem,
I zapłakaliśmy oba."),
		("dudarz", 34, null, "Poznaliśmy się lepiej nawzajem,
I byliśmy przyjaciele.
On zawsze milczał swoim zwyczajem,
I ja mówiłem niewiele."),
		("dudarz", 35, null, "Potem, gdy troską strawiony długą,
Już nie mógł rady dać sobie;
Ja towarzyszem, ja byłem sługą,
Jam go pilnował w chorobie."),
		("dudarz", 36, null, "Nędzny, w mych oczach gasnął powoli,
Raz mię przywołał do łoża:
»Czuję — rzekł — bliski koniec niedoli,
Niech się spełni wola Boża."),
		("dudarz", 37, null, "{{8:Zgrzeszyłem tylko, że moje lata
Tak się nadaremnie starły:
Ale bez żalu schodzę ze świata,
Dawno już na nim umarły.}}"),
		("dudarz", 38, null, "Kiedy mię skał tych dziki zakątek
Ukrył przed gminu obliczem,
Odtąd już dla mnie świat ten był niczem:
Żyłem na świecie pamiątek."),
		("dudarz", 39, null, "Ty, coś mi wiernym został do grobu,
— Kończył, ściskając za ręce —
Nagrodzić tobie nie mam sposobu,
Wszakże to, co mam, poświęcę."),
		("dudarz", 40, null, "Znasz piosnkę, którąm po tyle razy
Śpiewał, płacząc nad mym losem;
Pomnisz zapewne wszystkie wyrazy,
I wiesz, jakim śpiewać głosem."),
		("dudarz", 41, null, "Mam jeszcze z bladych włosów zawiązkę
I zeschły cyprysu listek:
Naucz się piosnki, weź tę gałązkę,
To mój na ziemi skarb wszystek."),
		("dudarz", 42, null, "Idź, może znajdziesz na brzegach Niemna
Tę, której już nie obaczę;
Może jej piosnka będzie przyjemna,
Może nad listkiem zapłacze."),
		("dudarz", 43, null, "Nagrodzi starca, do domu przyjmie,
Powiedz…« Wtem oko ściemniało,
A w ustach {{9:Panny Najświętszej imię,
Wpół wymówione zostało}}."),
		("dudarz", 44, null, "Silił się jeszcze i w samym skonie
Na próżno coś wyrzec żądał;
Wskazał ku sercu i ku tej stronie,
Na którą, żyjąc, poglądał”. —"),
		("dudarz", 45, null, "Tu przerwał dudarz i szukał okiem,
Dostając listek z papierka:
Lecz już nie była między natłokiem
Ta, której szukał — pasterka."),
		("dudarz", 46, null, "Z daleka tylko poznał {{10:sukienkę}},
Bo w chustce skryła twarz boską;
Jakiś młodzieniec wiódł ją pod rękę;
Już ich nie widać za wioską."),
		("dudarz", 47, null, "Przybiegła zgraja, gdzie starzec siedział.
„Co to jest?” wszyscy pytają…
On nic nie wiedział — może i wiedział,
Ale nie mówił przed zgrają.");

INSERT INTO Note (balladId, ordinal, body)
	VALUES
		("pierwiosnek", 0, "(Primula veris)"),
		("switez", 0, "(Do Michała Wereszczaki)"),
		("rybka", 0, "(Ze śpiewu gminnego)"),
		("kurhanek-maryli", 0, "(Myśl ze śpiewu litewskiego)"),
		("kurhanek-maryli", 1, "Cudzy Człowiek, Dziewczyna, Jaś, Matka, Przyjaciółka"),
		("do-przyjaciol", 0, "(Posyłając im balladę »To lubię«)"),
		("rekawiczka", 0, "{{1:(z Schillera)}}"),
		("tukaj-albo-proby-przyjazni", 0, "{{1:(We czterech częściach)}}"),
		("lilje", 0, "(Z pieśni gminnej)"),
		("dudarz", 0, "(Myśl z pieśni gminnej)");

INSERT INTO Motto (balladId, body, author, translation)
	VALUES
		("romantycznosc", "Methinks I see…
— Where?…
— In my mind's eye", "{{1:W. Shakespeare}}", "Zdaje mi się, że widzę… Gdzie?
Przed oczyma duszy mojej.");

INSERT INTO Annotation (balladId, id, body)
	VALUES
		("pierwiosnek", 1, "Chodzi o śnieg. Mickiewicz nieprzypadkowo nazywa śnieg pleśnią - czymś starym i zepsutym. Pierwiosnek zwiastuje nadejście wiosny po zimie, narodziny czegoś nowego i świeżego, tak jak Romantyzm, który przyjdzie po mrokach Oświecenia. [przypis własny]"),
		("romantycznosc", 1, "Motto wzięte z Szekspirowskiego Hamleta (akt I, scena 2). [przypis redakcyjny]"),
		("romantycznosc", 2, "„Czasem” (z białorus.) — a nuż, może przypadkiem. [przypis redakcyjny]"),
		("romantycznosc", 3, "Pianie koguta miało płoszyć duchy, upiory itp. [przypis redakcyjny]"),
		("romantycznosc", 4, "W autografie do tego wiersza dał poeta dopisek: „Ob. Rosp. w Dzien. Wileń.”. Miał na myśli rozprawę Jana Śniadeckiego przeciw romantyczości, wydrukowaną w zeszycie „Dziennika Wileńskiego” ze stycznia 1819 r. [przypis redakcyjny]"),
		("romantycznosc", 5, "„duby smalone” — głupstwa, brednie, rzeczy zmyślone, koszałki-opałki. Dubiel w staropolszczyźnie znaczył tyle co: głupiec, prostak. [przypis redakcyjny]"),
		("switez", 1, "„larwy” — straszydła. [przypis redakcyjny]"),
		("switez", 2, "„Cyryn” — miasteczko w Nowogródzkiem, z kościołem parafialnym. Do parafii cyryńskiej należały Płużyny. [przypis redakcyjny]"),
		("switez", 3, "„baty” — czółna. [przypis redakcyjny]"),
		("switez", 4, "„pławki” (pławy, pławuki) — kawałki kory przytwierdzane do górnej krawędzi sieci w celu utrzymania jej na wodzie. [przypis redakcyjny]"),
		("switez", 5, "„Pewnie nie złowią ni oka” — zwrot ludowy, używany na Białej Rusi i Podolu; oko — waga trzech funtów. [przypis redakcyjny]"),
		("switez", 6, "„głębinia” (forma białorus.) — głębina. [przypis redakcyjny]"),
		("switez", 7, "„car” — podbiał (ziele). [przypis redakcyjny]"),
		("switez", 8, "„od książąt Tuhanów” — aluzja do Tuhanowicz, wsi należącej do Wereszczaków, gdzie przebywała Maryla. [przypis redakcyjny]"),
		("switez", 9, "„List” (stpol.) — liść (por.: listopad). [przypis redakcyjny]"),
		("switezianka", 1, "Jest wieść, że na brzegach Świtezi pokazują się Ondiny, czyli Nimfy wodne, które gmin nazywa Świteziankami [przyp. poety]. [przypis autorski]"),
		("switezianka", 2, "Mickiewicz używa obu form: „Świteziu” i „Świtezi”; obie były wówczas w użyciu. [przypis redakcyjny]"),
		("switezianka", 3, "„liścia” — lm od zbiorowej formy: liście. [przypis redakcyjny]"),
		("switezianka", 4, "„przyklęknął, chwycił w dłoń piasku” — zwyczaj ludowy kazał przysięgać w ten właśnie sposób. [przypis redakcyjny]"),
		("switezianka", 5, "Drzewo było „świadomym” przysięgi strzelca. [przypis redakcyjny]"),
		("rybka", 1, "„urągać” — naśmiewać się z kogoś. [przypis edytorski]"),
		("rybka", 2, "„wszystko woła” (z białorus.) — ciągle woła. [przypis redakcyjny]"),
		("rybka", 3, "„skałka” — płaski kamyk nadbrzeżny, umiejętnie rzucony odbija się kilkakroć od powierzchni wody. [przypis redakcyjny]"),
		("rybka", 4, "„dłoń w trąbkę zwinął” — aby lepiej dostrzec z odległości. [przypis redakcyjny]"),
		("rybka", 5, "„z zatoki połową” — w połowie zatoki. [przypis redakcyjny]"),
		("kurhanek-maryli", 1, "„kurchanek” - stożkowy nasyp kryjący groby, wznoszony od neolitu do wczesnego średniowiecza [słownik PWN] [przypis własny]"),
		("to-lubie", 1, "„łóz” (starop.) — wierzb. [przypis edytorski]"),
		("to-lubie", 2, "„podaje się” — znajduje się. [przypis edytorski]"),
		("to-lubie", 3, "„chróśniak” (starop.) — chruśniak — teren porośnięty ostrokrzewami. [przypis edytorski]"),
		("to-lubie", 4, "„odmyka” (starop.) — otwiera. [przypis edytorski]"),
		("to-lubie", 5, "„dyszel” (daw.) — drąg do kierowania pojazdem zaprzężonym w konie. [przypis edytorski]"),
		("to-lubie", 6, "„djabłów” — popr.: diabłów. [przypis edytorski]"),
		("to-lubie", 7, "„zadaje” — uderza. [przypis edytorski]"),
		("to-lubie", 8, "„szrubie” — popr.: śrubie. [przypis edytorski]"),
		("to-lubie", 9, "„martwica” — widmo kobiece. [przypis edytorski]"),
		("to-lubie", 10, "„blizkich” — popr.: bliskich. [przypis edytorski]"),
		("to-lubie", 11, "„czyścowej” — popr.: czyśćcowej. [przypis edytorski]"),
		("to-lubie", 12, "„mnóztwo” — popr.: mnóstwo. [przypis edytorski]"),
		("to-lubie", 13, "„bez braku” (starop.) — bez wyjątku. [przypis edytorski]"),
		("to-lubie", 14, "„tamecznego” (starop.) — tamtego. [przypis edytorski]"),
		("to-lubie", 15, "„Ach! i ty poznasz Marylę, lecz ona…” — mowa o Maryli Wereszczakównie, z którą Mickiewicz romansował od 1818 lub 1819 r. Zaowocowało to niespełnioną miłością, ponieważ Maryla była zaręczona z hrabią Puttkamerem i w 1821 r. wzięła ślub z tymże. [przypis edytorski]"),
		("to-lubie", 16, "„Marya” — popr.: Maria [przypis edytorski]"),
		("rekawiczka", 1, "„z Schillera” — przekład Adama Mickiewicza powstał w kwietniu 1820 r. w Kownie; poeta zmienił imiona osób występujące w oryginale: król Franz (w tłumaczeniu polskim nie pada jego imię), dama imieniem Kunigund (tu: Marta), rycerz Delorges (tu: Emrod). [przypis edytorski]"),
		("rekawiczka", 2, "„podwoje” — podwójne drzwi a. brama. [przypis edytorski]"),
		("rekawiczka", 3, "„panowie Rada” — zwrot staropolski na oznaczenie senatu. [przypis redakcyjny]"),
		("rekawiczka", 4, "„wzniosły” — wzniesiony; znajdujący się wysoko. [przypis redakcyjny]"),
		("rekawiczka", 5, "„wrzeciądze” — zamknięcie drzwi a. bramy. [przypis edytorski]"),
		("rekawiczka", 6, "„z zachowu” — z zamkniętego miejsca. [przypis redakcyjny]"),
		("rekawiczka", 7, "„od radosnej witany kochanki” — dziś: „witany przez radosną kochankę”. [przypis edytorski]"),
		("pani-twardowska", 1, "łajać — strofować, ganić. [przypis edytorski]"),
		("pani-twardowska", 2, "patron — adwokat. [przypis redakcyjny]"),
		("pani-twardowska", 3, "kieska — woreczek z pieniędzmi. [przypis redakcyjny]"),
		("pani-twardowska", 4, "kondel — kundel, pies. [przypis edytorski]"),
		("pani-twardowska", 5, "szewcu — dziś C.lp.: szewcowi. [przypis edytorski]"),
		("pani-twardowska", 6, "bieży — 3.os. lp: idzie, zmierza. [przypis edytorski]"),
		("pani-twardowska", 7, "obcesem — natrętnie, zuchwale. [przypis redakcyjny]"),
		("pani-twardowska", 8, "ze mnąś (…) robił — konstrukcja z ruchomą końcówką czasownika; inaczej: ze mną robiłeś. [przypis edytorski]"),
		("pani-twardowska", 9, "cyrograf — własnoręcznie spisany dokument zawierający zobowiązanie, tekst umowy itp. (zwłaszcza z diabłem); dziś używane żartobliwie. [przypis edytorski]"),
		("pani-twardowska", 10, "jak dwa lata przebiegą — gdy upłyną dwa lata. [przypis edytorski]"),
		("pani-twardowska", 11, "kwapić się — śpieszyć się; kierować się śpiesznie. [przypis edytorski]"),
		("pani-twardowska", 12, "dictum acerbum (łac.) — przykre powiedzenie. [przypis redakcyjny]"),
		("pani-twardowska", 13, "nobile verbum (łac.) — słowo szlacheckie (którego trzeba dotrzymać pod groźbą utraty honoru). [przypis redakcyjny]"),
		("pani-twardowska", 14, "Krępak — także: Krempak a. Krapak; nazwa używana dawniej na określenie szczytu Łomnicy (2634 m n.p.m.), ale także Karpat lub Tatr. [przypis redakcyjny]"),
		("pani-twardowska", 15, "ćwieczek — mały gwóźdź, gwoździk. [przypis edytorski]"),
		("pani-twardowska", 16, "cal — daw. jednostka miary długości, równa ok. 2,5 cm. [przypis edytorski]"),
		("pani-twardowska", 17, "ziareczko — dziś: ziarneczko. [przypis edytorski]"),
		("pani-twardowska", 18, "bretnal (z niem. Brettnagel) — duży gwóźdź do przybijania desek. [przypis redakcyjny]"),
		("pani-twardowska", 19, "Najgorętsząm odbył — konstrukcja z ruchomą końcówką czasownika; inaczej: odbyłem najgorętszą (łaźnię). [przypis edytorski]"),
		("pani-twardowska", 20, "przysiąż — dziś: przysięgnij. [przypis edytorski]"),
		("pani-twardowska", 21, "samka — samica, tu żartobliwie o pani Twardowskiej. [przypis redakcyjny]"),
		("tukaj-albo-proby-przyjazni", 1, "„we czterech częściach” — W pierwszym tomie Poezji Mickiewicza z 1822 r. zostały opublikowane dwie pieśni Tukaja z takim dopiskiem autorskim; swojego zamierzenia Mickiewicz nigdy jednak nie zrealizował. Pozostałe dwie części dopisał kilka lat później Antoni Edward Odyniec. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 2, "„imie” (daw.) — tu: mienie, majątek. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 3, "„kostur” — kij, laska używany przez wędrowców do podpierania się. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 4, "„wierzchne” — górne, znajdujące się na piętrze. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 5, "„srebrzysta twarz miesiąca” — księżyc. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 6, "„trzęski” (daw.) — grząski. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 7, "„Kołdyczew” — nazwisko jeziora. [Wszystkie nazwy miejscowości: Hnilica, Kołdyczew, Żarnowa Góra pochodzą z okolic rodzinnego Zaosia Mickiewicza; przyp. red.]. [przypis autorski]"),
		("tukaj-albo-proby-przyjazni", 8, "„sinie” — sine. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 9, "„żwirami nasute” — zasypane żwirem. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 10, "„Polel” — imię rzekomej postaci (bóstwa) z mitologii słowiańskiej; Lel i Polel mieli być synami Łady, boga wojny (w wersji męskiej) a. miłości i płodności (w wersji męskiej). [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 11, "„dzielność” — tu: siłę, skuteczność. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 12, "„doznanej wiary” — zaufanego; o sprawdzonej, doświadczonej wierności. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 13, "„zwierzyć się” — zawierzyć się; powierzyć komuś swój los. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 14, "„miesiąc na młodziku” — księżyc po nowiu. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 15, "„post scriptum” (łac.) — dopisek. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 16, "„fortel” — podstęp. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 17, "„kweres” (daw.) — zamieszanie, zamęt. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 18, "„Ereb” (mit. gr.) — najciemniejsza część Hadesu, także: bóstwo i uosobienie ciemności świata podziemnego; tu: piekło [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 19, "„Własną ręką podpisano (…) A za zgodność: Hadramelach” — przedrzeźnianie formy ukazów carskich. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 20, "„stolowanie” (białorus.) — stoĺ (zapis fonetyczny): pułap. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 21, "„pargamin” — pergamin. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 22, "„kułak” — mocno zaciśnięta dłoń; pięść. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 23, "„tygiel” — ogniotrwałe naczynie. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 24, "„sylogizm” — schemat wnioskowania pośredniego złożonego z dwóch przesłanek i wynikającego z nich wniosku. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 25, "„kontent” (daw.) — zadowolony. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 26, "„niewczesny” — dziejący się w niewłaściwym czasie. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 27, "„po długim względzie, rozględzie” — po długim namyśle. [przypis edytorski]"),
		("tukaj-albo-proby-przyjazni", 28, "„nosik” — nosek. [przypis edytorski]"),
		("lilje", 1, "„Lilie — Wiadomość o Liliach”, jako niedokończonej jeszcze balladzie, mamy w liście z Kowna z dnia 8 kwietnia 1820 r. Lilie są arcydziełem wśród ballad Mickiewicza. Krótki motyw ludowy rozwinął poeta wspaniale. Pierwsza zwrotka pieśni ludowej brzmi: „Stała się nam nowina, Pani pana zabiła, / W ogródku go schowała, Ruty na nim posiała, / Rośnij rutko wysoko, Jak pan leży głęboko”. [przypis redakcyjny]"),
		("lilje", 2, "nie była wierna mężowi [przypis własny]"),
		("lilje", 3, "byle nikt się nie dowiedział o zbrodni [przypis własny]"),
		("lilje", 4, "„koniki wrone” — koń maści karej (jednolicie czarne zabarwienie sierści, grzywy i ogona) i odcieniu wronim (odcień popielaty bez połysku). [przypis edytorski]"),
		("lilje", 5, "„w obłędzie” — zbłądziwszy w drodze. [przypis redakcyjny]"),
		("lilje", 6, "„zmitręża się” — marnuje się. [przypis redakcyjny]"),
		("lilje", 7, "„znam” — tu: wiem. [przypis edytorski]"),
		("lilje", 8, "„Chyba zawołasz sama” - „Chyba że zawołasz sama” [przypis własny]"),
		("lilje", 9, "„Mój wieniec i ty moja! Kwiat na mym rwany grobie” - kwiaty zostały zerwane z grobu męża, więc do niego należał wianek wybrany przez niewierną żonę, żona wybierając wianek przywołała męża [przypis własny]"),
		("dudarz", 1, "„siewba” — siew, obsiewanie pól. [przypis edytorski]"),
		("dudarz", 2, "„święto dosiewek” — obchodzone dawniej na wiosnę, nieraz o chłodzie wczesnej wiosny; dlatego płoną stosy suchych drewek. [przypis redakcyjny]"),
		("dudarz", 3, "„samotrzeci” — ty i dwaj chłopcy, we trzech. [przypis redakcyjny]"),
		("dudarz", 4, "„listek” — listek cyprysu, o którym mowa w IV części Dziadów. [przypis redakcyjny]"),
		("dudarz", 5, "„multanki” — dudki o kilku piszczałkach, nazywane od Multan (Wołoszczyzny), gdzie najpierw były w użyciu. [przypis redakcyjny]"),
		("dudarz", 6, "„Komu ślubny splatasz wieniec… Z róż liliji i tymianka” — te triolety wyjęte są z poezji Tomasza Zana [triolet — strofa pochodząca z wł. poezji średniowiecznej, ośmiowersowa, o układzie rymów abaaabab Red. WL]. [przypis autorski]"),
		("dudarz", 7, "„struga” — własc. strug (ros.), barka, galar rzeczny. [przypis redakcyjny]"),
		("dudarz", 8, "„Zgrzeszyłem tylko… Dawno już na nim umarły” — ta strofa przypomina słowa Gustawa z Upiora i z IV cz. Dziadów. [przypis redakcyjny]"),
		("dudarz", 9, "„Panny Najświętszej imię wpół wymówione zostało” — być może imię Maryli. [przypis redakcyjny]"),
		("dudarz", 10, "„sukienkę” — wymawiał Mickiewicz: „sukiękę”; dlatego rymuje z „rękę”. [przypis redakcyjny]");

