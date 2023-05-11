# -*- mode: ruby -*-
# vi: set ft=ruby :

$provision = <<SCRIPT

apt-get update
apt-get install nginx mariadb-server php php-mysql php-fpm -y

rm /etc/nginx/sites-available/default -f
cp /vagrant/nginxfile /etc/nginx/sites-available/default

mysql -e "
CREATE USER 'lbplanner'@'localhost';
CREATE DATABASE lbpages;
GRANT ALL ON lbpages.* TO 'lbplanner'@'localhost';
GRANT FILE ON *.* TO 'lbplanner'@'localhost';

use lbpages;

create table TranslationKeys(
	id int PRIMARY KEY,
	name varchar(15) UNIQUE NOT NULL
);
create table Translation_en(
	id int PRIMARY KEY,
	str varchar(255),
	FOREIGN KEY (id) REFERENCES TranslationKeys(id)
);
create table DocsTitles_en(
	id int PRIMARY KEY,
	text varchar(31)
);
create table DocsHeadings_en(
	id int PRIMARY KEY,
	title_id int,
	text varchar(63),
	FOREIGN KEY (title_id) REFERENCES DocsTitles_en(id)
);
create table DocsTexts_en(
	heading_id int,
	text_id int,
	text varchar(255),
	FOREIGN KEY (heading_id) REFERENCES DocsHeadings_en(id),
	PRIMARY KEY (heading_id,text_id)
);
create table Translation_de(
	id int PRIMARY KEY,
	str varchar(255),
	FOREIGN KEY (id) REFERENCES TranslationKeys(id)
);
create table DocsTitles_de(
	id int PRIMARY KEY,
	text varchar(31)
);
create table DocsHeadings_de(
	id int PRIMARY KEY,
	title_id int,
	text varchar(63),
	FOREIGN KEY (title_id) REFERENCES DocsTitles_en(id)
);
create table DocsTexts_de(
	heading_id int,
	text_id int,
	text varchar(255),
	FOREIGN KEY (heading_id) REFERENCES DocsHeadings_en(id),
	PRIMARY KEY (heading_id,text_id)
);
"

echo | /vagrant/locale/commit.sh localhost 3306 lbpages lbplanner

sudo systemctl restart nginx

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  #NOTE: needs vagrant-hostsupdater plugin
  config.vm.hostname = "lbplanner.local"
  # presumably also works with different providers
  config.vm.provider :libvirt do |libvirt|
    libvirt.cpus=4
    libvirt.memory=2048
	libvirt.graphics_type="spice" # otherwise it complains about missing audio system…?
  end
  config.vm.provision :shell, inline: $provision, privileged: true, reset: true
end