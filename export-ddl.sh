#!/usr/bin/env bash

# References
# - https://github.com/Microsoft/mssql-scripter/blob/dev/doc/usage_guide.md
# - https://unix.stackexchange.com/questions/234544/
# - https://stackoverflow.com/questions/6945621/
# - https://stackoverflow.com/questions/1494178/

export MSSQL_SCRIPTER_PASSWORD=xxxxxx

debug=true

mkdir -p ddl/tmp/
cd ddl/ || exit

declare -A domain=( \
  ["host"]="host.net" \
  ["database"]="dbname" \
	["user"]="username" \
	["schema"]="dbo" \
)

mssql-scripter -S "${domain[host]}" -d "${domain[database]}" -U "${domain[user]}" \
  --include-objects "${domain[schema]}." --include-types TABLE > "tmp/${domain[database]}.sql"

# Extract only CREATE TABLE commands, ignore other commands
grep -zo 'CREATE TABLE .*ON ' "tmp/${domain[database]}.sql" \
  | grep -v 'SET\|GO\|\*\*\* Object' \
  | sed 's/ON \[PRIMARY\]/\n/g
          /CONSTRAINT/,/WITH/d
          /PRIMARY/,/WITH/d
          /INDEX/,/WITH/d' \
	> "${domain[database]}.sql"

if [ $debug = false ]; then
	# Remove temporary files
  rm -r tmp/
fi
