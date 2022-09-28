# Localization

## Database setup

There's a main table with the key strings and corresponding IDs. Its definition is:
```
create table TranslationKeys(
	id int PRIMARY KEY,
	name varchar(15) UNIQUE NOT NULL
);
```

For every language, there's a separate table. For example, the english table:
```
create table Translation_en(
	id int PRIMARY KEY,
	str varchar(255),
	FOREIGN KEY (id) REFERENCES TranslationKeys(id)
);
```

## Database requirements

You need to have mysql/mariadb installed. The user `lbplanner` has to be granted `SELECT` for the website to work.
For the locale update script `./reload.sh` to work, the user `lbplanner` has to be granted `FILE` and probably some others related to modifying tables. I recommend granting `ALL` temporarily.
(`FILE` has to be granted separately & globally to work)