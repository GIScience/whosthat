1. download (mysql) backup from e.g. http://whosthat.osmz.ru/whosthat.tgz and extract the compressed file
2. remember _sequenceNumber_ value from `state.txt` for later
3. remove mysql-specific boilerplate code (all except of the long `INSERT` statements) from `tmp/whosthat.sql`
4. replace `` `whosthat` `` with `whosthat` (without backticks `` ` ``)
5. npm install
6. node index.js …/whosthat.sql > whosthat.fixed.sql
7. create tables ./scripts/parse_osc.pl -d whosthat_test -u … -p … -c
8. put previously remembered  _sequenceNumber_ value (from the dump's `state.txt` file) into database table `whosthat_state`, e.g. `insert into whosthat_state values (…)`
9. import into postgres, e.g. `cat ./whosthat-dump.fixed.sql | psql whosthat_test` <- there will be some duplicate entries
10. remove/merge duplicate entries from sql, recreate tables again (`scripts/parse_osc.pl -c`), and reimport fixed dump into postgres (eventually repeat until there are no more duplicated lines)

