/* Proses memori */
:- dynamic(at/2).
:- dynamic(i_am_at/1).
:- dynamic(player/1).
:- dynamic(duit/1).
:- dynamic(reputasi/1).
:- dynamic(at/2).
:- dynamic(quitgame/1).
:- dynamic(answered/1).
:- dynamic(notanswered/1).
:- dynamic(bangun/1).
:- dynamic(sidequest/2).
:- dynamic(completed/1).
:- dynamic(active/1).
:- dynamic(saldo_habis/0).

/* current state */
	i_am_at(kos).
	quitgame(false).
	duit(5000).
	reputasi(0).
	notanswered(depositbox).
	notanswered(sopir).
	notanswered(tukangkebun).
	
/* Deklarasi tidur */
	bangun(mama_eka).
	
/* connection of places */
	path(bank, e, minimarket).
	path(bank, s, aceh).
	path(minimarket, s, banda).
	path(minimarket, w, bank).
	path(loteng, e, gudang).
	path(loteng, d, dapur).
	path(gudang, w, loteng).
	path(aceh, n, bank).
	path(aceh, e, banda).
	path(aceh, s, kos).
	path(banda, n, minimarket).
	path(banda, e, restaurant).
	path(banda, s, lombok) :-
		at(motor,in_hand),
		gambar(game_over), nl, nl,
		write('Oh tidak! Aku menjadi korban serangan begal!'),nl,
		gagal.
	path(banda, s, lombok).	
	path(banda, w, aceh).
	path(restaurant, s, gerbang) :- at(motor, in_hand).
	path(restaurant, s, gerbang) :- at(motor, gerbang).
	path(restaurant, s, gerbang) :-
		write('Supir: Siapa kamu? Teman-teman Eka tidak ada yang berjalan kaki.'),nl,fail,!.
	path(restaurant, w, banda).
	path(kos, n, aceh).
	path(kos, e, lombok) :-
		at(motor,in_hand),
		gambar(game_over), nl, nl,
		write('Oh tidak! Aku menjadi korban serangan begal!'),nl,
		gagal.
	path(kos, e, lombok).	
	path(lombok, n, banda).
	path(lombok, e, gerbang) :- at(motor, in_hand).
	path(lombok, e, gerbang) :- at(motor, gerbang).
	path(lombok, e, gerbang):-
		write('Supir: Siapa kamu? Teman-teman Eka tidak ada yang berjalan kaki.'),nl,fail,!.
	path(lombok, w, kos).
	path(gerbang, n, restaurant).
	path(gerbang, e, dapur) :- \+at(motor,in_hand).
	path(gerbang, e, dapur) :-
		write('Supir : Motornya diparkir saja disini,dek.'),nl,fail,!.
	
	path(gerbang, s, kebun) :- 	\+at(motor,in_hand).
	path(gerbang, s, kebun) :- 	
		write('Supir : Motornya diparkir saja disini,dek.'),nl,fail,!.
	
	path(gerbang, w, lombok) :- 
		at(motor,in_hand),
		gambar(game_over), nl, nl,
		write('Oh tidak! Aku menjadi korban serangan begal!'),nl,
		gagal.
	path(gerbang, w, lombok):-
		at(motor,in_hand),
		gambar(game_over), nl, nl,
		write('Oh tidak! Aku menjadi korban serangan begal!'),nl,
		gagal.
	path(gerbang, w, lombok).
	path(dapur, u, loteng).
	path(dapur, e, kamar_ortu):-
		\+bangun(mama_eka).
	path(dapur, e, kamar_ortu):-
		write('Mama Eka: Apa yang akan kamu lakukan? Keluar dari situ!'), nl,fail,!.
	path(dapur, s, toilet).
	path(dapur, w, gerbang).
	path(kamar_ortu, s, kamar_eka).
	path(kamar_ortu, w, dapur).
	path(kebun, n, gerbang).
	path(kebun, e, toilet).
	path(kebun, s, kolam).
	path(toilet, n, dapur).
	path(toilet, e, kamar_eka).
	path(toilet, w, kebun).
	path(kamar_eka, n, kamar_ortu):-
		\+bangun(mama_eka).
	path(kamar_eka, n, kamar_ortu):-
		write('Mama Eka: Apa yang kamu lakukan? Keluar dari situ!'), nl,fail, !.
	path(kolam, n, kebun).
	path(kamar_eka, d, basement).
	path(basement, u, kamar_eka).
	path(kamar_eka, w, toilet).

/* location of objects */
	at(atm, bank).
    at(teller, bank).
    at(depositbox, bank).
    at(sabun, minimarket).
    at(obat_tidur, minimarket).
	at(bola_tenis, minimarket).
	at(raket, minimarket).
    at(kasir, minimarket).
    at(kursi,loteng).
    at(meja,loteng).
    at(lemari_bekas,gudang).
    at(laci_bekas,gudang).
    at(pengemis, aceh).
    at(tetangga, banda).
    at(makanan, restaurant).
    at(boss, restaurant).
    at(kunci_motor, kos).
    at(motor, kos).
    at(laptop, kos).
    at(gengmotor, lombok).
    at(sopir, gerbang).
    at(mobil, gerbang).
    at(anjing, gerbang).
    at(oma_eka, dapur).
    at(kompor, dapur).
    at(kulkas, dapur).
    at(mama_eka, dapur).
    at(penerjemah, kamar_ortu).
    at(tukangkebun, kebun).
    at(bunga, kebun).
    at(kloset, toilet).
    at(air, toilet).
    at(diary, kamar_eka).
    at(tempat_tidur, kamar_eka).
    at(lemari, kamar_eka).
    at(ikan, kolam).
    at(makanan_ikan, kolam).
    at(kunci_diary, basement).
    at(pulsa, minimarket).
    at(baju, minimarket).
    at(kosmetik, minimarket).
    at(rokok, minimarket).
    at(makanan_ringan, minimarket).
    at(sikat_gigi, minimarket).
    at(sandal, minimarket).
	at(sepatu_hak, minimarket).

/* NPCs */
	npc(ikan).
	npc(teller).
	npc(tukangkebun).
	npc(boss).
	npc(mama_eka).
	npc(oma_eka).
	npc(tetangga).
	npc(pengemis).
	npc(kasir).
	npc(gengmotor).
	npc(anjing).
	npc(sopir).
	
/* Sidequest */
	completesidequest(Z,A,B,C) :-
		assertz(completed(A)),
		retract(reputasi(H)),
		I is H+B,
		assertz(reputasi(I)),
		retract(sidequest(Z,D)),
		E is D-1,
		assertz(sidequest(Z,E)),
		duit(F),
		retract(duit(F)),
		G is F+C,
		assertz(duit(G)),
		retract(active(A)).
		
/* Objects */		
	object(kunci_motor).
	object(motor).
	object(laptop).
	object(sabun).
	object(obat_tidur).
	object(makanan).
	object(diary).
	object(kunci_diary).
	object(depositbox).
	object(kloset).
	object(air).
	object(lemari).
	object(atm).
	object(mobil).
	object(bunga).
	object(makanan_ikan).
	object(tempat_tidur).
	object(kompor).
	object(kulkas).
	object(penerjemah).		
	object(bola_tenis).
	object(raket).
	object(lemari_bekas).
	object(laci_bekas).
	object(meja).
	object(kursi).
	object(pulsa).
	object(baju).
	object(kosmetik).
	object(rokok).
	object(makanan_ringan).
	object(sikat_gigi).
	object(sandal).
	object(sepatu_hak).
	object(penyiram_tanaman).
	object(penyiram_tanaman_air).
	object(bahan_makanan).
		
	ringan(kunci_motor).
	ringan(sabun).
	ringan(obat_tidur).
	ringan(raket).
	ringan(bola_tenis).
	ringan(makanan).
	ringan(kunci_diary).
	ringan(bunga).
	ringan(makanan_ikan).
	ringan(penerjemah).
	ringan(air).
	ringan(pulsa).
	ringan(baju).
	ringan(kosmetik).
	ringan(rokok).
	ringan(makanan_ringan).
	ringan(sikat_gigi).
	ringan(sandal).
	ringan(sepatu_hak).
	
/* Harga barang */
	price(sabun,2000).
	price(obat_tidur,5000).
	price(raket,100000).
	price(bola_tenis,50000).
	price(makanan,10000).
	price(pulsa,5000).
	price(baju,20000).
	price(kosmetik,100000).
	price(rokok,10000).
	price(makanan_ringan,3000).
	price(sikat_gigi,4000).
	price(sandal,8000).
	price(sepatu_hak,90000).

