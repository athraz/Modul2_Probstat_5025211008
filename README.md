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

![Screenshot_20221212_095208](https://user-images.githubusercontent.com/96050618/207076361-4c0e573c-68b8-471b-b9d4-8f7c8fd0835a.png)

- 1b. Carilah nilai t (p-value)!

Nilai t (p-value) dapat dicari dengan fungsi `t.test()` dengan argumen kedua array x dan y, serta argumen `paired` bernilai TRUE karena data yang diuji berpasangan.

```R
#1b
t.test(x, y, paired = TRUE)
```

![Screenshot_20221212_095449](https://user-images.githubusercontent.com/96050618/207077092-5dd00e7a-db3b-43db-8bbb-b5832cdf0a99.png)

- 1c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴”!

Berdasarkan poin B, didapat bahwa nilai p-value adalah `0.00006003` yang mana bernilai lebih kecil dari tingkat signifikansi `𝛼 = 0.05`, sehingga dapat disimpulkan bahwa H0 ditolak dan H1 diterima. Dalam artian terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴.

$~$

## Soal 2
> Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. 


- 2a. Apakah Anda setuju dengan klaim tersebut?

Setuju, karena rata-rata dan standar deviasi dari sampel acak sebesar 23500 dan 3900 kilometer, maka sangat mungkin hasil uji pada grafik cenderung berada di daerah lebih dari 20000 kilometer.

- 2b. Jelaskan maksud dari output yang dihasilkan! 

Terlebih dahulu dilakukan instalasi package library BSDA.

```R
install.packages("BSDA")
library(BSDA)
```

Selanjutnya, digunakan fungsi `tsum.test()` dengan argumen berupa rata-rata, standar deviasi, dan banyak data sampel. 

```R
#2b
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
```

![Screenshot_20221212_095543](https://user-images.githubusercontent.com/96050618/207077388-43c40eb5-e39a-465d-a862-a99fdf7ec467.png)

Berdasarkan output yang dihasilkan, diperoleh rata-rata jarak tempuh mobil per tahun berada di antara 22726.16 kilometer dan 24273.84 kilometer untuk selang kepercayaan 95%. Sehingga klaim bahwa mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun dapat diterima.

- 2c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Dari poin 2b didapatkan p-value sebesar `2.2e-16` yang mana lebih kecil dibandingkan tingkat signifikansi `𝛼 = 0.05`. Sehingga H0 ditolak dan H1 diterima, dalam artian klaim bahwa mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun dapat diterima.

$~$

## Soal 3
> Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut      | Bandung  | Bali  |
| :---------------------:| :------: | :---: |
| Jumlah Saham           | 19       | 27    |
| Sampel Mean            | 3.64     | 2.79  |
| Sampel Standar Deviasi | 1.67     | 1.32  |


> Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (𝛼 = 0.05)? Buatlah :

- 3a. H0 dan H1

Pada deskripsi soal, permasalahan yang ingin diselesaikan adalah apakah ada perbedaan pada rata-rata saham, sehingga H0 dan H1 adalah sebagai berikut:   
`H0: μ1 - μ2 = 0` (rata-rata saham di Bandung sama dengan di Bali)   
`H1: μ1 - μ2 ≠ 0` (rata-rata saham di Bandung tidak sama dengan di Bali)

- 3b. Hitung Sampel Statistik

Statistik sampel dihitung dengan fungsi `tsum.test()` dengan argumen sesuai dengan isi tabel, serta alternative two sided dan var.equal bernilai TRUE karena variansi keduanya dianggap sama.

```R
#3b
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, 
          mean.y = 2.79, s.y = 1.32, n.y = 27,
          alternative = "two.sided", var.equal = TRUE)
```

![image](https://user-images.githubusercontent.com/96050618/207259333-9f7e8a50-305e-4747-8905-abb063f705d0.png)

- 3c. Lakukan Uji Statistik (df = 2)

Uji statistik dilakukan dengan fungsi `plotDist()` yang membutuhkan package library `mosaic`.

```R
#3c
install.packages("mosaic")
library(mosaic)
plotDist(dist = 't', df = 2, col = "#FFBC04")
```

![Screenshot_20221212_113752](https://user-images.githubusercontent.com/96050618/207101895-2abb7531-b29c-4aee-bfe0-b290d80811a2.png)

- 3d. Nilai Kritikal

Nilai kritikal dicari menggunakan fungsi `qt()` dengan argumen tingkat signifikan `𝛼 / 2` dan derajat bebas 44. Serta dilakukan dua kali dengan argumen `lower.tail` bernilai TRUE dan FALSE dikarenakan grafik bersifat two sided.

```R
#3d
qt(p = 0.025, df = 44, lower.tail = TRUE)
qt(p = 0.025, df = 44, lower.tail = FALSE)
```

![image](https://user-images.githubusercontent.com/96050618/207259498-48c3a5a2-4b6e-40ff-a401-b7a8e2524e1a.png)

- 3e. Keputusan

Dari poin-poin sebelumnya didapat hasil uji t bernilai `1.9267` yang mana berada diantara kedua nilai kritikal. Serta p-value bernilai `0.06049` yang mana bernilai lebih kecil dari tingkat signifikansi `𝛼 = 0.05`. Sehingga keputusannya adalah tidak menolak H0.

- 3f. Kesimpulan

Kesimpulan yang bisa diambil adalah tidak ada bukti yang cukup bahwa tidak ada perbedaan pada rata-rata saham Bandung dan Bali.

$~$

## Soal 4
> Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. Jika diketahui dataset  https://intip.in/datasetprobstat1 dan H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama, Maka Kerjakan atau Carilah:

- 4a. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

Data dari dataset dimasukkan ke data frame menggunakan fungsi `read.table()` dengan argumen `header` bernilai TRUE karena terdapat header pada tabel dataset. Selanjutnya data dibagi menjadi tiga grup sesuai dengan data pada kolom `Group`.

```R
#4a
koceng <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", header = TRUE)
grup1 <- split(koceng, koceng$Group)$`1`
grup2 <- split(koceng, koceng$Group)$`2`
grup3 <- split(koceng, koceng$Group)$`3`
```

Dilanjutkan dengan menggambarkan plot kuantil normal untuk setiap grup untuk melihat apakah ada outlier utama dalam homogenitas varians pada masing-masing grup.

```R
qqnorm(grup1$Length)
qqline(grup1$Length)
```

![Screenshot_20221212_095805](https://user-images.githubusercontent.com/96050618/207077916-fa96fc8a-d0a7-4dcb-883e-f930a4b73591.png)

```R
qqnorm(grup2$Length)
qqline(grup2$Length)
```

![Screenshot_20221212_095835](https://user-images.githubusercontent.com/96050618/207078193-08c306c1-bcd1-4e74-b010-c9b0a05dc03e.png)

```R
qqnorm(grup3$Length)
qqline(grup3$Length)
```

![Screenshot_20221212_095854](https://user-images.githubusercontent.com/96050618/207078203-89cd4f6f-e268-47fa-8155-d212e89eb205.png)

- 4b. Carilah atau periksalah Homogeneity of variances nya, berapa nilai p yang didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?

Diasumsikan bahwa variansi ketiga grup sama, maka homogeneity of variances bisa didapatkan menggunakan fungsi `bartlett.test()` dengan argumen dari data yang telah dimasukkan.

```R
#4b
bartlett.test(koceng$Length, koceng$Group)
```

![Screenshot_20221212_100041](https://user-images.githubusercontent.com/96050618/207078569-0385b336-ff4b-49ae-84aa-c195bb851a8e.png)

Didapatkan p-value sebesar `0.8054` yang mana bernilai lebih besar dari `𝛼 = 0.05`, sehingga asumsi ketiga grup memiliki variansi yang sama terpenuhi.

- 4c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

Model linier dibuat dengan menggunakan fungsi `lm()`, kemudian uji ANOVA dilakukan dengan menggunakan fungsi `anova()` dengan argumen berupa model yang telah dibuat.

```R
#4c
model1 <- lm(Length ~ factor(Group), data = koceng)
anova(model1)
```

![Screenshot_20221212_104921](https://user-images.githubusercontent.com/96050618/207090376-89c7412b-7603-42b3-b37f-97d4ba1bc601.png)

- 4d. Dari Hasil Poin C, Berapakah nilai-p? Apa yang dapat Anda simpulkan dari H0?

Dari hasil poin C, diperoleh p-value sebesar `0.013` yang mana bernilai lebih kecil dari `𝛼 = 0.05`. Sehingga H0 ditolak dan H1 diterima, terdapat perbedaan panjang kucing yang signifikan berdasarkan grupnya.

- 4e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

Verifikasi jawaban model 1 menggunakan fungsi `TukeyHSD()` dengan argumen hasil fungsi `aov()` dari model 1.

```R
#4e
TukeyHSD(aov(model1))
```

![Screenshot_20221212_105027](https://user-images.githubusercontent.com/96050618/207096003-fa9a8ba2-130f-4e7c-976d-93bda8a05643.png)

Dari hasil test Tukey dengan tingkat signifikan 0.05, dapat dilihat bahwa terdapat perbedaan yang cukup siginfikan pada grup2-grup1 dan grup3-grup2.

- 4f. Visualisasikan data dengan ggplot2!

```R
#4f
install.packages("ggplot2")
library(ggplot2)
koceng$Group = factor(koceng$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))
ggplot(koceng, aes(x = Group, y = Length)) + 
      geom_boxplot(fill = "#FFBC04", colour = "black") + 
      xlab("Group") + ylab("Length")
```

![Screenshot_20221212_112550](https://user-images.githubusercontent.com/96050618/207098933-6016dd82-1fb0-4250-9817-a5579abed21d.png)

$~$

## Soal 5
> Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: 

- 5a. Buatlah plot sederhana untuk visualisasi data!

File csv di download terlebih dahulu dan diletakkan pada directory yang digunakan sebagai workingspace, kemudian dibaca menggunakan fungsi `read.csv()`. Setelah itu, divisualisasikan menggunakan quick plot dengan fungsi `qplot()`.

```R
#5a
library(ggplot2)
gtl <- read.csv("GTL.csv")
qplot(x = Temp, y = Light, data = gtl, geom = "point") + facet_grid(.~Glass, labeller = label_both)
```

![Screenshot_20221213_091712](https://user-images.githubusercontent.com/96050618/207209801-7969962f-1835-4dbd-afbc-9982718d40af.png)

- 5b. Lakukan uji ANOVA dua arah untuk 2 faktor!

Kedua variabel pada data GTL.csv dibuat menjadi variabel `as.factor()`, kemudian uji ANOVA dilakukan dengan fungsi `aov()` dan ringkasan hasil uji dilihat dengan fungsi `summary()`.

```R
#5b
gtl$Glass <- as.factor(gtl$Glass)
gtl$Temp <- as.factor(gtl$Temp)
anova <- aov(Light ~ Glass*Temp, data = gtl)
summary(anova)
```

![Screenshot_20221213_091838](https://user-images.githubusercontent.com/96050618/207209974-9c7bcfbc-33dc-4a4b-b948-8c3cbd94c591.png)

- 5c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)!

Digunakan fungsi `group_by()` dengan argumen berupa dataset, kaca pelat, dan suhu operasi. Kemudian rata-rata dan standar deviasi untuk setiap perlakuan dimasukkan ke tabel dengan fungsi `summarise()`.

```R
#5c
library(dplyr)
tabel <- group_by(gtl, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light))
tabel
```

![Screenshot_20221213_091923](https://user-images.githubusercontent.com/96050618/207210066-faba4885-4c79-4121-b547-8090d6b9fae7.png)

- 5d. Lakukan uji Tukey!

Uji Tukey menggunakan fungsi `TukeyHSD()` dengan argumen hasil uji anova dari poin sebelumnya.

```R
#5d
TukeyHSD(anova)
```

![Screenshot_20221213_091955](https://user-images.githubusercontent.com/96050618/207210157-9ba57677-4007-4897-9d00-822d8eafcea0.png)

- 5e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey!

Hasil uji Anova dan uji Tukey dalam bentuk aov object, sehingga compact letter display dibuat menggunakan fungsi `multcompLetters4()` dari libarary multcompView dengan argumen hasil uji Anova dan hasil uji Tukey.

```R
#5e
install.packages("multcompView")
library(multcompView)
cld <- multcompLetters4(anova, TukeyHSD(anova))
cld
```

![Screenshot_20221213_092055](https://user-images.githubusercontent.com/96050618/207210303-69113e1a-e1eb-4be0-b662-3ba385f059b1.png)
