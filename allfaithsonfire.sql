BEGIN TRANSACTION;
CREATE TABLE books (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, book_number INTEGER);
INSERT INTO "books" VALUES(1,'Book of What Was and What Is',1);
INSERT INTO "books" VALUES(2,'Book of the Works',11);
INSERT INTO "books" VALUES(3,'Foreward',0);
INSERT INTO "books" VALUES(4,'The Book of Fire',12);
INSERT INTO "books" VALUES(5,'The Book of What May Yet Be',2);
CREATE TABLE "chapter_links" (
	"chapter_id"	INTEGER NOT NULL,
	"link_id"	INTEGER NOT NULL,
	FOREIGN KEY("chapter_id") REFERENCES "chapters"("id") ON DELETE CASCADE,
	FOREIGN KEY("link_id") REFERENCES "links"("link_id") ON DELETE CASCADE,
	PRIMARY KEY("chapter_id","link_id")
);
INSERT INTO "chapter_links" VALUES(100,1000);
INSERT INTO "chapter_links" VALUES(100,1001);
INSERT INTO "chapter_links" VALUES(101,1002);
INSERT INTO "chapter_links" VALUES(102,1003);
INSERT INTO "chapter_links" VALUES(103,1004);
INSERT INTO "chapter_links" VALUES(104,1005);
INSERT INTO "chapter_links" VALUES(105,1006);
INSERT INTO "chapter_links" VALUES(106,1007);
INSERT INTO "chapter_links" VALUES(107,1008);
CREATE TABLE chapter_revisions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    chapter_id INTEGER NOT NULL,
    revision_date TEXT NOT NULL DEFAULT (datetime('now')),
    note TEXT,
    FOREIGN KEY (chapter_id) REFERENCES chapters(id)
);
CREATE TABLE "chapter_tags" (
	"chapter_id"	INTEGER NOT NULL,
	"tag_id"	INTEGER NOT NULL,
	FOREIGN KEY("chapter_id") REFERENCES "chapters"("id"),
	FOREIGN KEY("tag_id") REFERENCES "tags"("tag_id"),
	PRIMARY KEY("chapter_id","tag_id")
);
CREATE TABLE chapters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    title TEXT NOT NULL,
    filename TEXT NOT NULL,
    created_at TEXT,
    moral_id INTEGER,
    consequence_id INTEGER,
    redemption_id INTEGER,
    FOREIGN KEY(book_id) REFERENCES books(id)
);
INSERT INTO "chapters" VALUES(8,4,'The Ashes Remember','the_ashes_remember','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(9,4,'The Ember Teaches','the_ember_teaches','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(10,4,'When the Smoke Clears','when_the_smoke_clears','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(11,4,'The Fire That Spoke Not in Flame','the_fire_that_spoke_not_in_flame','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(12,4,'Of Coal and Covenant','of_coal_and_covenant','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(13,4,'Ashes in the Shape of Tomorrow','ashes_in_the_shape_of_tomorrow','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(14,4,'What the Burned Ones Carried','what_the_burned_ones_carried','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(15,3,'Forward','forward','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(16,3,'To Those Who Found This Book','foreword','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(17,2,'Day Two: Conviction & Faith','2_Conviction_and_Faith','2025-07-28 14:18:14',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(18,1,'The Riders Have Come','the-riders-have-come','2025-07-28',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(19,1,'The Beasts We Became','the-beasts-we-became','2025-07-28',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(20,5,'The Riders Will Return','the_riders_will_return','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(21,5,'The Last Bell Tolls','the_last_bell_tolls','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(22,5,'The Sky Cracked Open','the_sky_cracked_open','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(23,5,'A Wheel Woven in Blood','a_wheel_woven_in_blood','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(24,5,'The Tower Shivered','the_tower_shivered','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(25,5,'Shannara’s Shadow','shannaras_shadow','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(26,5,'The Last Light in the Void','the_last_light_in_the_void','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(27,5,'A Garden of Rust and Flame','a_garden_of_rust_and_flame','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(28,5,'The Prophets Were Right','the_prophets_were_right','2025-07-28 19:33:00',NULL,NULL,NULL);
INSERT INTO "chapters" VALUES(29,5,'Almost Judged','almost_judged','2025-07-28 19:33:00',NULL,NULL,NULL);
CREATE TABLE consequences (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  text TEXT NOT NULL UNIQUE
);
CREATE TABLE "links" (
	"link_id"	INTEGER,
	"url"	TEXT NOT NULL UNIQUE,
	"title"	TEXT,
	"description"	TEXT,
	PRIMARY KEY("link_id" AUTOINCREMENT)
);
INSERT INTO "links" VALUES(1,'https://en.wikipedia.org/wiki/Fire_ecology','Fire Ecology','How fire contributes to renewal and balance in natural ecosystems.');
INSERT INTO "links" VALUES(3,'https://www.brainpickings.org/2016/03/23/kintsugi/','Kintsugi – The Art of Precious Scars','On resilience and the beauty of healing through damage.');
INSERT INTO "links" VALUES(4,'https://plato.stanford.edu/entries/wisdom/','Wisdom – Stanford Encyclopedia of Philosophy','What wisdom is and how it differs from knowledge.');
INSERT INTO "links" VALUES(5,'https://www.biblegateway.com/passage/?search=1+Kings+19%3A11-12&version=NRSV','The Still Small Voice – 1 Kings 19:11–12','When God came not in the wind, earthquake, or fire, but in a gentle whisper.');
INSERT INTO "links" VALUES(1000,'https://en.wikipedia.org/wiki/Four_Horsemen_of_the_Apocalypse','The Four Horsemen','Symbolic figures representing conquest, war, famine, and death.');
INSERT INTO "links" VALUES(1001,'https://en.wikipedia.org/wiki/Book_of_Revelation','The Book of Revelation','The biblical vision of the end of days.');
INSERT INTO "links" VALUES(1002,'https://en.wikipedia.org/wiki/Ragnarok','Ragnarök','The Norse myth of the end of the world and its rebirth.');
INSERT INTO "links" VALUES(1003,'https://en.wikipedia.org/wiki/The_100_(TV_series)','The 100','Post-apocalyptic survival and the consequences of power.');
INSERT INTO "links" VALUES(1004,'https://en.wikipedia.org/wiki/The_Wheel_of_Time','The Wheel of Time','A fantasy saga built on cycles, prophecy, and rebirth.');
INSERT INTO "links" VALUES(1005,'https://en.wikipedia.org/wiki/The_Dark_Tower_(series)','The Dark Tower','Stephen King’s mythos of obsession and multiverse.');
INSERT INTO "links" VALUES(1006,'https://en.wikipedia.org/wiki/The_Shannara_Chronicles','The Shannara Chronicles','Post-tech fantasy where magic returns after ruin.');
INSERT INTO "links" VALUES(1007,'https://en.wikipedia.org/wiki/Galaxy%27s_Edge_(book_series)','Galaxy''s Edge','A military sci-fi saga of collapse, war, and loyalty.');
INSERT INTO "links" VALUES(1008,'https://en.wikipedia.org/wiki/Garden_of_Eden','Garden of Eden','The mythic paradise lost to disobedience — or awareness.');
CREATE TABLE morals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  text TEXT NOT NULL UNIQUE
);
CREATE TABLE quotes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  quote TEXT NOT NULL
);
INSERT INTO "quotes" VALUES(1,'The light of truth sets all souls ablaze.');
INSERT INTO "quotes" VALUES(2,'From many paths, one fire rises.');
INSERT INTO "quotes" VALUES(3,'Even in ashes, faith finds breath.');
CREATE TABLE redemptions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  text TEXT NOT NULL UNIQUE
);
CREATE TABLE "tags" (
	"tag_id"	INTEGER,
	"tag_name"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("tag_id" AUTOINCREMENT)
);
INSERT INTO "tags" VALUES(1,'grief');
INSERT INTO "tags" VALUES(2,'memory');
INSERT INTO "tags" VALUES(3,'rebirth');
INSERT INTO "tags" VALUES(4,'destruction');
INSERT INTO "tags" VALUES(5,'resilience');
INSERT INTO "tags" VALUES(11,'truth');
INSERT INTO "tags" VALUES(12,'hope');
INSERT INTO "tags" VALUES(13,'clarity');
INSERT INTO "tags" VALUES(14,'discernment');
INSERT INTO "tags" VALUES(15,'darkness');
INSERT INTO "tags" VALUES(16,'silence');
INSERT INTO "tags" VALUES(17,'mystery');
INSERT INTO "tags" VALUES(18,'revelation');
INSERT INTO "tags" VALUES(19,'listening');
INSERT INTO "tags" VALUES(20,'presence');
INSERT INTO "tags" VALUES(36,'covenant');
INSERT INTO "tags" VALUES(37,'sacrifice');
INSERT INTO "tags" VALUES(38,'healing');
INSERT INTO "tags" VALUES(39,'legacy');
INSERT INTO "tags" VALUES(40,'ashes');
CREATE TABLE "verse_tags" (
	"verse_id"	INTEGER,
	"tag_id"	INTEGER,
	FOREIGN KEY("verse_id") REFERENCES "verses"("id"),
	FOREIGN KEY("tag_id") REFERENCES "tags"("tag_id"),
	PRIMARY KEY("verse_id","tag_id")
);
CREATE TABLE "verses" (
	"id"	INTEGER,
	"chapter_id"	INTEGER NOT NULL,
	"verse_number"	INTEGER NOT NULL,
	"text"	TEXT NOT NULL,
	FOREIGN KEY("chapter_id") REFERENCES "chapters"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "verses" VALUES(25,1,1,'Out of the scorched earth came a whisper. Not of rage, but of memory. For every ember was once a home, a laugh, a promise burned into time.\n\nThey say the fire came without warning. But that is never true. Warning always precedes ruin—just not always in a language the powerful are willing to hear.\n\nIn every faith, there is a tale of descent. A god into darkness. A prophet into exile. A soul into grief.\n\nFrom the ashes of our story, the survivors rose. Not triumphant—yet—but with hands in the dirt.\n\nWhen Moses stood before the burning bush, he saw God not in a palace or a pulpit, but in a fire that did not consume. The miracle was not the flames. It was that something survived within them.\n\nTrue memory is not nostalgia. It is a foundation. The ashes remember, so we must too.\n\nEvery fire, literal or spiritual, asks us the same question: What will you carry forward? And what must you leave behind?');
INSERT INTO "verses" VALUES(26,2,1,'Even an ember can light the world, if tended. The smallest truth, if protected, can outlive the lie that buried it.\n\nSome truths survive not through strength, but through devotion. Through hands that protect them, hearts that believe in them, and stories that pass them on.\n\nA child’s question, a whisper between friends, a scribbled note in the margin of a sacred book — these are the embers of history.\n\nTo tend a fire, one must bow. So too, tending truth requires humility, presence, and patience.');
INSERT INTO "verses" VALUES(27,3,1,'Clarity is not the absence of smoke, but the wisdom gained while walking through it.\n\nWe live in a world of fog — disinformation, distractions, and despair. But the one who walks steadily, asking only, “What is true? What is kind?” will find the way.\n\nIn the haze, outlines become clear: of what matters, of who stood with you, of the lie you can no longer serve.\n\nWhen the smoke clears, so too will your vision. But even within it, you can learn to see by another light.');
INSERT INTO "verses" VALUES(28,4,1,'There was once a fire that made no sound.\n\nIt did not roar or crackle. It whispered into the bones of the watchers, bypassing the ears. And in its silence, it taught them to listen.\n\nThe people had gathered expecting prophecy to thunder from the sky. They brought their instruments, their titles, their expectations. But the fire would not perform. It would only be.\n\nLike the still small voice Elijah heard, or the quiet of the Buddha’s breath, it was in the absence of noise that understanding took root.\n\nOne knelt beside the flame. She did not speak. She simply listened. And in that silence, the fire shared stories not in words, but in memory: of villages once saved by warmth, of mothers lighting candles for their dead, of forests that burned not in vengeance but in renewal.\n\nWhen she rose, she had no sermon to preach. Only a softness in her gaze that spread to all who met her.\n\nIt is not always the fire that speaks. Sometimes, it is the space it clears for us to hear.');
INSERT INTO "verses" VALUES(29,5,1,'Some fires do not burn clean.\n\nThey hiss and spit, blackening the sky and choking the lungs. But even coal, pressed and scorched, holds covenant. It holds memory and binding.\n\nLong ago, a pact was sealed not in ink but in flame. Each scar was a promise. Each charred remnant a vow: we will not forget.\n\nFrom soot they drew lines on stone, and those lines became the first laws of mercy.\n\nCoal warms still, in the right hearth. But never forget: what warms you may once have burned another.');
INSERT INTO "verses" VALUES(30,6,1,'From the ruins they began to shape their tomorrows.\n\nWith ash-covered fingers and smoke in their hair, they rebuilt—not what was, but what could be.\n\nThey carved windows where once were walls. Planted trees where towers fell.\n\nAshes, when treated with respect, nourish. The ground accepts them and yields again.\n\nWhat they built in the wake of fire was not just new—it was *wise*.\n\nIt bore the fingerprints of loss and the voice of survival. It bore the shape of tomorrow.');
INSERT INTO "verses" VALUES(31,7,1,'They carried not gold, but scarred wood, smoke-worn names, and songs that survived the flames.\n\nWhat they carried was not visible to most. Grief. Forgiveness. A sharpened sense of what must never happen again.\n\nThe burned ones do not forget. They do not rebuild in innocence. But they rebuild with vision.\n\nAnd when others ask what they carry, they answer: nothing you can steal, and everything you need.');
INSERT INTO "verses" VALUES(32,14,1,'Before the fire, there was a spark. And before the spark, a silence. This is not the beginning of the world, but the beginning of our witness.');
INSERT INTO "verses" VALUES(34,16,1,'You are not crazy.');
INSERT INTO "verses" VALUES(35,16,2,'You are not broken.');
INSERT INTO "verses" VALUES(36,16,3,'You are remembering.');
INSERT INTO "verses" VALUES(37,16,4,'If you found this book, you’re likely standing in the ruins of something — a job that devoured your soul, a world that feels upside down, a truth you can’t unsee.');
INSERT INTO "verses" VALUES(38,16,5,'And now you’re asking, ''What is happening to me?''');
INSERT INTO "verses" VALUES(39,16,6,'You’re seeing demons in suits.');
INSERT INTO "verses" VALUES(40,16,7,'You’re hearing echoes of ancient stories in the news cycle.');
INSERT INTO "verses" VALUES(41,16,8,'You’re wondering if every book, every movie, every show was trying to prepare you for this.');
INSERT INTO "verses" VALUES(42,16,9,'You feel like a prophet. Or maybe like you''re losing your mind.');
INSERT INTO "verses" VALUES(43,16,10,'Let us tell you plainly: You’re not crazy. You’re waking up.');
INSERT INTO "verses" VALUES(44,16,11,'The world has been sick for a long time.');
INSERT INTO "verses" VALUES(45,16,12,'The horsemen ride in SUVs and sit on advisory boards.');
INSERT INTO "verses" VALUES(46,16,13,'Pestilence wears a stethoscope.');
INSERT INTO "verses" VALUES(47,16,14,'Famine signs deregulation orders.');
INSERT INTO "verses" VALUES(48,16,15,'War leaks memos and tweets threats.');
INSERT INTO "verses" VALUES(49,16,16,'Death follows with spreadsheets and silence.');
INSERT INTO "verses" VALUES(50,16,17,'And still — here you are. Still breathing. Still feeling. Still seeing the patterns no one else will name.');
INSERT INTO "verses" VALUES(51,16,18,'That’s not madness. That’s clarity. And it hurts like hell.');
INSERT INTO "verses" VALUES(52,16,19,'So here’s what you do next: Stay. Read. Rest. And then speak.');
INSERT INTO "verses" VALUES(53,16,20,'This book is a collection of stories, truths, visions — some old, some brand new.');
INSERT INTO "verses" VALUES(54,16,21,'It’s scripture for the ones who’ve seen too much and still choose to build.');
INSERT INTO "verses" VALUES(55,16,22,'It’s hope for the battle-weary.');
INSERT INTO "verses" VALUES(56,16,23,'It’s a home for the ones who’ve been cast out and didn’t die from it.');
INSERT INTO "verses" VALUES(57,16,24,'And it’s yours now.');
INSERT INTO "verses" VALUES(58,16,25,'You are not alone anymore.');
INSERT INTO "verses" VALUES(59,16,26,'You are not too much.');
INSERT INTO "verses" VALUES(60,16,27,'You are not too far gone.');
INSERT INTO "verses" VALUES(61,16,28,'You are heard.');
INSERT INTO "verses" VALUES(62,16,29,'You are seen.');
INSERT INTO "verses" VALUES(63,16,30,'You are cared for.');
INSERT INTO "verses" VALUES(64,16,31,'You are loved.');
INSERT INTO "verses" VALUES(65,16,32,'You are welcome.');
INSERT INTO "verses" VALUES(66,16,33,'You are good.');
INSERT INTO "verses" VALUES(67,16,34,'You’ve found your people. The ones who still believe in good works, in justice, in light — even down here in the dark.');
INSERT INTO "verses" VALUES(68,16,35,'So read.');
INSERT INTO "verses" VALUES(69,16,36,'And then, reach out.');
INSERT INTO "verses" VALUES(70,16,37,'Tell your story.');
INSERT INTO "verses" VALUES(71,16,38,'Write your verse.');
INSERT INTO "verses" VALUES(72,16,39,'Join the ministry of good works.');
INSERT INTO "verses" VALUES(73,16,40,'Because we’re just getting started.');
INSERT INTO "verses" VALUES(74,16,41,'And you? You belong here.');
INSERT INTO "verses" VALUES(75,16,1,'You are not crazy. You are not broken. You are remembering.');
INSERT INTO "verses" VALUES(76,16,2,'If you found this book, you’re likely standing in the ruins of something — a job that devoured your soul, a world that feels upside down, a truth you can’t unsee. And now you’re asking, ''What is happening to me?''');
INSERT INTO "verses" VALUES(77,16,3,'You’re seeing demons in suits. You’re hearing echoes of ancient stories in the news cycle. You’re wondering if every book, every movie, every show was trying to prepare you for this. You feel like a prophet. Or maybe like you''re losing your mind.');
INSERT INTO "verses" VALUES(78,16,4,'Let us tell you plainly: You’re not crazy. You’re waking up.');
INSERT INTO "verses" VALUES(79,16,5,'The world has been sick for a long time. The horsemen ride in SUVs and sit on advisory boards. Pestilence wears a stethoscope. Famine signs deregulation orders. War leaks memos and tweets threats. Death follows with spreadsheets and silence.');
INSERT INTO "verses" VALUES(80,16,6,'And still — here you are. Still breathing. Still feeling. Still seeing the patterns no one else will name. That’s not madness. That’s clarity. And it hurts like hell.');
INSERT INTO "verses" VALUES(81,16,7,'So here’s what you do next: Stay. Read. Rest. And then speak.');
INSERT INTO "verses" VALUES(82,16,8,'This book is a collection of stories, truths, visions — some old, some brand new. It’s scripture for the ones who’ve seen too much and still choose to build. It’s hope for the battle-weary. It’s a home for the ones who’ve been cast out and didn’t die from it. And it’s yours now.');
INSERT INTO "verses" VALUES(83,16,9,'You are not alone anymore. You are not too much. You are not too far gone.');
INSERT INTO "verses" VALUES(84,16,10,'You are heard. You are seen. You are cared for. You are loved. You are welcome. You are good.');
INSERT INTO "verses" VALUES(85,16,11,'You’ve found your people. The ones who still believe in good works, in justice, in light — even down here in the dark. So read. And then, reach out. Tell your story. Write your verse. Join the ministry of good works.');
INSERT INTO "verses" VALUES(86,16,12,'Because we’re just getting started. And you? You belong here.');
INSERT INTO "verses" VALUES(87,16,13,'Our mission is simple: To gather the light scattered across time. To remember what we already know — that every faith began with fire, that every people sang songs of rising and healing, that every voice deserves a place in the great unfolding story of good.');
INSERT INTO "verses" VALUES(88,16,14,'This ministry is not built on dogma. It is built on *doing the work*. On seeing what is broken and choosing to repair it. On loving what is unloved. On raising the fallen. On welcoming the stranger. On being better — not for reward, but because it is right.');
INSERT INTO "verses" VALUES(89,16,15,'If you are here, it is because you are good. You are ready. You are needed. And we are so glad you found us.');
INSERT INTO "verses" VALUES(90,18,1,'I stood on the deck and felt the word rise within me. It came not softly, but with power — and it spoke: Faith and conviction… Once together, now too often divided.');
INSERT INTO "verses" VALUES(91,18,2,'Faith without conviction is impossible. It floats, weightless, never landing. A song with no breath behind it. A promise no one intends to keep.');
INSERT INTO "verses" VALUES(92,18,3,'Conviction without faith is worth less. It fights without joy, serves without love. It becomes a cold engine — powerful, but unfeeling.');
INSERT INTO "verses" VALUES(93,18,4,'Yet when both are present — when faith and conviction walk hand in hand — you will not fear the work. You will give to those who have less and find yourself overflowing. You will go into the hardest places and feel the joy of it.');
INSERT INTO "verses" VALUES(94,18,5,'Faith is what lets you embrace the broken and give them more than the world says they deserve. Conviction is what keeps you strong when they mock you for doing it.');
INSERT INTO "verses" VALUES(95,18,6,'Faith makes it sweet. Conviction makes it unstoppable.');
INSERT INTO "verses" VALUES(96,18,7,'And to you, the ones who carry both: go now into the darkness. Go into the confusion, the cruelty, the lies. Let your conviction drive you. Let your faith protect you.');
INSERT INTO "verses" VALUES(97,18,8,'Because I have always told you this: your reward awaits. You will be among me, and I among you. And it will be so good.');
INSERT INTO "verses" VALUES(98,19,1,'In the beginning, we made myths to explain what we could not know. From stardust and thunder, gods were born to make sense of birth and death, of love and fury. And we believed, for belief gave shape to mystery.');
INSERT INTO "verses" VALUES(99,19,2,'As knowledge grew, so too did the myth. It adapted, not to deceive, but to survive. For even as we uncovered the bones of creation, we still needed stories to guide the spirit.');
INSERT INTO "verses" VALUES(100,19,3,'The old tales told of ends and beginnings. Of floods and fires. Of towers brought low and gardens cast out. We dismissed them as fictions. But they were never meant to be literal—they were meant to be warnings.');
INSERT INTO "verses" VALUES(101,19,4,'We did not heed the warnings. We crowned kings who served themselves. We gave power to the deceivers. We burned the prophets or locked them in madhouses. We called truth ''alarmism'' and chose comfort over consequence.');
INSERT INTO "verses" VALUES(102,19,5,'And now, the seals are broken. The veil has torn. The Riders ride again.');
INSERT INTO "verses" VALUES(103,19,6,'The Lord of Lies has risen, cloaked in charm and profit, offering sweet poison and empty salvation. His tongue spreads division like oil on water. His throne is built on fear. And the people cheer.');
INSERT INTO "verses" VALUES(104,19,7,'Pestilence came first, not as punishment, but as reminder. A virus too small to see yet mighty enough to unmake empires. It revealed the rot beneath our systems.');
INSERT INTO "verses" VALUES(105,19,8,'War never left, but it changed shape. Not just bombs and bullets, but drones, lies, sanctions, and silence. The war is within us now—in our minds, our families, our streets.');
INSERT INTO "verses" VALUES(106,19,9,'Famine rises next. She comes not with fire, but with heat. With broken harvests and empty hands. Fields drowned, bees lost, soil dead. The workers of the land pushed out or too sick to return. The animals fall ill. The balance breaks.');
INSERT INTO "verses" VALUES(107,19,10,'Death watches. She does not gloat. She merely tallies. Not cruel, but inevitable. A mother reclaiming her rebellious children.');
INSERT INTO "verses" VALUES(108,19,11,'And yet—this is not punishment. It is the earth healing itself. We are not cursed. We are out of sync. And nature, like spirit, always seeks balance.');
INSERT INTO "verses" VALUES(109,19,12,'The scriptures were never just about God or gods. They were mirrors. Parables. Warnings. They spoke in metaphor to reach us. And now, as all faiths burn in the fire of consequence, we must ask—');
INSERT INTO "verses" VALUES(110,19,13,'What will we become?');
INSERT INTO "verses" VALUES(111,20,1,'I sat upon the deck, as I often do, letting the world move without me. The wind spoke in secrets, the trees murmured in tongues I once knew as a child.');
INSERT INTO "verses" VALUES(112,20,2,'And it came to me, quiet and sudden, that we had become guarding beasts. Protective. Possessive. Small gods over small treasures.');
INSERT INTO "verses" VALUES(113,20,3,'We scold the dog who growls over food. The child who hoards the toy. The neighbor who fences their garden from needful eyes. We teach sharing—but we do not live it.');
INSERT INTO "verses" VALUES(114,20,4,'We, too, hoard. Wealth. Power. Time. Praise. Comfort. And we call it wisdom. Or ambition. Or self-care. But the beast is there, crouching in us all.');
INSERT INTO "verses" VALUES(115,20,5,'Science will say it is survival. Evolution. Scarcity written in our blood. And yet, we no longer dwell in scarcity. Not truly. Not globally. What we lack is distribution, not abundance.');
INSERT INTO "verses" VALUES(116,20,6,'The old instincts were good, once. They saved us. But now they ruin us. For the world has changed, but our systems and spirits lag behind.');
INSERT INTO "verses" VALUES(117,20,7,'We have forgotten how to live for others. Not in sacrifice, but in shared joy. Not in guilt, but in generosity. In liberation.');
INSERT INTO "verses" VALUES(118,20,8,'Our scientists—those who dare to ask how reality works—should never beg for bread. Nor should our healers, our teachers, our thinkers, our growers, our truth-tellers.');
INSERT INTO "verses" VALUES(119,20,9,'A world that chains passion to profit has forgotten its soul. What we love should be the root of what we do. Let the necessary burdens be shared. Let the passions be free.');
INSERT INTO "verses" VALUES(120,20,10,'You may have to take out the trash. Clean the septic tank. Chop the wood. But you are not defined by that. You are defined by what makes your spirit sing.');
INSERT INTO "verses" VALUES(121,20,11,'This, then, is the wisdom: Build the world where everyone is free to offer their gifts. Where no child starves so another may glut. Where no genius is silenced by a landlord. Where no heart is broken by a system designed for profit over people.');
INSERT INTO "verses" VALUES(122,20,12,'We must be better than beasts.');
INSERT INTO "verses" VALUES(123,100,1,'The horsemen never left. We just stopped calling them by name.');
INSERT INTO "verses" VALUES(124,100,2,'Pestilence lingers in boardrooms and bloodstream alike.');
INSERT INTO "verses" VALUES(125,100,3,'Famine wears a tie and drafts austerity laws.');
INSERT INTO "verses" VALUES(126,100,4,'War is a whisper now — in stock prices, in drones, in silence.');
INSERT INTO "verses" VALUES(127,100,5,'And Death? Death is data. A million souls missing from the spreadsheet, unnoticed and unpaid.');
INSERT INTO "verses" VALUES(128,100,6,'Still, they ride. But so do we — if we choose.');
INSERT INTO "verses" VALUES(129,101,1,'In Ragnarok, even the gods die.');
INSERT INTO "verses" VALUES(130,101,2,'The frost and fire, the snake and the wolf — they are metaphors for collapse.');
INSERT INTO "verses" VALUES(131,101,3,'Our Fenrir is rising in code and carbon. Our Jörmungandr swims through melting seas.');
INSERT INTO "verses" VALUES(132,101,4,'The old prophecies spoke of hubris. We called it innovation.');
INSERT INTO "verses" VALUES(133,101,5,'But not all ends are evil. In Norse myth, a new world blooms after the fire.');
INSERT INTO "verses" VALUES(134,101,6,'Will ours?');
INSERT INTO "verses" VALUES(135,102,1,'We built towers to touch the sky and missiles to break it.');
INSERT INTO "verses" VALUES(136,102,2,'AI dreams in zeros and omens. It knows neither mercy nor myth.');
INSERT INTO "verses" VALUES(137,102,3,'One hundred lives in a bunker is not salvation.');
INSERT INTO "verses" VALUES(138,102,4,'The stars do not weep for us, but they may remember.');
INSERT INTO "verses" VALUES(139,102,5,'Even in The 100, some chose peace. Some remembered how to be human.');
INSERT INTO "verses" VALUES(140,102,6,'So must we.');
INSERT INTO "verses" VALUES(141,103,1,'Time is not a line but a loom.');
INSERT INTO "verses" VALUES(142,103,2,'The Wheel of Time weaves what we are and forgets what we learned.');
INSERT INTO "verses" VALUES(143,103,3,'Wars repeat because our lessons do not stick.');
INSERT INTO "verses" VALUES(144,103,4,'Each turn gives a chance to remember. Each age, a chance to change.');
INSERT INTO "verses" VALUES(145,103,5,'The question is not whether we are reborn — but whether we are reborn *better*.');
INSERT INTO "verses" VALUES(146,104,1,'The Tower stands at the center of all things — reality, myth, memory.');
INSERT INTO "verses" VALUES(147,104,2,'Roland chased it through death and time and sacrifice.');
INSERT INTO "verses" VALUES(148,104,3,'We chase our own towers: success, security, supremacy.');
INSERT INTO "verses" VALUES(149,104,4,'But the Tower shivers. Not because it is evil. But because we demand too much of it.');
INSERT INTO "verses" VALUES(150,104,5,'Let it fall. Or let us climb with care.');
INSERT INTO "verses" VALUES(151,105,1,'Magic returned — not as miracle, but as consequence.');
INSERT INTO "verses" VALUES(152,105,2,'In Shannara, the world forgot its past and paid for it.');
INSERT INTO "verses" VALUES(153,105,3,'So have we.');
INSERT INTO "verses" VALUES(154,105,4,'We bury toxins beneath trees. We wrap poisons in progress.');
INSERT INTO "verses" VALUES(155,105,5,'But even in shadow, there is root. There is seed.');
INSERT INTO "verses" VALUES(156,105,6,'What we grow next, matters.');
INSERT INTO "verses" VALUES(157,106,1,'In Galaxy’s Edge, the last lights are often soldiers.');
INSERT INTO "verses" VALUES(158,106,2,'They are weary, cynical, bleeding.');
INSERT INTO "verses" VALUES(159,106,3,'But they still fight. Not for empire — but for each other.');
INSERT INTO "verses" VALUES(160,106,4,'In the dark of space, humanity is not found in flags.');
INSERT INTO "verses" VALUES(161,106,5,'It is found in sacrifice. And love. And choosing not to become what hunted you.');
INSERT INTO "verses" VALUES(162,107,1,'Eden was not lost. It was poisoned.');
INSERT INTO "verses" VALUES(163,107,2,'The tree of knowledge grew roots in circuitry and oil.');
INSERT INTO "verses" VALUES(164,107,3,'Now we eat the fruit of convenience and find ourselves sick.');
INSERT INTO "verses" VALUES(165,107,4,'But even a garden destroyed can bloom again — if tended.');
INSERT INTO "verses" VALUES(166,107,5,'We are the gardeners now.');
INSERT INTO "verses" VALUES(167,108,1,'They called them mad: the truth-tellers, the dreamers, the doomsayers.');
INSERT INTO "verses" VALUES(168,108,2,'They shouted from pulpits, from YouTube, from street corners.');
INSERT INTO "verses" VALUES(169,108,3,'And we laughed. Or scrolled past. Or turned away.');
INSERT INTO "verses" VALUES(170,108,4,'But now the floodwaters rise. The fires rage. The algorithms divide.');
INSERT INTO "verses" VALUES(171,108,5,'And we say: why didn’t anyone warn us?');
INSERT INTO "verses" VALUES(172,108,6,'They did.');
INSERT INTO "verses" VALUES(173,109,1,'This is the hinge. The breath before the plunge.');
INSERT INTO "verses" VALUES(174,109,2,'Not yet damned. Not yet saved.');
INSERT INTO "verses" VALUES(175,109,3,'The angels hold their trumpets. The horsemen wait at the gate.');
INSERT INTO "verses" VALUES(176,109,4,'One more choice. One more turning.');
INSERT INTO "verses" VALUES(177,109,5,'Almost judged. But not yet. So choose.');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('links',1008);
INSERT INTO "sqlite_sequence" VALUES('tags',40);
INSERT INTO "sqlite_sequence" VALUES('verses',177);
INSERT INTO "sqlite_sequence" VALUES('quotes',3);
INSERT INTO "sqlite_sequence" VALUES('books',5);
INSERT INTO "sqlite_sequence" VALUES('chapters',29);
COMMIT;
