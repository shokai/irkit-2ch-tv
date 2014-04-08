# 2ch実況で一番勢いのあるチャンネルにTVを自動で合わせる


## しくみ
[実況勢い観測](http://bc2ch.net/) -----> IRKit -----> TV


## 必要なもの
- Ruby1.9以上
- Mac OSX or Linux
- [IRKit](http://getirkit.com/)


## Install Dependencies

依存gemのインストール。irkit gemとirkitコマンドもインストールされる。

    % gem install bundler
    % bundle install


## 準備

事前にIRKitで赤外線データを学習しておく。bc2chの局名に合わせる。

    % irkit -help
    % irkit -get テレビ東京
    % irkit -get NHK総合
    % irkit -get NHK教育
    % irkit -get 日本テレビ
    % irkit -get テレビ朝日

## 使う

    % bundle exec ruby irkit-2ch-tv.rb


## 定期的に実行

crontabなどを使えばok。10分ごとに実行する例

    % crontab -e
    */10 * * * * cd /path/to/irkit-2ch-tv/ && bundle exec ruby irkit-2ch-tv.rb > /dev/null 2>&1
