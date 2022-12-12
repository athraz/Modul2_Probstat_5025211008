# Modul2_Probstat_5025211008
Penjelasan Praktikum Modul 2 Probabilitas dan Statistik.  
Dibuat oleh Muhammad Razan Athallah (5025211008).

## Soal 1
> Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴.

| Responden | X   | Y   |
| :--------:| :-: | :-: |
| 1         | 78  | 100 |
| 2         | 75  | 95  |
| 3         | 67  | 70  |
| 4         | 77  | 90  |
| 5         | 70  | 90  |
| 6         | 72  | 90  |
| 7         | 78  | 89  |
| 8         | 74  | 90  |
| 9         | 77  | 100 |

> Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

- 1a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas!

Nilai-nilai pada kolom X dan Y dari tabel diatas masing-masing dimasukkan ke array x dan y menggunakan fungsi `c()`. Standar deviasi data selisih dapat dicari menggunakan fungsi `sd()` dengan argumen x-y.

```R
#1a
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
sd(x-y)
```

- 1b. Carilah nilai t (p-value)!

Nilai t (p-value) dapat dicari dengan fungsi `t.test()` dengan argumen kedua array x dan y, serta argumen `paired` bernilai TRUE karena data yang diuji berpasangan.

```R
#1b
t.test(x, y, paired = TRUE)
```

- 1c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴”!

Berdasarkan poin B, didapat bahwa nilai p-value adalah `0.00006003` yang mana bernilai lebih kecil dari tingkat signifikansi `𝛼 = 0.05`, sehingga dapat disimpulkan bahwa H0 ditolak dan H1 diterima. Dalam artian terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴.


## Soal 2
> Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. 


- 2a. Apakah Anda setuju dengan klaim tersebut?

Setuju, karena rata-rata dan standar deviasi dari sampel acak sebesar 23.500 dan 3900 kilometer, maka sangat mungkin hasil uji pada grafik cenderung berada di daerah lebih dari 20.000 kilometer.

- 2b. Jelaskan maksud dari output yang dihasilkan! 

Sebelumnya terlebih dahulu melakukan instalasi package library BSDA.

```R
install.packages("BSDA")
library(BSDA)
```

Selanjutnya, digunakan fungsi `tsum.test()` dengan argumen berupa rata-rata, standar deviasi, dan banyak data sampel. 

```R
#2b
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
```

Berdasarkan output yang dihasilkan, diperoleh rata-rata jarak tempuh mobil per tahun berada di antara 22.726,16 kilometer dan 24.273,84 kilometer untuk selang kepercayaan 95%. Sehingga klaim bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun dapat diterima.

- 2c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Dari poin 2b didapatkan p-value sebesar `2.2.e10-16` yang mana lebih kecil dibandingkan tingkat signifikansi `𝛼 = 0.05`. Sehingga H0 ditolak dan H1 diterima, dalam artian klaim bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun dapat diterima.

## Soal 3
> Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut      | Bandung  | Bali  |
| :---------------------:| :------: | :-:   |
| Jumlah Saham           | 19       | 27    |
| Sampel Mean            | 3.64     | 2.79  |
| Sampel Standar Deviasi | 1.67     | 1.32  |


> Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (𝛼 = 0.05)? Buatlah :

- 3a. H0 dan H1

Pada deskripsi soal, permasalahan yang ingin diselesaikan adalah apakah ada perbedaan pada rata-rata saham, sehingga H0 dan H1 adalah sebagai berikut:   
`H0: μ1 - μ2 = 0` (rata-rata saham di Bandung sama dengan di Bali)   
`H1: μ1 - μ2 ≠ 0` (rata-rata saham di Bandung tidak sama dengan di Bali)

- 3b. Hitung Sampel Statistik

- 3c. Lakukan Uji Statistik (df = 2)

- 3d. Nilai Kritikal

- 3e. Keputusan

- 3f. Kesimpulan


## Soal 4
> Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. Jika diketahui dataset  https://intip.in/datasetprobstat1 dan H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama, Maka Kerjakan atau Carilah:

- 4a. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

- 4b. Carilah atau periksalah Homogeneity of variances nya, berapa nilai p yang didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?

- 4c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

- 4d. Dari Hasil Poin C, Berapakah nilai-p? Apa yang dapat Anda simpulkan dari H0?

- 4e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

- 4f. Visualisasikan data dengan ggplot2!


## Soal 5
> Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: 

- 5a. Buatlah plot sederhana untuk visualisasi data!

- 5b. Lakukan uji ANOVA dua arah untuk 2 faktor!

- 5c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)!

- 5d. Lakukan uji Tukey!

- 5e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey!
