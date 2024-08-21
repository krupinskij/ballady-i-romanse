-- Migration number: 0001 	 2024-08-21T21:32:48.190Z

CREATE TABLE IF NOT EXISTS ballads (
  id INTEGER PRIMARY KEY,
  key TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  b_order INTEGER NOT NULL UNIQUE,
  prev_id INTEGER,
  next_id INTEGER,

  FOREIGN KEY (prev_id) REFERENCES ballads(id),
  FOREIGN KEY (next_id) REFERENCES ballads(id)
);

CREATE TABLE IF NOT EXISTS contents (
  ballad_id INTEGER NOT NULL,
  c_order NUMBER NOT NULL,
  character TEXT,
  c_text TEXT NOT NULL,

  FOREIGN KEY(ballad_id) REFERENCES ballads(id),
  PRIMARY KEY(ballad_id, c_order)
);

CREATE TABLE IF NOT EXISTS notes (
  ballad_id INTEGER NOT NULL,
  n_order INTEGER NOT NULL,
  n_text TEXT NOT NULL,

  FOREIGN KEY(ballad_id) REFERENCES ballads(id),
  PRIMARY KEY(ballad_id, n_order)
);

CREATE TABLE IF NOT EXISTS mottos (
  id INTEGER PRIMARY KEY,
  ballad_id INTEGER NOT NULL,
  m_text TEXT NOT NULL,
  author TEXT NOT NULL,
  translation TEXT NOT NULL,

  FOREIGN KEY(ballad_id) REFERENCES ballads(id)
);

-- START INSERT BALLADS

INSERT INTO ballads (key, title, b_order) VALUES 
  ("pierwiosnek", "Pierwiosnek", 0),
  ("romantycznosc", "Romantyczność", 1),
  ("switez", "Świteź", 2),
  ("switezianka", "Świtezianka", 3),
  ("rybka", "Rybka", 4),
  ("powrot-taty", "Powrót taty", 5),
  ("kurhanek-maryli", "Kurhanek Maryli", 6),
  ("do-przyjaciol", "Do przyjaciół", 7),
  ("to-lubie", "To lubię", 8),
  ("rekawiczka", "Rękawiczka", 9),
  ("pani-twardowska", "Pani Twardowska", 10),
  ("tukaj-albo-proby-przyjazni", "Tukaj albo próby przyjaźni", 11),
  ("lilije", "Lilije", 12),
  ("dudarz", "Dudarz", 13);

UPDATE ballads SET
  next_id = (SELECT id FROM ballads WHERE key = "romantycznosc")
WHERE key = "pierwiosnek";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "pierwiosnek"),
  next_id = (SELECT id FROM ballads WHERE key = "switez")
WHERE key = "romantycznosc";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "pierwiosnek"),
  next_id = (SELECT id FROM ballads WHERE key = "switezianka")
WHERE key = "switez";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "switez"),
  next_id = (SELECT id FROM ballads WHERE key = "rybka")
WHERE key = "switezianka";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "switezianka"),
  next_id = (SELECT id FROM ballads WHERE key = "powrot-taty")
WHERE key = "rybka";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "rybka"),
  next_id = (SELECT id FROM ballads WHERE key = "kurhanek-maryli")
WHERE key = "powrot-taty";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "powrot-taty"),
  next_id = (SELECT id FROM ballads WHERE key = "do-przyjaciol")
WHERE key = "kurhanek-maryli";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "kurhanek-maryli"),
  next_id = (SELECT id FROM ballads WHERE key = "to-lubie")
WHERE key = "do-przyjaciol";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "do-przyjaciol"),
  next_id = (SELECT id FROM ballads WHERE key = "rekawiczka")
WHERE key = "to-lubie";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "to-lubie"),
  next_id = (SELECT id FROM ballads WHERE key = "pani-twardowska")
WHERE key = "rekawiczka";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "rekawiczka"),
  next_id = (SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni")
WHERE key = "pani-twardowska";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "pani-twardowska"),
  next_id = (SELECT id FROM ballads WHERE key = "lilije")
WHERE key = "tukaj-albo-proby-przyjazni";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"),
  next_id = (SELECT id FROM ballads WHERE key = "dudarz")
WHERE key = "lilije";

UPDATE ballads SET
  prev_id = (SELECT id FROM ballads WHERE key = "lilije")
WHERE key = "dudarz";

-- END INSERT BALLADS

-- START INSERT CONTENTS

INSERT INTO contents (ballad_id, c_order, character, c_text) VALUES 
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 0, NULL, 
"Z niebieskich najrańszą piosnek
Ledwie zadzwonił skowronek,
Najrańszy kwiatek, pierwiosnek,
Błysnął ze złotych obsłonek."
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 1, "Ja", 
"Zawcześnie, kwiatku, zawcześnie,
Jeszcze północ mrozem dmucha,
Z gór białe nie zeszły pleśnie,
Dąbrowa jeszcze nie sucha."
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 2, NULL, 
"Przymruż złociste światełka,
Ukryj się pod matki rąbek,
Nim cię zgubi szronu ząbek,
Lub chłodnej rosy perełka."
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 3, "Kwiatek",
"Dni nasze jak dni motylka;
Życiem wschód, śmiercią południe;
Lepsza w kwietniu jedna chwilka,
Niż w jesieni całe grudnie."
  
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 4, NULL,
"Czy dla Bogów szukasz datku,
Czy dla druha lub kochanki,
Upleć wianek z mego kwiatku,
Wianek to będzie nad wianki."
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 5, "Ja", "W podłej trawce, w dzikim lasku
Urosłeś, o kwiatku luby!
Mało wzrostu, mało blasku,
Cóż ci daje tyle chluby?"
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 6, NULL,
"Ni to kolory jutrzenki,
Ni zawoje tulipana,
Ni liliowe sukienki,
Ni róży pierś malowana."
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 7, NULL,
"Uplatam ciebie do wianka,
Lecz skądże ufności tyle?
Przyjaciele i kochanka
Czy cię powitają mile?"
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 8, "Kwiatek", "Powitają przyjaciele
Mnie, wiosny młodej aniołka;
Przyjaźń ma blasku niewiele
I cień lubi jak me ziołka."
  ),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 9, NULL,