/********************************/
/* Use : hanya untuk objek aktif*/
	use(kompor) :-
		i_am_at(dapur),
		sidequest(mama_eka,1),
		at(bahan_makanan,in_hand),
		completesidequest(mama_eka,bantu_mama,3,5000),
		retract(at(bahan_makanan,in_hand)),
		write('Mama Eka : Kamu benar-benar calon mantu yang baik ya!'), nl,
		write('Mama Eka : Sebagai rasa terima kasih, nih tante kasih 5000'),nl,nl,
		write('Sidequest Bantu Mama selesai!'),nl,
		!.
		
	use(kompor) :-
		i_am_at(dapur),
		sidequest(mama_eka,1),
		write('Waduh.. bahan makanannya belum ada.'), nl,!.
		
	use(kompor) :-
		i_am_at(dapur),
		write('Aku tidak bisa memasak..'), nl,!.
		
	use(tempat_tidur) :-
		i_am_at(kamar_eka),
		write('Zzzzz... Zzz...'),nl.
	
	use(penerjemah) :-
		i_am_at(kolam),
		at(penerjemah,in_hand),
		write('Ikan : Kamu tahu tidak? Eka sekarang sedang butuh uang.'),nl,
		write('Ah, kamu tidak peka.'),nl,!.
		
	use(penerjemah) :-
		i_am_at(gerbang),
		at(penerjemah,in_hand),
		write('Anjing : Main lempar bola tenis memang seru yaa!'),nl,!.
		
	use(penerjemah) :-
		\+i_am_at(kolam),
		\+i_am_at(gerbang),
		at(penerjemah,in_hand),
		write('Aku tidak bisa menggunakan itu disini.'),nl,!.
		
	use(laptop):-
		write('Belanja online kini lebih mudah!'), nl,
		write('...'), nl,
		write('Unable connect to network'), nl.
	use(kunci_diary):-
		i_am_at(kamar_eka),
		clue(diary).
	use(mobil) :-
		i_am_at(gerbang),
		write('Supir : HEH! MAU DIBAWA KE MANA MOBIL MAJIKAN SAYA??'), nl,
		retract(reputasi(X)),
		Y is X-1,
		assertz(reputasi(Y)),!
		.

	use(kloset) :-
		write('Fyuh leganya...'), nl.

	use(atm) :-
		i_am_at(bank),
		saldo_habis,
		write('Saldo di akun Anda sudah habis.'),
		nl, !.
	
	use(atm) :-
		i_am_at(bank),
		retract(duit(Y)),
		Z is (Y+1000),
		assertz(duit(Z)),
		assertz(saldo_habis),
		write('Penarikan uang berhasil.'), nl,
		write('Saldo di akun Anda sudah habis.'),
		nl, !.
	
	

	use(motor) :-
		examine(motor).
	
	use(kunci_motor):-
		examine(kunci_motor).
		
	use(X) :-
		npc(X),
		i_am_at(Place),
		at(X,Place),
		write('Memanfaatkan orang lain itu dosa'),nl.
	use(_) :-
		write('Barang tersebut tidak bisa digunakan.'), nl.
	
	
/* These rules describe how to pick up an object. */
	take(diary) :-
		i_am_at(kamar_eka),
		write('Jangan mengingini milik sesamamu.'),nl,!.
		
	take(bunga) :-
		i_am_at(kebun),
		write('Tukang Kebun : Heh! Jangan merusak kebunku.'), nl,
		retract(reputasi(X)),
		Y is X-1,
		assertz(reputasi(Y)),!.
		
	take(X) :-
        at(X, in_hand),
        write(X), write(' sudah kupegang.'),
        nl,!.

	take(X) :-
        i_am_at(Place),
        object(X),
        ringan(X),
		\+at(X,minimarket),
		at(X, Place),
        retract(at(X, Place)),
        assertz(at(X, in_hand)),
        write('OK. Aku mengambil '), write(X), write('.'),
        nl, !.
		
	take(laptop) :-
		i_am_at(X),
		at(laptop,X),
		write('Ah.. tasku tidak muat kalau harus bawa laptop.'), nl,
		!.
	take(air) :-
		\+at(penyiram_tanaman,in_hand),
		i_am_at(toilet),
		write('Aduh basah. Gak usah deh.'), nl,
		!.
	take(air) :-
		i_am_at(toilet),
		write('Oke.. Sekarang penyiram tanamannya sudah penuh'), nl,
		retract(at(penyiram_tanaman,in_hand)),
		assertz(at(penyiram_tanaman_air,in_hand)),!.
	take(X) :-
        i_am_at(Place),
        object(X),
        \+ringan(X),
		at(X, Place),
        write('Aduh berat banget, gak kuat. Perlu nge-gym lagi.'),nl,!.
		
	take(X) :-
		i_am_at(minimarket),
		object(X),
		at(X,minimarket),
		reputasi(Y),
		Z is Y-1,
		retract(reputasi(Y)),
		assertz(reputasi(Z)),
		write('Kasir : Heh ! Jangan mencuri yaa !'),nl,!.
	
	take(X) :-
		i_am_at(restaurant),
		object(X),
		at(X,restaurant),
		reputasi(Y),
		Z is Y-1,
		retract(reputasi(Y)),
		assertz(reputasi(Z)),
		write('Boss : Waduh ambil-ambil makanan dari restoran saya yaa...'),nl,!.
	
	take(X) :-
		npc(X),
		i_am_at(Place),
		at(X,Place),
		write('Aku tidak bisa mengantongi makhluk hidup.'),nl,!.
	
	take(_) :-
        write('Aku tidak melihat itu di sini.'),
        nl,!.
	
	buy(Item) :-
		at(Item,minimarket),
		i_am_at(minimarket),
		duit(X),
		price(Item,Z),
		X>=Z,
		Y is (X-Z),
		retract(duit(X)),
		assertz(duit(Y)),
		retract(at(Item,minimarket)),
		assertz(at(Item,in_hand)),
		write('Kasir : Terima kasih sudah berbelanja, sampai jumpa!'),nl,!.
		
	buy(Item) :-
		object(Item),
		at(Item,minimarket),
		i_am_at(minimarket),
		write('Uangnya tidak cukup.'), nl,!.
		
	buy(Item) :-
		at(Item,restaurant),
		i_am_at(restaurant),
		duit(X),
		price(Item,Z),
		X>=Z,
		Y is (X-Z),
		retract(duit(X)),
		assertz(duit(Y)),
		assertz(at(Item,in_hand)),
		write('Boss : Makasih .. Makasih.. Sering-sering dateng ya!'),nl,!.
		
	buy(Item) :-
		object(Item),
		at(Item,restaurant),
		i_am_at(restaurant),
		write('Uangnya tidak cukup'),nl,!.
	
	buy(X) :-
		npc(X),
		i_am_at(Place),
		at(X,Place),
		write('Aku merasa aneh, apa yang sedang aku lakukan?'),nl.
		
	buy(_) :-
		write('Barang ini tidak bisa dibeli.'),nl.
        
/* These rules describe how to put down an object. */
	drop(X) :-
		i_am_at(minimarket),
		write('Aku tidak mau meninggalkan barang sembarangan.'), nl, !.
	
	drop(X) :-
		i_am_at(restaurant),
		write('Aku tidak mau meninggalkan barang sembarangan.'), nl, !.
	
	drop(X) :-
        at(X, in_hand),
        i_am_at(Place),
        retract(at(X, in_hand)),
        assertz(at(X, Place)),
        write('OK. Aku tidak lagi memegang '), write(X), write('.'),
        nl.
	
	drop(makanan) :-
		at(X, in_hand),
        write('Sebaiknya aku tidak membuang-buang '), write(X), write('.'),
        nl.
	
	drop(_) :-
        write('Bagaimana aku mau meletakkannya?? Barang tersebut saja tidak kupegang.'),
        nl.

/* These rules describe how to give an object. */
	give(pengemis,makanan) :-
		i_am_at(X),
		at(pengemis,X),
		at(makanan,in_hand),
		sidequest(pengemis,1),
		completesidequest(pengemis,sedekah,2,100),
		retract(at(makanan,in_hand)),
		write('Pengemis : Wah.. Adek baik sekali.. Terima kasih ya..'), nl,
		write('Pengemis : Maaf ya saya hanya bisa membalas dengan 100 rupiah.'),nl,nl,
		write('Sidequest Sedekah selesai!'), nl,!.
		
	give(mama_eka,obat_tidur) :-
		i_am_at(dapur),
		at(obat_tidur,in_hand),
		retract(at(obat_tidur,in_hand)),
		write('Mama Eka : Wah, kamu tahu saja saya tidak bisa tidur dari kemarin.. Terima kasih obat tidurnya.'),nl,
		write('Mama Eka pun tertidur karena meminum obat tidur yang kamu berikan'), nl,
		retract(bangun(mama_eka)),fail,!.
		
	give(tetangga,parcel) :-
		\+completed(kerja),
		i_am_at(banda),
		at(parcel,in_hand),
		retract(at(parcel,in_hand)),
		write('Tetangga : Wah, terima kasih banyak yaa...'),nl,
		write('Ini uang untukmu, sebesar 20000'),nl,nl,
		write('Sidequest Kerja selesai!'),nl,
		completesidequest(boss,kerja,10,20000),!.
		
	give(bunga,penyiram_tanaman_air) :-
		i_am_at(kebun),
		at(penyiram_tanaman_air,in_hand),
		write('Tukang kebun : Anak muda! Kau sangat baik. Terima kasih ya'), nl,
		write('Tukang kebun : Ini kuberi 2000 untuk jajan.'), nl,nl,
		retract(at(penyiram_tanaman_air,in_hand)),
		completesidequest(tukangkebun,siram_bunga,4,2000),!.
		
	give(bunga,penyiram_tanaman) :-
		i_am_at(kebun),
		at(penyiram_tanaman,in_hand),
		write('Aku ngapain sih.. orang masi kosong'),nl,!.
		
	give(Person,Something) :-
		i_am_at(Place),
		at(Person,Place),
		npc(Person),
		\+at(Something,in_hand),
		write('Aku : Aku tidak punya benda itu sekarang.'),nl,!.
		
	give(Person,Something) :-
		i_am_at(Place),
		\+(at(Person,Place)),
		write('Aku : Orang itu tidak ada di sini sekarang.'),nl,!.
		
	give(Person,Something) :-
		i_am_at(Place),
		at(Person,Place),
		npc(Person),
		Person \== anjing,
		Person \== ikan,
		at(Something,in_hand),
		write(Person),write(' : Apa ini ? Aku tidak butuh benda ini.'),nl,!.
		
	give(anjing,Something) :-
		i_am_at(gerbang),
		write('Anjing : Woof woof !'),nl,!.
	give(ikan,makanan_ikan) :-
		i_am_at(kolam),
		retract(at(makanan_ikan,in_hand)),
		reputasi(X),
		Y is X+1,
		retract(reputasi(X)),
		assertz(reputasi(Y)),
		write('Ikan : ').
	give(ikan,Something) :-
		i_am_at(kolam),
		write('Ikan : Blubub blubub blubub'),nl,!.
		
