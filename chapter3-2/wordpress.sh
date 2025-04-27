#!/bin/bash

# システムアップデート
sudo dnf update -y

# Apache, PHP, その他必要なパッケージのインストール
sudo dnf install -y httpd php php-mysqlnd php-fpm php-json php-mbstring

# WordPressのダウンロードと展開
wget http://ja.wordpress.org/latest-ja.tar.gz -P /tmp/
tar zxvf /tmp/latest-ja.tar.gz -C /tmp
sudo rm -rf /var/www/html/*
sudo cp -r /tmp/wordpress/* /var/www/html/

# パーミッションの設定
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html

# wp-config.phpの設定
cd /var/www/html
sudo cp wp-config-sample.php wp-config.php
sudo sed -i "s/database_name_here/wpdb/" wp-config.php
sudo sed -i "s/username_here/dba/" wp-config.php
sudo sed -i "s/password_here/${rds_password}/" wp-config.php
sudo sed -i "s/localhost/wordpress.cbsqsiwkkw2a.ap-northeast-1.rds.amazonaws.com/" wp-config.php

# Apacheの起動と自動起動設定
sudo systemctl enable httpd
sudo systemctl start httpd