"Czym kochanki godzien rączek,
Powiedz, niebieska Marylko!
Za pierwszy młodości pączek
Zyskam pierwszą — ach! łzę tylko..."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 0, NULL,
"Słuchaj, dzieweczko!
— Ona nie słucha. —
To dzień biały! to miasteczko!
Przy tobie niema żywego ducha:
Co tam wkoło siebie chwytasz?
Kogo wołasz, z kim się witasz?
— Ona nie słucha. —"
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 1, NULL,
"To jak martwa opoka
Nie zwróci w stronę oka,
To strzela wkoło oczyma,
To się łzami zaleje,
Coś niby chwyta, coś niby trzyma,
Rozpłacze się i zaśmieje."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 2, NULL,
"— »Tyżeś to w nocy? to ty, Jasieńku!
Ach! i po śmierci kocha!
Tutaj, tutaj, pomaleńku,
Czasem usłyszy macocha!..."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 3, NULL,
"— »Niech sobie słyszy... już niema ciebie,
Już po twoim pogrzebie!"
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 4, NULL,
"»Ty już umarłeś? Ach! ja się boję!...
Czego się boję mego Jasieńka?
Ach, to on! lica twoje, oczki twoje!
Twoja biała sukienka!"
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 5, NULL,
"»I sam ty biały jak chusta,
Zimny... jakie zimne dłonie!
Tutaj połóż, tu na łonie,
Przyciśnij mnie, do ust usta..."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 6, NULL,
"»Ach, jak tam zimno musi być w grobie!
Umarłeś, tak, dwa lata!
Weź mię, ja umrę przy tobie,
Nie lubię świata."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 7, NULL,
"»Źle mnie w złych ludzi tłumie:
Płaczę, a oni szydzą:
Mówię, nikt nie rozumie;
Widzę, oni nie widzą!"
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 8, NULL,
"»Śród dnia przyjdź kiedy... to może we śnie?
Nie, nie... trzymam ciebie w ręku.
Gdzie znikasz, gdzie, mój Jasieńku?
Jeszcze wcześnie, jeszcze wcześnie!"
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 9, NULL,
"»Mój Boże! kur się odzywa,
Zorza błyska w okienku.
Gdzie znikłeś! ach! stój, Jasieńku!
Ja nieszczęśliwa!« —"
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 10, NULL,
"Tak się dziewczyna z kochankiem pieści,
Bieży za nim, krzyczy, pada;
Na ten upadek, na głos boleści,
Skupia się ludzi gromada."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 11, NULL,
"»Mówcie pacierze! — krzyczy prostota —
Tu jego dusza być musi,
Jasio być musi przy swej Karusi,
On ją kochał za żywota!«"
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 12, NULL,
"I ja to słyszę, i ja tak wierzę,
Płaczę, i mówię pacierze."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 13, NULL,
"— »Słuchaj, dzieweczko! — krzyknie śród zgiełku
Starzec, i na lud zawoła:
Ufajcie memu oku i szkiełku,
Nic tu nie widzę dokoła."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 14, NULL,
"»Duchy karczemnej tworem gawiedzi,
W głupstwa wywarzone kuźni;
Dziewczyna duby smalone bredzi,
A gmin rozumowi bluźni«."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 15, NULL,
"— »Dziewczyna czuje, — odpowiadam skromnie,
A gawiedź wierzy głęboko:
Czucie i wiara silniej mówi do mnie,
Niż mędrca szkiełko i oko."
  ),
  ((SELECT id FROM ballads WHERE key = "romantycznosc"), 16, NULL,
"»Martwe znasz prawdy, nieznane dla ludu,
Widzisz świat w proszku, w każdej gwiazd iskierce;
Nie znasz prawd żywych, nie obaczysz cudu!
Miej serce i patrzaj w serce!«"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 0, NULL,
"Z niebieskich najrańszą piosnek
Ledwie zadzwonił skowronek,
Najrańszy kwiatek, pierwiosnek,
Błysnął ze złotych obsłonek."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 1, NULL,
"Ktokolwiek będziesz w Nowogródzkiej stronie,
Do Płużyn ciemnego boru
Wjechawszy, pomnij zatrzymać twe konie,
Byś się przypatrzył jezioru."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 2, NULL,
"Świteź tam jasne rozprzestrzenia łona,
W wielkiego kształcie obwodu,
Gęstą po bokach puszczą oczerniona,
A gładka jak szyba lodu."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 3, NULL,
"Jeżeli nocną przybliżysz się dobą
I zwrócisz ku wodom lice:
Gwiazdy nad tobą i gwiazdy pod tobą,
I dwa obaczysz księżyce."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 4, NULL,
"Niepewny, czyli szklana z pod twej stopy
Pod niebo idzie równina,
Czyli też niebo swoje szklane stropy
Aż do nóg twoich ugina;"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 5, NULL,
"Gdy oko brzegów przeciwnych nie sięga,
Dna nie odróżnia od szczytu:
Zdajesz się wisieć w środku niebokręga,
W jakiejś otchłani błękitu."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 6, NULL,
"Tak w noc, pogodna jeśli służy pora,
Wzrok się przyjemnie ułudzi...
Lecz żeby w nocy jechać do jeziora,
Trzeba być najśmielszym z ludzi."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 7, NULL,
"Bo jakie szatan wyprawia tam harce!
Jakie się larwy szamocą!
Drżę cały, kiedy bają o tem starce,
I strach wspominać przed nocą."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 8, NULL,
"Nieraz śród wody gwar, jakoby w mieście,
Ogień i dym bucha gęsty,
I zgiełk walczących, i wrzaski niewieście,
I dzwonów gwałt, i zbrój chrzęsty."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 9, NULL,
"Nagle dym spada, hałas się uśmierza,
Na brzegach tylko szum jodły,
W wodach gadanie cichego pacierza,
I dziewic żałosne modły."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 10, NULL,
"Co to ma znaczyć? różni różnie plotą:
Cóż, kiedy nie był nikt na dnie;
Biegają wieści pomiędzy prostotą,
Lecz któż z nich prawdę odgadnie?"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 11, NULL,
"Pan na Płużynach, którego pradziady
Były Świtezi dziedzice,
Zdawna przemyślał i zasięgał rady,
Jak te zbadać tajemnice."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 12, NULL,
"Kazał przybory w blizkiem robić mieście,
I wielkie sypał wydatki:
Związano niewód głęboki stóp dwieście,
Budują czółna i statki."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 13, NULL,
"Ja ostrzegałem, że w tak wielkiem dziele
Dobrze, kto z Bogiem poczyna;
Dano więc na mszę w niejednym kościele,
I ksiądz przyjechał z Cyryna."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 14, NULL,
"Stanął na brzegu, ubrał się w ornaty,
Przeżegnał, pracę pokropił;
Pan daje hasło: odbijają baty,
Niewód się z szumem zatopił."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 15, NULL,
"Topi się, pławki nadół z sobą spycha,
Tak przepaść wody głęboka;
Prężą się liny, niewód idzie z cicha,
Pewnie nie złowią ni oka."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 16, NULL,
"Na brzeg oboje wyjęto już skrzydło,
Ciągną ostatek więcierzy:
Powiemże, jakie złowiono straszydło?
Choć powiem, nikt nie uwierzy."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 17, NULL,
"Powiem jednakże. Nie straszydło wcale,
Żywa kobieta w niewodzie!
Twarz miała jasną, usta jak korale,
Włos biały, skąpany w wodzie."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 18, NULL,
"Do brzegu dąży. A gdy jedni z trwogi
Na miejscu stanęli głazem,
Drudzy zwracają ku ucieczce nogi,
Łagodnym rzecze wyrazem:"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 19, NULL,
"»Młodzieńcy! wiecie, że tutaj bezkarnie
Dotąd nikt statku nie spuści:
Każdego śmiałka jezioro zagarnie
Do nieprzebrnionych czeluści."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 20, NULL,
"»I ty zuchwały, i twoja gromada,
Wrazbyście poszli w głębinie:
Lecz że to kraj był twojego pradziada,
Że w tobie nasza krew płynie;"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 21, NULL,
"»Choć godna kary jest ciekawość pusta,
Lecz żeście z Bogiem poczęli:
Bóg wam przez moje opowiada usta
Dzieje tej cudnej topieli."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 22, NULL,
"»Na miejscach, które dziś piaskiem zaniosło,
Gdzie car i trzcina zarasta,
Po których teraz wasze biega wiosło,
Stał okrąg pięknego miasta."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 23, NULL,
"»Świteź, i w sławne orężem ramiona
I w kraśne twarze bogata,
Niegdyś od książąt Tuhanów rządzona,
Kwitnęła przez długie lata."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 24, NULL,
"»Nie ćmił widoku ten ostęp ponury:
Przez żyzne wskroś okolice
Widać stąd było Nowogródzkie mury,
Litwy naówczas stolicę."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 25, NULL,
"»Raz niespodzianie obległ tam Mendoga
Potężnem wojskiem car z Rusi;
Na całą Litwę wielka padła trwoga,
Że Mendog poddać się musi."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 26, NULL,
"»Nim ściągnął wojsko z odległej granicy,
Do ojca mego napisze:
— »Tuhanie! w tobie obrona stolicy,
Śpiesz, zwołaj twe towarzysze«. —"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 27, NULL,
"»Skoro przeczytał Tuhan list książęcy
I wydał rozkaz do wojny:
Stanęło zaraz mężów pięć tysięcy,
A każdy konny i zbrojny."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 28, NULL,
"»Uderzą w trąby, rusza młódź, już w bramie
Błyska Tuhana proporzec:
Lecz Tuhan stanie i ręce załamie,
I znowu jedzie na dworzec."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 29, NULL,
"»I mówi do mnie: — Jaż własnych mieszkańców
Dla obcej zgubię odsieczy?
Wszak wiesz, że Świteź nie ma innych szańców,
Prócz naszych piersi i mieczy."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 30, NULL,
"Jeśli rozdzielę szczupłe wojsko moje,
Krewnemu nie dam obrony;
A jeśli wszyscy pociągniem na boje,
Jak będą córy i żony?"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 31, NULL,
"— »Ojcze, odpowiem, lękasz się niewcześnie,
Idź, kędy sława cię woła,
Bóg nas obroni: dziś nad miastem we śnie
Widziałam jego Anioła."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 32, NULL,
"»Okrążył Świteź miecza błyskawicą,
I nakrył złotemi pióry,
I rzekł mi: póki męże za granicą,
Ja bronię żony i córy. —"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 33, NULL,
"»Usłuchał Tuhan i za wojskiem goni;
Lecz gdy noc spadła ponura,
Słychać gwar zdala, szczęk i tentent koni,
I zewsząd straszny wrzask: ura!"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 34, NULL,
"»Zagrzmią tarany, padły bram ostatki,
Zewsząd pocisków grad leci,
Biegą na dworzec starce, nędzne matki,
Dziewice i drobne dzieci."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 35, NULL,
"»Gwałtu! wołają, zamykajcie bramę,
Tuż, tuż, za nami Ruś wali.
Ach! zgińmy lepiej, zabijmy się same,
Śmierć nas od hańby ocali."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 36, NULL,
"»Natychmiast wściekłość bierze miejsce strachu;
Miecą bogactwa na stosy,
Przynoszą żagwie i płomień do gmachu,
I krzyczą strasznymi głosy:"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 37, NULL,
"»Przeklęty będzie, kto się nie dobije!
Broniłam, lecz próżny opór:
Klęczą, na progach wyciągają szyje,
A drugie przynoszą topór."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 38, NULL,
"»Gotowa zbrodnia... Czyli wezwać hordy
I podłe przyjąć kajdany,
Czy bezbożnymi wytępić się mordy?...
Panie! zawołam, nad Pany:"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 39, NULL,
"»Jeśli nie możem ujść nieprzyjaciela,
O śmierć błagamy u Ciebie,
Niechaj nas lepiej Twój piorun wystrzela,
Lub żywych ziemia pogrzebie! —"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 40, NULL,
"»Wtem jakaś białość nagle mię otoczy,
Dzień zda się spędzać noc ciemną:
Spuszczam ku ziemi przerażone oczy...
Już ziemi niema podemną!..."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 41, NULL,
"»Takeśmy uszły zhańbienia i rzezi.
Widzisz to ziele dokoła?
To są małżonki i córki Świtezi,
Które Bóg przemienił w zioła."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 42, NULL,
"»Białawem kwieciem, jak białe motylki,
Unoszą się nad topielą;
Liść ich zielony, jak jodłowe szpilki,
Kiedy je śniegi pobielą."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 43, NULL,
"»Za życia cnoty niewinnej obrazy,
Jej barwę mają po zgonie,
W ukryciu żyją i nie cierpią skazy,
Śmiertelne nie tkną ich dłonie."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 44, NULL,
"»Doświadczył tego car i ruska zgraja,
Gdy piękne ujrzawszy kwiecie,
Ten rwie i szyszak stalony umaja,
Ten wianki na skronie plecie."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 45, NULL,
"»Kto tylko ściągnął do głębiny ramię,
Tak straszna jest kwiatów władza,
Że go natychmiast choroba wyłamie,
I śmierć gwałtowna ugadza."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 46, NULL,
"»Choć czas te dzieje wymazał z pamięci,
Pozostał sam odgłos kary,
Dotąd w swych baśniach prostota go święci,
I kwiaty nazywa cary«. —"
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 47, NULL,
"To mówiąc, pani zwolna się oddala,
Topią się statki i sieci,
Szum słychać w puszczy, poburzona fala
Z łoskotem na brzegi leci."
  ),
  ((SELECT id FROM ballads WHERE key = "switez"), 48, NULL,
"Jezioro do dna pękło nakształt rowu,
Lecz próżno za nią wzrok goni:
Wpadła, i falą nakryła się znowu,
I więcej nie słychać o niéj."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 0, NULL,
"Jakiż to chłopiec piękny i młody?
Jaka to obok dziewica?
Brzegami sinej Świtezi wody
Idą przy świetle księżyca."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 1, NULL,
"Ona mu z kosza daje maliny,
A on jej kwiaty do wianka;
Pewnie kochankiem jest tej dziewczyny,
Pewnie to jego kochanka?..."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 2, NULL,
"Każdą noc prawie o jednej porze
Pod tym się widzą modrzewiem.
Młody jest strzelcem w tutejszym borze;
Kto jest dziewczyna? ja nie wiem."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 3, NULL,
"Skąd przyszła? darmo śledzić kto pragnie,
Gdzie uszła? nikt jej nie zbada.
Jak mokry jaskier wschodzi na bagnie,
Jak ognik nocny przepada."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 4, NULL,
"— »Powiedz mi, piękna, luba dziewczyno,
Na co nam te tajemnice?
Jaką przybiegłaś do mnie drożyną?
Gdzie dom twój, gdzie są rodzice?"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 5, NULL,
"»Minęło lato, zżółkniały liścia
I dżdżysta nadchodzi pora:
Zawsze mam czekać twojego przyjścia
Na dzikich brzegach jeziora?"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 6, NULL,
"»Zawszeż po kniejach jak sarna płocha,
Jak upiór błądzisz w noc ciemną?
Zostań się lepiej z tym, kto cię kocha,
Zostań się, o luba, ze mną!"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 7, NULL,
"»Chateczka moja stąd niedaleka
Pośrodku gęstej leszczyny;
Jest tam dostatkiem owoców, mleka,
Jest tam dostatkiem zwierzyny«."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 8, NULL,
"— »Stój, stój, odpowie, hardy młokosie,
Pomnę, co ojciec rzekł stary:
Słowicze wdzięki w mężczyzny głosie,
A w sercu lisie zamiary."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 9, NULL,
"»Więcej się waszej obłudy boję,
Niż w zmienne ufam zapały;
Możebym prośby przyjęła twoje:
Ale czy będziesz mnie stały?« —"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 10, NULL,
"Chłopiec przyklęknął, chwycił w dłoń piasku,
Piekielne wzywał potęgi,
Klął się przy świętym księżyca blasku...
Lecz czy dochowa przysięgi?"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 11, NULL,
"— »Dochowaj, strzelcze, to moja rada:
Bo kto przysięgę naruszy,
Ach biada jemu, za życia biada!
I biada jego złej duszy!« —"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 12, NULL,
"To mówiąc, dziewka więcej nie czeka,
Wieniec włożyła na skronie,
I pożegnawszy strzelca zdaleka,
Na zwykłe uchodzi błonie."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 13, NULL,
"Próżno się za nią strzelec pomyka:
Rączym wybiegom nie sprostał;
Znikła jak lekki powiew wietrzyka,
A on sam jeden pozostał."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 14, NULL,
"Sam został, dziką powraca drogą,
Ziemia uchyla się grzązka.
Cisza wokoło, tylko pod nogą
Zwiędła szeleszcze gałązka."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 15, NULL,
"Idzie nad wodą, błędny krok niesie,
Błędnemi strzela oczyma;
Wtem wiatr zaszumiał po gęstym lesie,
Woda się burzy i wzdyma."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 16, NULL,
"Burzy się, wzdyma, pękają tonie,
O niesłychane zjawiska!
Ponad srebrzyste Świtezi błonie
Dziewicza piękność wytryska."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 17, NULL,
"Jej twarz, jak róży bladej zawoje
Skropione jutrzenki łezką:
Jako mgła lekka, tak lekkie stroje
Obwiały postać niebieską."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 18, NULL,
"— »Chłopcze mój piękny, chłopcze mój młody,
Zanuci czule dziewica:
Poco wokoło Świtezi wody
Błądzisz przy świetle księżyca?"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 19, NULL,
"»Poco żałujesz dzikiej wietrznicy,
Która cię zwabia w te knieje,
Zawraca głowę, rzuca w tęsknicy,
I może jeszcze się śmieje?"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 20, NULL,
"»Daj się namówić czułym wyrazem:
Porzuć wzdychania i żale,
Do mnie tu, do mnie, tu będziem razem
Po wodnym pląsać krysztale."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 21, NULL,
"»Czy zechcesz, niby jaskółka chybka,
Oblicze tylko wód muskać,
Czy zdrów jak rybka, wesół jak rybka,
Cały dzień ze mną się pluskać, —"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 22, NULL,
"»A na noc w łożu srebrnej topieli,
Pod namiotami zwierciadeł,
Na miękkiej wodnych lilijek bieli,
Śród boskich usnąć widziadeł.« —"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 23, NULL,
"Wtem z zasłon błysną piersi łabędzie...
Strzelec w ziemię patrzy skromnie.
Dziewica w lekkim zbliża się pędzie,
I — »do mnie, woła, pódź do mnie!«"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 24, NULL,
"I na wiatr lotne rzuciwszy stopy,
Jak tęcza śmiga w krąg wielki,
To znowu siekąc wodne zatopy,
Srebrnemi pryska kropelki."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 25, NULL,
"Podbiega strzelec... i staje w biegu...
I chciałby skoczyć i nie chce;
Wtem modra fala, prysnąwszy z brzegu,
Zlekka mu w stopy załechce."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 26, NULL,
"I tak go łechce i tak go znęca,
Tak się w nim serce rozpływa,
Jak gdy tajemnie rękę młodzieńca
Ściśnie kochanka wstydliwa."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 27, NULL,
"Zapomniał strzelec o swej dziewczynie,
Przysięgą pogardził świętą,
Na zgubę oślep bieży w głębinie,
Nową zwabiony ponętą."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 28, NULL,
"Bieży i patrzy, patrzy i bieży,
Niesie go wodne przestworze:
Już zdala suchych odbiegł wybrzeży,
Na średniem igra jeziorze."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 29, NULL,
"I już dłoń śnieżną w swej ciśnie dłoni,
W pięknych licach topi oczy,
Ustami usta różane goni,
I skoczne okręgi toczy:"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 30, NULL,
"Wtem wietrzyk świsnął, obłoczek pryska,
Co ją w łudzącym krył blasku...
Poznaje strzelec dziewczynę zbliska...
Ach, to dziewczyna z pod lasku!"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 31, NULL,
"— »A gdzie przysięga? gdzie moja rada?
Wszak kto przysięgę naruszy,
Ach, biada jemu, za życia biada!
I biada jego złej duszy!"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 32, NULL,
"»Nie tobie igrać przez srebrne tonie,
Lub nurkiem pluskać w głąb jasną:
Surowa ziemia ciało pochłonie,
Oczy twe żwirem zagasną."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 33, NULL,
"»A dusza przy tem świadomem drzewie
Niech lat doczeka tysiąca:
Wiecznie piekielne cierpiąc zarzewie,
Nie ma czem zgasić gorąca.« —"
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 34, NULL,
"Słyszy to strzelec, błędny krok niesie,
Błędnemi rzuca oczyma;
A wicher szumi po gęstym lesie,
Woda się burzy i wzdyma."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 35, NULL,
"Burzy się, wzdyma i wre aż do dna,
Kręconym nurtem pochwyca.
Roztwiera paszczę otchłań podwodna,
Ginie z młodzieńcem dziewica."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 36, NULL,
"Woda się dotąd burzy i pieni;
Dotąd przy świetle księżyca
Snuje się para znikomych cieni:
Jestto z młodzieńcem dziewica."
  ),
  ((SELECT id FROM ballads WHERE key = "switezianka"), 37, NULL,
"Ona po srebrnem pląsa jeziorze,
On pod tym jęczy modrzewiem.
Kto jest młodzieniec? strzelcem był w borze.
A kto dziewczyna? ja nie wiem."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 0, NULL,
"Od dworu, z pod lasa, z wioski,
Smutna wybiega dziewica,
Rozpuściła na wiatr włoski
I łzami skropiła lica."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 1, NULL,
"Przybiega na koniec łączki,
Gdzie w jezioro wpada rzeka;
Załamuje białe rączki
I tak żałośnie narzeka:"
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 2, NULL,
"»O wy, co mieszkacie w wodzie,
Siostry moje, Świtezianki,
Słuchajcie w ciężkiej przygodzie
Głosu zdradzonej kochanki."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 3, NULL,
"»Kochałam pana tak szczerze,
On mię przysięgał zaślubić:
Dziś księżnę za żonę bierze,
Krysię ubogą chce zgubić."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 4, NULL,
"»Niechże sobie żyją młodzi,
Niech się z nią obłudnik pieści,
Niech tylko tu nie przychodzi
Urągać się z mych boleści."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 5, NULL,
"»Dla opuszczonej kochanki
Cóż pozostało na świecie?
Przyjmijcie mię, Świtezianki:
Lecz moje dziecię... ach, dziecię!«"
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 6, NULL,
"To mówiąc, rzewnie zapłacze,
Rączkami oczy zasłoni,
I z brzegu do wody skacze,
I w bystrej nurza się toni."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 7, NULL,
"Wtem z lasu, gdzie się dwór bieli,
Tysiączne świecą kagańce,
Zjeżdzają goście weseli,
Muzyka, hałas i tańce."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 8, NULL,
"Lecz mimo tego hałasu
Płacz dziecięcia słychać w lesie;
Wierny sługa wyszedł z lasu,
I dziecię na ręku niesie."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 9, NULL,
"Ku wodzie obraca kroki,
Gdzie łoza, gęsto spleciona,
Wzdłuż wykręconej zatoki
Okryła rzeki ramiona."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 10, NULL,
"Tam staje w ciemnym zakątku,
Płacze i woła: — »Niestety!
Ach! któż da piersi dzieciątku?
Ach! gdzie ty, Krysiu, ach, gdzie ty?«"
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 11, NULL,
"— »Tu jestem, w rzece, u spodu,
Cichy mu głos odpowiada:
Tutaj drżę cała od chłodu,
A żwir mnie oczki wyjada."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 12, NULL,
"»Przez żwir, przez ostre kamuszki,
Fale mnie gwałtowne niosą;
Pokarm mój: koralki, muszki,
A zapijam zimną rosą."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 13, NULL,
"Lecz sługa, jak na początku,
Tak wszystko woła: — »Niestety!
Ach! któż da piersi dzieciątku?
Ach! gdzie ty, Krysiu, ach, gdzie ty?"
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 14, NULL,
"Wtem się coś zlekka potrąci
Śród kryształowej przezroczy,
Woda się zlekka zamąci,
Rybka nad wodę podskoczy;"
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 15, NULL,
"I jak skałka, płaskim bokiem,
Gdy z lekkich rąk chłopca pierzchnie,
Tak nasza rybka podskokiem
Mokre całuje powierzchnie."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 16, NULL,
"Złotemi plamki nadobna,
Kraśne ma po bokach piórka,
Główka jak naparstek drobna,
Oczko drobne jak paciórka."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 17, NULL,
"Wtem rybią łuskę odwinie,
Spojrzy dziewicy oczyma;
Z głowy jasny włos wypłynie,
Szyjka cieniuchna się wzdyma."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 18, NULL,
"Na licach różana krasa,
Piersi, jak jabłuszka mleczne,
Rybią ma pletwę do pasa,
Płynie pod chrósty nadrzeczne."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 19, NULL,
"I dziecię bierze do ręki,
U łona białego tuli,
— »Luli, woła, mój maleńki,
Luli, mój maleńki, luli». —"
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 20, NULL,
"Gdy dziecię płakać przestało,
Zawiesza kosz na gałęzi,
I znowu ściska swe ciało,
I główkę nadobną zwęzi."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 21, NULL,
"Znowu ją łuski powleką
Od boków wyskoczą skrzelki;
Plusła: i tylko nad rzeką
Kipiące pękły bąbelki."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 22, NULL,
"Tak co wieczora, co ranka,
Gdy sługa stanie w zakątku,
Wraz wypływa Świtezianka,
Żeby dać piersi dzieciątku."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 23, NULL,
"Za cóż jednego wieczora
Nikt nie przychodzi na smugi?
Już zwykła przemija pora:
Nie widać z dziecięciem sługi."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 24, NULL,
"Nie może on przyjść tą stroną,
Musi zaczekać troszeczkę,
Bo właśnie teraz pan z żoną
Poszli przechadzką nad rzeczkę."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 25, NULL,
"Wrócił się, czekał zdaleka,
Za gęstym usiadłszy krzakiem:
Lecz próżno czeka i czeka,
Nikt nie powracał tym szlakiem."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 26, NULL,
"Wstaje, i dłoń w trąbkę zwinął,
I patrzył przez palców szparę,
Ale i dzień już przeminął,
I mroki padają szare."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 27, NULL,
"Czekał długo po zachodzie;
A gdy noc gwiazdy zapala,
Zbliża się zlekka ku wodzie
I śledzi oczyma zdala."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 28, NULL,
"Przebóg! Cudy, czy moc piekła?
Uderza go widok nowy:
Gdzie pierwej rzeczułka ciekła,
Tam suchy piasek i rowy."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 29, NULL,
"Na brzegach porozrzucana
Wala się odzież bez ładu;
Ani pani, ani pana,
Nie widać nigdzie ni śladu."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 30, NULL,
"Tylko z zatoki połową
Sterczał wielki głazu kawał,
I dziwną kształtu budową
Dwa ludzkie ciała udawał."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 31, NULL,
"Zdumiewa się wierny sługa,
Rozpierzchłych myśli nie złowił;
Przeszła godzina, i druga,
Nim wreszcie słówko przemowił:"
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 32, NULL,
"»Krysiu, o Krysiu!« zawoła:
Echo mu »Krysiu« odpowie;
Lecz próżno patrzy dokoła,
Nikt nie pokazał się w rowie."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 33, NULL,
"Patrzy na rów i na głazy,
Otrze pot na licu zbladłem,
I kiwnie głową trzy razy,
Jakby chciał mówić: już zgadłem."
  ),
  ((SELECT id FROM ballads WHERE key = "rybka"), 34, NULL,
"Dzieciątko na ręce bierze,
Śmieje się dzikim uśmiechem,
I odmawiając pacierze,
Wraca do domu z pośpiechem."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 0, NULL,
"»Pójdźcie, o dziatki, pójdźcie wszystkie razem
Za miasto, pod słup, na wzgórek;
Tam przed cudownym klęknijcie obrazem,
Pobożnie zmówcie paciorek."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 1, NULL,
"»Tato nie wraca: ranki i wieczory
We łzach go czekam i trwodze;
Rozlały rzeki, pełne zwierza bory,
I pełno zbójców na drodze«."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 2, NULL,
"Słysząc to dziatki, biegną wszystkie razem,
Za miasto, pod słup, na wzgórek;
Tam przed cudownym klękają obrazem,
I zaczynają paciorek."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 3, NULL,
"Całują ziemię, potem: w imię Ojca,
Syna i Ducha Świętego,
Bądź pochwalona Przenajświętsza Trójca
Teraz i czasu wszelkiego."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 4, NULL,
"Potem Ojcze nasz, i Zdrowaś, i Wierzę,
Dziesięcioro i koronki:
A kiedy całe zmówili pacierze,
Wyjmą książeczkę z kieszonki:"
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 5, NULL,
"I litaniją do Najświętszej Matki,
Starszy brat śpiewa, a z bratem:
»Najświętsza Matko, przyśpiewują dziatki,
Zmiłuj się, zmiłuj nad tatem!«"
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 6, NULL,
"Wtem słychać turkot. Wozy jadą drogą,
I wóz znajomy na przedzie:
Skoczyły dzieci i krzyczą, jak mogą:
»Tato, ach, tato nasz jedzie!«"
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 7, NULL,
"Obaczył kupiec, łzy radośne leje,
Z wozu na ziemię wylata:
»Ha, jak się macie, co się u was dzieje?
Czyście tęskniły do tata?"
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 8, NULL,
"»Mama czy zdrowa? ciotunia? domowi?
A ot rodzynki w koszyku...«
Ten sobie mówi, a ten sobie mówi,
Pełno radości i krzyku."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 9, NULL,
"»Ruszajcie! kupiec na sługi zawoła,
Ja z dziećmi pójdę ku miastu«.
Idzie... Aż zbójcy obskoczą dokoła,
A zbójców było dwunastu."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 10, NULL,
"Brody ich długie, kręcone wąsiska,
Wzrok dziki, suknia plugawa;
Noże za pasem, miecz u boku błyska,
W ręku ogromna buława."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 11, NULL,
"Krzyknęły dziatki, do ojca przypadły,
Tulą się pod płaszcz na łonie,
Truchleją sługi, struchlał pan wybladły,
Drżące ku zbójcom wzniósł dłonie:"
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 12, NULL,
"«Ach! bierzcie wozy, ach! bierzcie dostatek,
Tylko puszczajcie nas zdrowo,
Nie róbcie małych sierotami dziatek,
I młodej małżonki wdową«."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 13, NULL,
"Nie słucha zgraja. Ten już wóz wyprzęga,
Zabiera konie; a drugi
»Pieniędzy!« krzyczy, i buławą sięga;
Ów z mieczem wpada na sługi."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 14, NULL,
"Wtem: »Stójcie, stójcie!« krzyknie starszy zbójca,
I spędza bandę precz z drogi,
A wypuściwszy i dzieci i ojca,
»Idźcie, rzekł, dalej bez trwogi«."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 15, NULL,
"Kupiec dziękuje, a zbójca odpowie:
»Nie dziękuj; wyznam ci szczerze,
Pierwszybym pałkę strzaskał na twej głowie,
Gdyby nie dziatek pacierze."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 16, NULL,
"»Dziatki sprawiły, że uchodzisz cało,
Darzą cię życiem i zdrowiem;
Im więc podziękuj za to, co się stało,
A jak się stało, opowiem."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 17, NULL,
"»Zdawna już słysząc o przejeździe kupca,
I ja, i moje kamraty,
Tutaj za miastem, przy wzgórku, u słupca,
Zasiadaliśmy na czaty."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 18, NULL,
"»Dzisiaj nadchodzę; patrzę między chrósty:
Modlą się dziatki do Boga;
Słucham: z początku porwał mię śmiech pusty,
A potem litość i trwoga."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 19, NULL,
"»Słucham: ojczyste przyszły na myśl strony,
Buława upadła z ręki:
Ach! ja mam żonę, i u mojej żony
Jest synek taki maleńki."
  ),
  ((SELECT id FROM ballads WHERE key = "powrot-taty"), 20, NULL,
"»Kupcze, jedź w miasto; ja do lasu muszę.
Wy, dziatki, na ten pagórek
Biegajcie sobie, i za moją duszę
Zmówcie też czasem paciorek«."
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 0, "Cudzy człowiek", "Tam u Niemnowej odnogi,
Tam u zielonej rozłogi,
Co to za piękny kurhanek?
Spodem uwieńczon jak w wianek,
W maliny, ciernie i głogi;
Boki ma strojne murawą,
Głowę ukwieconą w kwiaty.
A na niej czeremchy drzewo
A od niej idą trzy drogi:
Jedna droga na prawo,
Druga droga do chaty,
Trzecia droga na lewo.
Ja tędy płynę z wiciną,
Pytam się ciebie, dziewczyno,
Co to za piękny kurhanek?"
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 1, "Dziewczyna", "W całej wsi pytaj się, bracie,
A cała wieś powie tobie:
Maryla żyła w tej chacie,
A teraz leży w tym grobie.
Na prawej stronie te śladki
Ubite nogą pastuszka;
To jest drożyna jej matki,
A stąd przychodzi jej drużka."
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 2, NULL,
"Lecz oto błysnął poranek,
Przyjdą oni na kurhanek;
Ukryj się tu za stos łomu,
Sam ich posłuchasz niedoli,
Własne twe oczy zobaczą.
Patrz w prawo... idzie kochanek.
Patrz, matka idzie z domu,
Patrz w lewo, przyjaciółka.
Wszyscy idą powoli,
I niosą ziółka,
I płaczą."
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 3, "Jaś", "Marylo! o tej porze
Jeszcześmy się nie widzieli,
Jeszcześmy się nie ścisnęli.
Marylo! zaszło zorze!
Tu czeka twój kochanek:
Czy ty przespałaś ranek?
Czy na mnie zagniewana?
Ach! Marylo kochana,
Gdzież się ty dotąd kryjesz?
Nie, nie przespałaś ranka,
Nie gniewasz się na Janka:
Lecz nie żyjesz, nie żyjesz!
Więzi cię ten kurhanek,
Nie ujrzysz już kochanka,
Nie ujrzy cię kochanek!
Dawniej, kiedy spać szedłem, tem słodziłem chwile,
Że skoro się obudzę, obaczę Marylę,
I dawniej spałem mile!
Teraz, tutaj spać będę, od ludzi daleki,
Może ją we śnie ujrzę, gdy zamknę powieki;
Może zamknę na wieki!"
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 4, NULL,
"Byłem ja gospodarny, gdy byłem szczęśliwy;
Chwalili mnie sąsiedzi,
Chwalił mię ojciec siwy:
Teraz się ojciec biedzi;
A ja ni ludziom, ni Bogu!
Niech ziarno w polu przepadnie,
Niech ginie siano ze stogu,
Niech sąsiad kopy rozkradnie,
Niech trzodę wyduszą wilki!
Niemasz, niemasz Marylki!
Daje mi ojciec chaty,
Daje mi sprzęt bogaty,
Bym wziął w dom gospodynię;
Namawiali mię swaty,
Niemasz, niemasz Maryli!
Swaty nie namówili:
Nie mogę, nie, nie mogę!
Wiem, ojcze, co uczynię:
Pójdę w daleką drogę,
Więcej mnie nie znajdziecie
Choćbyście i szukali,
Nie będę już na świecie,
Przystanę do Moskali,
Żeby mię wraz zabili.
Niemasz, niemasz Maryli!"
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 5, "Matka", "Czemuż nie wstałam zrana?
Już w polu pełno ludzi.
Niemasz cię, niemasz, kochana
Marylo, któż mię obudzi?
Płakałam przez noc całą,
Zasnęłam, kiedy dniało.
Mój Szymon gdzieś już w polu,
Wyprzedził on świtania;"
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 6, NULL,
"Nie budził mię, mojego litując się bolu,
Poszedł z kosą bez śniadania;
Koś ty dzień cały, koś sobie,
Ja tutaj leżę na grobie.
Czegóż mam iść do domu?
Kto nas na obiad zawoła?
Kto z nami siądzie do stoła?
Niemasz, ach! niemasz komu!
Pókiśmy mieli ciebie,
W domu było jak w niebie.
U nas i wieczorynki,
Z całej wsi chłopcy, dziewki,
Najweselsze zażynki,
Najhuczniejsze dosiewki.
Niemasz cię! w domu pustynie!
Każdy kto idzie, minie.
Zawiasy rdzewieją w sieni,
Mchem się dziedziniec zieleni:
Bóg nas opuścił, ludzie opuścili,
Niemasz, niemasz Maryli!"
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 7, "Przyjaciółka", "Tutaj bywało z ranku
Nad wodą sobie stoim,
Ja o twoim kochanku,
Ty mnie mówisz o moim.
Już więcej z sobą nie będziem mówili,
Niemasz, niemasz Maryli!
Któż mi zwierzy się szczerze,
Komuż się ja powierzę?
Ach, gdy z tobą, kochanie,
Smutku i szczęścia nie dzielę,
Smutek smutkiem zostanie,
Weselem nie jest wesele."
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 8, NULL,
"***"
  ),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 9, NULL,
