import 'package:godigi/data/data.dart';

final dummyAirportData = [
  AirportModel(airportId: 'CGK', airportName: 'Airport Name In Indonesia'),
  AirportModel(airportId: 'DPS', airportName: 'Airport Name In Indonesia'),
  AirportModel(airportId: 'KNO', airportName: 'Airport Name In Indonesia'),
  AirportModel(airportId: 'DPK', airportName: 'Airport Name In Indonesia'),
  AirportModel(airportId: 'KPS', airportName: 'Airport Name In Indonesia'),
  AirportModel(airportId: 'JNO', airportName: 'Airport Name In Indonesia'),
];

final dummyBannerData = [
  const BannerModel(
    content: 'Welcome to GoDigital! Enjoy the best digital experience for your journey.',
  ),
  const BannerModel(
    content: 'Get the latest information about airport facilities and our newest services.',
  ),
  const BannerModel(
    content: 'Explore exciting destinations with complete guides from GoDigital.',
  ),
];

final dummyIrregularitiesData = [
  IrregularityModel(
    irregularityId: 1,
    title: 'Check-in System Disruption Terminal 2',
    publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
    content:
        'Check-in system at Terminal 2 is experiencing temporary disruption. Technical team is performing repairs.',
    informationType: InformationType.goAround,
  ),
  IrregularityModel(
    irregularityId: 2,
    title: 'Temporary Closure of Gate A12',
    publishedAt: DateTime.now().subtract(const Duration(hours: 4)),
    content:
        'Gate A12 is temporarily closed for routine maintenance. Passengers are redirected to the nearest gate.',
    informationType: InformationType.goAround,
  ),
  IrregularityModel(
    irregularityId: 3,
    title: 'Flight JT-610 Delay',
    publishedAt: DateTime.now().subtract(const Duration(hours: 6)),
    content:
        'Flight JT-610 is delayed by 30 minutes due to bad weather at the destination airport.',
    informationType: InformationType.goAround,
  ),
];

final dummyAirportFacilityData = [
  const AirportFacilityModel(
    imageUrl: 'https://place.abh.ai/s3fs-public/placeholder/DSC_0089_400x400.JPG',
    name: 'Food Court Terminal 1',
    activeCount: 15,
    tags: ['Food', 'Beverages', 'Halal'],
  ),
  const AirportFacilityModel(
    imageUrl: 'https://place.abh.ai/s3fs-public/placeholder/DSC_0364_400x400.JPG',
    name: 'Duty Free Shop',
    activeCount: 8,
    tags: ['Shopping', 'Perfume', 'Chocolate'],
  ),
  const AirportFacilityModel(
    imageUrl: 'https://place.abh.ai/s3fs-public/placeholder/DSC_0062_0_400x400.jpeg',
    name: 'Executive Lounge',
    activeCount: 25,
    tags: ['VIP', 'WiFi', 'Food'],
  ),
  const AirportFacilityModel(
    imageUrl: 'https://place.abh.ai/s3fs-public/placeholder/DSC_0277_400x400.JPG',
    name: 'ATM Center',
    activeCount: 12,
    tags: ['Banking', 'Cash', '24 Hours'],
  ),
];

