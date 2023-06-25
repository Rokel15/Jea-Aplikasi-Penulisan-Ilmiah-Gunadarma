class ArticleModel{
  String namaArticle;
  String pdfUrl;

  ArticleModel({
    required this.namaArticle,
    required this.pdfUrl,
  });
}

List<ArticleModel> listArticle = [
  ArticleModel(
    namaArticle: "Mengenal Peternakan Ayam dan Cara Mengelola Bisnisnya!",
    pdfUrl: 'assets/01 Mengenal Peternakan Ayam dan Cara Mengelola Bisnisnya!.pdf',
  ),
  ArticleModel(
    namaArticle: 'Rahasia Sukses Bisnis Ternak Ayam Kampung',
    pdfUrl: 'assets/02 Rahasia Sukses Bisnis Ternak Ayam Kampung.pdf',
  ),
  ArticleModel(
    namaArticle: 'MANFAAT TELUR BAGI TUBUH KITA',
    pdfUrl: 'assets/03 MANFAAT TELUR BAGI TUBUH KITA.pdf',
  ),
  ArticleModel(
    namaArticle: 'Cara Memilih Telur Ayam dengan Ciri yang Baik dan Normal',
    pdfUrl: 'assets/04 Cara Memilih Telur Ayam dengan Ciri yang Baik dan Normal.pdf',
  ),
  ArticleModel(
    namaArticle: '5 Manfaat Daging Ayam, Salah Satunya untuk Kesehatan Jantung',
    pdfUrl: 'assets/05 5 Manfaat Daging Ayam, Salah Satunya untuk Kesehatan Jantung.pdf',
  ),
  ArticleModel(
    namaArticle: 'Kandungan Gizi dan Manfaat daging ayam bagi kesehatan',
    pdfUrl: 'assets/06 Kandungan Gizi dan Manfaat daging ayam bagi kesehatan.pdf',
  ),
  ArticleModel(
    namaArticle: '7 Cara Memilih Daging Ayam Segar, Jangan Sampai Keliru!',
    pdfUrl: 'assets/07 7 Cara Memilih Daging Ayam Segar, Jangan Sampai Keliru!.pdf',
  )
];