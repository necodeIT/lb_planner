# Localization Database setup

There's a main table with the key strings and corresponding IDs. Its definition is:
```mysql
create table TranslationKeys(
	id int PRIMARY KEY,
	name varchar(15) UNIQUE NOT NULL
);
```

For every language, there's a separate table. For example, the english table:
```mysql
create table Translation_en(
	id int PRIMARY KEY,
	str varchar(255),
	FOREIGN KEY (id) REFERENCES TranslationKeys(id)
);
```

# Docs Database setup

There's a main table with the titles and corresponding IDs. Its definition is:
```mysql
create table DocsTitles_en(
	id int PRIMARY KEY,
	text varchar(31)
);
```

For every title, there's several headings, which reside in this table:
```mysql
create table DocsHeadings_en(
	id int PRIMARY KEY,
	title_id int,
	text varchar(63),
	FOREIGN KEY (title_id) REFERENCES DocsTitles_en(id)
);
```

And then there's the texts below each title:
```mysql
create table DocsTexts_en(
	heading_id int,
	text_id int,
	text varchar(255),
	FOREIGN KEY (heading_id) REFERENCES DocsHeadings_en(id),
	PRIMARY KEY (heading_id,text_id)
);
```

One heading can have multiple texts associated with them. They're sorted by id in ascending order and then concatenated.

# Database requirements

You need to have mysql/mariadb installed. The user `lbplanner` has to be granted `SELECT` for the website to work.
For the locale update script `./reload.sh` to work, the user `lbplanner` has to be granted `FILE` and probably some others related to modifying tables. I recommend granting `ALL` temporarily.
(`FILE` has to be granted separately & globally to work)