/* This rule tells how to move in a given direction. */
	go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assertz(i_am_at(There)),
		(quitgame(false) -> (look,!); !).

	go(_) :-
        write('Aku tidak bisa kesana.'),nl.
		
/* Predikat menggunakan motor */
	ride :-
		at(kunci_motor,in_hand),
		at(motor,Place),
		i_am_at(Place),
		retract(at(motor,Place)),
		assertz(at(motor,in_hand)),
		write('Aku : Sekarang aku mengendarai motor !'), nl,
		gambar(motorbebek),nl,
		write('BRUMMM BRUMMM'),nl,!.
	ride :-
		at(motor,Place),
		\+i_am_at(Place),
		write('Aku : Motorku dimana ya?'),nl,!.

	ride :-
		\+at(kunci_motor,in_hand),
		write('Aku : Kunci motorku dimana ya?'),nl,!.
		
/* This rule tells how to look about you. */
	
	look :-
        i_am_at(Place),
        describe(Place),
        nl,
        write('Objek yang terdapat di sini: '), nl,
        notice_objects_at(Place),
        nl.
    
/* These rules set up a loop to mention all the objects
   in your vicinity. */
	notice_objects_at(Place) :-
        at(X, Place),
        write('   > '), write(X), nl,
        fail.
	notice_objects_at(_).

/* stat */
	stat :-
		write('Duit : '), duit(X), write(X), nl,
		write('Reputasi : '), reputasi(P), write(P), nl,
		write('Inventaris-ku : '), nl,	notice_objects_at(in_hand),
		write('Sidequest : '),nl,
		forall(active(A),(write('   > '),write(A),nl)),
		!.
/* Instructions */
	instructions :-
		write('Berikut instruksi yang dapat digunakan :'),nl,
		write('start.                        : memulai permainan'), nl,
		write('n., s., w., e., u., d.        : pindah ke arah sesuai instruksi'), nl,
		write('examine(Object).              : memeriksa barang'), nl,
		write('take(Object).                 : mengambil barang'), nl,
		write('use(Object).                  : menggunakan barang'), nl,
		write('buy(Object).                  : membeli barang'), nl,
		write('drop(Object).                 : meletakkan barang'), nl,
		write('talk(Npc).                    : mengajak NPC berbicara'), nl,
		write('askmoney(Npc).                : meminta uang dari NPC'), nl,
		write('give(Npc,Object)              : memberikan barang ke NPC'), nl,
		write('answer(Object/Npc)            : menjawab teka-teki yang berasal dari objek'), nl,
		write('ride.                         : mengendarai motor'), nl,
		write('tunggu.                       : menunggu Eka pulang dari berbelanja'), nl,
		write('stat.                         : menampilkan atribut'), nl,
		write('look.                         : melihat sekeliling'), nl,
		write('instructions.                 : melihat daftar instruksi'), nl,
		write('save(Filename).               : menyimpan progress'), nl,
		write('loadfile(Filename).           : memuat progress'), nl,
		write('quit.                         : mengakhiri permainan'), nl.

/* Rules untuk Input name */
	inputnama :-
		gambar(judul_game), nl, nl,
		write('Halo!! Sebelum memulai permainan, masukkan terlebih dahulu nama anda (lowercase):'),
		nl,
		read(X),
		assertz(player(X)),
		write('Namaku '),
		write(X),
		write('.'),
		nl.

/* Rules untuk File Eksternal */
	assertfile(Extfile,Content1) :-
	read(Extfile,Content1),
	(
		Content1 \== ('|') -> assertz(Content1),assertfile(Extfile,Content2); !
	).
	
	loadfile(Filename) :- 
		open(Filename,read,Str),
		retract(player(Name)),
		retract(i_am_at(Here)),
		retract(duit(X)),
		retract(reputasi(Y)),
		forall((object(O),at(O,Place)),retract(at(O,Place))),
		forall(notanswered(Anything),retract(notanswered(Anything))),
		forall(answered(Something),retract(answered(Something))),
		forall(bangun(Person),retract(bangun(Person))),
		forall(completed(Sidequest),retract(completed(Sidequest))),
		forall(sidequest(A,B), retract(sidequest(A,B))),
		forall(active(Quest), retract(active(Quest))),
		assertfile(Str,C),
		close(Str),
		write('Game berhasil dimuat.'), nl.

	save(Filename) :-
		open(Filename,write,Str),
		player(Name),
		write(Str,'player('),
		write(Str,Name),
		write(Str,').'),
		nl(Str),
		i_am_at(Place),
		write(Str,'i_am_at('),
		write(Str,Place),
		write(Str,').'),
		nl(Str),
		duit(Money),
		write(Str,'duit('),
		write(Str,Money),
		write(Str,').'),
		nl(Str),
		reputasi(Rep),
		write(Str,'reputasi('),
		write(Str,Rep),
		write(Str,').'),
		nl(Str),
		forall((at(Itema,in_hand)),(write(Str,'at('),write(Str,Itema),write(Str,',in_hand).'),nl(Str))),
		forall((at(Itemb,bank),object(Itemb)),(write(Str,'at('),write(Str,Itemb),write(Str,',bank).'),nl(Str))),
		forall((at(Itemc,minimarket),object(Itemc)),(write(Str,'at('),write(Str,Itemc),write(Str,',minimarket).'),nl(Str))),
		forall((at(Itemd,loteng),object(Itemd)),(write(Str,'at('),write(Str,Itemd),write(Str,',loteng).'),nl(Str))),
		forall((at(Iteme,gudang),object(Iteme)),(write(Str,'at('),write(Str,Iteme),write(Str,',gudang).'),nl(Str))),
		forall((at(Itemf,aceh),object(Itemf)),(write(Str,'at('),write(Str,Itemf),write(Str,',aceh).'),nl(Str))),
		forall((at(Itemg,banda),object(Itemg)),(write(Str,'at('),write(Str,Itemg),write(Str,',banda).'),nl(Str))),
		forall((at(Itemh,restaurant),object(Itemh)),(write(Str,'at('),write(Str,Itemh),write(Str,',restaurant).'),nl(Str))),
		forall((at(Itemi,kos),object(Itemi)),(write(Str,'at('),write(Str,Itemi),write(Str,',kos).'),nl(Str))),
		forall((at(Itemj,lombok),object(Itemj)),(write(Str,'at('),write(Str,Itemj),write(Str,',lombok).'),nl(Str))),
		forall((at(Itemk,dapur),object(Itemk)),(write(Str,'at('),write(Str,Itemk),write(Str,',dapur).'),nl(Str))),
		forall((at(Iteml,gerbang),object(Iteml)),(write(Str,'at('),write(Str,Iteml),write(Str,',gerbang).'),nl(Str))),
		forall((at(Itemm,dapur),object(Itemm)),(write(Str,'at('),write(Str,Itemm),write(Str,',dapur).'),nl(Str))),
		forall((at(Itemn,kamar_ortu),object(Itemn)),(write(Str,'at('),write(Str,Itemn),write(Str,',kamar_ortu).'),nl(Str))),
		forall((at(Itemo,kebun),object(Itemo)),(write(Str,'at('),write(Str,Itemo),write(Str,',kebun).'),nl(Str))),
		forall((at(Itemp,toilet),object(Itemp)),(write(Str,'at('),write(Str,Itemp),write(Str,',toilet).'),nl(Str))),
		forall((at(Itemq,kamar_eka),object(Itemq)),(write(Str,'at('),write(Str,Itemq),write(Str,',kamar_eka).'),nl(Str))),
		forall((at(Itemr,kolam),object(Itemr)),(write(Str,'at('),write(Str,Itemr),write(Str,',kolam).'),nl(Str))),
		forall((at(Items,basement),object(Items)),(write(Str,'at('),write(Str,Items),write(Str,',basement).'),nl(Str))),
		forall((answered(Something)),(write(Str,'answered('),write(Str,Something),write(Str,').'),nl(Str))),
		forall((notanswered(Anything)),(write(Str,'notanswered('),write(Str,Anything),write(Str,').'),nl(Str))),
		forall((bangun(Person)),(write(Str,'bangun('),write(Str,Person),write(Str,').'),nl(Str))),
		forall((completed(Sidequest)),(write(Str,'completed('), write(Str,Sidequest), write(Str,').'), nl(Str))),
		forall((sidequest(A,B)),(write(Str,'sidequest('),write(Str,A),write(Str,','),write(Str,B),write(Str,').'), nl(Str))),
		forall((active(Act)),(write(Str,'active('),write(Str,Act),write(Str,').'),nl(Str))),
		write(Str,'('),
		write(Str,'\''),
		write(Str,'|'),
		write(Str,'\''),
		write(Str,').'),
		close(Str),
		write('Game berhasil disimpan.'), nl.