"Słyszy to cudzy człowiek,
Wzdycha i łzy mu płyną,
Westchnął, otarł łzy z powiek,
I dalej poszedł z wiciną."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 0, NULL,
"Bije raz, dwa, trzy... już północna pora:
Głuche wokoło zacisze,
Wiatr tylko szumi po murach klasztora,
I psów szczekanie gdzieś słyszę."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 1, NULL,
"Świeca w lichtarzu dopala się na dnie:
Raz w głębi tłumi ogniska,
Znowu się wzmoże i znowu opadnie,
Błyska, zagasa i błyska."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 2, NULL,
"Straszno!... Nie była straszną ta godzina,
Gdy były nieba łaskawsze;
Ileż mi słodkich chwilek przypomina!
Precz!... to już znikło na zawsze!"
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 3, NULL,
"Teraz ja szczęścia szukam ot w tej księdze...
Księga znudziła, porzucam;
Znowu ku lubym przedmiotom myśl pędzę,
To marzę, to się ocucam."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 4, NULL,
"Czasem, gdy słodkie złudzi zachwycenie,
Kochankę widzę lub braci;
Zrywam się, patrzę: aż tylko po ścienie
Biega cień własnej postaci."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 5, NULL,
"Ot, lepiej pióro wezmę i śród ciszy,
Gdy się bez ładu myśl plącze,
Zacznę coś pisać dla mych towarzyszy,
Zacznę, bo nie wiem, czy skończę."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 6, NULL,
"Może też pamięć o minionej wiośnie
Zimowy wietrzyk umili;
Chcę coś okropnie, coś pisać miłośnie,
O strachach i o Maryli."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 7, NULL,
"Kto pragnie pędzlem swe rozsławić imię,
Niech jej maluje portrety;
Wieszcz w nieśmiertelnym niech opiewa rymie
Serca, rozumu zalety;"
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 8, NULL,
"Mnie choć to wszystko w umyśle przytomne,
Pociechy szukam, nie sławy:
Lepiej wam powiem, jeżeli przypomnę,
Jakie z nią miałem zabawy."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 9, NULL,
"Maryla słodkie miłości wyrazy
Dzieliła skąpo w rachubie:
Choć jej kto kocham mówił po sto razy,
Nie rzekła nawet i lubię."
  ),
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 10, NULL,
"Za to więc w Rucie, pod północną chwilę,
Kiedy się wszyscy spać kładą,
Ja na dobranoc żegnając Marylę,
Taką straszyłem balladą."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 0, NULL,
"Spojrzyj, Marylo, gdzie się kończą gaje:
W prawo łóz gęsty zarostek,
W lewo się piękna dolina podaje,
Przodem rzeczułka i mostek."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 1, NULL,
"Tuż stara cerkiew, w niej puszczyk i sowy,
Obok dzwonnicy zrąb zgniły,
A za dzwonnicą chróśniak malinowy,
A w tym chróśniaku mogiły."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 2, NULL,
"Czy tam bies siedział, czy dusza zaklęta,
Że o północnej godzinie,
Nikt, jak najstarszy człowiek zapamięta,
Miejsc tych bez trwogi nie minie."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 3, NULL,
"Bo skoro północ nawlecze zasłony,
Cerkiew się z trzaskiem odmyka,
W pustej zrąbnicy dzwonią same dzwony,
W chróstach coś huczy i ksyka."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 4, NULL,
"Czasami płomyk okaże się blady,
Czasem grom trzaska po gromie,
Same się z mogił ruszają pokłady,
I larwy stają widomie."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 5, NULL,
"Raz trup po drodze bez głowy się toczy,
To znowu głowa bez ciała;
Roztwiera gębę i wytrzeszcza oczy,
W gębie i w oczach żar pała."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 6, NULL,
"Albo wilk bieży; pragniesz go odegnać,
Aż orlem skrzydłem wilk macha...
Dość »zgiń, przepadnij!« wyrzec i przeżegnać,
Wilk zniknie, wrzeszcząc: cha, cha, cha!"
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 7, NULL,
"Każdy podróżny oglądał te zgrozy,
I każdy musiał kląć drogę;
Ten złamał dyszel, ten wywrócił wozy,
Innemu zwichnął koń nogę."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 8, NULL,
"Ja, chociaż, pomnę, nieraz Andrzej stary
Zaklinał, nieraz przestrzegał:
Śmiałem się z dyabłów, nie wierzyłem w czary,
Tamtędym jeździł i biegał."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 9, NULL,
"Raz, gdy do Ruty jadę w czas noclegu,
Na moście z końmi wóz staje;
Próżno woźnica przynagla do biegu,
Hej! krzyczy, biczem zadaje..."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 10, NULL,
"Stoją, a potem skoczą z całej mocy,
Dyszel przy samej pękł szrubie;
Zostać na polu samemu i w nocy,
To lubię, rzekłem, to lubię!"
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 11, NULL,
"Ledwiem dokończył, aż straszna martwica
Wypływa z blizkich wód toni;
Białe jej szaty, jak śnieg białe lica,
Ognisty wieniec na skroni."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 12, NULL,
"Chciałem uciekać, padłem zalękniony,
Włos dębem stanął na głowie;
Krzyknę: niech będzie Chrystus pochwalony!
»Na wieki wieków« — odpowie."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 13, NULL,
"»Ktokolwiek jesteś, poczciwy człowieku,
Coś mię zachował od męki,
Dożyj ty szczęścia i późnego wieku,
I pokój tobie i dzięki."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 14, NULL,
"Widzisz przed sobą obraz grzesznej duszy,
Wkrótce się niebem pochlubię:
Boś ty czyscowej zbawił mię katuszy
Tem jednem słówkiem: To lubię."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 15, NULL,
"»Dopóki gwiazdy zejdą i dopóki
We wsi kur pierwszy zapieje,
Opowiem tobie, a ty dla nauki
Opowiedz innym me dzieje."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 16, NULL,
"»Onego czasu żyłam ja na świecie,
Marylą zwana przed laty;
Ojciec mój, pierwszy urzędnik w powiecie,
Możny, poczciwy, bogaty."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 17, NULL,
"»Za życia pragnął sprawić mi wesele,
A żem dostatnia i młoda,
Zbiegło się zewsząd zalotników wiele,
Posag wabił i uroda."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 18, NULL,
"»Mnóstwo ich marnej pochlebiało dumie,
I to mi było do smaku,
Że kiedy w licznym kłaniano się tłumie,
Tłumem gardziłam bez braku."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 19, NULL,
"»Przybył i Józio; dwudziestą miał wiosnę,
Młody, cnotliwy, nieśmiały:
Obce dla niego wyrazy miłosne,
Choć czuł miłosne zapały."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 20, NULL,
"»Lecz próżno nędzny w oczach prawie znika,
Próżno i dzień i noc płacze;
W boleściach jego dla mnie radość dzika,
Śmiech obudzały rozpacze."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 21, NULL,
"»Ja pójdę!« — mówił ze łzami — »Idź sobie!«
Poszedł i umarł z miłości...
Tu nad rzeczułką, w tym zielonym grobie,
Złożone jego są kości."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 22, NULL,
"»Odtąd mi życie stało się nielube,
Późne uczułam wyrzuty;
Lecz ani sposób wynagrodzić zgubę,
Ani czas został pokuty."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 23, NULL,
"»Raz, gdy się w północ z rodzicami bawię,
Wzmaga się hałas, szum, świsty:
Przyleciał Józio w straszliwej postawie,
Jak potępieniec ognisty."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 24, NULL,
"»Porwał, udusił gęszczą dymnych kłębów,
W czyscowe rzucił potoki,
Gdzie pośród jęku i zgrzytania zębów,
Takie słyszałam wyroki:"
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 25, NULL,
"— »Wiedziałaś, że się spodobało Panu
»Z męża ród stworzyć niewieści,
»Na osłodzenie mężom złego stanu,
»Na roskosz, nie na boleści."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 26, NULL,
"»Ty, jakbyś w piersiach miała serce z głazu,
»Ani cię jęki ubodły,
»Nikt nie uprosił słodkiego wyrazu,
»Przez łzy, cierpienia i modły."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 27, NULL,
"»Za taką srogość, długie, długie lata,
»Dręcz się w czyscowej zagubie;
»Póki mąż jaki z tamecznego świata,
»Nie powie na cię choć: lubię."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 28, NULL,
"»Prosił i Józio niegdyś o to słowo,
»Gorzkie łzy lał nieszczęśliwy:
»Prośże ty teraz nie łzą, nie namową,
»Ale przez strachy i dziwy«. —"
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 29, NULL,
"»Rzekł. Mnie natychmiast porwały złe duchy;
Odtąd już setny rok minie,
W dzień męczą, na noc zdejmują łańcuchy,
Rzucam ogniste głębinie."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 30, NULL,
"»I w cerkwi, albo na Józia mogile,
Niebu i ziemi obrzydła,
Muszę podróżnych trwożyć w nocne chwile,
Różne udając straszydła."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 31, NULL,
"»Idących w błota zawiodę lub w gaje,
Jadącym konia uskubię;
A każdy naklnie, nafuka, nałaje,
Tyś pierwszy wyrzekł: to lubię."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 32, NULL,
"»Za to ci spadnie wyroków zasłona,
Przyszłość z pod ciemnych wskażę chmur,
Ach! i ty poznasz Marylę, lecz ona...«
Wtem na nieszczęście zapiał kur."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 33, NULL,
"Skinęła tylko, widać radość z oczek,
Mieni się w parę cieniuchną,
Ginie, jak ginie bladawy obłoczek,
Kiedy zefiry nań dmuchną..."
  ),
  ((SELECT id FROM ballads WHERE key = "to-lubie"), 34, NULL,
"Patrzę — aż cały wóz stoi na łące.
Siadam, powoli strach mija;
Proszę za dusze, w czyscu bolejące,
Zmówić trzy Zdrowaś Maryja."
  ),
  ((SELECT id FROM ballads WHERE key = "rekawiczka"), 0, NULL,
"Chcąc być widzem dzikich bojów,
Już u zwierzyńca podwojów
Król zasiada.
Przy nim książęta i panowie Rada,
A gdzie wzniosły krążył ganek,
Rycerze obok kochanek."
  ),
  ((SELECT id FROM ballads WHERE key = "rekawiczka"), 1, NULL,
"Król skinął palcem, zaczęto igrzysko,
Spadły wrzeciądze; ogromne lwisko
Zwolna się toczy,
Podnosi czoło,
Milczkiem obraca oczy
Wokoło,
I ziewy rozdarł straszliwie,
I kudły zatrząsł na grzywie,
I wyciągnął cielska brzemię,
I obalił się na ziemię."
  ),
  ((SELECT id FROM ballads WHERE key = "rekawiczka"), 2, NULL,
"Król skinął znowu,
Znowu przemknie się krata,
Szybkimi skoki, chciwy połowu,
Tygrys wylata.
Spoziera z dala
I kłami błyska,
Język wywala,
Ogonem ciska
I lwa dokoła obiega.
Topiąc wzrok jaszczurczy
Wyje i burczy;
Burcząc na stronie przylega."
  ),
  ((SELECT id FROM ballads WHERE key = "rekawiczka"), 3, NULL,
"Król skinął znowu,
Znowu podwój otwarty,
I z jednego zachowu
Dwa wyskakują lamparty.
Łakoma boju, para zajadła
Już tygrysa opadła,
Już się tygrys z nimi drapie,
Już obudwu trzyma w łapie;
Wtem lew podniósł łeb do góry,
Zagrzmiał - i znowu cisze -
A dzicz z krwawymi pazury
Obiega... za mordem dysze.
Dysząc na stronie przylega."
  ),
  ((SELECT id FROM ballads WHERE key = "rekawiczka"), 4, NULL,
"Wtem leci rękawiczka z krużganków pałacu,
Z rączek nadobnej Marty,
Pada między tygrysa i między lamparty,
Na środek placu."
  ),
  ((SELECT id FROM ballads WHERE key = "rekawiczka"), 5, NULL,
"Marta z uśmiechem rzecze do Emroda:
»Kto mię tak kocha, jak po tysiąc razy
Czułymi przysiągł wyrazy,
Niechaj mi teraz rękawiczkę poda«."
  ),
  ((SELECT id FROM ballads WHERE key = "rekawiczka"), 6, NULL,
"Emrod przeskoczył zapory,
Idzie pomiędzy potwory,
Śmiało rękawiczkę bierze.
Dziwią się panie, dziwią się rycerze.
A on w zwycięskiej chwale
Wstępuje na krużganki.
Tam od radośnej witany kochanki,
Rycerz jej w oczy rękawiczkę rzucił,
»Pani, twych dzięków nie trzeba mi wcale«.
To rzekł i poszedł, i więcej nie wrócił."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 0, NULL,
"Jedzą, piją, lulki palą,
Tańce, hulanka, swawola;
Ledwie karczmy nie rozwalą,
Cha, cha! chi, chi! hejża! hola!"
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 1, NULL,
"Twardowski siadł w końcu stoła,
Podparł się w boki jak basza:
»Hulaj dusza! hulaj!« woła,
Śmieszy, tumani, przestrasza."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 2, NULL,
"Żołnierzowi, co grał zucha,
Wszystkich łaje i potrąca;
Świsnął szablą koło ucha,
Już z żołnierza masz zająca."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 3, NULL,
"Na patrona z trybunału,
Co milczkiem wypróżniał rondel,
Zadzwonił kieską pomału:
Z patrona robi się kondel."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 4, NULL,
"Szewcu w nos wyciął trzy szczutki,
Do łba przymknął trzy rureczki,
Cmoknął: cmok, i gdańskiej wódki
Wytoczył ze łba pół beczki."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 5, NULL,
"Wtem, gdy wódkę pił z kielicha,
Kielich zaświstał, zazgrzytał;
Patrzy na dno: — »Co u licha?
Po coś tu, kumie, zawitał?«"
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 6, NULL,
"Dyablik to był w wódce na dnie,
Istny Niemiec, sztuczka kusa,
Skłonił się gościom układnie,
Zdjął kapelusz i dał susa."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 7, NULL,
"Z kielicha aż na podłogę
Pada, rośnie na dwa łokcie,
Nos jak haczyk, kurzą nogę,
I krogulcze ma paznogcie."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 8, NULL,
"»A, Twardowski... witam, bracie!«
To mówiąc bieży obcesem:
»Cóż to, czyliż mię nie znacie?
Jestem Mefistofelesem."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 9, NULL,
"»Wszak ze mnąś na Łysej górze
Robił o duszę zapisy:
Cyrograf na byczej skórze
Podpisałeś ty i biésy."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 10, NULL,
"»Miały słuchać twego rymu;
Ty, jak dwa lata przebiegą,
Miałeś pojechać do Rzymu,
By cię tam porwać jak swego."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 11, NULL,
"»Już i siedem lat uciekło,
Cyrograf nadal nie służy,
Ty czarami dręcząc piekło,
Ani myślisz o podróży."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 12, NULL,
"»Ale zemsta, choć leniwa,
Nagnała cię w nasze sieci:
Ta karczma Rzym się nazywa...
Kładę areszt na waszeci«."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 13, NULL,
"»Twardowski ku drzwiom się kwapił
Na takie dictum acerbum;
Dyabeł za kontusz ułapił:
»A gdzie jest nobile verbum?«"
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 14, NULL,
"Co tu począć? kusa rada,
Przyjdzie już nałożyć głową...
Twardowski na koncept wpada
I zadaje trudność nową."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 15, NULL,
"»Patrz w kontrakt, Mefistofilu,
Tam warunki takie stoją:
Po latach tylu, a tylu,
Gdy przyjdziesz brać duszę moją,"
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 16, NULL,
"»Będę miał prawo trzy razy
Zaprządz ciebie do roboty,
A ty najtwardsze rozkazy,
Musisz spełnić co do joty."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 17, NULL,
"»Patrz, oto jest karczmy godło,
Koń malowany na płótnie;
Ja chcę mu wskoczyć na siodło,
A koń niech z kopyta utnie."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 18, NULL,
"»Skręć mi przytem biczyk z piasku,
Żebym miał czem konia chłostać
I wymuruj gmach w tym lasku,
Bym miał gdzie na popas zostać."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 19, NULL,
"»Gmach będzie z ziarnek orzecha,
Wysoki pod szczyt Krępaku,
Z bród żydowskich ma być strzecha,
Pobita nasieniem z maku."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 20, NULL,
"»Patrz, oto na miarę ćwieczek,
Cal gruby, długi trzy cale,
W każde z makowych ziarneczek
Wbij mi takie trzy bretnale."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 21, NULL,
"Mefistofil duchem skoczy,
Konia czyści, karmi, poi,
Potem bicz z piasku utoczy,
I już w gotowości stoi."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 22, NULL,
"Twardowski dosiadł biegusa,
Próbuje podskoków, zwrotów,
Stępa, galopuje, kłusa —
Patrzy, aż i gmach już gotów."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 23, NULL,
"»No! wygrałeś, panie biésie,
Lecz druga rzecz nieskończona:
Trzeba skąpać się w tej misie —
A to jest woda święcona«."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 24, NULL,
"Dyabeł kurczy się i krztusi,
Aż zimny pot na nim bije:
Lecz pan każe, sługa musi,
Skąpał się biedak po szyję."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 25, NULL,
"Wyleciał potem, jak z procy,
Otrząsł się, dbrum! parsknął raźnie:
»Teraz jużeś w naszej mocy,
Najgorętsząm odbył łaźnię«."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 26, NULL,
"»Jeszcze jedno, będzie kwita:
Zaraz pęknie moc czartowska! —
Patrzaj, oto jest kobiéta,
Moja żoneczka, Twardowska."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 27, NULL,
"»Ja na rok u Belzebuba
Przyjmę za ciebie mieszkanie;
Niech przez ten rok moja luba
Z tobą, jak z mężem zostanie."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 28, NULL,
"»Przysiąż jej miłość, szacunek,
I posłuszeństwo bez granic;
Złamiesz choć jeden warunek,
Już cała ugoda za nic«."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 29, NULL,
"Dyabeł do niego pół ucha,
Pół oka zwrócił do samki:
Niby patrzy, niby słucha —
Tymczasem już blizko klamki."
  ),
  ((SELECT id FROM ballads WHERE key = "pani-twardowska"), 30, NULL,
"Gdy mu Twardowski dokucza,
Od drzwi, od okien odpycha:
Czmychnąwszy dziurką od klucza,
Dotąd, jak czmycha, tak czmycha."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 0, "I", "»Ja umieram. — Ja nie płaczę.
I wy chciejcie ulżyć sobie;
Prędzej, później, legniem w grobie,
Nie wrócą na świat rozpacze.
»Byłem panem mnogich włości,
Sławny potęgą i zbiorem;
Zamki me stały otworem
Dla przyjaciół i dla gości,
O potęgo! o człowieku!
Wielkie zamki, wielkie imię,
Wielkie nic! Wielkość, czczy dymie!
Ja umieram w kwiecie wieku!"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 1, NULL,
"»Gdy za mądrości widziadłem
Goniąc, zbiegam kraje cudze,
Gdy wzrok nad księgami trudzę,
Skarbnice nauk posiadłem:
O nauki! o człowieku!
Wielka mądrość, wielkie imię,
Wielkie nic! Rozum, czczy dymie!
Ja umieram w kwiecie wieku!
»Strzegłem ustaw świętej wiary
W ducha i serca prostocie;
Hojnie nagradzałem cnocie,
Kościołom niosłem ofiary:
O pobożności! człowieku!
Święta wiaro, święte imię,
Święte nic! Cnoto, czczy dymie!
Ja umieram w kwiecie wieku.
»Twórco, jakże igrasz srodze!
Kiedy mi dasz wiek niedługi,
Coż, że mi dasz wierne sługi?
Czemże za wierność nagrodzę?
Dasz kochankę kochankowi:
Śmierć truje ślubów słodycze.
I tylu przyjaciół liczę!
Bądźcie zdrowi, bądźcie zdrowi!«"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 2, NULL,
"Tak na domowników ręku
Tukaj, pośród skarg i jęku,
Pożegnawszy świat na wieki,
Gasnące zamknął powieki."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 3, NULL,
"Wtem grom łamie szczyty dachu,
Zadrżały zamkowe ściany,
Jakowyś starzec nieznany,
Wlatuje na środek gmachu.
Siwy włos okrył mu skronie,
Twarz marszczkami rozorana,"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 4, NULL,
"Broda długa za kolana,
Na kosturze wsparte dłonie.
»Tukaju!« Porwał z pościeli,
I wraz za sobą iść każe;
Już wierzchne sale minęli,
Minęli wały i straże.
Idą — ciemno, deszczyk kropi:
A srebrzysta twarz miesiąca,
To grubawe mgły roztrąca,
To się znowu we mgle topi.
Idą ponad trzęskie kępy,
Mijają bagna, głębinie,
Hnilicy ciemnej ostępy,
Kołdyczewa nurty sinie,
Gdzie puszcza zarosła wkoło,
Spodem czarna, zwierzchu płowa,
Żwirami nasute czoło
Wynosi góra Żarnowa,
Tam szli. Starzec kląkł na grobie,
Rozwarł usta, okiem błysnął,
Podniósł w górę ręce obie,
Trzykroć krzyknął, trzykroć świsnął.
»Tukaju, patrz, oto ścieżka!
Za ścieżką chatka na bagnie,
W chatce mędrzec Polel mieszka:
Mędrzec mędrca wspomódz pragnie.
Znana twa nauka, cnota;
Znam, że Bóg węzły lubemi,
Przywiązawszy cię do ziemi,
Długiego nie da żywota.
Ale rzucaj przestrach płony,
Mych sposobów uznaj dzielność;
Żyj dla sług, przyjaciół, żony,
Lata, wieki, nieśmiertelność."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 5, NULL,
"Ja pierwszy ziemskiemu oku,
Śmiem do niej pokazać drogę;
Lecz podług ustaw wyroku,
Dwom tylko pokazać mogę.
Wybierz drugiego człowieka,
Człowieka doznanej wiary,
Któremubyś w każdej probie
Tak zaufał, jak sam sobie.
Trafisz — nieśmiertelność czeka!
Chybisz — śmierć i wieczne kary!«"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 6, NULL,
"»Starcze! twe zjawienia wieszcze
Ciemna zasłona powleka,
Powiedz...« — »Powiadam ci jeszcze:
Wybierz drugiego człowieka.
Radź się twej głowy i serca:
Idzie o ciało i duszę!
Wierny, albo przeniewierca,
Nieśmiertelność, lub katusze!...
Czy mógłbyś się zwierzyć słudze?«"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 7, NULL,
"Tukaj nic nie odpowiada;
Bo któż zgadnie myśli cudze?
Bo zbyt częsta w sługach zdrada.
»Może kochance, lub żonie?«
»Tak...« wtem uciął, patrzy smutnie;
»Tak« rzecze, i znowu utnie.
Myśli, sam się z sobą biedzi,
»Tak jest, kochance... tak, żonie!«
I wierzy i strach nań pada,
I wątpi, i wstydem płonie;
Myśli, sam się z sobą biedzi;
Umyślił, już w odpowiedzi,
Już... i nic nie odpowiada.
»Umrzyj więc! ty śmiałeś żądać?
Daj pokój żądaniom dzikim!"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 8, NULL,
"Ty nie masz ufności w nikim,
Wartoż dłużej świat oglądać?«
On myśli... »Nikogoż z wiela?
Sługi, żony, przyjaciela?«
On myśli... Tu, w mgnieniu oka,
Czerni się niebios sklepienie,
Słychać grzmienie, ziemi drżenie,
Kipią bagna, lasy gorą,
Niknie w płomieniach opoka,
I doliny i jezioro.
Śród gromów świstu i szczęku,
Czy to zły duch, czy moc boża,
Tukaj znalazł się śród łoża,
Na swych domowników ręku.
Głos tylko zagrzmiał zdaleka:
»Niemasz drugiego człowieka,
Któremubyś w każdej probie
Tak zaufał, jak sam sobie«."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 9, "II", "»Ja mam, ja mam przyjaciela!«
Konający Tukaj woła.
Wraz uchodzi bladość z czoła,
Iskrą zdrowia oko strzela;
Tukaj, wydarty mogile,
Wstaje, dziwią się doktory;
Wstaje, chodzi o swej sile,
Jakby nigdy nie był chory.
A wtem na poduszce z boku,
Ujrzy z wolej skóry karty,
Gdzie tajemnice wyroku
Przeklęte spisały czarty.
Tukaj z ciekawością chwyta,
Siada, podparł się, i czyta:"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 10, NULL,
"»Kiedy miesiąc na młodziku,
Idź na górę do gaiku,
Znajdziesz kamień, z pod kamienia
Białego urwij korzenia.
Kiedy będziesz blizki śmierci,
Każ ciało posiec na ćwierci,
W wodzie zgotować korzonki,
Pocięte namaścić członki:
Znowu się duch z ciałem zrośnie,
W młodocianej wstaniesz wiośnie,
I możesz skutkiem tych leków
Umierać, wstawać, wiek wieków«."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 11, NULL,
"Dalej tam były przestrogi:
Jak siekać głowę, jak nogi:
W jakiej wodzie smażyć trunek,
Po jakiej brać zioła szczypcie;
Ale w końcu w post-skrypcie,
Taki dodano warunek:"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 12, NULL,
"»Jeśli użyty ktoś drugi,
Do namaszczalnej posługi,
Zwiedzion przez nasze fortele,
Innemu pokaże ziele,
Lub w oznaczonej godzinie,
Twego ciała nie namaści;
Wtenczas skutek zioła zginie,
Wtenczas piekło czeka waści.
Jeśli na to się ośmielisz,
Dla znaku, że zaszła zgoda,
Nasz poseł Mefistofelisz,
Do wymiany traktat poda.
Ostrzegliśmy o fortelach,
Strzeż się; potem próżny kweres.
Dan w Erebie, w szabas rano;
Własną ręką podpisano:"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 13, NULL,
"Tak ma stać się: Lucyferes,
A za zgodność: Hadramelach«."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 14, NULL,
"Tukaj trochę się zagniewał,
Warunku się nie spodziewał.
Brodę na ręku podpiera,
Potarł czoło, skrzywił nosa,
Na kontrakt spojrzał z ukosa:
Tabaczki dwa razy zażył,
To na ziemię spuszcza oczy,
To po stolowaniu toczy.
Wziął pergamin, w ręku zważył;
Znowu nań zezem poziera,
Znowu czytał i odczytał,
Znowu zważył, znowu zmierzył,
Kułakiem o stół uderzył,
Westchnął, mruczał, zębem zgrzytał,
Ręce nad czoło zakłada,
Skoczył raptem i w zapędzie
Machnął ręką: »Niech tak będzie!«
Znowu umilkł, znowu siada,
Znowu myśli, znowu wstaje,
Znowu chodzi, znowu siada.
Niech go za to nikt nie łaje,
Bo z dyabłami rzecz nie lada."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 15, NULL,
"Myśli: albo wieczne życie,
Albo wiecznie dyabłu dusza.
Nic nie mówi, myśli skrycie,
Tylko trochę wargą rusza."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 16, NULL,
"Nadszedł już czas odpowiedzi.
Tukaj oddala się z tłumu,
I do pracowni rozumu
Zamknąwszy się, jeden siedzi,"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 17, NULL,
"I tam swój traktat raz jeszcze,
Nim stępel przyjęcia zyska,
W surowej uwagi kleszcze
Bierze i porządnie ściska.
Tam myśl rozmaita ścieka
W jedne podobieństwa tygle;
Tam jedną myśl niedościgle
Różnicy nożykiem sieka;
Sieka, topi, nakształt wosku,
Aż wycisnął ekstrakt wniosku.
Obejrzawszy wniosek ściśle,
Tak rzekł po długim namyśle:
»Jakieżkolwiek to fortele,
O których słyszałem z góry,
Czy ich niewiele, czy wiele,
Trojakiej będą natury.
Chcąc kogo przywieść do zdrady,
Trzeba siły, albo rady;
Albo podarunkiem skusić,
Albo strwożyć, albo zmusić.
Toż samo krótszemi słowy,
Będzie syllogizm takowy:
Trojaka do zguby droga —
Ciekawość, łakomstwo, trwoga.
Więc kto w tym trojakim względzie
Twardej nie ulegnie probie,
Takiemu już można będzie
Ufać, jak samemu sobie«."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 18, NULL,
"Tukaj, kontent z wynalazku,
Szuka atramentu, piasku,
Idzie kreślić pismo grzechu,
Ale idzie bez pośpiechu.
Już ciemno, pisać niewcześnie.
W atramencie jakieś pleśnie;"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 19, NULL,
"Dwie świece musiał zapalać,
I dwa kałamarze nalać.
Coś mu zabolało w łokciu;
Wziął pióro, na piórze włosek,
I bardzo spisany nosek:
Otrząsł, przyciął na paznogciu.
Po długim względzie, rozględzie,
Wreszcie pisze: niech tak będzie.
Chciał dołożyć i nazwisko:
Lecz nim pierwsze »T« napisał,
Myślał pół godziny blizko,
Głową i piórem kołysał,
I nic więcej nie napisał;
Tylko do pierwszej litery
Dodał małe kropki.... cztery."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 20, NULL,
"Gdy już napisano widzi,
Jeszcze patrzy, jeszcze bada;
Niechaj z tego nikt nie szydzi,
Bo z dyabłami rzecz nie lada."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 21, NULL,
"Lecz jakże się musiał zdumieć,
Gdy głoska B, w słowie będzie,
Zaczęła brzęczeć i szumieć,
I wzdymać wszystkie krawędzie.
Kręci się, beczy, podrasta,
Jak na drożdżach kawał ciasta;
Dolna litery połowa,
Wykurcza się w brzuch i żebra,
U zwierzchniej wypukła głowa,
Nakształt ogromnego cebra.
Szyjka jak u osy wązka,
Nosik orła, bródka kozła,
A z jednej go strony końska,
Z drugiej kurza łapka wiozła;"
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 22, NULL,
"Pogląda okiem wołowem,
Skrzydła nakształt młyńskich wioseł...
Był to dyabeł jednem słowem,
Był to Mefistofel poseł."
  ),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 23, NULL,
