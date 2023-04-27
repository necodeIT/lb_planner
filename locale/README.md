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

# helper scripts

## reload.sh

this script prints a mysql script that reloads all of the translation strings. No parameters required!

## commit.sh

this is a short script that connects to the database and tries to execute the command specified in `reload.sh`. It needs four parameters:

- server hostname
- port
- database name
- username

Additionally, it will read the user password from stdin. You can either enter it manually or use a pipe.

**Example usage:**

```bash
echo passwd1 | ./commit.sh projekte.tgm.ac.at 3306 lbpages lbplanner
```