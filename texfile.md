# TeXファイルについて

* [PDFファイルのページ数](#pdfファイルのページ数)
* [プリアンブル](#プリアンブル)
* [seiritz.sty](#seiritzsty)
  * [パッケージ](#パッケージ)
    * [数式関連](#数式関連)
    * [画像関連](#画像関連)
    * [その他](#その他のパッケージ)
  * [コマンド定義](#コマンド定義)

## PDFファイルのページ数

表紙(ページ数に含まれない)で1ページ使っているため、冊子形式を想定すると、最後のページのページ番号が

* 4n-1→裏表紙も使う
* 4n+2→裏表紙を使わない

## プリアンブル

文書クラスはいつも通り。

```tex
 \documentclass[a4paper,11pt]{jsarticle}
```

パッケージは以下の一文でよい。

```tex
 \usepackage{seiritz}
```

ページスタイルはファイルによって異なる。

```tex
 %*_all.tex
 \pagestyle{fancy}
  \cfoot{\thepage}
  \renewcommand{\headrulewidth}{0pt}%ページ上部の線をなくす
```

```tex
 %*_Qn.tex
 \pagestyle{fancy}
  \lhead{YYYY/MM/DD}
  \rhead{第n問}
  \cfoot{\thepage}
```

## seiritz.sty

### パッケージ

#### 数式関連

機械的に書いているが、気持ち的には上が必須な、下が便利なパッケージのつもり。

```tex
 \usepackage{amsmath, amsfonts, amssymb, mathtools, mathrsfs, latexsym}
 \usepackage{nccmath, empheq}
```

#### 画像関連

```tex
 %\usepackage[draft]{graphicx}%画像の枠だけ
 \usepackage[dvipdfmx]{graphicx}%通常の画像
 \usepackage[dvipdfmx]{color}%テキストに色をつける。(dvipfmxのオプションが必要なのでここに)
 \usepackage{here, wrapfig, subcaption}%順に、絶対here, 回り込み、minipageによる図の貼り付けときに各画像のキャプション
```

#### その他のパッケージ

```tex
 \usepackage{enumerate, comment, fancyhdr}% 順に、文書モードでの段落環境、複数行コメント、ページスタイル
```

### コマンド定義

```tex
\newcounter{partNo}%大問番号-第n問のnに相当
\newcounter{eqNo}%式番号

\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}%絶対値

\newcommand{\vevenspace}{\vspace{\stretch{1}}}%複数の行を等間隔に配置
\newcommand{\hruleline}{\par\noindent\hrulefill\par}%黒線の行を引く
\newcommand{\length}[1]{$\overline{\textup{#1}}$}%共役複素数や線分ABの長さを表すときに用いる上線

\newcommand{\nn}{$n$}%小文字のn(数式)-自然数
\newcommand{\m}{$m$}%小文字のm(数式)-自然数
\newcommand{\kmath}{$k$}%小文字のk(数式)-自然数、ばね定数
\newcommand{\Rmath}{$R$}%大文字のR(数式)-気体定数
\newcommand{\g}{$g$}%小文字のg(数式)-重力加速度
\renewcommand{\O}{\textup{O}}%原点O
\newcommand{\xy}{$xy$}%xy平面
\newcommand{\yz}{$yz$}%yz平面
\newcommand{\xz}{$xz$}%xz平面
\newcommand{\zx}{$zx$}%zx平面
\newcommand{\xyz}{$xyz$}%xyz空間座標系
\newcommand{\x}{$x$}%x(数式)
\newcommand{\y}{$y$}%y(数式)
\newcommand{\z}{$z$}%z(数式)
\newcommand{\Pn}[2]{$\textup{#1}_{#2}$}%テキストモードで使う点Pn
\newcommand{\mathPn}[2]{\textup{#1}_{#2}}%数式モードで使う点Pn
\renewcommand{\P}{\textup{P}}%点P
\newcommand{\Q}{\textup{Q}}%点Q
\newcommand{\R}{\textup{R}}%点R
\newcommand{\A}{\textup{A}}%点A
\newcommand{\B}{\textup{B}}%点B
\newcommand{\C}{\textup{C}}%点C
\newcommand{\D}{\textup{D}}%点D
\newcommand{\numseq}[2]{$\{#1_{#2}\}$}%数列{an}
\newcommand{\combi}[2]{{}_{#1}\mathrm{C}_{#2}}%組み合せnCr

\newcommand{\qPart}{%中央揃えで第n問と表示
\pagebreak
\stepcounter{partNo}%partNo=partNo+1
\noindent\textup{\Large 第\arabic{partNo}問}
\par\vspace{0.5\baselineskip}
}
\newcommand{\calcPage}{%計算用紙のためのページを挿入
\pagebreak
\begin{center}
\textless\,計算用紙\,\textgreater
\end{center}
\pagebreak
}

\newcommand{\brankPage}{%空白ページ
\pagebreak\mbox{}\pagebreak
}

\newcommand{\ctext}[1]{%丸数字
\raise0.2ex\hbox{\textcircled{\scriptsize{#1}}}
}

\newcommand{\assignNumEq}{%式に番号を振る
\stepcounter{numEq}
\tag*{$\cdots\cdots$\ctext{\the\value{numEq}}}
}
```