/* Starting game */
	start :-
		inputnama,
		write('Huft.. Beberapa hari lagi aku dan pacarku, Eka, '), nl,
		write('akan merayakan anniv yang ke-5.'), nl,
		write('Kami bersepakat bahwa kami akan melakukan tukar kado.'), nl,
		write('Namun aku merasa bingung apa hadiah yang tepat untuk si dia. :('), nl,
		write('Apa yang akan aku lakukan?'), nl,
		write('Hmm... Seharusnya beberapa saat ke depan Eka tidak berada di rumah untuk mencari hadiah untukku.'), nl,
		write('Aku bisa masuk ke rumahnya untuk mencari petunjuk.'), nl,
		write('Aku harus melakukan sesuatu!'), nl,
		write('Tapi aku harus cepat, sebelum Eka kembali pulang.'), nl,
		instructions,
		look,
		repeat,
		write('> '),
		read(X),
		(
			X\==quit -> do(X), (quitgame(true) -> ! ; fail); 
			write('Udahan dulu ah.'), nl,
			quit,! ).
			
/* Akhir game */
	berhasil :-
		write('Beruntungnya nasibku.'), nl,
		write('The End.'), nl,
		quit,
		retract(quitgame(false)),
		assertz(quitgame(true)),
		write('Completed Sidequest : '),
		forall(completed(X),(write('   > '),write(X),nl)).
		
	gagal :-
		write('Malangnya nasibku.'), nl,
		quit,
		retract(quitgame(false)),
		assertz(quitgame(true)),
		write('Completed Sidequest : '),
		forall(completed(X),(write('   > '),write(X),nl)).
		
	resetitem :-
		forall((object(Object),at(Object,Place)),retract(at(Object,Place))),
		assertz(at(kunci_motor,kos)),
		assertz(at(laptop,kos)),
		assertz(at(motor,kos)),
		assertz(at(sabun,minimarket)),
		assertz(at(obat_tidur,minimarket)),
		assertz(at(makanan,restaurant)),
		assertz(at(diary,kamar_eka)),
		assertz(at(kunci_diary,basement)),
		assertz(at(depositbox,bank)),
		assertz(at(kloset,toilet)),
		assertz(at(air,toilet)),
		assertz(at(lemari,kamar_eka)),
		assertz(at(atm,bank)),
		assertz(at(mobil,gerbang)),
		assertz(at(bunga,kebun)),
		assertz(at(makanan_ikan,kolam)),
		assertz(at(tempat_tidur,kamar_eka)),
		assertz(at(kompor,dapur)),
		assertz(at(kulkas,dapur)),
		assertz(at(penerjemah,kamar_ortu)),
		assertz(at(bola_tenis,minimarket)),
		assertz(at(raket,minimarket)),
		assertz(at(lemari_bekas,gudang)),
		assertz(at(laci_bekas,gudang)),
		assertz(at(meja,loteng)),
		assertz(at(kursi,loteng)).
		
	quit :-
		retract(player(_)),
		retract(i_am_at(_)),
		assertz(i_am_at(kos)),
		retract(duit(_)),
		assertz(duit(1000)),
		retract(reputasi(_)),
		assertz(reputasi(0)),
		resetitem,
		forall(notanswered(Anything),retract(notanswered(Anything))),
		forall(answered(Something),retract(answered(Something))),
		assertz(notanswered(depositbox)),
		assertz(notanswered(sopir)),
		assertz(notanswered(tukangkebun)).

/* Rules perinta dibawah start */
	do(n) :- go(n),!.
	do(e) :- go(e),!.
	do(s) :- go(s),!.
	do(w) :- go(w),!.
	do(u) :- go(u),!.
	do(d) :- go(d),!.
	do(take(X)):- take(X),!.
	do(drop(X)):- drop(X),!.
	do(give(Person,Somehthing)):-give(Person,Something),!.
	do(use(X)) :- use(X),!.
	do(stat) :- stat,!.
	do(talk(X)):- talk(X),!.
	do(askmoney(X)):- askmoney(X),!.
	
	/*do(give(X,Y):-give(X,Y),!.*/
	do(examine(X)):- examine(X),!.	
	do(look) :- look,!.
	do(instructions) :- instructions,!.
	do(tunggu) :- tunggu, !.
	do(save(File)) :- save(File),!.
	do(loadfile(File)) :- loadfile(File),!.
	do(buy(Item)) :- buy(Item),!.
	do(ride) :- ride,!.
	do(answer(Something)) :- answer(Something),!.
	do(_) :- write('Perintah salah.'),nl,fail.