final dummyArticleData = [
  ArticleModel(
    articleId: 0,
    author: 'Alice Smith',
    title: 'Pertahankan Predikat Badan Publik "Informatif", InJourney: Kolaborasi Jadi Kunci',
    url: 'https://place.abh.ai/s3fs-public/placeholder/DSC_0461_400x400.JPG',
    publishedAt: DateTime.parse('2025-09-14T09:00:00Z'),
    content: '''
Jakarta, 17 Desember 2024 – PT Aviasi Pariwisata Indonesia (Persero) atau InJourney kembali mendapatkan predikat Badan Publik "Informatif" dari Komisi Informasi Pusat (KIP) Republik Indonesia. Ini merupakan tahun kedua InJourney mendapatkan predikat "Informatif" dari KIP. Predikat "Informatif" yang diraih selama dua tahun berturut-turut ini mengukuhkan posisi InJourney sebagai BUMN yang senantiasa mengedepankan informasi sebagai bagian dari transparansi dan akuntabilitas. 

"InJourney yang baru berdiri selama 3 tahun berhasil meraih predikat Informatif selama dua tahun berturut-turut. Ini merupakan bukti nyata komitmen InJourney untuk menjadi perusahaan yang terbuka dan menerapkan tata kelola perusahaan yang baik atau Good Corporate Governance (GCG), khususnya asas transparansi," kata Herdy Harman, Direktur SDM dan Digital InJourney. 

InJourney mendapatkan predikat Informatif setelah mengantongi skor 94,87 untuk tahun 2024. Pada tahun 2022, InJourney yang baru berusia satu tahun masih mendapatkan skor 17,68 atau Tidak Informatif. InJourney kemudian menyusun sejumlah langkah strategis dan inovasi-inovasi untuk mewujudkan keterbukaan informasi. Hasilnya, pada tahun 2023 InJourney langsung melesat dengan skor 91,11, sehingga mendapatkan predikat Informatif untuk pertama kalinya. 

Pada tahun 2024, KIP memberikan predikat informatif untuk 162 Badan Publik, yang berarti 44,63 persen dari total 363 Badan Publik. Jumlah ini meningkat signifikan dibandingkan tahun 2023 yang mencatat 139 Badan Publik masuk predikat informatif. Ketua Komisi Informasi Pusat, Donny Yoesgiantoro memberikan apresiasinya kepada Badan Publik yang berhasil mendapatkan predikat Informatif ini.

"KIP menyampaikan terima kasih dan apresiasi kepada seluruh pimpinan badan publik yang telah berpartisipasi dan berkomitmen dalam mewujudkan transparansi informasi. Kami berharap, Badan Publik Informatif dapat menjadi pemicu badan publik lainnya untuk memperbaiki pelayanan informasi kepada masyarakat," kata Ketua KI Pusat, Donny Yoesgiantoro.

Berdasarkan UU No 14 Tahun 2008, KIP bertugas menetapkan Standar Teknis Layanan Informasi Publik di lingkungan Badan Publik di Indonesia. Hal ini untuk menjamin setiap warga negara mendapatkan hak asasinya untuk berkomunikasi dan memperoleh informasi untuk mengembangkan pribadi dan lingkungan sosialnya, serta berhak untuk mencari, memperoleh, memiliki, menyimpan, mengolah, dan menyampaikan informasi dengan menggunakan segala jenis saluran yang tersedia.

Pada tahun 2024, InJourney melanjutkan berbagai strategi untuk mewujudkan ekosistem pelayanan informasi publik yang informatif dan kolaboratif di lingkungan InJourney Group. Prosesnya antara lain dilakukan dengan melakukan evaluasi PPID di InJourney Group, melaksanakan program edukasi keterbukaan informasi publik, monitoring dan evaluasi PPID, inovasi saluran komunikasi PPID serta kolaborasi dalam penyediaan konten-konten komunikasi.

Sebagai program social movement, tim PPID InJourney Group juga terlibat aktif dalam peningkatan literasi masyarakat. Salah satunya dilakukan dengan memberikan donasi 300 buku bacaan untuk SDN 02 Prambanan di Jawa Tengah. Donasi dilakukan InJourney bersama dengan anak usahanya, PT Taman Wisata Candi Borobudur, Prambanan, dan Ratu Boko (TWC) atau InJourney Destination Management. Program tersebut juga sekaligus merupakan bagian dari kegiatan Tanggung Jawab Sosial dan Lingkungan (TJSL) yakni InJourney Peduli Literasi.

"Ke depan, InJourney akan terus melakukan berbagai strategi untuk meningkatkan keterbukaan informasi publik. Melalui langkah ini, kami berharap InJourney menjadi BUMN yang semakin kuat kinerjanya, didukung oleh transparansi dan akuntabilitas yang baik," tutup Herdy Harman.
''',
    informationType: InformationType.event,
  ),
  ArticleModel(
    articleId: 1,
    author: 'Bob Johnson',
    title: 'Pertahankan Predikat Badan Publik "Informatif", InJourney: Kolaborasi Jadi Kunci',
    url: 'https://place.abh.ai/s3fs-public/placeholder/road-to-nowhere_400x400.jpeg',
    publishedAt: DateTime.parse('2025-09-13T15:30:00Z'),
    content: '''
Jakarta, 17 Desember 2024 – PT Aviasi Pariwisata Indonesia (Persero) atau InJourney kembali mendapatkan predikat Badan Publik "Informatif" dari Komisi Informasi Pusat (KIP) Republik Indonesia. Ini merupakan tahun kedua InJourney mendapatkan predikat "Informatif" dari KIP. Predikat "Informatif" yang diraih selama dua tahun berturut-turut ini mengukuhkan posisi InJourney sebagai BUMN yang senantiasa mengedepankan informasi sebagai bagian dari transparansi dan akuntabilitas. 

"InJourney yang baru berdiri selama 3 tahun berhasil meraih predikat Informatif selama dua tahun berturut-turut. Ini merupakan bukti nyata komitmen InJourney untuk menjadi perusahaan yang terbuka dan menerapkan tata kelola perusahaan yang baik atau Good Corporate Governance (GCG), khususnya asas transparansi," kata Herdy Harman, Direktur SDM dan Digital InJourney. 

InJourney mendapatkan predikat Informatif setelah mengantongi skor 94,87 untuk tahun 2024. Pada tahun 2022, InJourney yang baru berusia satu tahun masih mendapatkan skor 17,68 atau Tidak Informatif. InJourney kemudian menyusun sejumlah langkah strategis dan inovasi-inovasi untuk mewujudkan keterbukaan informasi. Hasilnya, pada tahun 2023 InJourney langsung melesat dengan skor 91,11, sehingga mendapatkan predikat Informatif untuk pertama kalinya. 

Pada tahun 2024, KIP memberikan predikat informatif untuk 162 Badan Publik, yang berarti 44,63 persen dari total 363 Badan Publik. Jumlah ini meningkat signifikan dibandingkan tahun 2023 yang mencatat 139 Badan Publik masuk predikat informatif. Ketua Komisi Informasi Pusat, Donny Yoesgiantoro memberikan apresiasinya kepada Badan Publik yang berhasil mendapatkan predikat Informatif ini.

"KIP menyampaikan terima kasih dan apresiasi kepada seluruh pimpinan badan publik yang telah berpartisipasi dan berkomitmen dalam mewujudkan transparansi informasi. Kami berharap, Badan Publik Informatif dapat menjadi pemicu badan publik lainnya untuk memperbaiki pelayanan informasi kepada masyarakat," kata Ketua KI Pusat, Donny Yoesgiantoro.

Berdasarkan UU No 14 Tahun 2008, KIP bertugas menetapkan Standar Teknis Layanan Informasi Publik di lingkungan Badan Publik di Indonesia. Hal ini untuk menjamin setiap warga negara mendapatkan hak asasinya untuk berkomunikasi dan memperoleh informasi untuk mengembangkan pribadi dan lingkungan sosialnya, serta berhak untuk mencari, memperoleh, memiliki, menyimpan, mengolah, dan menyampaikan informasi dengan menggunakan segala jenis saluran yang tersedia.

Pada tahun 2024, InJourney melanjutkan berbagai strategi untuk mewujudkan ekosistem pelayanan informasi publik yang informatif dan kolaboratif di lingkungan InJourney Group. Prosesnya antara lain dilakukan dengan melakukan evaluasi PPID di InJourney Group, melaksanakan program edukasi keterbukaan informasi publik, monitoring dan evaluasi PPID, inovasi saluran komunikasi PPID serta kolaborasi dalam penyediaan konten-konten komunikasi.

Sebagai program social movement, tim PPID InJourney Group juga terlibat aktif dalam peningkatan literasi masyarakat. Salah satunya dilakukan dengan memberikan donasi 300 buku bacaan untuk SDN 02 Prambanan di Jawa Tengah. Donasi dilakukan InJourney bersama dengan anak usahanya, PT Taman Wisata Candi Borobudur, Prambanan, dan Ratu Boko (TWC) atau InJourney Destination Management. Program tersebut juga sekaligus merupakan bagian dari kegiatan Tanggung Jawab Sosial dan Lingkungan (TJSL) yakni InJourney Peduli Literasi.

"Ke depan, InJourney akan terus melakukan berbagai strategi untuk meningkatkan keterbukaan informasi publik. Melalui langkah ini, kami berharap InJourney menjadi BUMN yang semakin kuat kinerjanya, didukung oleh transparansi dan akuntabilitas yang baik," tutup Herdy Harman.
''',
    informationType: InformationType.event,
  ),
  ArticleModel(
    articleId: 2,
    author: 'Charlie Brown',
    title:
        'Ajak Masyarakat Rayakan Libur Akhir Tahun, InJourney Destinations Hadirkan Pengalaman Berkesan di Borobudur, Prambanan, dan TMII',
    url: 'https://place.abh.ai/s3fs-public/placeholder/PXL_20230505_201332767_400x400.jpg',
    publishedAt: DateTime.parse('2025-09-12T18:45:00Z'),
    content: '''
Jakarta, 17 Desember 2024 – PT Aviasi Pariwisata Indonesia (Persero) atau InJourney kembali mendapatkan predikat Badan Publik "Informatif" dari Komisi Informasi Pusat (KIP) Republik Indonesia. Ini merupakan tahun kedua InJourney mendapatkan predikat "Informatif" dari KIP. Predikat "Informatif" yang diraih selama dua tahun berturut-turut ini mengukuhkan posisi InJourney sebagai BUMN yang senantiasa mengedepankan informasi sebagai bagian dari transparansi dan akuntabilitas. 

"InJourney yang baru berdiri selama 3 tahun berhasil meraih predikat Informatif selama dua tahun berturut-turut. Ini merupakan bukti nyata komitmen InJourney untuk menjadi perusahaan yang terbuka dan menerapkan tata kelola perusahaan yang baik atau Good Corporate Governance (GCG), khususnya asas transparansi," kata Herdy Harman, Direktur SDM dan Digital InJourney. 

InJourney mendapatkan predikat Informatif setelah mengantongi skor 94,87 untuk tahun 2024. Pada tahun 2022, InJourney yang baru berusia satu tahun masih mendapatkan skor 17,68 atau Tidak Informatif. InJourney kemudian menyusun sejumlah langkah strategis dan inovasi-inovasi untuk mewujudkan keterbukaan informasi. Hasilnya, pada tahun 2023 InJourney langsung melesat dengan skor 91,11, sehingga mendapatkan predikat Informatif untuk pertama kalinya. 

Pada tahun 2024, KIP memberikan predikat informatif untuk 162 Badan Publik, yang berarti 44,63 persen dari total 363 Badan Publik. Jumlah ini meningkat signifikan dibandingkan tahun 2023 yang mencatat 139 Badan Publik masuk predikat informatif. Ketua Komisi Informasi Pusat, Donny Yoesgiantoro memberikan apresiasinya kepada Badan Publik yang berhasil mendapatkan predikat Informatif ini.

"KIP menyampaikan terima kasih dan apresiasi kepada seluruh pimpinan badan publik yang telah berpartisipasi dan berkomitmen dalam mewujudkan transparansi informasi. Kami berharap, Badan Publik Informatif dapat menjadi pemicu badan publik lainnya untuk memperbaiki pelayanan informasi kepada masyarakat," kata Ketua KI Pusat, Donny Yoesgiantoro.

Berdasarkan UU No 14 Tahun 2008, KIP bertugas menetapkan Standar Teknis Layanan Informasi Publik di lingkungan Badan Publik di Indonesia. Hal ini untuk menjamin setiap warga negara mendapatkan hak asasinya untuk berkomunikasi dan memperoleh informasi untuk mengembangkan pribadi dan lingkungan sosialnya, serta berhak untuk mencari, memperoleh, memiliki, menyimpan, mengolah, dan menyampaikan informasi dengan menggunakan segala jenis saluran yang tersedia.

Pada tahun 2024, InJourney melanjutkan berbagai strategi untuk mewujudkan ekosistem pelayanan informasi publik yang informatif dan kolaboratif di lingkungan InJourney Group. Prosesnya antara lain dilakukan dengan melakukan evaluasi PPID di InJourney Group, melaksanakan program edukasi keterbukaan informasi publik, monitoring dan evaluasi PPID, inovasi saluran komunikasi PPID serta kolaborasi dalam penyediaan konten-konten komunikasi.

Sebagai program social movement, tim PPID InJourney Group juga terlibat aktif dalam peningkatan literasi masyarakat. Salah satunya dilakukan dengan memberikan donasi 300 buku bacaan untuk SDN 02 Prambanan di Jawa Tengah. Donasi dilakukan InJourney bersama dengan anak usahanya, PT Taman Wisata Candi Borobudur, Prambanan, dan Ratu Boko (TWC) atau InJourney Destination Management. Program tersebut juga sekaligus merupakan bagian dari kegiatan Tanggung Jawab Sosial dan Lingkungan (TJSL) yakni InJourney Peduli Literasi.

"Ke depan, InJourney akan terus melakukan berbagai strategi untuk meningkatkan keterbukaan informasi publik. Melalui langkah ini, kami berharap InJourney menjadi BUMN yang semakin kuat kinerjanya, didukung oleh transparansi dan akuntabilitas yang baik," tutup Herdy Harman.
''',
    informationType: InformationType.event,
  ),
  ArticleModel(
    articleId: 3,
    author: 'Dana White',
    title:
        'Ajak Masyarakat Rayakan Libur Akhir Tahun, InJourney Destinations Hadirkan Pengalaman Berkesan di Borobudur, Prambanan, dan TMII',
    url: 'https://place.abh.ai/s3fs-public/placeholder/DSC_0325_400x400.JPG',
    publishedAt: DateTime.parse('2025-09-11T20:10:00Z'),
    content: '''
Jakarta, 17 Desember 2024 – PT Aviasi Pariwisata Indonesia (Persero) atau InJourney kembali mendapatkan predikat Badan Publik "Informatif" dari Komisi Informasi Pusat (KIP) Republik Indonesia. Ini merupakan tahun kedua InJourney mendapatkan predikat "Informatif" dari KIP. Predikat "Informatif" yang diraih selama dua tahun berturut-turut ini mengukuhkan posisi InJourney sebagai BUMN yang senantiasa mengedepankan informasi sebagai bagian dari transparansi dan akuntabilitas. 

"InJourney yang baru berdiri selama 3 tahun berhasil meraih predikat Informatif selama dua tahun berturut-turut. Ini merupakan bukti nyata komitmen InJourney untuk menjadi perusahaan yang terbuka dan menerapkan tata kelola perusahaan yang baik atau Good Corporate Governance (GCG), khususnya asas transparansi," kata Herdy Harman, Direktur SDM dan Digital InJourney. 

InJourney mendapatkan predikat Informatif setelah mengantongi skor 94,87 untuk tahun 2024. Pada tahun 2022, InJourney yang baru berusia satu tahun masih mendapatkan skor 17,68 atau Tidak Informatif. InJourney kemudian menyusun sejumlah langkah strategis dan inovasi-inovasi untuk mewujudkan keterbukaan informasi. Hasilnya, pada tahun 2023 InJourney langsung melesat dengan skor 91,11, sehingga mendapatkan predikat Informatif untuk pertama kalinya. 

Pada tahun 2024, KIP memberikan predikat informatif untuk 162 Badan Publik, yang berarti 44,63 persen dari total 363 Badan Publik. Jumlah ini meningkat signifikan dibandingkan tahun 2023 yang mencatat 139 Badan Publik masuk predikat informatif. Ketua Komisi Informasi Pusat, Donny Yoesgiantoro memberikan apresiasinya kepada Badan Publik yang berhasil mendapatkan predikat Informatif ini.

"KIP menyampaikan terima kasih dan apresiasi kepada seluruh pimpinan badan publik yang telah berpartisipasi dan berkomitmen dalam mewujudkan transparansi informasi. Kami berharap, Badan Publik Informatif dapat menjadi pemicu badan publik lainnya untuk memperbaiki pelayanan informasi kepada masyarakat," kata Ketua KI Pusat, Donny Yoesgiantoro.

Berdasarkan UU No 14 Tahun 2008, KIP bertugas menetapkan Standar Teknis Layanan Informasi Publik di lingkungan Badan Publik di Indonesia. Hal ini untuk menjamin setiap warga negara mendapatkan hak asasinya untuk berkomunikasi dan memperoleh informasi untuk mengembangkan pribadi dan lingkungan sosialnya, serta berhak untuk mencari, memperoleh, memiliki, menyimpan, mengolah, dan menyampaikan informasi dengan menggunakan segala jenis saluran yang tersedia.

Pada tahun 2024, InJourney melanjutkan berbagai strategi untuk mewujudkan ekosistem pelayanan informasi publik yang informatif dan kolaboratif di lingkungan InJourney Group. Prosesnya antara lain dilakukan dengan melakukan evaluasi PPID di InJourney Group, melaksanakan program edukasi keterbukaan informasi publik, monitoring dan evaluasi PPID, inovasi saluran komunikasi PPID serta kolaborasi dalam penyediaan konten-konten komunikasi.

Sebagai program social movement, tim PPID InJourney Group juga terlibat aktif dalam peningkatan literasi masyarakat. Salah satunya dilakukan dengan memberikan donasi 300 buku bacaan untuk SDN 02 Prambanan di Jawa Tengah. Donasi dilakukan InJourney bersama dengan anak usahanya, PT Taman Wisata Candi Borobudur, Prambanan, dan Ratu Boko (TWC) atau InJourney Destination Management. Program tersebut juga sekaligus merupakan bagian dari kegiatan Tanggung Jawab Sosial dan Lingkungan (TJSL) yakni InJourney Peduli Literasi.

"Ke depan, InJourney akan terus melakukan berbagai strategi untuk meningkatkan keterbukaan informasi publik. Melalui langkah ini, kami berharap InJourney menjadi BUMN yang semakin kuat kinerjanya, didukung oleh transparansi dan akuntabilitas yang baik," tutup Herdy Harman.
''',
    informationType: InformationType.event,
  ),
];
