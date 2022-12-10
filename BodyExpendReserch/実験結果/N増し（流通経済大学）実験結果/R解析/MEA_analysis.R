## ファイル読み込み
#関数の定義
moving_average <- function(x){
  filter(x, rep(1,50)) / 50
}



#ID2読み込み
ID2_BallPen <- read.table(
  file = "ID2_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID2_BallPen_head_raw <- ID2_BallPen[, 1]
ID2_BallPen_head <- (ID2_BallPen_head_raw - min(ID2_BallPen[, 1])) / (max(ID2_BallPen[, 1]) - min(ID2_BallPen[, 1]))

# コレログラム可視化
IDacf_data <- acf(ID2_BallPen_head)
ts.plot(acf_data)

#移動平均
ID2_BallPen_head <- moving_average(ID2_BallPen_head)
ts.plot(ID2_BallPen_head)
#欠損値を取り除く
ID2_BallPen_head <- ID2_BallPen_head[!is.na(ID2_BallPen_head)]


ID2_BallPen_chest <- ID2_BallPen[, 2]
ID2_BallPen_arm <- ID2_BallPen[, 3]


ID2_Socks <- read.table(
  file = "ID2_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID2_Socks_head_raw <- ID2_Socks[, 1]
ID2_Socks_head <- (ID2_Socks_head_raw - min(ID2_Socks[, 1])) / (max(ID2_Socks[, 1]) - min(ID2_Socks[, 1]))

#移動平均
ID2_Socks_head <- moving_average(ID2_Socks_head)
ts.plot(ID2_Socks_head)
#欠損値を取り除く
ID2_Socks_head <- ID2_Socks_head[!is.na(ID2_Socks_head)]

ID3_Socks_chest <- ID3_Socks[, 2]
ID3_Socks_arm <- ID3_Socks[, 3]

#ID3読み込み
ID3_BallPen <- read.table(
  file = "ID3_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID3_BallPen_head_raw <- ID3_BallPen[, 1]
ID3_BallPen_head <- (ID3_BallPen_head_raw - min(ID3_BallPen[, 1])) / (max(ID3_BallPen[, 1]) - min(ID3_BallPen[, 1]))

# コレログラム可視化
ID3_acf_data <- acf(ID3_BallPen_head)
ts.plot(ID3_acf_data)

#移動平均
ID3_BallPen_head <- moving_average(ID3_BallPen_head)
#欠損値を取り除く
ID3_BallPen_head <- ID3_BallPen_head[!is.na(ID3_BallPen_head)]

ts.plot(ID3_BallPen_head)

ID3_BallPen_chest <- ID3_BallPen[, 2]
ID3_BallPen_arm <- ID3_BallPen[, 3]

ID3_Socks <- read.table(
  file = "ID3_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID3_Socks_head_raw <- ID3_Socks[, 1]
ID3_Socks_head <- (ID3_Socks_head_raw - min(ID3_Socks[, 1])) / (max(ID3_Socks[, 1]) - min(ID3_Socks[, 1]))

#移動平均
ID3_Socks_head <- moving_average(ID3_Socks_head)
#欠損値を取り除く
ID3_Socks_head <- ID3_Socks_head[!is.na(ID3_Socks_head)]
ts.plot(ID3_Socks_head)

ID3_Socks_chest <- ID3_Socks[, 2]
ID3_Socks_arm <- ID3_Socks[, 3]

#ID4読み込み
ID4_BallPen <- read.table(
  file = "ID4_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID4_BallPen_head_raw <- ID4_BallPen[, 1]
ID4_BallPen_head <- (ID4_BallPen_head_raw - min(ID4_BallPen[, 1])) / (max(ID4_BallPen[, 1]) - min(ID4_BallPen[, 1]))

#移動平均
ID4_BallPen_head <- moving_average(ID4_BallPen_head)
#欠損値を取り除く
ID4_BallPen_head <- ID4_BallPen_head[!is.na(ID4_BallPen_head)]
ts.plot(ID4_BallPen_head)


ID4_BallPen_chest <- ID4_BallPen[, 2]
ID4_BallPen_arm <- ID4_BallPen[, 3]

ID4_Socks <- read.table(
  file = "ID4_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID4_Socks_head_raw <- ID4_Socks[, 1]
ID4_Socks_head <- (ID4_Socks_head_raw - min(ID4_Socks[, 1])) / (max(ID4_Socks[, 1]) - min(ID4_Socks[, 1]))

#移動平均
ID4_Socks_head <- moving_average(ID4_Socks_head)
#欠損値を取り除く
ID4_Socks_head <- ID4_Socks_head[!is.na(ID4_Socks_head)]
ts.plot(ID4_Socks_head)


ID4_Socks_chest <- ID4_Socks[, 2]
ID4_Socks_arm <- ID4_Socks[, 3]

#ID5読み込み
ID5_BallPen <- read.table(
  file = "ID5_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID5_BallPen_head_raw <- ID5_BallPen[, 1]
ID5_BallPen_head <- (ID5_BallPen_head_raw - min(ID5_BallPen[, 1])) / (max(ID5_BallPen[, 1]) - min(ID5_BallPen[, 1]))

#移動平均
ID5_BallPen_head <- moving_average(ID5_BallPen_head)
#欠損値を取り除く
ID5_BallPen_head <- ID5_BallPen_head[!is.na(ID5_BallPen_head)]
ts.plot(ID5_BallPen_head)


ID5_BallPen_chest <- ID5_BallPen[, 2]
ID5_BallPen_arm <- ID5_BallPen[, 3]

ID5_Socks <- read.table(
  file = "ID5_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID5_Socks_head_raw <- ID5_Socks[, 1]
ID5_Socks_head <- (ID5_Socks_head_raw - min(ID5_Socks[, 1])) / (max(ID5_Socks[, 1]) - min(ID5_Socks[, 1]))

#移動平均
ID5_Socks_head <- moving_average(ID5_Socks_head)
#欠損値を取り除く
ID5_Socks_head <- ID5_Socks_head[!is.na(ID5_Socks_head)]
ts.plot(ID5_Socks_head)


#ID6読み込み
ID6_BallPen <- read.table(
  file = "ID6_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID6_BallPen_head_raw <- ID6_BallPen[, 1]
ID6_BallPen_head <- (ID6_BallPen_head_raw - min(ID6_BallPen[, 1])) / (max(ID6_BallPen[, 1]) - min(ID6_BallPen[, 1]))

#移動平均
ID6_BallPen_head <- moving_average(ID6_BallPen_head)
#欠損値を取り除く
ID6_BallPen_head <- ID6_BallPen_head[!is.na(ID6_BallPen_head)]
ts.plot(ID6_BallPen_head)

ID6_BallPen_chest <- ID6_BallPen[, 2]
ID6_BallPen_arm <- ID6_BallPen[, 3]

ID6_Socks <- read.table(
  file = "ID6_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID6_Socks_head_raw <- ID6_Socks[, 1]
ID6_Socks_head <- (ID6_Socks_head_raw - min(ID6_Socks[, 1])) / (max(ID6_Socks[, 1]) - min(ID6_Socks[, 1]))

#移動平均
ID6_Socks_head <- moving_average(ID6_Socks_head)
#欠損値を取り除く
ID6_Socks_head <- ID6_Socks_head[!is.na(ID6_Socks_head)]
ts.plot(ID6_Socks_head)

ID6_Socks_chest <- ID6_Socks[, 2]
ID6_Socks_arm <- ID6_Socks[, 3]

#ID7読み込み
ID7_BallPen <- read.table(
  file = "ID7_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID7_BallPen_head_raw <- ID7_BallPen[, 1]
ID7_BallPen_head <- (ID7_BallPen_head_raw - min(ID7_BallPen[, 1])) / (max(ID7_BallPen[, 1]) - min(ID7_BallPen[, 1]))

#移動平均
ID7_BallPen_head <- moving_average(ID7_BallPen_head)
#欠損値を取り除く
ID7_BallPen_head <- ID7_BallPen_head[!is.na(ID7_BallPen_head)]
ts.plot(ID7_BallPen_head)


ID7_BallPen_chest <- ID7_BallPen[, 2]
ID7_BallPen_arm <- ID7_BallPen[, 3]

ID7_Socks <- read.table(
  file = "ID7_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID7_Socks_head_raw <- ID7_Socks[, 1]
ID7_Socks_head <- (ID7_Socks_head_raw - min(ID7_Socks[, 1])) / (max(ID7_Socks[, 1]) - min(ID7_Socks[, 1]))

#移動平均
ID7_Socks_head <- moving_average(ID7_Socks_head)
#欠損値を取り除く
ID7_Socks_head <- ID7_Socks_head[!is.na(ID7_Socks_head)]
ts.plot(ID7_Socks_head)

ID7_Socks_chest <- ID7_Socks[, 2]
ID7_Socks_arm <- ID7_Socks[, 3]

#ID8読み込み
ID8_BallPen <- read.table(
  file = "ID8_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID8_BallPen_head_raw <- ID8_BallPen[, 1]
ID8_BallPen_head <- (ID8_BallPen_head_raw - min(ID8_BallPen[, 1])) / (max(ID8_BallPen[, 1]) - min(ID8_BallPen[, 1]))

#移動平均
ID8_BallPen_head <- moving_average(ID8_BallPen_head)
#欠損値を取り除く
ID8_BallPen_head <- ID8_BallPen_head[!is.na(ID8_BallPen_head)]
ts.plot(ID8_BallPen_head)


ID8_BallPen_chest <- ID8_BallPen[, 2]
ID8_BallPen_arm <- ID8_BallPen[, 3]

ID8_Socks <- read.table(
  file = "ID8_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID8_Socks_head_raw <- ID8_Socks[, 1]
ID8_Socks_head <- (ID8_Socks_head_raw - min(ID8_Socks[, 1])) / (max(ID8_Socks[, 1]) - min(ID8_Socks[, 1]))

#移動平均
ID8_Socks_head <- moving_average(ID8_Socks_head)
#欠損値を取り除く
ID8_Socks_head <- ID8_Socks_head[!is.na(ID8_Socks_head)]
ts.plot(ID8_Socks_head)

ID8_Socks_chest <- ID8_Socks[, 2]
ID8_Socks_arm <- ID8_Socks[, 3]

#ID9読み込み
ID9_BallPen <- read.table(
  file = "ID9_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID9_BallPen_head_raw <- ID9_BallPen[, 1]
ID9_BallPen_head <- (ID9_BallPen_head_raw - min(ID9_BallPen[, 1])) / (max(ID9_BallPen[, 1]) - min(ID9_BallPen[, 1]))

#移動平均
ID9_BallPen_head <- moving_average(ID9_BallPen_head)
#欠損値を取り除く
ID9_BallPen_head <- ID9_BallPen_head[!is.na(ID9_BallPen_head)]
ts.plot(ID9_BallPen_head)


ID9_BallPen_chest <- ID9_BallPen[, 2]
ID9_BallPen_arm <- ID9_BallPen[, 3]

ID9_Socks <- read.table(
  file = "ID9_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID9_Socks_head_raw <- ID9_Socks[, 1]
ID9_Socks_head <- (ID9_Socks_head_raw - min(ID9_Socks[, 1])) / (max(ID9_Socks[, 1]) - min(ID9_Socks[, 1]))

#移動平均
ID9_Socks_head <- moving_average(ID9_Socks_head)
#欠損値を取り除く
ID9_Socks_head <- ID9_Socks_head[!is.na(ID9_Socks_head)]
ts.plot(ID9_Socks_head)

ID9_Socks_chest <- ID9_Socks[, 2]
ID9_Socks_arm <- ID9_Socks[, 3]

#ID10読み込み
ID10_BallPen <- read.table(
  file = "ID10_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID10_BallPen_head_raw <- ID10_BallPen[, 1]
ID10_BallPen_head <- (ID10_BallPen_head_raw - min(ID10_BallPen[, 1])) / (max(ID10_BallPen[, 1]) - min(ID10_BallPen[, 1]))

#移動平均
ID10_BallPen_head <- moving_average(ID10_BallPen_head)
#欠損値を取り除く
ID10_BallPen_head <- ID10_BallPen_head[!is.na(ID10_BallPen_head)]
ts.plot(ID10_BallPen_head)


ID10_BallPen_chest <- ID10_BallPen[, 2]
ID10_BallPen_arm <- ID10_BallPen[, 3]

ID10_Socks <- read.table(
  file = "ID10_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID10_Socks_head_raw <- ID10_Socks[, 1]
ID10_Socks_head <- (ID10_Socks_head_raw - min(ID10_Socks[, 1])) / (max(ID10_Socks[, 1]) - min(ID10_Socks[, 1]))

#移動平均
ID10_Socks_head <- moving_average(ID10_Socks_head)
#欠損値を取り除く
ID10_Socks_head <- ID10_Socks_head[!is.na(ID10_Socks_head)]
ts.plot(ID10_Socks_head)

ID10_Socks_chest <- ID10_Socks[, 2]
ID10_Socks_arm <- ID10_Socks[, 3]

#ID11読み込み
ID11_BallPen <- read.table(
  file = "ID11_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID11_BallPen_head_raw <- ID11_BallPen[, 1]
ID11_BallPen_head <- (ID11_BallPen_head_raw - min(ID11_BallPen[, 1])) / (max(ID11_BallPen[, 1]) - min(ID11_BallPen[, 1]))

#移動平均
ID11_BallPen_head <- moving_average(ID11_BallPen_head)
#欠損値を取り除く
ID11_BallPen_head <- ID11_BallPen_head[!is.na(ID11_BallPen_head)]
ts.plot(ID11_BallPen_head)


ID11_BallPen_chest <- ID11_BallPen[, 2]
ID11_BallPen_arm <- ID11_BallPen[, 3]

ID11_Socks <- read.table(
  file = "ID11_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID11_Socks_head_raw <- ID11_Socks[, 1]
ID11_Socks_head <- (ID11_Socks_head_raw - min(ID11_Socks[, 1])) / (max(ID11_Socks[, 1]) - min(ID11_Socks[, 1]))

#移動平均
ID11_Socks_head <- moving_average(ID11_Socks_head)
#欠損値を取り除く
ID11_Socks_head <- ID11_Socks_head[!is.na(ID11_Socks_head)]
ts.plot(ID11_Socks_head)

ID11_Socks_chest <- ID11_Socks[, 2]
ID11_Socks_arm <- ID11_Socks[, 3]

#ID12読み込み
ID12_BallPen <- read.table(
  file = "ID12_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID12_BallPen_head_raw <- ID12_BallPen[, 1]
ID12_BallPen_head <- (ID12_BallPen_head_raw - min(ID12_BallPen[, 1])) / (max(ID12_BallPen[, 1]) - min(ID12_BallPen[, 1]))

#移動平均
ID12_BallPen_head <- moving_average(ID12_BallPen_head)
#欠損値を取り除く
ID12_BallPen_head <- ID12_BallPen_head[!is.na(ID12_BallPen_head)]
ts.plot(ID12_BallPen_head)


ID12_BallPen_chest <- ID12_BallPen[, 2]
ID12_BallPen_arm <- ID12_BallPen[, 3]


ID12_Socks <- read.table(
  file = "ID12_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID12_Socks_head_raw <- ID12_Socks[, 1]
ID12_Socks_head <- (ID12_Socks_head_raw - min(ID12_Socks[, 1])) / (max(ID12_Socks[, 1]) - min(ID12_Socks[, 1]))

#移動平均
ID12_Socks_head <- moving_average(ID12_Socks_head)
ID12_Socks_head <- ID12_Socks_head[!is.na(ID12_Socks_head)]
ts.plot(ID12_Socks_head)

ID12_Socks_chest <- ID12_Socks[, 2]
ID12_Socks_arm <- ID12_Socks[, 3]

#ID13読み込み
ID13_BallPen <- read.table(
  file = "ID13_BallPen.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID13_BallPen_head_raw <- ID13_BallPen[, 1]
ID13_BallPen_head <- (ID13_BallPen_head_raw - min(ID13_BallPen[, 1])) / (max(ID13_BallPen[, 1]) - min(ID13_BallPen[, 1]))

#移動平均
ID13_BallPen_head <- moving_average(ID13_BallPen_head)
#欠損値を取り除く
ID13_BallPen_head <- ID13_BallPen_head[!is.na(ID13_BallPen_head)]
ts.plot(ID13_BallPen_head)


ID13_BallPen_chest <- ID13_BallPen[, 2]
ID13_BallPen_arm <- ID13_BallPen[, 3]

ID13_Socks <- read.table(
  file = "ID13_Socks.txt",
  header = TRUE,
  sep = "",
  skip = 0
)

#正規化
ID13_Socks_head_raw <- ID13_Socks[, 1]
ID13_Socks_head <- (ID13_Socks_head_raw - min(ID13_Socks[, 1])) / (max(ID13_Socks[, 1]) - min(ID13_Socks[, 1]))

#移動平均
ID13_Socks_head <- moving_average(ID13_Socks_head)
#欠損値を取り除く
ID13_Socks_head <- ID13_Socks_head[!is.na(ID13_Socks_head)]
ts.plot(ID13_Socks_head)

ID13_Socks_chest <- ID13_Socks[, 2]
ID13_Socks_arm <- ID13_Socks[, 3]

##頭動作の分析
#頭動作プロット


#頭の標本標準偏差を出す(BallPen)
ID2_BallPen_head_sd <- sd(ID2_BallPen_head)
ID3_BallPen_head_sd <- sd(ID3_BallPen_head)
ID4_BallPen_head_sd <- sd(ID4_BallPen_head)
ID5_BallPen_head_sd <- sd(ID5_BallPen_head)
ID6_BallPen_head_sd <- sd(ID6_BallPen_head)
ID8_BallPen_head_sd <- sd(ID8_BallPen_head)
ID9_BallPen_head_sd <- sd(ID9_BallPen_head)
ID10_BallPen_head_sd <- sd(ID10_BallPen_head)
ID11_BallPen_head_sd <- sd(ID11_BallPen_head)
ID12_BallPen_head_sd <- sd(ID12_BallPen_head)


#頭の標本標準偏差を出す(Socks)
ID2_Socks_head_sd <- sd(ID2_Socks_head)
ID3_Socks_head_sd <- sd(ID3_Socks_head)
ID4_Socks_head_sd <- sd(ID4_Socks_head)
ID5_Socks_head_sd <- sd(ID5_Socks_head)
ID6_Socks_head_sd <- sd(ID6_Socks_head)
ID8_Socks_head_sd <- sd(ID8_Socks_head)
ID9_Socks_head_sd <- sd(ID9_Socks_head)
ID10_Socks_head_sd <- sd(ID10_Socks_head)
ID11_Socks_head_sd <- sd(ID11_Socks_head)
ID12_Socks_head_sd <- sd(ID12_Socks_head)

ID2_Socks_head_sd
ID3_Socks_head_sd

BallPen_Strong_sd <- c(ID2_BallPen_head_sd,ID3_BallPen_head_sd,ID4_BallPen_head_sd,ID5_BallPen_head_sd,ID6_BallPen_head_sd)
BallPen_chest_Week_sd <- c(ID8_BallPen_head_sd,ID9_BallPen_head_sd,ID10_BallPen_head_sd,ID11_BallPen_head_sd,ID12_BallPen_head_sd)

#ボールペン試行の頭動作の標準偏差のＦ検定
#var.test(BallPen_Strong_sd,BallPen_chest_Week_sd)
#ボールペン試行の頭動作の標準偏差T検定
t.test(BallPen_Strong_sd, BallPen_chest_Week_sd)
#ボールペン試行の頭動作の標準偏差のウィルコクソの順位和検定
wilcox.test(BallPen_Strong_sd,BallPen_chest_Week_sd)

Socks_Strong_sd <- c(ID2_Socks_head_sd,ID3_Socks_head_sd,ID4_Socks_head_sd,ID5_Socks_head_sd,ID6_Socks_head_sd)
Socks_Weak_sd <- c(ID8_Socks_head_sd,ID9_Socks_head_sd,ID10_Socks_head_sd,ID11_Socks_head_sd,ID12_Socks_head_sd)

#靴下試行の頭動作の標準偏差のＦ検定
#var.test(Socks_Strong_sd,Socks_Weak_sd)
#靴下試行の頭動作の標準偏差T検定
t.test(Socks_Strong_sd, Socks_Weak_sd)
#靴下試行の頭動作の標準偏差のウィル告訴の順位和検定
wilcox.test(Socks_Strong_sd, Socks_Weak_sd)

#頭動作の平均を出す(BallPen)
ID2_BallPen_head_mean <- mean(ID2_BallPen_head)
ID3_BallPen_head_mean <- mean(ID3_BallPen_head)
ID4_BallPen_head_mean <- mean(ID4_BallPen_head)
ID5_BallPen_head_mean <- mean(ID5_BallPen_head)
ID6_BallPen_head_mean <- mean(ID6_BallPen_head)
ID8_BallPen_head_mean <- mean(ID8_BallPen_head)
ID9_BallPen_head_mean <- mean(ID9_BallPen_head)
ID10_BallPen_head_mean <- mean(ID10_BallPen_head)
ID11_BallPen_head_mean <- mean(ID11_BallPen_head)
ID12_BallPen_head_mean <- mean(ID12_BallPen_head)

#頭動作の平均を出す(Socks)
ID2_Socks_head_mean <- mean(ID2_Socks_head)
ID3_Socks_head_mean <- mean(ID3_Socks_head)
ID4_Socks_head_mean <- mean(ID4_Socks_head)
ID5_Socks_head_mean <- mean(ID5_Socks_head)
ID6_Socks_head_mean <- mean(ID6_Socks_head)
ID8_Socks_head_mean <- mean(ID8_Socks_head)
ID9_Socks_head_mean <- mean(ID9_Socks_head)
ID10_Socks_head_mean <- mean(ID10_Socks_head)
ID11_Socks_head_mean <- mean(ID11_Socks_head)
ID12_Socks_head_mean <- mean(ID12_Socks_head)

BallPen_Strong_mean <- c(ID2_BallPen_head_mean,ID3_BallPen_head_mean,ID4_BallPen_head_mean,ID5_BallPen_head_mean,ID6_BallPen_head_mean)
BallPen_Weak_mean <- c(ID8_BallPen_head_mean,ID9_BallPen_head_mean,ID10_BallPen_head_mean,ID11_BallPen_head_mean,ID12_BallPen_head_mean)

Socks_Strong_mean <- c(ID2_Socks_head_mean,ID3_Socks_head_mean,ID4_Socks_head_mean,ID5_Socks_head_mean,ID6_Socks_head_mean)
Socks_Weak_mean <- c(ID8_Socks_head_mean,ID9_Socks_head_mean,ID10_Socks_head_mean,ID11_Socks_head_mean,ID12_Socks_head_mean)

#頭動作のボールペン試行の平均のＦ検定
#var.test(BallPen_Strong_mean,BallPen_Weak_mean)
#頭動作のボールペン試行の平均T検定
t.test(BallPen_Strong_mean, BallPen_Weak_mean)
#頭動作のボールペン試行の平均のウィルコクソの順位和検定
wilcox.test(BallPen_Strong_mean,BallPen_Weak_mean)

#頭動作の靴下試行の平均のＦ検定
var.test(Socks_Strong_mean,Socks_Weak_mean)
#頭動作の靴下試行の平均T検定
t.test(Socks_Strong_mean, Socks_Weak_mean)
#頭動作の靴下試行の平均のウィル告訴の順位和検定
wilcox.test(Socks_Strong_mean, Socks_Weak_mean)

#頭動作の分散を出す(BallPen)
ID2_BallPen_head_var <- var(ID2_BallPen_head)
ID3_BallPen_head_var <- var(ID3_BallPen_head)
ID4_BallPen_head_var <- var(ID4_BallPen_head)
ID5_BallPen_head_var <- var(ID5_BallPen_head)
ID6_BallPen_head_var <- var(ID6_BallPen_head)
ID8_BallPen_head_var <- var(ID8_BallPen_head)
ID9_BallPen_head_var <- var(ID9_BallPen_head)
ID10_BallPen_head_var <- var(ID10_BallPen_head)
ID11_BallPen_head_var <- var(ID11_BallPen_head)
ID12_BallPen_head_var <- var(ID12_BallPen_head)

#頭動作の分散を出す(Socks)
ID2_Socks_head_var <- var(ID2_Socks_head)
ID3_Socks_head_var <- var(ID3_Socks_head)
ID4_Socks_head_var <- var(ID4_Socks_head)
ID5_Socks_head_var <- var(ID5_Socks_head)
ID6_Socks_head_var <- var(ID6_Socks_head)
ID8_Socks_head_var <- var(ID8_Socks_head)
ID9_Socks_head_var <- var(ID9_Socks_head)
ID10_Socks_head_var <- var(ID10_Socks_head)
ID11_Socks_head_var <- var(ID11_Socks_head)
ID12_Socks_head_var <- var(ID12_Socks_head)

BallPen_Strong_var <- c(ID2_BallPen_head_var,ID3_BallPen_head_var,ID4_BallPen_head_var,ID5_BallPen_head_var,ID6_BallPen_head_var)
BallPen_Weak_var <- c(ID8_BallPen_head_var,ID9_BallPen_head_var,ID10_BallPen_head_var,ID11_BallPen_head_var,ID12_BallPen_head_var)

Socks_Strong_var <- c(ID2_Socks_head_var,ID3_Socks_head_var,ID4_Socks_head_var,ID5_Socks_head_var,ID6_Socks_head_var)
Socks_Weak_var <- c(ID8_Socks_head_var,ID9_Socks_head_var,ID10_Socks_head_var,ID11_Socks_head_var,ID12_Socks_head_var)

#頭動作のボールペン試行の分散のＦ検定
#var.test(BallPen_Strong_var,BallPen_Weak_var)
#頭動作のボールペン試行の分散T検定
t.test(BallPen_Strong_var, BallPen_Weak_var)
#頭動作のボールペン試行の分散のウィルコクソの順位和検定
wilcox.test(BallPen_Strong_var,BallPen_Weak_var)

#頭動作の靴下試行の分散のＦ検定
var.test(Socks_Strong_var,Socks_Weak_var)
#頭動作の靴下試行の分散T検定
t.test(Socks_Strong_var, Socks_Weak_var)
#頭動作の靴下試行の分散のウィル告訴の順位和検定
wilcox.test(Socks_Strong_var, Socks_Weak_var)

##胴体動作の分析

#胴体動作プロット
# ts.plot(ID2_BallPen_chest)
# ts.plot(ID3_BallPen_chest)
# ts.plot(ID4_BallPen_chest)
# ts.plot(ID5_BallPen_chest)
# ts.plot(ID6_BallPen_chest)
# ts.plot(ID8_BallPen_chest)
# ts.plot(ID9_BallPen_chest)
# ts.plot(ID10_BallPen_chest)
# ts.plot(ID11_BallPen_chest)
# ts.plot(ID12_BallPen_chest)

#胴体の標本標準偏差を出す(BallPen)
ID2_BallPen_chest_sd <- sd(ID2_BallPen_chest)
ID3_BallPen_chest_sd <- sd(ID3_BallPen_chest)
ID4_BallPen_chest_sd <- sd(ID4_BallPen_chest)
ID5_BallPen_chest_sd <- sd(ID5_BallPen_chest)
ID6_BallPen_chest_sd <- sd(ID6_BallPen_chest)
ID8_BallPen_chest_sd <- sd(ID8_BallPen_chest)
ID9_BallPen_chest_sd <- sd(ID9_BallPen_chest)
ID10_BallPen_chest_sd <- sd(ID10_BallPen_chest)
ID11_BallPen_chest_sd <- sd(ID11_BallPen_chest)
ID12_BallPen_chest_sd <- sd(ID12_BallPen_chest)

ID2_BallPen_chest_sd
ID3_BallPen_chest_sd
ID4_BallPen_chest_sd
ID5_BallPen_chest_sd
ID6_BallPen_chest_sd
ID8_BallPen_chest_sd
ID9_BallPen_chest_sd
ID10_BallPen_chest_sd
ID11_BallPen_chest_sd
ID12_BallPen_chest_sd

#胴体の標本標準偏差を出す(Socks)
ID2_Socks_chest_sd <- sd(ID2_Socks_chest)
ID3_Socks_chest_sd <- sd(ID3_Socks_chest)
ID4_Socks_chest_sd <- sd(ID4_Socks_chest)
ID5_Socks_chest_sd <- sd(ID5_Socks_chest)
ID6_Socks_chest_sd <- sd(ID6_Socks_chest)
ID8_Socks_chest_sd <- sd(ID8_Socks_chest)
ID9_Socks_chest_sd <- sd(ID9_Socks_chest)
ID10_Socks_chest_sd <- sd(ID10_Socks_chest)
ID11_Socks_chest_sd <- sd(ID11_Socks_chest)
ID12_Socks_chest_sd <- sd(ID12_Socks_chest)

ID2_Socks_chest_sd
ID3_Socks_chest_sd
ID4_Socks_chest_sd
ID5_Socks_chest_sd
ID6_Socks_chest_sd
ID8_Socks_chest_sd
ID9_Socks_chest_sd
ID10_Socks_chest_sd
ID11_Socks_chest_sd
ID12_Socks_chest_sd


BallPen_chest_Strong_sd <- c(ID2_BallPen_chest_sd,ID3_BallPen_chest_sd,ID4_BallPen_chest_sd,ID5_BallPen_chest_sd,ID6_BallPen_chest_sd)
BallPen_chest_Weak_sd <- c(ID8_BallPen_chest_sd,ID9_BallPen_chest_sd,ID10_BallPen_chest_sd,ID11_BallPen_chest_sd,ID12_BallPen_chest_sd)

#ボールペン試行の胴体動作の標準偏差のＦ検定
var.test(BallPen_chest_Strong_sd,BallPen_chest_Weak_sd)
#ボールペン試行の胴体動作の標準偏差T検定
t.test(BallPen_chest_Strong_sd, BallPen_chest_Weak_sd)
#ボールペン試行の胴体動作の標準偏差のウィルコクソの順位和検定
wilcox.test(BallPen_chest_Strong_sd,BallPen_chest_Weak_sd)

Socks_chest_Strong_sd <- c(ID2_Socks_chest_sd,ID3_Socks_chest_sd,ID4_Socks_chest_sd,ID5_Socks_chest_sd,ID6_Socks_chest_sd)
Socks_chest_Weak_sd <- c(ID8_Socks_chest_sd,ID9_Socks_chest_sd,ID10_Socks_chest_sd,ID11_Socks_chest_sd,ID12_Socks_chest_sd)

#靴下試行の胴体動作の標準偏差のＦ検定
var.test(Socks_chest_Strong_sd,Socks_chest_Weak_sd)
#靴下試行の胴体動作の標準偏差T検定
t.test(Socks_chest_Strong_sd, Socks_chest_Weak_sd)
#靴下試行の胴体動作の標準偏差のウィル告訴の順位和検定
wilcox.test(Socks_chest_Strong_sd, Socks_chest_Weak_sd)

#胴体動作の平均を出す(BallPen)
ID2_BallPen_chest_mean <- mean(ID2_BallPen_chest)
ID3_BallPen_chest_mean <- mean(ID3_BallPen_chest)
ID4_BallPen_chest_mean <- mean(ID4_BallPen_chest)
ID5_BallPen_chest_mean <- mean(ID5_BallPen_chest)
ID6_BallPen_chest_mean <- mean(ID6_BallPen_chest)
ID8_BallPen_chest_mean <- mean(ID8_BallPen_chest)
ID9_BallPen_chest_mean <- mean(ID9_BallPen_chest)
ID10_BallPen_chest_mean <- mean(ID10_BallPen_chest)
ID11_BallPen_chest_mean <- mean(ID11_BallPen_chest)
ID12_BallPen_chest_mean <- mean(ID12_BallPen_chest)

ID2_BallPen_chest_mean
ID3_BallPen_chest_mean
ID4_BallPen_chest_mean
ID5_BallPen_chest_mean
ID6_BallPen_chest_mean
ID8_BallPen_chest_mean
ID9_BallPen_chest_mean
ID10_BallPen_chest_mean
ID11_BallPen_chest_mean
ID12_BallPen_chest_mean

#胴体動作の平均を出す(Socks)
ID2_Socks_chest_mean <- mean(ID2_Socks_chest)
ID3_Socks_chest_mean <- mean(ID3_Socks_chest)
ID4_Socks_chest_mean <- mean(ID4_Socks_chest)
ID5_Socks_chest_mean <- mean(ID5_Socks_chest)
ID6_Socks_chest_mean <- mean(ID6_Socks_chest)
ID8_Socks_chest_mean <- mean(ID8_Socks_chest)
ID9_Socks_chest_mean <- mean(ID9_Socks_chest)
ID10_Socks_chest_mean <- mean(ID10_Socks_chest)
ID11_Socks_chest_mean <- mean(ID11_Socks_chest)
ID12_Socks_chest_mean <- mean(ID12_Socks_chest)

ID2_Socks_chest_mean
ID3_Socks_chest_mean
ID4_Socks_chest_mean
ID5_Socks_chest_mean
ID6_Socks_chest_mean
ID8_Socks_chest_mean
ID9_Socks_chest_mean
ID10_Socks_chest_mean
ID11_Socks_chest_mean
ID12_Socks_chest_mean

BallPen_chest_Strong_mean <- c(ID2_BallPen_chest_mean,ID3_BallPen_chest_mean,ID4_BallPen_chest_mean,ID5_BallPen_chest_mean,ID6_BallPen_chest_mean)
BallPen_chest_Week_mean <- c(ID8_BallPen_chest_mean,ID9_BallPen_chest_mean,ID10_BallPen_chest_mean,ID11_BallPen_chest_mean,ID12_BallPen_chest_mean)

Socks_Strong_mean <- c(ID2_Socks_chest_mean,ID3_Socks_chest_mean,ID4_Socks_chest_mean,ID5_Socks_chest_mean,ID6_Socks_chest_mean)
Socks_Weak_mean <- c(ID8_Socks_chest_mean,ID9_Socks_chest_mean,ID10_Socks_chest_mean,ID11_Socks_chest_mean,ID12_Socks_chest_mean)

#胴体動作のボールペン試行の平均のＦ検定
var.test(BallPen_chest_Strong_mean,BallPen_chest_Week_mean)
#胴体動作のボールペン試行の平均T検定
t.test(BallPen_chest_Strong_mean, BallPen_chest_Week_mean)
#胴体動作のボールペン試行の平均のウィルコクソの順位和検定
wilcox.test(BallPen_chest_Strong_mean,BallPen_chest_Week_mean)

#胴体動作の靴下試行の平均のＦ検定
var.test(Socks_Strong_mean,Socks_Weak_mean)
#胴体動作の靴下試行の平均T検定
t.test(Socks_Strong_mean, Socks_Weak_mean)
#胴体動作の靴下試行の平均のウィル告訴の順位和検定
wilcox.test(Socks_Strong_mean, Socks_Weak_mean)

#胴体動作の分散を出す(BallPen)
ID2_BallPen_chest_var <- var(ID2_BallPen_chest)
ID3_BallPen_chest_var <- var(ID3_BallPen_chest)
ID4_BallPen_chest_var <- var(ID4_BallPen_chest)
ID5_BallPen_chest_var <- var(ID5_BallPen_chest)
ID6_BallPen_chest_var <- var(ID6_BallPen_chest)
ID8_BallPen_chest_var <- var(ID8_BallPen_chest)
ID9_BallPen_chest_var <- var(ID9_BallPen_chest)
ID10_BallPen_chest_var <- var(ID10_BallPen_chest)
ID11_BallPen_chest_var <- var(ID11_BallPen_chest)
ID12_BallPen_chest_var <- var(ID12_BallPen_chest)

ID2_BallPen_chest_var
ID3_BallPen_chest_var
ID4_BallPen_chest_var
ID5_BallPen_chest_var
ID6_BallPen_chest_var
ID8_BallPen_chest_var
ID9_BallPen_chest_var
ID10_BallPen_chest_var
ID11_BallPen_chest_var
ID12_BallPen_chest_var

#胴体動作の分散を出す(Socks)
ID2_Socks_chest_var <- var(ID2_Socks_chest)
ID3_Socks_chest_var <- var(ID3_Socks_chest)
ID4_Socks_chest_var <- var(ID4_Socks_chest)
ID5_Socks_chest_var <- var(ID5_Socks_chest)
ID6_Socks_chest_var <- var(ID6_Socks_chest)
ID8_Socks_chest_var <- var(ID8_Socks_chest)
ID9_Socks_chest_var <- var(ID9_Socks_chest)
ID10_Socks_chest_var <- var(ID10_Socks_chest)
ID11_Socks_chest_var <- var(ID11_Socks_chest)
ID12_Socks_chest_var <- var(ID12_Socks_chest)

ID2_Socks_chest_var
ID3_Socks_chest_var
ID4_Socks_chest_var
ID5_Socks_chest_var
ID6_Socks_chest_var
ID8_Socks_chest_var
ID9_Socks_chest_var
ID10_Socks_chest_var
ID11_Socks_chest_var
ID12_Socks_chest_var

BallPen_chest_Strong_var <- c(ID2_BallPen_chest_var,ID3_BallPen_chest_var,ID4_BallPen_chest_var,ID5_BallPen_chest_var,ID6_BallPen_chest_var)
BallPen_chest_Week_var <- c(ID8_BallPen_chest_var,ID9_BallPen_chest_var,ID10_BallPen_chest_var,ID11_BallPen_chest_var,ID12_BallPen_chest_var)

Socks_Strong_var <- c(ID2_Socks_chest_var,ID3_Socks_chest_var,ID4_Socks_chest_var,ID5_Socks_chest_var,ID6_Socks_chest_var)
Socks_Weak_var <- c(ID8_Socks_chest_var,ID9_Socks_chest_var,ID10_Socks_chest_var,ID11_Socks_chest_var,ID12_Socks_chest_var)

#胴体動作のボールペン試行の分散のＦ検定
var.test(BallPen_chest_Strong_var,BallPen_chest_Week_var)
#胴体動作のボールペン試行の分散T検定
t.test(BallPen_chest_Strong_var, BallPen_chest_Week_var)
#胴体動作のボールペン試行の分散のウィルコクソの順位和検定
wilcox.test(BallPen_chest_Strong_var,BallPen_chest_Week_var)

#胴体動作の靴下試行の分散のＦ検定
var.test(Socks_Strong_var,Socks_Weak_var)
#胴体動作の靴下試行の分散T検定
t.test(Socks_Strong_var, Socks_Weak_var)
#胴体動作の靴下試行の分散のウィル告訴の順位和検定
wilcox.test(Socks_Strong_var, Socks_Weak_var)

##腕部動作の分析
#腕動作のプロット
# ts.plot(ID2_BallPen_arm)
# ts.plot(ID3_BallPen_arm)
# ts.plot(ID4_BallPen_arm)
# ts.plot(ID5_BallPen_arm)
# ts.plot(ID6_BallPen_arm)
# ts.plot(ID8_BallPen_arm)
# ts.plot(ID9_BallPen_arm)
# ts.plot(ID10_BallPen_arm)
# ts.plot(ID11_BallPen_arm)
# ts.plot(ID12_BallPen_arm)
#腕部の標本標準偏差を出す(BallPen)
ID2_BallPen_arm_sd <- sd(ID2_BallPen_arm)
ID3_BallPen_arm_sd <- sd(ID3_BallPen_arm)
ID4_BallPen_arm_sd <- sd(ID4_BallPen_arm)
ID5_BallPen_arm_sd <- sd(ID5_BallPen_arm)
ID6_BallPen_arm_sd <- sd(ID6_BallPen_arm)
ID8_BallPen_arm_sd <- sd(ID8_BallPen_arm)
ID9_BallPen_arm_sd <- sd(ID9_BallPen_arm)
ID10_BallPen_arm_sd <- sd(ID10_BallPen_arm)
ID11_BallPen_arm_sd <- sd(ID11_BallPen_arm)
ID12_BallPen_arm_sd <- sd(ID12_BallPen_arm)

ID2_BallPen_arm_sd
ID3_BallPen_arm_sd
ID4_BallPen_arm_sd
ID5_BallPen_arm_sd
ID6_BallPen_arm_sd
ID8_BallPen_arm_sd
ID9_BallPen_arm_sd
ID10_BallPen_arm_sd
ID11_BallPen_arm_sd
ID12_BallPen_arm_sd

#腕部の標本標準偏差を出す(Socks)
ID2_Socks_arm_sd <- sd(ID2_Socks_arm)
ID3_Socks_arm_sd <- sd(ID3_Socks_arm)
ID4_Socks_arm_sd <- sd(ID4_Socks_arm)
ID5_Socks_arm_sd <- sd(ID5_Socks_arm)
ID6_Socks_arm_sd <- sd(ID6_Socks_arm)
ID8_Socks_arm_sd <- sd(ID8_Socks_arm)
ID9_Socks_arm_sd <- sd(ID9_Socks_arm)
ID10_Socks_arm_sd <- sd(ID10_Socks_arm)
ID11_Socks_arm_sd <- sd(ID11_Socks_arm)
ID12_Socks_arm_sd <- sd(ID12_Socks_arm)

ID2_Socks_arm_sd
ID3_Socks_arm_sd
ID4_Socks_arm_sd
ID5_Socks_arm_sd
ID6_Socks_arm_sd
ID8_Socks_arm_sd
ID9_Socks_arm_sd
ID10_Socks_arm_sd
ID11_Socks_arm_sd
ID12_Socks_arm_sd


BallPen_arm_Strong_sd <- c(ID2_BallPen_arm_sd,ID3_BallPen_arm_sd,ID4_BallPen_arm_sd,ID5_BallPen_arm_sd,ID6_BallPen_arm_sd)
BallPen_arm_Weak_sd <- c(ID8_BallPen_arm_sd,ID9_BallPen_arm_sd,ID10_BallPen_arm_sd,ID11_BallPen_arm_sd,ID12_BallPen_arm_sd)

#ボールペン試行の腕部動作の標準偏差のＦ検定
var.test(BallPen_arm_Strong_sd,BallPen_arm_Weak_sd)
#ボールペン試行の腕部動作の標準偏差T検定
t.test(BallPen_arm_Strong_sd, BallPen_arm_Weak_sd)
#ボールペン試行の腕部動作の標準偏差のウィルコクソの順位和検定
wilcox.test(BallPen_arm_Strong_sd,BallPen_arm_Weak_sd)

Socks_arm_Strong_sd <- c(ID2_Socks_arm_sd,ID3_Socks_arm_sd,ID4_Socks_arm_sd,ID5_Socks_arm_sd,ID6_Socks_arm_sd)
Socks_arm_Weak_sd <- c(ID8_Socks_arm_sd,ID9_Socks_arm_sd,ID10_Socks_arm_sd,ID11_Socks_arm_sd,ID12_Socks_arm_sd)

#靴下試行の腕部動作の標準偏差のＦ検定
var.test(Socks_arm_Strong_sd,Socks_arm_Weak_sd)
#靴下試行の腕部動作の標準偏差T検定
t.test(Socks_arm_Strong_sd, Socks_arm_Weak_sd)
#靴下試行の腕部動作の標準偏差のウィル告訴の順位和検定
wilcox.test(Socks_arm_Strong_sd, Socks_arm_Weak_sd)

#腕部動作の平均を出す(BallPen)
ID2_BallPen_arm_mean <- mean(ID2_BallPen_arm)
ID3_BallPen_arm_mean <- mean(ID3_BallPen_arm)
ID4_BallPen_arm_mean <- mean(ID4_BallPen_arm)
ID5_BallPen_arm_mean <- mean(ID5_BallPen_arm)
ID6_BallPen_arm_mean <- mean(ID6_BallPen_arm)
ID8_BallPen_arm_mean <- mean(ID8_BallPen_arm)
ID9_BallPen_arm_mean <- mean(ID9_BallPen_arm)
ID10_BallPen_arm_mean <- mean(ID10_BallPen_arm)
ID11_BallPen_arm_mean <- mean(ID11_BallPen_arm)
ID12_BallPen_arm_mean <- mean(ID12_BallPen_arm)

ID2_BallPen_arm_mean
ID3_BallPen_arm_mean
ID4_BallPen_arm_mean
ID5_BallPen_arm_mean
ID6_BallPen_arm_mean
ID8_BallPen_arm_mean
ID9_BallPen_arm_mean
ID10_BallPen_arm_mean
ID11_BallPen_arm_mean
ID12_BallPen_arm_mean

#腕部動作の平均を出す(Socks)
ID2_Socks_arm_mean <- mean(ID2_Socks_arm)
ID3_Socks_arm_mean <- mean(ID3_Socks_arm)
ID4_Socks_arm_mean <- mean(ID4_Socks_arm)
ID5_Socks_arm_mean <- mean(ID5_Socks_arm)
ID6_Socks_arm_mean <- mean(ID6_Socks_arm)
ID8_Socks_arm_mean <- mean(ID8_Socks_arm)
ID9_Socks_arm_mean <- mean(ID9_Socks_arm)
ID10_Socks_arm_mean <- mean(ID10_Socks_arm)
ID11_Socks_arm_mean <- mean(ID11_Socks_arm)
ID12_Socks_arm_mean <- mean(ID12_Socks_arm)

ID2_Socks_arm_mean
ID3_Socks_arm_mean
ID4_Socks_arm_mean
ID5_Socks_arm_mean
ID6_Socks_arm_mean
ID8_Socks_arm_mean
ID9_Socks_arm_mean
ID10_Socks_arm_mean
ID11_Socks_arm_mean
ID12_Socks_arm_mean

BallPen_arm_Strong_mean <- c(ID2_BallPen_arm_mean,ID3_BallPen_arm_mean,ID4_BallPen_arm_mean,ID5_BallPen_arm_mean,ID6_BallPen_arm_mean)
BallPen_arm_Week_mean <- c(ID8_BallPen_arm_mean,ID9_BallPen_arm_mean,ID10_BallPen_arm_mean,ID11_BallPen_arm_mean,ID12_BallPen_arm_mean)

Socks_Strong_mean <- c(ID2_Socks_arm_mean,ID3_Socks_arm_mean,ID4_Socks_arm_mean,ID5_Socks_arm_mean,ID6_Socks_arm_mean)
Socks_Weak_mean <- c(ID8_Socks_arm_mean,ID9_Socks_arm_mean,ID10_Socks_arm_mean,ID11_Socks_arm_mean,ID12_Socks_arm_mean)

#腕部動作のボールペン試行の平均のＦ検定
var.test(BallPen_arm_Strong_mean,BallPen_arm_Week_mean)
#腕部動作のボールペン試行の平均T検定
t.test(BallPen_arm_Strong_mean, BallPen_arm_Week_mean)
#腕部動作のボールペン試行の平均のウィルコクソの順位和検定
wilcox.test(BallPen_arm_Strong_mean,BallPen_arm_Week_mean)

#腕部動作の靴下試行の平均のＦ検定
var.test(Socks_Strong_mean,Socks_Weak_mean)
#腕部動作の靴下試行の平均T検定
t.test(Socks_Strong_mean, Socks_Weak_mean)
#腕部動作の靴下試行の平均のウィル告訴の順位和検定
wilcox.test(Socks_Strong_mean, Socks_Weak_mean)

#腕部動作の分散を出す(BallPen)
ID2_BallPen_arm_var <- var(ID2_BallPen_arm)
ID3_BallPen_arm_var <- var(ID3_BallPen_arm)
ID4_BallPen_arm_var <- var(ID4_BallPen_arm)
ID5_BallPen_arm_var <- var(ID5_BallPen_arm)
ID6_BallPen_arm_var <- var(ID6_BallPen_arm)
ID8_BallPen_arm_var <- var(ID8_BallPen_arm)
ID9_BallPen_arm_var <- var(ID9_BallPen_arm)
ID10_BallPen_arm_var <- var(ID10_BallPen_arm)
ID11_BallPen_arm_var <- var(ID11_BallPen_arm)
ID12_BallPen_arm_var <- var(ID12_BallPen_arm)

ID2_BallPen_arm_var
ID3_BallPen_arm_var
ID4_BallPen_arm_var
ID5_BallPen_arm_var
ID6_BallPen_arm_var
ID8_BallPen_arm_var
ID9_BallPen_arm_var
ID10_BallPen_arm_var
ID11_BallPen_arm_var
ID12_BallPen_arm_var

#腕部動作の分散を出す(Socks)
ID2_Socks_arm_var <- var(ID2_Socks_arm)
ID3_Socks_arm_var <- var(ID3_Socks_arm)
ID4_Socks_arm_var <- var(ID4_Socks_arm)
ID5_Socks_arm_var <- var(ID5_Socks_arm)
ID6_Socks_arm_var <- var(ID6_Socks_arm)
ID8_Socks_arm_var <- var(ID8_Socks_arm)
ID9_Socks_arm_var <- var(ID9_Socks_arm)
ID10_Socks_arm_var <- var(ID10_Socks_arm)
ID11_Socks_arm_var <- var(ID11_Socks_arm)
ID12_Socks_arm_var <- var(ID12_Socks_arm)

ID2_Socks_arm_var
ID3_Socks_arm_var
ID4_Socks_arm_var
ID5_Socks_arm_var
ID6_Socks_arm_var
ID8_Socks_arm_var
ID9_Socks_arm_var
ID10_Socks_arm_var
ID11_Socks_arm_var
ID12_Socks_arm_var

BallPen_arm_Strong_var <- c(ID2_BallPen_arm_var,ID3_BallPen_arm_var,ID4_BallPen_arm_var,ID5_BallPen_arm_var,ID6_BallPen_arm_var)
BallPen_arm_Week_var <- c(ID8_BallPen_arm_var,ID9_BallPen_arm_var,ID10_BallPen_arm_var,ID11_BallPen_arm_var,ID12_BallPen_arm_var)

Socks_Strong_var <- c(ID2_Socks_arm_var,ID3_Socks_arm_var,ID4_Socks_arm_var,ID5_Socks_arm_var,ID6_Socks_arm_var)
Socks_Weak_var <- c(ID8_Socks_arm_var,ID9_Socks_arm_var,ID10_Socks_arm_var,ID11_Socks_arm_var,ID12_Socks_arm_var)

#腕部動作のボールペン試行の分散のＦ検定
var.test(BallPen_arm_Strong_var,BallPen_arm_Week_var)
#腕部動作のボールペン試行の分散T検定
t.test(BallPen_arm_Strong_var, BallPen_arm_Week_var)
#腕部動作のボールペン試行の分散のウィルコクソの順位和検定
wilcox.test(BallPen_arm_Strong_var,BallPen_arm_Week_var)

#腕部動作の靴下試行の分散のＦ検定
var.test(Socks_Strong_var,Socks_Weak_var)
#腕部動作の靴下試行の分散T検定
t.test(Socks_Strong_var, Socks_Weak_var)
#腕部動作の靴下試行の分散のウィル告訴の順位和検定
wilcox.test(Socks_Strong_var, Socks_Weak_var)

# 変動係数
ID2_BallPen_head_cv <- ID2_BallPen_head_sd / ID2_BallPen_head_mean
ID3_BallPen_head_cv <- ID3_BallPen_head_sd / ID3_BallPen_head_mean
ID4_BallPen_head_cv <- ID4_BallPen_head_sd / ID4_BallPen_head_mean
ID5_BallPen_head_cv <- ID5_BallPen_head_sd / ID5_BallPen_head_mean
ID6_BallPen_head_cv <- ID6_BallPen_head_sd / ID6_BallPen_head_mean
ID8_BallPen_head_cv <- ID8_BallPen_head_sd / ID8_BallPen_head_mean
ID9_BallPen_head_cv <- ID9_BallPen_head_sd / ID9_BallPen_head_mean
ID10_BallPen_head_cv <- ID10_BallPen_head_sd / ID10_BallPen_head_mean
ID11_BallPen_head_cv <- ID11_BallPen_head_sd / ID11_BallPen_head_mean
ID12_BallPen_head_cv <- ID12_BallPen_head_sd / ID12_BallPen_head_mean

ID2_BallPen_head_cv
ID3_BallPen_head_cv
ID4_BallPen_head_cv
ID5_BallPen_head_cv
ID6_BallPen_head_cv
ID8_BallPen_head_cv
ID9_BallPen_head_cv
ID10_BallPen_head_cv
ID11_BallPen_head_cv
ID12_BallPen_head_cv

#各パラメータをCSVに書き込む
#値を作成
ID <- c(2,3,4,5,6,8,9,10,11,12)
BallPen_Head_sd <- c(ID2_BallPen_head_sd,ID3_BallPen_head_sd,ID4_BallPen_head_sd,ID5_BallPen_head_sd,ID6_BallPen_head_sd,ID8_BallPen_head_sd,ID9_BallPen_head_sd,ID10_BallPen_head_sd,ID11_BallPen_head_sd,ID12_BallPen_head_sd)
BallPen_Head_mean <- c(ID2_BallPen_head_mean,ID3_BallPen_head_mean,ID4_BallPen_head_mean,ID5_BallPen_head_mean,ID6_BallPen_head_mean,ID8_BallPen_head_mean,ID9_BallPen_head_mean,ID10_BallPen_head_mean,ID11_BallPen_head_mean,ID12_BallPen_head_mean)
BallPen_Head_var <- c(ID2_BallPen_head_var,ID3_BallPen_head_var,ID4_BallPen_head_var,ID5_BallPen_head_var,ID6_BallPen_head_var,ID8_BallPen_head_var,ID9_BallPen_head_var,ID10_BallPen_head_var,ID11_BallPen_head_var,ID12_BallPen_head_var)
BallPen_Chest_sd <- c(ID2_BallPen_chest_sd,ID3_BallPen_chest_sd,ID4_BallPen_chest_sd,ID5_BallPen_chest_sd,ID6_BallPen_chest_sd,ID8_BallPen_chest_sd,ID9_BallPen_chest_sd,ID10_BallPen_chest_sd,ID11_BallPen_chest_sd,ID12_BallPen_chest_sd)
BallPen_Chest_mean <- c(ID2_BallPen_chest_mean,ID3_BallPen_chest_mean,ID4_BallPen_chest_mean,ID5_BallPen_chest_mean,ID6_BallPen_chest_mean,ID8_BallPen_chest_mean,ID9_BallPen_chest_mean,ID10_BallPen_chest_mean,ID11_BallPen_chest_mean,ID12_BallPen_chest_mean)
BallPen_Chest_var <- c(ID2_BallPen_chest_var,ID3_BallPen_chest_var,ID4_BallPen_chest_var,ID5_BallPen_chest_var,ID6_BallPen_chest_var,ID8_BallPen_chest_var,ID9_BallPen_chest_var,ID10_BallPen_chest_var,ID11_BallPen_chest_var,ID12_BallPen_chest_var)
BallPen_Arm_sd <- c(ID2_BallPen_arm_sd,ID3_BallPen_arm_sd,ID4_BallPen_arm_sd,ID5_BallPen_arm_sd,ID6_BallPen_arm_sd,ID8_BallPen_arm_sd,ID9_BallPen_arm_sd,ID10_BallPen_arm_sd,ID11_BallPen_arm_sd,ID12_BallPen_arm_sd)
BallPen_Arm_mean <- c(ID2_BallPen_arm_mean,ID3_BallPen_arm_mean,ID4_BallPen_arm_mean,ID5_BallPen_arm_mean,ID6_BallPen_arm_mean,ID8_BallPen_arm_mean,ID9_BallPen_arm_mean,ID10_BallPen_arm_mean,ID11_BallPen_arm_mean,ID12_BallPen_arm_mean)
BallPen_Arm_var <- c(ID2_BallPen_arm_var,ID3_BallPen_arm_var,ID4_BallPen_arm_var,ID5_BallPen_arm_var,ID6_BallPen_arm_var,ID8_BallPen_arm_var,ID9_BallPen_arm_var,ID10_BallPen_arm_var,ID11_BallPen_arm_var,ID12_BallPen_arm_var)
Socks_Head_sd <- c(ID2_Socks_head_sd,ID3_Socks_head_sd,ID4_Socks_head_sd,ID5_Socks_head_sd,ID6_Socks_head_sd,ID8_Socks_head_sd,ID9_Socks_head_sd,ID10_Socks_head_sd,ID11_Socks_head_sd,ID12_Socks_head_sd)
Socks_Head_mean <- c(ID2_Socks_head_mean,ID3_Socks_head_mean,ID4_Socks_head_mean,ID5_Socks_head_mean,ID6_Socks_head_mean,ID8_Socks_head_mean,ID9_Socks_head_mean,ID10_Socks_head_mean,ID11_Socks_head_mean,ID12_Socks_head_mean)
Socks_Head_var <- c(ID2_Socks_head_var,ID3_Socks_head_var,ID4_Socks_head_var,ID5_Socks_head_var,ID6_Socks_head_var,ID8_Socks_head_var,ID9_Socks_head_var,ID10_Socks_head_var,ID11_Socks_head_var,ID12_Socks_head_var)
Socks_Chest_sd <- c(ID2_Socks_chest_sd,ID3_Socks_chest_sd,ID4_Socks_chest_sd,ID5_Socks_chest_sd,ID6_Socks_chest_sd,ID8_Socks_chest_sd,ID9_Socks_chest_sd,ID10_Socks_chest_sd,ID11_Socks_chest_sd,ID12_Socks_chest_sd)
Socks_Chest_mean <- c(ID2_Socks_chest_mean,ID3_Socks_chest_mean,ID4_Socks_chest_mean,ID5_Socks_chest_mean,ID6_Socks_chest_mean,ID8_Socks_chest_mean,ID9_Socks_chest_mean,ID10_Socks_chest_mean,ID11_Socks_chest_mean,ID12_Socks_chest_mean)
Socks_Chest_var <- c(ID2_Socks_chest_var,ID3_Socks_chest_var,ID4_Socks_chest_var,ID5_Socks_chest_var,ID6_Socks_chest_var,ID8_Socks_chest_var,ID9_Socks_chest_var,ID10_Socks_chest_var,ID11_Socks_chest_var,ID12_Socks_chest_var)
Socks_Arm_sd <- c(ID2_Socks_arm_sd,ID3_Socks_arm_sd,ID4_Socks_arm_sd,ID5_Socks_arm_sd,ID6_Socks_arm_sd,ID8_Socks_arm_sd,ID9_Socks_arm_sd,ID10_Socks_arm_sd,ID11_Socks_arm_sd,ID12_Socks_arm_sd)
Socks_Arm_mean <- c(ID2_Socks_arm_mean,ID3_Socks_arm_mean,ID4_Socks_arm_mean,ID5_Socks_arm_mean,ID6_Socks_arm_mean,ID8_Socks_arm_mean,ID9_Socks_arm_mean,ID10_Socks_arm_mean,ID11_Socks_arm_mean,ID12_Socks_arm_mean)
Socks_Arm_var <- c(ID2_Socks_arm_var,ID3_Socks_arm_var,ID4_Socks_arm_var,ID5_Socks_arm_var,ID6_Socks_arm_var,ID8_Socks_arm_var,ID9_Socks_arm_var,ID10_Socks_arm_var,ID11_Socks_arm_var,ID12_Socks_arm_var)

data = data.frame(ID, BallPen_Head_sd,BallPen_Head_mean,BallPen_Head_var,BallPen_Chest_sd,BallPen_Chest_mean,BallPen_Chest_var,BallPen_Arm_sd,BallPen_Arm_mean,BallPen_Arm_var,Socks_Head_sd,Socks_Head_mean,Socks_Head_var,Socks_Chest_sd,Socks_Chest_mean,Socks_Chest_var,Socks_Arm_sd,Socks_Arm_mean,Socks_Arm_var)
data

write.csv(data, file = "statistical_results.csv")

