// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfilKabupaten extends StatelessWidget {
  const ProfilKabupaten({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        color: Colors.transparent,
        elevation: 2,
        child: Container(
          width: double.infinity,
          height: 57,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              opacity: 0.7,
              fit: BoxFit.fitHeight,
              alignment: const AlignmentDirectional(1.00, 1.00),
              image: Image.asset(
                'assets/images/motif/motif_lapik2_top_right.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'PROFIL KABUPATEN',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ]),
          ),
        ),
      ).animate().fade().slide(),
      Expanded(child: _profilKab()
          // child: ListView.builder(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   itemCount: 7,
          //   itemBuilder: (context, index) => const CardJadwal(),
          // ),
          )
    ]);
  }
}

class _profilKab extends StatelessWidget {
  const _profilKab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    repeat: ImageRepeat.repeatX,
                    image: Image.asset(
                            'assets/images/motif/motif_lapik2_horizontal.png')
                        .image)),
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'KABUPATEN SIMEULUE',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
              )),
          // Container(
          //   width: 320,
          //   child: Image.asset(
          //     'assets/images/logo/pimpinan.png',
          //   ),
          // ),

          Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/logo/simeulue.png',
                  width: 130,
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Image.asset('assets/images/logo/bupati.png'),
                            Text(
                              'AHMADLYAH, SH',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              'Pj. BUPATI SIMEULUE',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Image.asset('assets/images/logo/sekda.png'),
                            Text(
                              'ASLUDIN, SE., M.Kes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              'Pj. SEKDA KABUPATEN SIMEULUE',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    repeat: ImageRepeat.repeatX,
                    image: Image.asset(
                            'assets/images/motif/motif_lapik2_horizontal.png')
                        .image)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    ' Visi dan Misi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Visi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    '“Terwujudnya Simeulue yang maju, Sejahtera dan bermartabat dalam bingkai masyarakat Madani”',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Misi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1.',
                    ),
                    Flexible(
                      child: Text(
                        'Meningkatkan kualitas pendidikan untuk menghasilkan sumberdaya manusia yang mapan, terampil, menguasai teknologi serta memiliki kepribadian yang terpuji, bertaqwa kepada Allah SWT.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2.',
                    ),
                    Flexible(
                      child: Text(
                        'Mewujudkan pelayanan kesehatan yang baik guna meningkatkan kualitas kesehatan masyarakat secara menyeluruh sampai ke pelosok desa.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3.',
                    ),
                    Flexible(
                      child: Text(
                        'Melakukan penataan birokrasi pemerintah yang lebih elegan, profesional dan seimbang.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4.',
                    ),
                    Flexible(
                      child: Text(
                        'Mengupayakan terwujudnya sarana dan prasarana infrastruktur daerah terutama yang bersentuhan langsung dengan kebutuhan masyarakat.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '5.',
                    ),
                    Flexible(
                      child: Text(
                        'Membangun pemerintah yang mantap, bersih dan berwibawa serta mendapat kepercayaan dari masyarakat.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6.',
                    ),
                    Flexible(
                      child: Text(
                        'Mendorong terlaksananya pembangunan mental spiritual masyarakat melalui kegiatan keagamaan, pelaksanaan Syari’at Islam serta mendorong agar serana keagamaan sekaligus berfungsi sebagai tempat pembinaan umat.',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '7.',
                    ),
                    Flexible(
                      child: Text(
                        'Menggali potensi sumber daya yang dimiliki sebagai pondasi peningkatan pendapatan daerah sekaligus menjadi daya tarik bagi wisatawan dan investor',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    repeat: ImageRepeat.repeatX,
                    image: Image.asset(
                            'assets/images/motif/motif_lapik2_horizontal.png')
                        .image)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Selayang Pandang Kabupaten Simeulue',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'A. Geografi Wilayah',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Text(
                  'Secara geografis Pulau Simeulue beserta pulau-pulau besar dan kecil disekitarnya terletak di wilayah pantai Barat Provinsi Aceh. Persisnya berjarak sekitar 105 mil laut dari Meulaboh Kabupaten Aceh Barat dan 85 mil laut dari Tapak Tuan Kabupaten Aceh Selatan dan berada pada posisi astronomi antara 020 15’13”- 020 55’04 Lintang Utara dan 950 40’15”- 960 30’45” Bujut Timur (Andri, 2008; Sanny, 2007; Roesli, 2017). Dengan posisi tersebut dapat dikatakan bahwa Pulau Simeulue merupakan gugus kepulauan terdepan dan terluar dari Wilayah Negara Kesatuan Republik Indonesia yang langsung berbatasan dengan perairan international dan dikelilingi oleh Samudera Hindia.',
                  textAlign: TextAlign.justify,
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'B. Budaya dan Bahasa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Text(
                        'Berbicara mengenai budaya dan bahasa, dalam buku ini disatukan dalam sebuah tema karena kedua elemen ini tidak dapat dipisahkan satu dengan lainnya, berhubungan erat dan berperan sentral dalam pewarisan budaya masyarakat itu sendiri. Meskipun harus diakui bahwa suatu budaya dapat berkembang sedemikian rupa berkat adanya bahasa. Bahkan, bahasa merupakan elemen utama yang dapat atau tidak dapat menumbuh-kembangkan suatu budaya. \n\n Pada umumnya dikenal ada tiga bahasa lokal yang dipakai penduduk Simeulue sebagai media komunikasi keseharian mereka. Simeulue sebagai media komunikasi seharian mereka. Ketiga bahasa tersebut yaitu bahasa Devayan/Simulul, bahasa Lamamek/Sigulai dan bahasa Leukon. Bahasa Devayan/Simulul pada umumnya digunakan oleh penduduk yang bermukim dikecamatan Simeulue Timur, Simeulue Tengah, Teupah Barat, Teluk Dalam, Teupah Selatan, Teupah Tengah dan Simeulue Cut. Bahasa Lamamek/Sigulai digunakan oleh penduduk yang bermukim dikecamatan Simeulue Barat, Salang dan Kecamatan Alafan. Sedangkan bahasa Leukon digunakan oleh penduduk yang berdomisili didesa Lafakha dan Langi kecamatan Alafan. \n\n Meskipun penutur ketiga bahasa ini tidak sepenuhnya bisa saling mengerti atau memahami secara total, penduduk Simeulue diuntungkan dengan adanya bahasa yang relatif berfungsi sebagai pemersatu untuk masyarakat kepulauan Simeulue, bahasa ini dalam menjembatani antar penduduk dalam berkomunikasi satu sama lainnya bagaikan bahasa “nasional” yaitu bahasa Aneuk Jamee yang bila dikaji secara morfologis merupakan turunan bahasa Minangkabau walaupun masih banyak perbedaannya disana sini. \n\n Sebagaimana telah diuraikan terdahulu, bahwa penduduk Simeulue sangatlah majemuk, hal ini dikarenakan adanya percampuran berbagai suku yang mendiami pulau ini sejak zaman dahulu kala sebagai penduduk awal. Ada yang berasal dari Aceh, Batak/Tapanuli, Nias, Minang bahkan juga dari pulau Jawa dan daerah lainnya di Indonesia. Maka oleh karena itu, secara garis besar dikenal ada beberapa suku yang mendiami pulau Simeulue berdasarkan asal usul daerah dari mana mereka datang. Suku-suku induk tersebut adalah; suku Aceh yang berasal dari daratan Aceh dan sebagian besar dari Aceh Besar terutama pada masa kesultanan Aceh, Suku Dainang yang diketahui berasal dari Tapanuli Selatan, suku Da’awa yang diketahui berasal dari Tapanuli Utara, suku Dagang yang berasal dari Minangkabau, suku Fengawen yang diduga berasal dari Jawa, suku Lanteng yang berasal dari Bugis dan suku Abon yang diperkirakan dari Ambon. Selain dari suku-suku tersebut diatas, dikalangan masyarakat masih dikenal beberapa suku lagi antara lain; suku Habu, suku Habsyi, suku Lasali, suku Manjungkan, suku Pamuncak, dan suku Bolawa. \n\n Karena majemuknya penduduk yang mendiami Simeulue, maka corak kehidupan masyarakat dan kultur yang tumbuh dan terbentuk dari akulturasi budaya yang dibawa membentuk pula budaya baru di Pulau Simeulue, hal ini dapat diketahui dari bahasa yang memiliki kesamaan dari akar bahasa asalnya dengan bahasa di Simeulue. \n\n Dalam hal ini seni dan budaya, karena Simeulue merupakan daerah pesisir dan penduduknya pun terdiri dari berbagai etnis dan suku yang sangat majemuk, maka corak dan jenis keseniannya juga banyak diwarnai oleh seni dan budaya penduduk awal Simeulue sejak dahulu kala. Sebut saja kesenian debus, angguk dan mincar yang lebih diwarnai oleh kesenian dari Aceh, nandong, nanga-nanga, tonjon dan sebagainya yang menggunakan bahasa minang atau aneuk jamee tentunya diwarnai oleh kesenian yang dibawa oleh perantau-perantau Minang dahulu kala sehingga timbul akulturasi budaya yang kental dengan dialek Simeulue nya. Demikian juga kesenian tari andalas atau sikambang yang dikenal merupakan tariah daerah pesisir pantai barat Sumatera dengan daerah sebarannya seperti Sibolga, Barus (Tapanuli Tengah), Singkil dan Tapak Tuan, telah pula menjadi bagian dari seni dan budaya yang ada di Simeulue. \n\n Disamping sumber daya alam laut dan hutannya, Simeulue dikenal juga dengan hasil ternak kerbaunya dengan populasi yang relatif tinggi. Ternak kerbau tersebut selain untuk konsumsi lokal juga diantar pulau kan ke Provinsi Riau, Sumatera Barat, Sibolga, Aceh Barat dan Aceh Selatan baik untuk konsumsi sehari-hari maupun sebagai hewan kurban. \n\n \n\n Sumber daya alam hutan dan laut dan lain-lainnya tersebut adalah merupakan ladang emas yang masih berupan potensi ekonomi saja yang belum dikelola sedemikian rupa menjadi kekuatan ekonomi masyarakat yang produktif dalam berbagai produk-produk hilir atau hasil olahan dalam rangka perbaikan ekonomi dan taraf hidup rakyat. \n\n Sebagaimana dimaklumi bahwa hasil hutan di Simeulue menimbulkan daya tarik tersendiri dalam dunia Usaha dan perdagangan, bahkan sebagaimana telah disebutkan diawal bab ini pihak kerajaan Belanda pun sangat tertarik akan potensi hasil hutan kayu di pulau Simeulue. Hal ini ditandai dengan adanya perjalanan seorang mantan Residen dari Tapanuli pada tahun 1854 yang lalu yaitu F.H.J. Netcher mengunjungi Pulau Simeulue dan dilanjutkan oleh K.F.H van Langen pada tahun 1981 dalam rangka ekspedisi persiapan ekploitasi kayu. Kunjungan-kunjungan tersebut adalah mengingat pulau ini merupakan wilayah yang strategis serta memiliki hasil hutan yang baik kualitasnnya. Hingga era tahun 2080an kayu dari Simeulue masih menjadi inceran dunia bisnis perkayuan oleh pengusaha-pengusaha pemegang izin HPH (Hak Pengusahaan Hutan) dan HPHH (Hak Pemungutan Hasil Hutan Ikutan) baik dari Jakarta, Medan maupun Banda Aceh. \n\n Secara kronologis tahapan perjuangan politik rakyat Simeulue menuju sebuah Kabupaten adalah dimulai dari dilaksanakannya Kongres Rakyat Simeulue tahun 1957 sebagai pondasi awal, 6 (enam) tahun kemudian dilaksanakan pula Musyawarah Luan Balu pada tahun 1963 dengan tema inti masalah Pertanian. Kendatipun tidak beraroma politik sebagaimana Kongres Rakyat Simeulue pada tahun 1957, tetapi terlaksananya musyawarah Luan Balu tidak dapat di pisahkan dari perjuangan rakyat menuju otonomi. Selang sekitar 17 tahun, dilaksanakan pula pertemuan mengalami vacuum selama 15 tahun, maka perjuangan ini digerakkan kembali pada tahun 1995, sehingga secara keseluruhan menghabiskan waktu selama 38 tahun. \n\n Buah perjuangan dari tokoh-tokoh politik, tokoh masyarakat, tokoh pemuda dan pengusaha bersama pemerintah Simeulue baik melalui jalur politik maupun administrasi pemerintahan serta lobi-lobi yang kuat, akhirnya membuahkan hasil dengan terbitnya Peraturan Presiden Nomor 53 Tahun 1996 tanggal 13 Agustus 1996 tentang Pembentukan Kabupaten Administratif Simeulue. \n\n Waktu terus berganti, demikian juga pemerintahan di Simeulue, pada tahun 1999 terjadi pergantian pimpinan dari Drs. Muhammad Amin kepada T. Yusuf, SH. Pada periode ini upaya yang telah dirintis oleh Bupati Simeulue sebelumnya terus dilakukan bersama-sama tokoh masyarakat pemuda, pengusaha dan partai politik. \n\n Setelah melalui perjuangan yang gigih dan melelahkan serta berkat kebersamaan seluruh komponen masyarakat dan pemerintah, akhirnya dambaan yang dinanti-nantikan tersebut yaitu sebuah predikat otonomi untuk Kabupaten Simeulue, atas ridha dan rahmat Allah SWT membuahkan hasil dan menjadi kenyataan yaitu dengan disahkannya Undang-Undang Nomor 48 Tahun 1999 tentang Pembentukan Kabupaten Bireuen dan Kabupaten Simeulue pada tanggal 12 Oktober 1999. \n\n Upacara peresmian Kabupaten Simeulue sebagai daerah tingkat II otonom dilaksanakan pada tanggal 12 Oktober 1999 oleh Menteri Dalam Negeri Ad Interim Faisal Tanjung di aula Departemen Dalam Negeri Jakarta dengan dihadiri oleh Bupati Simeulue T. Yusuf, SH beserta para tokoh dari Simeulue yang terdiri dari; Drs. Syafii Agur, Kepala Kantor Sosial Politik Kabupaten Simeulue, Azharuddin Agur, S.Pd, Ketua DPD Golkar Kabupaten Simeulue, T.M. Hasbi Mahmud, Ketua DPD Partai Amanat Nasional Kabupaten Simeulue, Umar Darwis, Ketua DPD Partai Persatuan Pembangunan Kabupaten Simeulue, Rasyidinsyah, HS, Ketua DPD Partai Demokrasi Indonesia Perjuangan Kabupaten Simeulue dan T. Satri Mandala atas nama tokoh masyarakat dan pemuda.\n\n Setahun setelah diresmikan sebagai kabupaten otonom, para pimpinan partai politik di Simeulue sepakat untuk memperjuangkan adanya dewan perwakilan rakyat sebagai kelengkapan pokok sebuah daerah otonom dalam menyelenggarakan urusan rumah tangga daerah. Untuk mewujudkan hal tersebut, 16 (enam belas) partai politik hasil pemilu tahun 1999 dan juga KNPI Simeulue sepakat menyurati Menteri Dalam Negeri c/q Direktur Jendral Pemerintahan Umum dan Otonom Daerah dan Gubernur Kepala Daerah Istimewa Aceh perihan pembentukan dewan perwakilan rakyat daerah Kabupaten Simeulue dengan diantar langsung oleh beberapa orang tokoh pimpinan partai politik yang ada dengan didampingi oleh unsure pemerintah, dalam hal ini Kepala Kantor Sosial dan Politik Kabupaten Simeulue. \n\n Perjuangan tersebut segera membuahkan hasil dengan terbitnya surat keputusan Gubernur Kepala Daerah Istimewah Aceh Nomor :171.2/442/2000 tanggal, 30 November 2000, tentang peresmian pengangkatan keanggotaan Dewan Perwakilan Rakyat Daerah Kabupaten Simeulue dan sejak itu dengan resmi terbentuklah lembaga Dewan Perwakilan Rakyat Kabupaten Simeulue dan selanjutnya pada tanggal 5 Januari 2021 dilantiklah 20 (dua puluh) orang anggota DPRD Kabupaten Simeulue yang perdana oleh Gubernur Kepada Daerah Istimewah Aceh periode 2000-2004. \n\n Dengan terbentuknya lembaga Dewan Perwakilan Rakyat Daerah Kabupaten Simeulue dan terpilihnya 20 (dua puluh) orang anggota legislatif yang disusul dengan terpilihnya pimpinan dewan dan terbentuknya alat kelengkapan dewan pada Dewan Perwakilan Rakyat Daerah Kabupaten Simeulue, maka telah sampailah dengan sempurna perjuangan rakyat Simeulue pada titik harapannya yang dimulai dari Kongres Rakyat Simeulue Tahun 1980 dan upaya pemerintah bersama rakyat Simeulue yang dimulai kembali pada tahun 1995.',
                        textAlign: TextAlign.justify)),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Sumber Buku Panduan MTQ Aceh XXXVI 2023 Kab. Simeulue',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
