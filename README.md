# QuizTemplateApp

## サイト概要
主にレストランなどの飲食店で働く人のためのサイトで、クイズ形式で問題を解くことで、お店の商品知識の理解を深められるサイトです。

### テーマを選んだ理由
私が実際に働いているレストランでは、お客様のご要望に対応するために商品知識が必要です。
また、ソムリエやバーテンダー、バリスタなどをはじめとする専門知識を要するポジションでも同様に知識が必要となります。
そのための学習時間が従業員には設けられており、学習の最後にテスト形式で理解度を確認します。
現在では、そのテストを用紙で行っているため、これをアプリケーションとして作ることができると思いこのテーマを選びました。

### メリット
- 人件費を削れる<br />
  用紙の形式では、出題側が採点を都度行う必要があり、採点するための人員を割く必要がありました。
  しかし、これをアプリケーションとして自動化すれば、採点するために人員を割く必要はなくなります。

- 解きっきりをなくせる<br />
  これまでは問題を一度解いたら終わりで、間違えた問題を見直す機会はほとんどなく、受けた切りとなって有効活用できていませんでした。
  しかし、達成率という形で可視化することで、間違えた問題を「誤答問題リスト」として一覧できる機能があるので、覚えるまで振り返り学習することができます。

- 紙を無駄にしない<br />
  これまでの紙の形式とは異なり電子版なので、紙を印刷する必要がありません。

- ランキング形式で学習意欲を向上<br />
  達成率や正答率をランキング形式にし可視化することで、学習意欲をより促進できます。

- 簡単にスタッフの教育進度を確認できる<br />
  管理者はスタッフの学習の達成率や正答率を確認することでひとめで商品知識の理解度を確認することが可能です。

### ターゲットユーザ
飲食店のマネージャーや教育チームなど

### 主な利用シーン
スタッフの教育時、教育の進度を確認する時

## 設計書
- ワイヤーフレーム
    - [エンドユーザー側](https://docs.google.com/presentation/d/1OzLFpmpzXDgM4hCzvYUqzFEot72Gd0mifktNJPSh3TY/edit?usp=sharing)
    - [管理者側](https://docs.google.com/presentation/d/1PYMCgLxt_RAWg-ldga9_NK921aoxNsSnbWvFUke7uq8/edit?usp=sharing)
- UI Flows
    - [エンドユーザー側](https://drive.google.com/file/d/1dMgpz0at2ti2O02bj_cry-HMlbV4cE00/view?usp=sharing)
    - [管理者側](https://drive.google.com/file/d/18GXDIDS4ew5d8Bo08sRE58i-xvc7ggbt/view?usp=sharing)
- [ER図](https://app.diagrams.net/#G101-VEWajDF5Os07ogFXGQhSj5vQlW24T)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1vpu2JEOMfGRNMmJ0IlxvuerfNxHbZy5hgQvVizzXkc0/edit?usp=sharing)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/10_a5xxnsgidroidpTSMcFmeTdKzugFEN/edit?usp=sharing&ouid=112204990398560162009&rtpof=true&sd=true)

## チャレンジ要素一覧
[Googleスプレッドシート](https://docs.google.com/spreadsheets/d/1lwIlwItBYlEIK2DCFUPcZWzLjwV8VuEpqazJ_Ki0MHk/edit?usp=sharing)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL,Sass
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery,Chart.js
- IDE：Cloud9