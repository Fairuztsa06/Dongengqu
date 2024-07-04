class Dongeng {
  String? id;
  String judul;
  String penulis;
  int tahunTerbit;
  String isiCerita;
  String gambar;

  Dongeng({
    this.id,
    required this.judul,
    required this.penulis,
    required this.tahunTerbit,
    required this.isiCerita,
    required this.gambar,
  });

  factory Dongeng.fromJson(Map<String, dynamic> json) => Dongeng(
        id: json["id"],
        judul: json["judul"],
        penulis: json["penulis"],
        tahunTerbit: json["tahun_terbit"],
        isiCerita: json["isi_cerita"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "penulis": penulis,
        "tahun_terbit": tahunTerbit,
        "isi_cerita": isiCerita,
        "gambar": gambar,
      };
}
