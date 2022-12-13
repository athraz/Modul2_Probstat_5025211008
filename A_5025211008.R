#SOAL 1
#1a
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
sd(x-y)

#1b
t.test(x, y, paired = TRUE)


#SOAL 2
install.packages("BSDA")
library(BSDA)

#2b
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)


#SOAL 3
#3b
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, 
          mean.y = 2.79, s.y = 1.32, n.y = 27,
          alternative = "two.sided", var.equal = TRUE)

#3c
install.packages("mosaic")
library(mosaic)
plotDist(dist = 't', df = 2, col = "#FFBC04")

#3d
qt(p = 0.025, df = 44, lower.tail = TRUE)
qt(p = 0.025, df = 44, lower.tail = FALSE)


#SOAL 4
#4a
koceng <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", header = TRUE)
grup1 <- split(koceng, koceng$Group)$`1`
grup2 <- split(koceng, koceng$Group)$`2`
grup3 <- split(koceng, koceng$Group)$`3`

qqnorm(grup1$Length)
qqline(grup1$Length)

qqnorm(grup2$Length)
qqline(grup2$Length)

qqnorm(grup3$Length)
qqline(grup3$Length)

#4b
bartlett.test(koceng$Length, koceng$Group)

#4c
model1 <- lm(Length ~ factor(Group), data = koceng)
anova(model1)

#4e
TukeyHSD(aov(model1))

#4f
install.packages("ggplot2")
library(ggplot2)
koceng$Group = factor(koceng$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))
ggplot(koceng, aes(x = Group, y = Length)) + 
      geom_boxplot(fill = "#FFBC04", colour = "black") + 
      xlab("Group") + ylab("Length")


#SOAL 5
#5a
library(ggplot2)
gtl <- read.csv("GTL.csv")
qplot(x = Temp, y = Light, data = gtl, geom = "point") + facet_grid(.~Glass, labeller = label_both)

#5b
gtl$Glass <- as.factor(gtl$Glass)
gtl$Temp <- as.factor(gtl$Temp)
anova <- aov(Light ~ Glass*Temp, data = gtl)
summary(anova)

#5c
library(dplyr)
tabel <- group_by(gtl, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light))
tabel

#5d
TukeyHSD(anova)

#5e
install.packages("multcompView")
library(multcompView)
cld <- multcompLetters4(anova, TukeyHSD(anova))
cld