"Jeszcze Tukaj nie mógł wiedzieć,
Czy żegnać, czy prosić siedzieć,
Kiedy przyskoczył zuchwalec,
Porwał za maleńki palec,
Zasadził nożyk pod skórką
I umoczył we krwi piórko;
Piórko wścibił, ścisnął w ręku,
Ręką wodzi pomaleńku,
Gdy już u, k, a, j, minął,
Zrobiło się całkiem Tukaj.
Dyabeł świsnął, czmychnął, zginął...
Terazże z nim ładu szukaj!"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 0, NULL,
"Zbrodnia to niesłychana:
Pani zabija pana.
Zabiwszy, grzebie w gaju,
Na łączce przy ruczaju.
Grób liliją zasiewa,
Zasiewając, tak śpiewa:
»Rośnij, kwiecie, wysoko,
Jak pan leży głęboko;
Jak pan leży głęboko,
Tak ty rośnij wysoko«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 1, NULL,
"Potem cała skrwawiona,
Męża zbójczyni żona,
Bieży przez łąki, przez knieje,
I górą i dołem i górą.
Zmrok pada, wietrzyk wieje;
Ciemno, wietrzno, ponuro.
Wrona gdzieniegdzie kracze,
I puhają puhacze."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 2, NULL,
"Bieży w dół do strumyka,
Gdzie stary rośnie buk,
Do chatki pustelnika,
Stuk-stuk, stuk-stuk!"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 3, NULL,
"»Kto tam?« Spadła zapora,
Wychodzi starzec, świeci;
Pani nakształt upiora
Z krzykiem do chatki leci.
Ha! ha! zsiniałe usta,
Oczy przewraca w słup,
Drżąca, zbladła jak chusta;
»Ha! mąż, ha! trup!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 4, NULL,
"»Niewiasto, Pan Bóg z tobą!
Co ciebie tutaj niesie?
Wieczorną, słotną dobą,
Co robisz sama w lesie?«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 5, NULL,
"— »Tu za lasem, za stawem,
Błyszczą mych zamków ściany,
Mąż z królem Bolesławem
Poszedł na Kijowiany.
Lato za latem bieży,
Niemasz go z bojowiska,
Ja młoda śród młodzieży,
A droga cnoty ślizka!"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 6, NULL,
"Nie dochowałam wiary,
Ach! biada mojej głowie!
Król srogie głosi kary;
Powrócili mężowie."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 7, NULL,
"»Ha! ha! mąż się nie dowie!
Oto krew! oto nóż!
Po nim już, po nim już!
Starcze, wyznałam szczerze,
Ty głoś świętemi usty,
Jakie mówić pacierze,
Gdzie mam iść na odpusty?
Ach! pójdę aż do piekła,
Zniosę bicze, pochodnie,
Byleby moją zbrodnię
Wieczysta noc powlekła«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 8, NULL,
"— »Niewiasto — rzecze stary —
Więc ci nie żal rozboju,
Ale tylko strach kary?
Idźże sobie w pokoju,
Rzuć bojaźń, rozjaśń lica,
Wieczna twa tajemnica.
Bo takie sądy boże,
Iż co ty zrobisz skrycie,
Mąż tylko wydać może,
A mąż twój stracił życie«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 9, NULL,
"Pani z wyroku rada,
Jak wpadła, tak wypada.
Bieży nocą do domu,
Nic nie mówiąc nikomu.
Stoją dzieci przed bramą:
»Mamo — wołają — mamo!
A gdzie został nasz tato?«
»Nieboszczyk? co? wasz tato?«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 10, NULL,
"— Nie wie, co mówić na to —
»Został w lesie za dworem,
Powróci dziś wieczorem«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 11, NULL,
"Czekają wieczór dzieci;
Czekają drugi, trzeci;
Czekają tydzień cały;
Nareszcie zapomniały."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 12, NULL,
"Pani zapomnieć trudno;
Nie wygnać z myśli grzechu.
Zawsze na sercu nudno,
Nigdy na ustach uśmiechu,
Nigdy snu na źrenicy!
Bo często w nocnej porze
Coś stuka się na dworze,
Coś chodzi po świetlicy:
»Dzieci, woła, to ja to,
To ja dzieci, wasz tato«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 13, NULL,
"Noc przeszła, zasnąć trudno;
Nie wygnać z myśli grzechu.
Zawsze na sercu nudno,
Nigdy na ustach śmiechu!"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 14, NULL,
"»Idź, Hanko, przez dziedziniec;
Słyszę tętent na moście,
I kurzy się gościniec:
Czy nie jadą tu goście?
Idź na gościniec i w las,
Czy kto nie jedzie do nas?«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 15, NULL,
"— »Jadą, jadą w tę stronę,
Tuman na drodze wielki,
Rżą, rżą koniki wrone,
Ostre błyszczą szabelki,
Jadą, jadą panowie,
Nieboszczyka bratowie!« —"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 16, NULL,
"— »A witajże, czy zdrowa?
Witajże nam, bratowa.
Gdzie brat?« — »Nieboszczyk brat
Już pożegnał ten świat«.
— »Kiedy?« — »Dawno, rok minął,
Umarł.. na wojnie zginął«.
— »To kłamstwo, bądź spokojna,
Już skończyła się wojna,
Brat zdrowy i ochoczy,
Ujrzysz go na twe oczy«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 17, NULL,
"Pani ze strachu zbladła,
Zemdlała i upadła;
Oczy przewraca w słup,
»Gdzie on? gdzie mąż? gdzie trup?«
Powoli się ocuca;
Mdlała niby z radości
I pytała u gości:
»Gdzie mąż, gdzie me kochanie,
Kiedy przedemną stanie?"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 18, NULL,
"— »Powracał razem z nami,
Lecz przodem chciał pośpieszyć,
Nas przyjąć z rycerzami,
I twoje łzy pocieszyć.
Dziś, jutro, pewnie będzie,
Pewnie kędyś w obłędzie
Ubite minął szlaki.
Zaczekajmy dzień jaki,
Poślemy szukać wszędzie,
Dziś, jutro, pewnie będzie«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 19, NULL,
"Posłali wszędzie sługi,
Czekali dzień i drugi;
Gdy nic nie doczekali,
Z płaczem chcą jechać daléj."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 20, NULL,
"Zachodzi drogę pani:
»Bracia moi kochani,
Jesień zła do podróży,
Wiatry, słoty i deszcze,
Wszak czekaliście dłużéj,
Czekajcie trochę jeszcze«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 21, NULL,
"Czekają. Przyszła zima,
Brata niéma i niéma.
Czekają; i myślą sobie:
Może powróci z wiosną?
A on już leży w grobie,
A nad nim kwiatki rosną,
A rosną tak wysoko,
Jak on leży głęboko.
I wiosnę przeczekali,
I już nie jadą daléj."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 22, NULL,
"Do smaku im gospoda,
Bo gospodyni młoda;
Że chcą jechać, udają,
A tymczasem czekają,
Czekają aż do lata,
Zapominają brata."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 23, NULL,
"Do smaku im gospoda,
I gospodyni młoda;
Jak dwaj u niej gościli,
Tak ją dwaj polubili.
Obu nadzieja łechce,
Obadwaj zjęci trwogą,
Żyć bez niej żaden nie chce,
Żyć z nią obaj nie mogą.
Wreszcie na jedno zdani,
Idą razem do pani."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 24, NULL,
"— »Słuchaj, pani bratowo,
Przyjm dobrze nasze słowo:
My tu próżno siedzimy,
Brata nie zobaczymy.
Ty jeszcze jesteś młoda,
Młodości twojej szkoda,
Nie wiąż dla siebie świata,
Wybierz brata za brata«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 25, NULL,
"To rzekli i stanęli.
Gniew ich i zazdrość piecze,
Ten, to ów okiem strzeli,
Ten, to ów słówko rzecze;
Usta sine przycięli,
W ręku ściskają miecze."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 26, NULL,
"Pani ich widzi w gniewie,
Co mówić, sama nie wie.
Prosi o chwilkę czasu,
Bieży zaraz do lasu.
Bieży w dół do strumyka,
Gdzie stary rośnie buk,
Do chatki pustelnika,
Stuk-stuk, stuk-stuk!
Całą mu rzecz wykłada,
Pyta się, co za rada?"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 27, NULL,
"»Ach, jak pogodzić braci?
Chcą mojej ręki oba;
Ten i ten się podoba,
Lecz kto weźmie? kto straci?
Ja mam maleńkie dziatki;
I wioski i dostatki;
Dostatek się zmitręża,
Gdy zostałam bez męża."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 28, NULL,
"Lecz ach! nie dla mnie szczęście!
Nie dla mnie już zamęście!
Boża nademną kara,
Ściga mnie nocna mara;
Zaledwie przymknę oczy,
Traf, traf! klamka odskoczy;
Budzę się: widzę, słyszę,
Jak idzie i jak dysze,
Jak dysze i jak tupa,
Ach widzę, słyszę trupa!
Skrzyp, skrzyp, i już nad łożem
Skrwawionym sięga nożem,
I iskry z gęby sypie,
I ciągnie mię i szczypie.
Ach! dosyć, dosyć strachu,
Nie siedzieć mnie w tym gmachu,
Nie dla mnie świat i szczęście,
Nie dla mnie już zamęście!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 29, NULL,
"— »Córko — rzecze jej stary —
Niemasz zbrodni bez kary,
Lecz jeśli szczera skrucha,
Zbrodniarzów Pan Bóg słucha.
Znam ja tajnie wyroku,
Miłą ci rzecz obwieszczę:
Ja go wskrzeszę dziś jeszcze«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 30, NULL,
"— »Co, co? jak, jak? mój ojcze!
Nie czas już, ach nie czas!
To żelazo zabojcze
Na wieki dzieli nas!
Ach znam, żem warta kary,
I zniosę wszelkie kary,
Byle się pozbyć mary.
Zrzekę się mego zbioru,
I pójdę do klasztoru,"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 31, NULL,
"I pójdę w ciemny las.
Nie, nie wskrzeszaj, mój ojcze!
Nie czas już, ach nie czas!
To żelazo zabojcze
Na wieki dzieli nas!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 32, NULL,
"Starzec westchnął głęboko
I łzami zalał oko,
Oblicze skrył w zasłonie,
Drżące załamał dłonie:"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 33, NULL,
"— »Idź za mąż, póki pora,
Nie lękaj się upiora.
Martwy się nie ocuci,
Twarda wieczności brama;
I mąż twój nie powróci,
Chyba zawołasz sama«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 34, NULL,
"— »Lecz jak pogodzić braci?
Kto weźmie, a kto straci?«
— »Najlepsza będzie droga,
Zdać się na los i Boga.
Niechajże z ranną rosą
Pójdą i kwiecie zniosą.
Niech każdy weźmie kwiecie,
I wianek tobie splecie,
I niechaj doda znaki,
Żeby poznać czyj jaki,
I pójdzie w kościół boży,
I na ołtarzu złoży:
Czyj pierwszy weźmiesz wianek,
Ten mąż twój, ten kochanek«."
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 35, NULL,
"Pani, z przestrogi rada,
Już do małżeństwa skora,
Nie boi się upiora;
Bo w myśli swej układa,"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 36, NULL,
"Nigdy, w żadnej potrzebie,
Nie wołać go do siebie.
I z tych układów rada,
Jak wpadła, tak wypada.
Bieży prosto do domu,
Nic nie mówiąc nikomu.
Bieży przez łąki, przez gaje,
I bieży i staje,
I staje i myśli i słucha:
Zda się, że ją ktoś goni,
I że coś szepce do niéj,
Wokoło ciemność głucha:
»To ja, twój mąż, twój mąż!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 37, NULL,
"I staje i myśli i słucha;
Słucha, zrywa się, bieży,
Włos się na głowie jeży,
W tył obejrzeć się lęka,
Coś wciąż po krzakach stęka,
Echo powtarza wciąż:
»To ja, twój mąż, twój mąż!"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 38, NULL,
"Lecz zbliża się niedziela,
Zbliża się czas wesela.
Zaledwie słońce wschodzi,
Wybiegają dwaj młodzi.
Pani, śród dziewic grona
Do ślubu prowadzona,
Wystąpi śród kościoła
I bierze pierwszy wianek,
Obnosi go dokoła:
»Oto w wieńcu lilije,
Ach! czyjeż to są, czyje?
Kto mój mąż, kto kochanek?«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 39, NULL,
"Wybiega starszy brat,
Radość na licach płonie,
Skacze i klaszcze w dłonie:
— »Tyś moja! mój to kwiat!
Między liliji kręgi,
Uplotłem wstążek zwój:
To znak, to moje wstęgi!
To mój, to mój, to mój!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 40, NULL,
"»Kłamstwo! — drugi zawoła —
Wyjdźcie tylko z kościoła,
Miejsce widzieć możecie,
Kędy rwałem to kwiecie.
Rwałem na łączce, w gaju,
Na grobie, przy ruczaju,
Okażę grób i zdrój
To mój, to mój, to mój!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 41, NULL,
"Kłócą się źli młodzieńce,
Ten mówi, ten zaprzecza;
Dobyli z pochew miecza,
Wszczyna się srogi bój,
Szarpią do siebie wieńce:
»To mój, to mój, to mój!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 42, NULL,
"Wtem drzwi kościoła trzasły,
Wiatr zawiał, świece zgasły.
Wchodzi osoba w bieli:
Znany chód, znana zbroja...
Staje, wszyscy zadrżeli,
Staje, patrzy ukosem,
Podziemnym woła głosem:
»Mój wieniec i ty moja!
Kwiat na mym rwany grobie:
Mnie, księże, stułą wiąż;"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 43, NULL,
"Zła żono, biada tobie!
To ja, twój mąż, twój mąż!
Źli bracia! biada obu!
Zawieście krwawy bój!
To ja, twój mąż, wasz brat,
Wy moi, wieniec mój,
Dalej na tamten świat!«"
  ),
  ((SELECT id FROM ballads WHERE key = "lilije"), 44, NULL,
"Wstrzęsła się cerkwi posada,
Z zrębu wysuwa się zrąb,
Sklep trzeszczy, w głąb zapada,
Cerkiew zapada w głąb.
Ziemia ją z wierzchu kryje,
Na niej rosną lilije,
A rosną tak wysoko,
Jak pan leżał głęboko."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 0, NULL,
"Jakiż to dziadek, jak gołąb siwy,
Z siwą aż do pasa brodą?
Dwaj go chłopczyki pod rękę wiodą,
Wiodą mimo naszej niwy."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 1, NULL,
"Starzec na lirze brząka i nuci,
Chłopcy dmą w dudeczki z piórek.
Zawołam starca, niech się zawróci
I przyjdzie pod ten pagórek."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 2, NULL,
"»Zawróć się, starcze, tu na igrzysko,
Tu się po siewbie weselim;
Co nam dał Pan Bóg, tem się podzielim,
I do wsi na noc stąd blizko«."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 3, NULL,
"Posłuchał, przyszedł, skłonił się nizko
I usiadł sobie pod miedzą;
Przy nim po bokach chłopczyki siedzą,
Patrząc na wiejskie igrzysko."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 4, NULL,
"Tu brzmią piszczałki, biją bębenki,
Płoną stosy suchych drewek;
Piją staruszki, skaczą panienki,
Obchodząc święto dosiewek."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 5, NULL,
"Milczą piszczałki, głuchną bębenki,
Porzuca ogień gromadka;
Biegą staruszki, biegą panienki,
Biegą do dudarza dziadka."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 6, NULL,
"»Witaj, dudarzu, witamy radzi,
W wesołej przychodzisz dobie;
Pewnie z daleka Pan Bóg prowadzi,
Pogrzej się i spocznij sobie«."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 7, NULL,
"Wiodą, gdzie ogień, gdzie stół z murawy,
Sadzą dudarza pośrodku:
»Może pozwolisz na trochę strawy,
Albo na szklaneczkę miodku?"
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 8, NULL,
"»Widzim i lirę, widzim piszczałki:
Zagraj co nam samotrzeci;
Napełnim za to tłomok, kobiałki,
I będziem wdzięczni waszeci«."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 9, NULL,
"»No, stójcież cicho — rzekł do gromadki —
Cicho — powtarza, w dłoń klaska —
Jeżeli chcecie, zagram wam, dziatki,
A cóż wam zagrać?« — »Co łaska«."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 10, NULL,
"Wziął w ręce lirę i szklankę sporą,
Miodem pierś starą zagrzewa:
Mrugnął na chłopców, ci dudki biorą;
Brząknął, nastroił i śpiewa:"
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 11, NULL,
"»Idę ja Niemnem, jak Niemen długi,
Od wioseczki do wioseczki,
Z borku do borku, z smugów na smugi,
Śpiewając moje piosneczki."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 12, NULL,
"»Wszyscy się zbiegli, wszyscy słuchali,
Ale nikt mię nie rozumie!
Ja łzy ocieram, westchnienia tłumię,
I idę dalej a daléj."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 13, NULL,
"»Kto mię zrozumie, ten się użali,
I w białe uderzy dłonie;
Uroni łezkę, i ja uronię,
Ale już nie pójdę daléj«."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 14, NULL,
"A wtem grać przestał. Nim znowu zacznie,
Przelotem spojrzał po błoniu:
Lecz w jedną stronę spoziera bacznie;
Któż tam stoi na ustroniu?"
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 15, NULL,
"Stała pasterka i plotła wieniec,
To uplecie, to rozplecie;
A obok przy niej stoi młodzieniec,
I splecione przyjął kwiecie."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 16, NULL,
"Spokojność duszy z jej widać czoła,
Ku ziemi spuszczone oko;
Nie była smutna, ani wesoła,
Tylko coś myśli głęboko."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 17, NULL,
"Jak puszkiem chwieje trawka zielona,
Choć wiatr przestanie oddychać:
Tak się na piersiach chwieje zasłona,
Chociaż westchnienia nie słychać."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 18, NULL,
"Wtem z piersi listek zżółkły odepnie,
Listek nieznanego drzewa;
Spojrzy nań, rzuci i z cicha szepnie,
Jakby się na listek gniewa."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 19, NULL,
"Odwraca głowę, odeszła nieco,
Podniosła w niebo źrenice;
Nagle na oczach łezki zaświecą
I róż wystąpił na lice."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 20, NULL,
"A dudarz milczy, brząka powoli,
A wzrok utopił w pasterce,
Utopił w licu, lecz wzrok sokoli
Zdał się przedzierać aż w serce."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 21, NULL,
"Znowu wziął lirę i spory dzbanek,
Miodem pierś starą zagrzewa,
Skinął na chłopców; ci do multanek;
Brząknął, nastroił i śpiewa:"
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 22, NULL,
"»Komu ślubny splatasz wieniec,
Z róż, liliji i tymianka?
Ach, jak szczęśliwy młodzieniec,
Komu ślubny splatasz wieniec!"
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 23, NULL,
"»Pewnie dla twego kochanka?
Wydają łzy i rumieniec!...
Komu ślubny splatasz wieniec
Z róż, liliji i tymianka?"
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 24, NULL,
"»Jednemu oddajesz wieniec,
Z róż, liliji i tymianka;
Kocha cię drugi młodzieniec:
Ty jednemu oddasz wieniec."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 25, NULL,
"»Zostawże łzy i rumieniec,
Dla nieszczęsnego kochanka,
Gdy szczęśliwy bierze wieniec
Z róż, liliji i tymianka«."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 26, NULL,
"Na to szmer powstał; różne pogłoski
Pomiędzy ciżbą przytomną:
Tę piosnkę śpiewał ktoś z naszej wioski:
Lecz kto i kiedy — nie pomną."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 27, NULL,
"Starzec ucisza, podnosi rękę:
»Słuchajcie dzieci — zawoła —
Powiem, od kogo mam tę piosenkę,
Może on był z tego sioła."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 28, NULL,
"»Kiedym, wędrując przez kraje cudze,
Królewiec zwiedził przechodem,
Wtenczas przypłynął z Litwy na strudze
Pasterz jakiś, z tych stron rodem."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 29, NULL,
"»Smutny był bardzo, ale przyczyny
Smutku nie mówił nikomu.
Odbił się potem od swej drużyny
I nie powrócił do domu."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 30, NULL,
"Często widziałem, gdy świecą zorza,
Czyli księżyc w pełnym blasku,
Jak on po błoniach, albo u morza
Po nadbrzeżnym błądził piasku."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 31, NULL,
"»Pośród skał nieraz, podobny skale,
Na deszczu, wietrze i chłodzie,
Odludny dumał, wiatrom swe żale,
A łzy powierzając wodzie."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 32, NULL,
"»Szedłem ku niemu: spozierał smutnie,
Ale odemnie nie stronił;
Jam, nic nie mówiąc, nastroił lutnię,
Zaśpiewał, w struny zadzwonił."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 33, NULL,
"»Łzy mu się rzucą; lecz skinął czołem,
Że się to granie podoba:
Ścisnął za rękę, ja go ścisnąłem,
I zapłakaliśmy oba."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 34, NULL,
"»Poznaliśmy się lepiej nawzajem,
I byliśmy przyjaciele.
On zawsze milczał swoim zwyczajem,
I ja mówiłem niewiele."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 35, NULL,
"»Potem, gdy troską strawiony długą,
Już nie mógł rady dać sobie;
Ja towarzyszem, ja byłem sługą,
Jam go pilnował w chorobie."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 36, NULL,
"»Nędzny w mych oczach gasnął powoli,
Raz mię przywołał do łoża:
»Czuję, rzekł, blizki koniec niedoli,
Niech się spełni wola boża."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 37, NULL,
"Zgrzeszyłem tylko, że moje lata
»Tak się nadaremnie starły:
»Ale bez żalu schodzę ze świata,
»Dawno już na nim umarły."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 38, NULL,
"»Kiedy mię skał tych dzikich zakątek,
»Ukrył przed gminu obliczem,
»Odtąd już dla mnie świat ten był niczem;
»Żyłem na świecie pamiątek."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 39, NULL,
"»Ty, coś mi wiernym został do grobu,
— »Kończył, ściskając za ręce —
»Nagrodzić tobie nie mam sposobu,
»Wszakże to, co mam, poświęcę."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 40, NULL,
"»Znasz piosnkę, którąm po tyle razy
»Śpiewał, płacząc nad mym losem;
»Pomnisz zapewne wszystkie wyrazy,
»I wiesz, jakim śpiewać głosem."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 41, NULL,
"»Mam jeszcze z bladych włosów zawiązkę
I zeschły cyprysu listek:
»Naucz się piosnki, weź tę gałązkę,
»To mój na ziemi skarb wszystek."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 42, NULL,
"»Idź, może znajdziesz nad brzegiem Niemna,
»Tę, której już nie obaczę;
»Może jej piosnka będzie przyjemna,
»Może nad listkiem zapłacze."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 43, NULL,
"»Nagrodzi starca, do domu przyjmie,
»Powiedz...« Wtem oko ściemniało,
A w ustach Panny Najświętszej imię
Wpół wymówione zostało."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 44, NULL,
"»Silił się jeszcze i w samym skonie
Napróżno coś wyrzec żądał;
Wskazał ku sercu i ku tej stronie,
Na którą żyjąc poglądał«."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 45, NULL,
"Tu przerwał dudarz, i szukał okiem,
Dostając listek z papierka:
Lecz już nie była między natłokiem
Ta, której szukał — pasterka."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 46, NULL,
"Zdaleka tylko poznał sukienkę,
Bo w chustce skryła twarz boską;
Jakiś młodzieniec wiódł ją pod rękę;
Już ich nie widać za wioską."
  ),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 47, NULL,