/* Rules yang mendeskripsikan ruangan */

    describe(bank) :-
    	write('"BANK VALAK", tulisan ini tampak jelas di mataku. Bank ini tidak '), nl,
    	write('jauh berbeda dengan bank yang biasa kulihat sehari-hari.'), nl,
    	write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> Jalan Aceh'), nl,
    	write('   > barat   -> N/A'), nl,
    	write('   > timur   -> Minimarket'), nl.
	describe(minimarket) :-
		write('Kini aku berada di minimarket. Tampaknya segala hal yang kuperlukan '), nl,
		write('bisa didapatkan di sini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> Jalan Banda'), nl,
    	write('   > barat   -> Bank'), nl,
    	write('   > timur   -> N/A'), nl.
	describe(loteng) :-
		write('Loteng ini sempit sekali. '), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> N/A'), nl,
    	write('   > timur   -> Gudang'), nl.
	describe(gudang) :-
		write('Gudang dengan barang-barang usang. Tidak kusangka di rumah semewah ini '), nl,
		write('ternyata masih ada ruangan seperti ini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> Loteng'), nl,
    	write('   > timur   -> N/A'), nl.
	describe(aceh) :-
    	write('Sekarang aku berada di jalan Aceh. Pengemis di pinggir jalan'), nl,
        write('ini terlihat sangat kelaparan.'), nl,
        write('Petunjuk arah : '), nl,
    	write('   > utara   -> Bank'), nl,
    	write('   > selatan -> Kos'), nl,
    	write('   > barat   -> N/A'), nl,
    	write('   > timur   -> Jalan Banda'), nl.
	describe(banda) :-
		write('Sekarang aku berada di jalan Banda. Tetanggaku banyak yang '), nl,
		write('tinggal di sini. Mungkin aku harus menyapa mereka.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> Minimarket'), nl,
    	write('   > selatan -> Jalan Lombok'), nl,
    	write('   > barat   -> Jalan Aceh'), nl,
    	write('   > timur   -> Restoran'), nl.
	describe(restaurant) :-
		write('Hmm wanginya.. Aku jadi lapar, nih. Ini adalah salah satu '), nl,
		write('restoran paling terkenal di kota ini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> Gerbang'), nl,
    	write('   > barat   -> Jalan Banda'), nl,
    	write('   > timur   -> N/A'), nl.
	describe(kos) :-
    	write('Iuh jorok banget deh. Baju kotor berserakan di lantai, '), nl,
        write('bahkan kamar kosanku ini jadi parkiran motor. Heran deh, '), nl,
        write('kok Eka masih bisa bertahan ya selama 5 tahun bersamaku.'), nl,
        write('Petunjuk arah : '), nl,
    	write('   > utara   -> Jalan Aceh'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> N/A'), nl,
    	write('   > timur   -> Jalan Lombok'), nl.
	describe(lombok) :-
		write('*** : Brum brummm... '), nl,
		write('Wah suara apa itu? Jalan Lombok ini terlihat sangat mengerikan.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> Jalan Banda'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> Kos'), nl,
    	write('   > timur   -> Gerbang'), nl.
	describe(gerbang):-
		write('Sekarang aku berada di gerbang rumah Eka. Rumah Eka tampak '), nl,
		write('begitu mewah dan indah dari sini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> Restoran'), nl,
    	write('   > selatan -> Kebun'), nl,
    	write('   > barat   -> Jalan Lombok'), nl,
    	write('   > timur   -> Dapur'), nl.
	describe(dapur) :-
		write('Harum masakan yang ada di dapur ini sangat enak. Aku jadi '), nl,
		write('rindu masakan ibuku di kampung. Namun, sepertinya ada yang'), nl,
		write('janggal dengan ruangan ini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> Toilet'), nl,
    	write('   > barat   -> Gerbang'), nl,
    	write('   > timur   -> Kamar Orang Tua'), nl.
	describe(kamar_ortu) :-
		write('Akhirnya, aku dapat masuk ke kamar orang tua Eka. Semoga '), nl,
		write('saja Eka dan orang tuanya tidak mengetahui ini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> Kamar Eka'), nl,
    	write('   > barat   -> Dapur'), nl,
    	write('   > timur   -> N/A'), nl.
	describe(kebun) :-
		write('Tanaman di kebun ini sangat indah. Ingin aku beristirahat '), nl,
		write('sejenak di sini. Namun, aku tak punya banyak waktu untuk itu.'), nl,
		write('Eka pasti sudah menunggu hadiah dariku.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> Gerbang'), nl,
    	write('   > selatan -> Kolam ikan'), nl,
    	write('   > barat   -> N/A'), nl,
    	write('   > timur   -> Toilet'), nl.
	describe(toilet) :-
		write('Sekarang aku berada di toilet rumah Eka. Toilet ini tampak '), nl,
		write('jauh lebih layak untuk kutinggali dibandingkan kosanku sendiri.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> Dapur'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> Kebun'), nl,
    	write('   > timur   -> Kamar Eka'), nl.
	describe(kamar_eka) :-
		write('Rapi, wangi, dan bersih. Inilah kamar Eka. Namun, sepertinya '), nl,
		write('ada sesuatu yang janggal dengan ruangan ini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> Kamar Orang Tua'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> Toilet'), nl,
    	write('   > timur   -> N/A'), nl.
	describe(kolam) :-
		write('Setelah mataku disegarkan dengan indahnya pepohonan, kini '), nl,
		write('kolam ikan dengan air yang jernih membuatku semakin ingin '), nl,
		write('bersantai dan menghabiskan waktu di sini.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> Kebun'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> N/A'), nl,
    	write('   > timur   -> N/A'), nl.
	describe(basement) :-
		write('Wah, ternyata ada ruangan rahasia di bawah kamar Eka. Bahkan'), nl,
		write('setelah 5 tahun berpacaran dengan Eka, aku baru mengetahui '), nl,
		write('ruangan ini sekarang.'), nl,
		write('Petunjuk arah : '), nl,
    	write('   > utara   -> N/A'), nl,
    	write('   > selatan -> N/A'), nl,
    	write('   > barat   -> N/A'), nl,
    	write('   > timur   -> N/A'), nl.
		
/* Rules yang mendeskripsikan talk */
	talk(mama_eka) :-
		i_am_at(dapur),
		\+bangun(mama_eka),
		write('Mama Eka : Zzz..'),nl,!.
		
	talk(X) :-
        i_am_at(Place),
        npc(X), notanswered(X),
		clue(X), nl,
        at(X, Place),
        nl, !.
         
	talk(X) :-
        i_am_at(Place),
        npc(X),
        at(X, Place),
        dialog(X),
        nl, !.

	talk(_) :-
        write('Duh aku kebanyakan berpetualang, jadi ngomong sama hantu.'),
        nl.
		
/* Rules yang mendeskripsikan ASKMONEY */
	
	askmoney(ikan) :-
		i_am_at(kolam),
		write('Aku sepertinya sudah gila karena cinta.'), nl, !.
		
	askmoney(anjing) :-
		i_am_at(gerbang),
		write('Aku sepertinya sudah gila karena cinta.'), nl, !.

	askmoney(boss) :-
		\+completed(kerja),
		assertz(sidequest(boss,1)),
		assertz(active(kerja)),
		i_am_at(restaurant),
		assertz(at(parcel,in_hand)),
		write('Boss : Wah kamu tidak boleh minta-minta uang dengan cara seperti ini, bagaimana jika kamu membantu saya mengirim parcel ?'),nl,nl,
		write('Sidequest Kerja : Ayo bekerja untuk boss restaurant, kirim parcel yang sudah ada di tanganmu ke tetangga di Jalan Banda.'),nl,!.
		
	askmoney(X) :-
        i_am_at(Place),
        npc(X),
        at(X, Place),
		reputasi(R),
		@>(R,0),
		retract(reputasi(R)),
		duit(Y),
		retract(duit(Y)),
		Z is (Y+100*R),
		S is (R-1),
		assertz(duit(Z)),
		assertz(reputasi(S)),
		write(X), write(' : Nih..'), nl,
		write('Aku : Wah, terimakasih banyak..'),
		nl, !.
		
	askmoney(X) :-
		i_am_at(Place),
        npc(X),
        at(X, Place),
		write(X), write(' : Aku tidak akan memberikan sepeser pun ke orang sepertimu.'),
		reputasi(A),
		retract(reputasi(A)),
		B is A-1,
		assertz(reputasi(-1)),
		nl, !.
	
	askmoney(X) :-
		i_am_at(Place),
		object(X),
		at(X,Place),
		write('Jangan menyembah berhala. Rezeki sudah diatur Yang Maha Kuasa.'), nl,!.
	
	askmoney(_) :-
        write('Aku tidak melihatnya.'),
        nl.
        
/* Dialog npc */

	dialog(ikan):-
		write('Ikan : Blub blub blub...'), nl.
	dialog(teller) :-
		write('Teller : Selamat Pagi.'),nl.
	dialog(tukangkebun) :-
		sidequest(tukangkebun,0),
		clue(tukangkebun),nl,!.
	dialog(tukangkebun) :-
		assertz(sidequest(tukangkebun,1)),
		assertz(active(siram_bunga)),
		write('Tukang kebun : Duh bunganya sudah semakin layu.'), nl,
		write('Aku : Hmm..'),nl,nl,
		write('Eh ada penyiram tanaman. Ambil ah'), nl,
		assertz(at(penyiram_tanaman,in_hand)),
		write('Sidequest Siram Bunga : Bantulah tukang kebun menyiram bunga.'),nl,!.
	dialog(boss) :-
		write('Boss : Haloo, silakan silakan dibeli makanannya.'),nl.
	dialog(mama_eka) :-
		sidequest(mama_eka,0),
		write('Mama Eka : Hai nak, kamu lagi mencari Eka?'),nl.
	dialog(mama_eka) :-
		assertz(sidequest(mama_eka,1)),
		assertz(active(bantu_mama)),
		write('Mama Eka : Eeh apa kabar? Tante lagi masak nih..'),nl,
		write('Aku : Waah kelihatannya enak. Boleh kubantu Tan?'), nl,
		write('Mama Eka : Okee ini resepnya. Bahan makanan ada di kulkas.'),nl,nl,
		write('Sidequest Bantu Masak : Bantulah Mama Eka memasak.'),nl,!.
	dialog(oma_eka) :-
		write('Oma Eka : Nenek sudah tua, cu...'), nl.
	dialog(tetangga) :-
		write('Tetangga : Hai, '), player(X),write(X), write('! Aduh akhir-akhir ini'), nl,
		write('lagi banyak tindakan kriminal, bikin saya resah saja...').
	dialog(pengemis) :-
		sidequest(pengemis,0),
		write('Pengemis : Hari yang cerah ya Dek..').
	dialog(pengemis) :-
		assertz(sidequest(pengemis,1)),
		assertz(active(sedekah)),
		write('Pengemis : Dek... Kasihan, dek... Belum makan tiga hari...'),nl,
		write('Duh kasihan sekali kakek ini.. Aku harus memberikan sesuatu.'),nl,nl,
		write('Sidequest Sedekah : Berikan makanan pada pengemis.'),nl,!.
	dialog(kasir) :-
		write('Kasir : Gak sekalian pulsanya?').
	dialog(gengmotor) :-
		write('Geng Motor : Arghh togel gua gak keluar-keluar nih!'),nl.
	dialog(anjing) :- 
		write('Anjing : Woof woof...(gak waras ngomong sama guguk)'),nl.
	dialog(sopir) :-
		clue(sopir),nl,!.

/* Rules untuk examine */
    examine(kunci_motor) :- 
		i_am_at(Place),
		at(kunci_motor, Place),
		write('Cara menggunakannya, pastikan kunci berada di tangan,'),nl,
		write('dan masukkan perintah ride ketika sedang seruangan dengan'), nl,
		write('motor.'),nl,!.
	
	examine(kunci_motor) :- 
		at(kunci_motor,in_hand),
		write('Cara menggunakannya, pastikan kunci berada di tangan,'),nl,
		write('dan masukkan perintah ride ketika sedang seruangan dengan'),nl,
		write('motor.'),nl,!.
		
	examine(sabun):-
		i_am_at(minimarket),
		write('Sabun yang wangi ini seharga 2000'), nl,!.
	
	examine(sabun):-
		at(sabun, in_hand),
		write('Kira-kira Eka membutuhkan sabun tidak ya?'),nl,!.
	
	examine(sabun):-
		i_am_at(Place),
		at(sabun, Place),
		write('Kira-kira Eka membutuhkan sabun tidak ya?'),nl.
	
	examine(obat_tidur):-
		i_am_at(minimarket),
		write('Obat tidur cap gajah mabok seharga 5000'), nl,!.
		
	examine(obat_tidur):-
		at(obat_tidur, in_hand),
		write('Orang-orang yang menghalangiku lebih baik diberi obat ini.'), nl,!.
	
	examine(obat_tidur):-
		i_am_at(Place),
		at(obat_tidur, Place),
		write('Orang-orang yang menghalangiku lebih baik diberi obat ini.'), nl.
	
	examine(raket):-
		i_am_at(minimarket),
		write('Raket seharga 100000.'), nl,!.
	
	examine(raket):-
		at(raket, in_hand),
		write('Raket yenox berkualitas tinggi.'), nl,!.
	
	examine(raket):-
		i_am_at(Place),
		at(raket, Place),
		write('Raket yenox berkualitas tinggi.'), nl.
	
	examine(bola_tenis):-
		i_am_at(minimarket),
		write('Bola tenis ini seharga 50000.'), nl,!.
	
	examine(bola_tenis):-
		at(bola_tenis, in_hand),
		write('Mainan favorit para anjing.'), nl,!.
	
	examine(bola_tenis):-
		i_am_at(Place),
		at(bola_tenis, Place),
		write('Mainan favorit para anjing.'), nl.
	
	examine(kunci_diary):-
		i_am_at(basement),
		write('Kunci apa ya ini? Tampak baru dan mengkilap.'), nl,!.
	
	examine(kunci_diary):-
		at(kunci_diary, in_hand),
		write('Kunci ini sepertinya akan memberikanku petunjuk.'), nl.
	
	examine(kunci_diary):-
		i_am_at(Place),
		at(kunci_diary, Place),
		write('Kunci ini sepertinya akan memberikanku petunjuk.'), nl.
		
	examine(makanan):-
		i_am_at(restaurant),
		write('Makanan ini seharga 25000.'),nl,!.
		
	examine(makanan):-
		at(makanan,in_hand),
		write('Makanan yang sangat pedas sampai membuat sakit perut.'),nl.
	
	examine(makanan):-
		i_am_at(Place),
		at(makanan,Place),
		write('Makanan yang sangat pedas sampai membuat sakit perut.'),nl.
		
	examine(bunga) :-
		i_am_at(Place),
		at(bunga,Place),
		write('Bunga-bunga yang cantik, dibesarkan seperti anak sendiri.'),nl.
	
	examine(bunga) :-
		at(bunga, in_hand),
		write('Setangkai bunga untuk mencerahkan hati orang yang spesial.'),nl.
	
	examine(makanan_ikan) :-
		i_am_at(kolam),
		write('Terbuat dari daging pilihan dengan 10 bumbu rahasia.'),nl,!.
		
	examine(makanan_ikan) :-
		at(makanan,in_hand),
		write('Terbuat dari daging pilihan dengan 10 bumbu rahasia.'),nl,!.
	
	examine(kloset) :-
		i_am_at(toilet),
		write('Wah klosetnya mulus... semulus kulit Eka.'),nl,!.
		
	examine(air) :- 
		i_am_at(toilet),
		write('Pompa air sumitshi, air mengalir sampai jauh...'),nl,!.
	
	examine(atm) :-
		i_am_at(bank),
		write('ATM ini pecahan 1000'), nl,
		write('Aku : Aku hanya bisa mengambil uang disini satu kali'),nl.
		
	examine(mobil) :-
		i_am_at(gerbang),
		write('Sepertinya aku harus mencoba menyetir mobil ini..'),nl,!.
		
	examine(lemari_bekas) :-
		i_am_at(gudang),
		write('Hiii seramnya...'),nl,!.
	
	examine(laci_bekas) :-
		sidequest(laci_bekas,0),
		i_am_at(gudang),
		write('Laci ini sudah lapuk dimakan rayap.'),nl,!.
	examine(laci_bekas) :-
		assertz(sidequest(laci_bekas,1)),
		assertz(active(foto_eka)),
		i_am_at(gudang),
		gambar(foto_eka),nl,
		write('Aku : Wah ada foto Eka. Disini dia manis sekali <3'),nl,
		write('Aku : Lumayan juga ada gopek disini'),nl,nl,
		completesidequest(laci_bekas,foto_eka,1,500),
		write('Sidequest Foto Eka selesai!'),nl,!.
	
	examine(motor) :-
		at(motor,Place),
		i_am_at(Place),
		write('Motor bebek kesayangan pemberian orang tua.'),nl,
		write('Cara menggunakannya, pastikan kunci berada di tangan,'),nl,
		write('dan masukkan perintah ride ketika sedang seruangan dengan'),nl,
		write('motor.'),nl,!.

	examine(motor) :-
		at(motor, in_hand),
		write('Setelah berkendara, motor bebek kesayanganku ini menjadi kotor.'), nl,
		write('Cara berhenti menggunakan motor, dengan perintah drop(motor).'),nl,!.
	
	examine(depositbox) :-
		i_am_at(bank),
		clue(depositbox),!.
	
	examine(lemari) :-
		i_am_at(kamar_eka),
		write('Lemari ini hanya berisi baju-baju Eka.'), nl,!.
	
	examine(kursi):-
		i_am_at(loteng),
		write('Kalau aku duduk di sini akan hancur kursinya.'), nl.
		
	examine(meja):-
		i_am_at(loteng),
		write('Meja ini sudah usang. Banyak coretan tip x di atasnya.'), nl.
	
	examine(laptop) :-
		i_am_at(kos),
		write('Masih mulus seperti baru, sayangnya krisis internet.'),nl.
	
	examine(kulkas) :-
		i_am_at(dapur),
		sidequest(mama_eka,1),
		assertz(at(bahan_makanan,in_hand)),
		write('Nah ini dia bahannya..'),nl,!.
	examine(kulkas):-
		i_am_at(dapur),
		write('Terdapat secarik kertas, isinya: '),nl,
		write('Oma, jangan lupa kasih makan ikan. -Eka '),nl.
	
	examine(diary) :-
		i_am_at(kamar_eka),
		write('Buku harian dengan sebuah lubang kunci.'),nl.
		
	examine(penerjemah) :-
		i_am_at(kamar_ortu),
		write('Benda ini sepertinya dapat berguna untuk mengartikan perkataan-perkataan yang aneh.'), nl.

	examine(penerjemah) :-
		in_hand(penerjemah),
		write('Benda ini sepertinya dapat berguna untuk mengartikan perkataan-perkataan yang aneh.'), nl.

	examine(kompor) :-
		i_am_at(kompor),
		write('Memasak di sini tentu akan menyenangkan.'), nl.

	examine(tempat_tidur) :-
		i_am_at(kamar_eka),
		write('Empuk dan nyaman sekali kasur ini. Berbeda jauh dengan kasur kosanku.'), nl.
		
	examine(pulsa):-
		i_am_at(minimarket),
		write('Pulsa berbagai operator seharga 5000.'), nl,!.
	examine(pulsa):-
		i_am_at(Place),
		at(pulsa, Place),
		write('Akhirnya aku bisa mengisi pulsa.'), nl.
	examine(pulsa):-
		at(pulsa, in_hand),
		write('Akhirnya aku bisa mengisi pulsa.'), nl.
		
	examine(baju):-
		i_am_at(minimarket),
		write('Baju diskon seharga 20000.'), nl,!.
	examine(baju):-
		i_am_at(Place),
		at(baju, Place),
		write('Baju ini bagus dan bisa dipakai oleh pria maupun wanita.'), nl.
	examine(baju):-
		at(baju, in_hand),
		write('Baju ini bagus dan bisa dipakai oleh pria maupun wanita.'), nl.
	
	examine(kosmetik):-
		i_am_at(minimarket),
		write('Kosmetik KW super seharga 100000.'), nl,!.
	examine(kosmetik):-
		i_am_at(Place),
		at(kosmetik, Place),
		write('Walaupun kosmetik KW namun kelihatan seperi asli'), nl.
	examine(kosmetik):-
		at(kosmetik, in_hand),
		write('Walaupun kosmetik KW namun kelihatan seperi asli'), nl.
		
	examine(rokok):-
		i_am_at(minimarket),
		write('Rokok Dbenang seharga 10000.'), nl,!.
	examine(rokok):-
		i_am_at(Place),
		at(rokok, Place),
		write('Sebaiknya aku tidak merokok karena tidak baik untuk kesehatan.'), nl.
	examine(rokok):-
		at(rokok, in_hand),
		write('Sebaiknya aku tidak merokok karena tidak baik untuk kesehatan.'), nl.
	
	examine(makanan_ringan):-
		i_am_at(minimarket),
		write('Makanan ringan seharga 3000.'), nl,!.
	examine(makanan_ringan):-
		i_am_at(Place),
		at(makanan_ringan, Place),
		write('Makanan ringan ini enak.'), nl.
	examine(makanan_ringan):-
		at(makanan_ringan, in_hand),
		write('Makanan ringan ini enak.'), nl.
	
	examine(sikat_gigi):-
		i_am_at(minimarket),
		write('Sikat gigi seharga 4000.'), nl, !.
	examine(sikat_gigi):-
		i_am_at(Place),
		at(sikat_gigi, Place),
		write('Sikat gigi baru bisa kugunakan sehari-hari.'), nl.
	examine(sikat_gigi):-
		at(sikat_gigi, in_hand),
		write('Sikat gigi baru bisa kugunakan sehari-hari.'), nl.
		
	examine(sandal):-
		i_am_at(minimarket),
		write('Sandal seharga 8000.'), nl, !.
	examine(sandal):-
		i_am_at(Place),
		at(sandal, Place),
		write('Walaupun harganya murah, sandal ini tampak bagus dan awet.'), nl.
	examine(sandal):-
		at(sandal, in_hand),
		write('Walaupun harganya murah, sandal ini tampak bagus dan awet.'), nl.
		
	examine(sepatu_hak):-
		i_am_at(minimarket),
		write('Sepatu hak 20 cm seharga 90000'), nl,!.
	examine(sepatu_hak):-
		i_am_at(Place),
		at(sepatu_hak, Place),
		write('Semua wanita pasti menyukai sepatu hak ini.'), nl.
	examine(sepatu_hak):-
		at(sepatu_hak, in_hand),
		write('Semua wanita pasti menyukai sepatu hak ini.'), nl.
		
	examine(X):-
			npc(X),
			i_am_at(Place),
			at(X,Place),
			write('Tidak baik menilai seseorang dari penampilannya'),nl.
			
    examine(_) :-
        write('Aku tidak melihat itu di sini.'),
        nl.
		
/* Rules untuk tunggu */
	tunggu :-
		at(bola_tenis,in_hand),
		write('Aku memutuskan untuk menunggu kepulangan Eka dengan bola tenis di tanganku.'), nl,
		write('Aku berhasil memberikan kebahagiaan pada kekasihku!'), nl,
		gambar(love),
		berhasil.
		
		
	tunggu :-
		gambar(game_over2),
		write('Aku memutuskan menunggu kepulangan Eka setelah semua ini.'), nl,
		write('Namun ternyata aku gagal memberikan yang terbaik.'), nl,
		gagal.
		
		
/* Rules untuk clue */
	clue(sopir) :-
		write('Aku memiliki teka-teki, di dalam sebuah keluarga ada seorang ayah, anak dan ibu,'),nl,
		write('Suatu hari, sang ayah bertanya, "Hari ini aku harus mengenakan pakaian apa?"'),nl,
		write('Di saat yang sama, sang anak juga bertanya, "Dimanakah aku harus meletakkan makanan ini?"'),nl,
		write('Sang ibu bisa menjawab pertanyaan tersebut dengan hanya sekali jawab.'),nl,
		write('Kira-kira apa jawaban sang ibu?'),nl,
		write('Gunakan perintah answer(sopir) untuk menjawab.'),!.
		
	clue(tukangkebun) :-
		write('Aku kesulitan berhitung, keponakanku punya satu pertanyaan yang tidak bisa aku jawab...'),nl,
		write('Suatu hari seorang pria ingin mengadakan makan malam bersama dengan kekasihnya.'),nl,
		write('Ia ingin mengadakan makan malam bersama dengan kekasihnya di rumahnya sendiri.'),nl,
		write('Agar lebih romantis, dia membuka jendela dengan pemandangan langit kota yang indah.'),nl,
		write('Agar lebih romantis lagi, dia tak lupa menyalakan 15 buah lilin.'),nl,
		write('Setelah itu, dia memutuskan untuk pergi meninggalkan ruangan dan mengambil makanan.'),nl,
		write('Setelah kembali, ternyata angin berhembus dan mematikan 6 buah lilin.'),nl,
		write('Kemudian dia memutuskan untuk mempercantik dekorasi ruangan, setelah selesai, ternyata'),nl,
		write('ada 2 buah lilin lagi yang sudah mati juga. Untuk memastikan agar lilin tidak ada yang'),nl,
		write('lagi, dia memutuskan untuk menutup jendela karena angin sudah mematikan cukup banyak lilin.'),nl,
		write('Akhirnya dia pun makan malam dengan kekasihnya. Karena mengantuk, dia tidak lagi mematikan lilin'),nl,
		write('dan tidak juga membereskan kamar, dan langsung memutuskan untuk pergi tidur.'),nl,
		write('Berapakah jumlah lilin yang tersisa pada akhirnya?'),nl,
		write('Gunakan perintah answer(tukangkebun) untuk menjawab.'),!.
		
	clue(depositbox) :-
		write('Jawaban dari teka-teki ini adalah password dari depositbox di bank ini.'),nl,
		write('It is greater than God and more evil than the devil.'),nl,
		write('Rich people need it, but poor people have it.'),nl,
		write('If you eat it, you will die, what is it?'),nl,
		write('Jawabannya pasti dalam Bahasa Inggris.'),nl,
		write('Gunakan perintah answer(depositbox) untuk menjawab.'),!.
		
	clue(diary) :-
		player(X),
		write('12 November 2016'),nl,nl,
		write('Hari ini seneng bangeeet :D hari ini bisa jalan bareng dia sambil ajak Blacky jalan juga.'),nl,
		write('Gak nyangka juga sih bisa liat '),write(X),write(' kecebur ke kali karena Blacky HAHAHA'),nl,
		write('Kasian sihh tapi untung aja gak ada luka juga wkwkwk, seru banget juga tadi Blacky akhirnya dapet temen '),nl,
		write('baru di taman wkwk, walaupun gatau juga sih tadi anjing siapa (?) tapi seneng deh liat Blacky seneng.'),nl,
		write('Tadi seru juga bisa main bareng sama Blacky dan '),write(X),write(' buat kejar-kejaran ambil bola tenis.'),nl,
		write('Tapi sayang bola tenisnya tadi ikutan kecemplung ke kali :( jadi gabisa main bola tenis bareng lagi deh.'),nl,
		write('Tapi gapapa deh yang penting semuanya bisa seneng :"), sebenernya itu bola tenis kesayangan aku...'),nl,
		write('Soalnya itu bola tenis hadiah dari '),write(X),write(' karena aku pernah menang lomba main tenis dulu.'),nl,
		write('Apalagi kalau inget itu sempet jadi hadiah anniversary jadian kita yang ke-3 taun (?)'),nl,
		write('Yaaaa, tapi yang penting aku masih bisa sama Blacky dan '),write(X),write(' udah seneng banget kok :D'),nl,
		write('OVERALL, THANK GOD, HARI INI AKU SENENGG :D, semoga ada hari lain lagi deh ya kayak hari ini.'),nl,!.
		
	clue(_).

	answer(Thing) :-
		i_am_at(Place),
		at(Thing,Place),
		notanswered(Thing),
		write('Apa jawabannya ?'),nl,
		read(Ans),
		(
		(((Thing==depositbox),(Ans==nothing)) -> ((retract(notanswered(depositbox))),(assertz(answered(depositbox))),write('Depositbox terbuka dan berisi 40000!'),nl,duit(X),(Y is (X+40000)),retract(duit(X)),assertz(duit(Y))));
		(((Thing==sopir),(Ans==kemeja)) -> ((retract(notanswered(sopir))),(assertz(answered(sopir))),write('Sopir : Yaa kamu benar! Ini aku berikan uang sebesar 30000!'),nl,duit(X),(Y is (X+40000)),retract(duit(X)),assertz(duit(Y))));
		(((Thing==tukangkebun),(Ans==8)) -> ((retract(notanswered(tukangkebun))),(assertz(answered(tukangkebun))),write('Tukang kebun : Wahh sepertinya kamu bener, ini uang buat kamu 10000'),nl,duit(X),(Y is (X+30000)),retract(duit(X)),assertz(duit(Y))));
		write('Aku : Aku rasa jawabannya salah...'),nl,!
		).
		
	answer(_) :-
		write('Kamu tidak bisa menjawab itu disini.'),nl.

/* Hiasan */
	gambar(judul_game):-
		write('                   .d8888b.  d8b          888                  888888b.            888             '), nl,
		write('                  d88P  Y88b Y8P          888                  888  "88b           888             '), nl,
		write('                  888    888              888                  888  .88P           888             '), nl,
		write('                  888        888 88888b.  888888  8888b.       8888888K.  888  888 888888  8888b.  '), nl,
		write('                  888        888 888 "88b 888        "88b      888  "Y88b 888  888 888        "88b '), nl,
		write('                  888    888 888 888  888 888    .d888888      888    888 888  888 888    .d888888 '), nl,
		write('                  Y88b  d88P 888 888  888 Y88b.  888  888      888   d88P Y88b 888 Y88b.  888  888 '), nl,
		write('                   "Y8888P"  888 888  888  "Y888 "Y888888      8888888P"   "Y88888  "Y888 "Y888888 '), nl, nl,
		write('                                                                          `-.'), nl,
		write('                                                                            .`'), nl,
		write('                                                                         _.`.`'), nl,
		write('                                                                     _.-` .`'), nl,
		write('                                                             ___.---` _.-`'), nl,
		write('                                                     __..---`___..---`'), nl,
		write('                                            _...--.-`   _.--`'), nl,
		write('                                        _.-`.-`.-`  _.-`'), nl,
		write('                                     .-` .`  .`   .`'), nl,
		write('                          .         /   /   /    /                    .'), nl,
		write('                          \\`-.._    |  |    \\    `.              _..-`/'), nl,
		write('                         .`-.._ ``--.._\\     `. -- `.      _..-``  _..-`.'), nl,
		write('                         `_    _       `-. .`        `. .-`      _    _`'), nl,
		write('                           `.``           .            \\          ``.`'), nl,
		write('                            `-.-`    _   .              :   _   `-.-`'), nl,
		write('                              `..-..`    ;       .` `.  `    `..-..`'), nl,
		write('                                  /      .      : .-. : :        \\'), nl,
		write('                                  `._     \\     ;( O ) /      _.`'), nl,
		write('                                     `-._.``.    .`-`.` `._.-`'), nl,
		write('                                             `-....-`'), nl.
			
	gambar(game_over):-
		write('                   #####                          #######                      '), nl,
		write('                  #     #   ##   #    # ######    #     # #    # ###### #####  '), nl,
		write('                  #        #  #  ##  ## #         #     # #    # #      #    # '), nl,
		write('                  #  #### #    # # ## # #####     #     # #    # #####  #    # '), nl,
		write('                  #     # ###### #    # #         #     # #    # #      #####  '), nl,
		write('                  #     # #    # #    # #         #     #  #  #  #      #   #  '), nl,
		write('                   #####  #    # #    # ######    #######   ##   ###### #    #'), nl, nl,
		write('               ...'), nl,
		write('             ;::::;'), nl,
		write('           ;::::; :;'), nl,
		write('         ;:::::;   :;'), nl,
		write('        ;:::::;     ;.'), nl,
		write('       ,:::::;       ;           OOO'), nl,
		write('       ::::::;       ;          OOOOO'), nl,
		write('       ;:::::;       ;         OOOOOOOO'), nl,
		write('      ,;::::::;     ;;         / OOOOOOO'), nl,
		write('    ;:::::::::`. ,,,;.        /  / DOOOOOO'), nl,
		write('  .;;:::::::::::::::::;,     /  /     DOOOO'), nl,
		write(' ,::::::;::::::;;;;::::;,   /  /        DOOO'), nl,
		write(';`::::::`;::::::;;;::::: ,#/  /          DOOO'), nl,
		write(':`:::::::`;::::::;;::: ;::#  /            DOOO'), nl,
		write('::`:::::::`;:::::::: ;::::# /              DOO'), nl,
		write('`:`:::::::`;:::::: ;::::::#/               DOO'), nl,
		write(' :::`:::::::`;; ;:::::::::##                OO'), nl,
		write(' ::::`:::::::`;::::::::;:::#                OO'), nl,
		write(' `:::::`::::::::::::;;`:;::#                O'), nl,
		write('  `:::::`::::::::;; /  / `:#'), nl,
		write('   ::::::`:::::;;  /  /   `#'), nl, nl, nl,
		write('By: Tim Valak'), nl,
		write('Credits ASCII Art: www.chris.com ').

	gambar(game_over2):-
		write('                   #####                          #######                      '), nl,
		write('                  #     #   ##   #    # ######    #     # #    # ###### #####  '), nl,
		write('                  #        #  #  ##  ## #         #     # #    # #      #    # '), nl,
		write('                  #  #### #    # # ## # #####     #     # #    # #####  #    # '), nl,
		write('                  #     # ###### #    # #         #     # #    # #      #####  '), nl,
		write('                  #     # #    # #    # #         #     #  #  #  #      #   #  '), nl,
		write('                   #####  #    # #    # ######    #######   ##   ###### #    #'), nl, nl,
		write('                                  ('), nl,
		write('                         .-```-..` \\                         Who the...??'), nl,
		write('               _______ .`       -   \\                           yikes!'), nl,
		write('             <<<<<<<< );__   ,,,_)   \\                      __ /'), nl,
		write('                <<<<<<<<< ) ;C  /     \\                /ZZZ`  )'), nl,
		write('                  <<<<<< (.-`-.  )====_)_=======>      .-````>>>>>>>>>>'), nl,
		write('                    <<<<< \\    ```````   )           .`    >>>>>>>>>'), nl,
		write('                    ;  <<<     .......__/       __\\_;    ,>>>>>>>'), nl,
		write('               .-```         (         )          / / (`"\\__'), nl,
		write('            .-`              ;.       /            (;/;) /\\'), nl,
		write('           /  .-`     .     =  .     /'), nl,
		write('       _-``\\_/         `. .`    .   /'), nl,
		write('    .-`  )  ;\\          ```.     . /'), nl,
		write('   ;   .````  `.       `    ;     ('), nl,
		write('   O -`        .```       .`              '), nl,
		write('             .`   .-``````                    '), nl,
		write('             `o-`                         '), nl, nl, nl,
		write('By: Tim Valak'), nl,
		write('Credits ASCII Art: www.chris.com ').
	
	gambar(love):-
		write('                        OOOOO          OOOOO'), nl,
		write('                       OO   OOO      OOO   OO'), nl,
		write('                       OO     OOO  OOO     OO'), nl,
		write('                        OOO     OOOO     OOO'), nl,
		write('      OOOOOO          OO  OOOOOO    OOOOOO  OO          OOOOOO'), nl,
		write('   OOOO    OOOOO   OOOO                      OOOO   OOOOO    OOOO'), nl,
		write('               OOOOO     VVVVVV      VVVVVV     OOOOO'), nl,
		write('                       VVVVVVVVVV  VVVVVVVVVV'), nl,
		write('                     VVVVVVVVVVVVVVVVVVVVVVVVVV'), nl,
		write('                     VVVVVVVVVVVVVVVVVVVVVVVVVV'), nl,
		write('        XXXXXX       VVVVVVVVVVVVVVVVVVVVVVVVVV      XXXXXXX'), nl,
		write('     XXXXXXXXXXX      VVVVVVVVVVVVVVVVVVVVVVVV      XXXXXXXXXXX'), nl,
		write('    XXXXXXXXXXXXX      VVVVVVVVVVVVVVVVVVVVVV      XXXXXXXXXXXXX'), nl,
		write('   XXXXXXXXXXXXXXXX     VVVVVVVVVVVVVVVVVVVV     XXXXXXXXXXXXXXXX'), nl,
		write('   XXXXXXXXXXXXXXXX      VVVVVVVVVVVVVVVVVV      XXXXXXXXXXXXXXXX'), nl,
		write('   XXXXXXXXXXXXXXXX     XXVVVVVVVVVVVVVVVVXX     XXXXXXXXXXXXXXXX'), nl,
		write('    XXXXXXXXXXXXXXXX    XXXVVVVVVVVVVVVVVXXX    XXXXXXXXXXXXXXXX'), nl,
		write('       XXXXXXXXXXX     XXXX VVVVVVVVVVVV XXXX     XXXXXXXXXXX'), nl,
		write('           XXXXXXX    XXXX   VVVVVVVVVV   XXXX    XXXXXXX'), nl,
		write('    XXXXXX  XXXXXXXXXXXXXX    VVVVVVVV    XXXXXXXXXXXXXX  XXXXXX'), nl,
		write('  XXXXXXXXXXXXXXXXXXXXXX       VVVVVV       XXXXXXXXXXXXXXXXXXXXXX'), nl,
		write(' XXXXXXXXXXXXXXXXXXXX           VVVV           XXXXXXXXXXXXXXXXXXXX'), nl,
		write('XX XXXXX XXXXXXXXXXXX            VV            XXXXXXXXXXXX XXXXX XX'), nl,
		write('X  X XX  XXXXXXXXXXXX                          XXXXXXXXXXXX  XX X  X'), nl,
		write('     X  XXXXXXXXXXXX                            XXXXXXXXXXXX  X'), nl,
		write('       XXXXXXXXXXXXX                            XXXXXXXXXXXXX'), nl,
		write('       XXXXXXXXXXXXXX                          XXXXXXXXXXXXXX'), nl,
		write('       XXXXXXXXXXXXXXX                        XXXXXXXXXXXXXXX'), nl,
		write('        XXXXXXXXXXXXXXX                      XXXXXXXXXXXXXXX'), nl,
		write('       XXXXXXX  XXXXXXXX                    XXXXXXXX  XXXXXXX'), nl,
		write('      XXXXXXX     XXXXXXX                  XXXXXXX     XXXXXXX'), nl,
		write(' XXXXXXXXXXX        XXXXXX                XXXXXX        XXXXXXXXXXX'), nl,
		write(' XXXXXXXXX           XXXXX                XXXXX           XXXXXXXXX'), nl,
		write(' XXXX                 XXXXX              XXXXX                 XXXX'), nl,
		write('  XXX                  XXXXX            XXXXX                  XXX'), nl,
		write('                        XXXX            XXXX'), nl, nl, nl,
		write('By: Tim Valak'), nl,
		write('Credits ASCII Art: www.chris.com '), nl.

	gambar(foto_eka):-
		write('-----------------------------------------------------------------'), nl,
		write(': + - \\ | / - \\ | / - \\ | / - \\ | / - \\ | / - \\ | / - \\ | / - + : '), nl,
		write(': | <-------------------------------------------------------> | :'), nl,
		write(': \\ :                                                       : - :'), nl,
		write(': | :                        _               \\\\,///         : / :'), nl,
		write(': / :                      _/_\\_   ___       \\\\|///         : | :'), nl,
		write(': - :                       (")   /.-.\\       (")\\\\         : \\ :'), nl,
		write(': \\ :             _        //U\\\\  |(")|      //-\\\\\\         : - :'), nl,
		write(': | :            ( )   _   \\|_|/  /)v(\\  <#>_/|_|/\\\\        : / :'), nl,
		write(': / :           (_` )_(`>   | |   \\/~\\/       |||\\\\\\        : | :'), nl,
		write(': / :           (__,~_)8    |||   //_\\\\       ||| \\\\        : \\ :'), nl,
		write(': - :     jgs      _YY_    _[|]_ /_____\\     _[|]_          : - :'), nl,
		write(': \\ :        """""""""""""""""""""""""""""""""""""""""""    : / :'), nl,
		write(': | <-------------------------------------------------------> | :'), nl,
		write(': + - / | \\ - / | \\ - / | \\ - / | \\ - / | \\ - / | \\ - / | \\ - + :'), nl,
		write('-----------------------------------------------------------------'), nl.
	
	gambar(motorbebek):-
		write('                                     ,-~ |'), nl,
		write('        ________________          o==]___|'), nl,
		write('       |                |            \\ \\'), nl,
		write('       |________________|            /\\ \\'), nl,
		write('  __  /  _,-----._      )           |  \\ \\.'), nl,
		write(' |_||/_-~         `.   /()          |  /|]_|_____'), nl,
		write('   |//              \\ |              \\/ /_-~     ~-_'), nl,
		write('   //________________||              / //___________\\'), nl,
		write('  //__|______________| \\____________/ //___/-\\ \\~-_'), nl,
		write(' ((_________________/_-o___________/_//___/  /\\,\\  \\'), nl,
		write('  |__/(  ((====)o===--~~                 (  ( (o/)  )'), nl,
		write('       \\  ``==` /                         \\  `--`  /'), nl,
		write('        `-.__,-`                           `-.__,-`'), nl.

