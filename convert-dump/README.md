1. download (mysql) backup from e.g. http://whosthat.osmz.ru/whosthat.tgz
2. extract and move the `state.txt` file to `scripts` directory
3. remove mysql-specific boilerplate code (all except of the long `INSERT` statements) from `tmp/whosthat.sql`
4. replace `` `whosthat` `` with `whosthat` (without backticks `` ` ``)
5. npm install
6. node index.js …/whosthat.sql > whosthat.fixed.sql
7. create tables ./scripts/parse_osc.pl -d whosthat_test -u … -p … -c
8. import into postgres, e.g. `cat ./whosthat-dump.fixed.sql | psql whosthat_test` <- there will be some duplicate entries
9. remove/merge duplicate entries from sql, recreate tables again (`scripts/parse_osc.pl -c`), and reimport fixed dump into postgres (eventually repeat until there are no more duplicated lines)