"Przybiegła zgraja, gdzie starzec siedział:
»Co to jest?« wszyscy pytają...
On nic nie wiedział — może i wiedział,
Ale nie mówił przed zgrają."
  );

-- END INSERT CONTENTS

-- START INSERT NOTES

INSERT INTO notes (ballad_id, n_order, n_text) VALUES 
  ((SELECT id FROM ballads WHERE key = "do-przyjaciol"), 0, "(Posyłając im balladę »To lubię«)"),
  ((SELECT id FROM ballads WHERE key = "dudarz"), 0, "(Myśl z pieśni gminnej)"),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 0, "(Myśl ze śpiewu litewskiego)"),
  ((SELECT id FROM ballads WHERE key = "kurhanek-maryli"), 1, "Cudzy Człowiek, Dziewczyna, Jaś, Matka, Przyjaciółka"),
  ((SELECT id FROM ballads WHERE key = "lilije"), 0, "(Z pieśni gminnej)"),
  ((SELECT id FROM ballads WHERE key = "pierwiosnek"), 0, "(Primula veris)"),
  ((SELECT id FROM ballads WHERE key = "rybka"), 0, "(Ze śpiewu gminnego)"),
  ((SELECT id FROM ballads WHERE key = "switez"), 0, "(Do Michała Wereszczaki)"),
  ((SELECT id FROM ballads WHERE key = "tukaj-albo-proby-przyjazni"), 0, "(We czterech częściach)");

--- END INSERT NOTES

-- START INSERT MOTTOS

INSERT INTO mottos (ballad_id, m_text, author, translation) VALUES 
  (
    (SELECT id FROM ballads WHERE key = "romantycznosc"),
"Methinks I see...
— Where?...
— In my mind's eye",
    "W. Shakespeare",
"Zdaje mi się, że widzę... Gdzie?
Przed oczyma duszy mojej."
  );

--- END INSERT MOTTOS