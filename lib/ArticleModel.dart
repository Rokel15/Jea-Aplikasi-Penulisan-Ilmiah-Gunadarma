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
    namaArticle: "CCNA class.pdf",
    pdfUrl: 'assets/CCNA class.pdf',
  ),
  ArticleModel(
    namaArticle: 'CCNA Lab Guide Nixtrain_1st Edition_Full Version.pdf',
    pdfUrl: 'assets/CCNA Lab Guide Nixtrain_1st Edition_Full Version.pdf',
  ),
  ArticleModel(
    namaArticle: 'CCNA MQ IT ACAADEMY 17 agustus.pdf',
    pdfUrl: 'assetes/CCNA MQ IT ACAADEMY 17 agustus.pdf',
  ),
  ArticleModel(
    namaArticle: 'ccna-ibrahim-smktarunabhaktidepok.pdf',
    pdfUrl: 'assets/ccna-ibrahim-smktarunabhaktidepok.pdf',
  ),
  ArticleModel(
    namaArticle: 'ccna-taufik-smk7semarang.pdf',
    pdfUrl: 'assets/ccna-taufik-smk7semarang.pdf',
  ),
  ArticleModel(
    namaArticle: 'ccnp (1).pdf',
    pdfUrl: 'assets/ccnp (1).pdf',
  ),
  ArticleModel(
    namaArticle: 'CCNP EIGRP.pdf',
    pdfUrl: 'assets/CCNP EIGRP.pdf',
  )
];