### Bash scripts

Power tools to automate stuff at work as a backend engineer or as a data engineer.

From my experience working with AWS, Git, Slack, JIRA, Confluence.

Focuses on minimalism and productivity.

#### CLI Tools

- [`aws-cli`](https://github.com/aws/aws-cli)
- [`awslogs`](https://github.com/jorgebastida/awslogs)
- [`aws-shell`](https://github.com/awslabs/aws-shell)
- [`csvkit`](https://github.com/wireservice/csvkit)
- [`httpie`](https://httpie.org)
- [`franz`](https://github.com/meetfranz/franz)
- [`postman`](https://www.getpostman.com)
- [`httpie`](https://httpie.org)
- [`jq`](https://stedolan.github.io/jq/)
- [`git-standup`](https://github.com/kamranahmedse/git-standup)
- [`jira-cmd`](https://github.com/germanrcuriel/jira-cmd)
- [`ncdu`](https://dev.yorhel.nl/ncdu)
- [`ncdu-s3`](https://github.com/EverythingMe/ncdu-s3)
- [`puppeteer`](https://github.com/GoogleChrome/puppeteer)
- [`ngrok`](https://ngrok.com)
- [`socat`](https://github.com/craSH/socat)
- [`hub`](https://github.com/github/hub)
[`mssql-tools`](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?- view=sql-server-2017)
- [`psql`](https://docs.aws.amazon.com/redshift/latest/mgmt/connecting-from-psql.html)

#### Slack automation

- [`slack-cli`](https://github.com/candrholdings/slack-cli)

#### Git Functions

```
$./git-clean-secrets.sh
```

#### Time Functions
```
$./calendar.sh

Thu	Fri	Sat	Sun	Mon	Tue	Wed	Thu
 30	 31	 1	 2	 3	 4	 5	 6

$./timer-pv.sh 2
```

#### AWS Functions

```bash
$./aws-bucket-list.sh s3://ryft-public-sample-data/

$./aws-bucket-list-csv.sh s3://ryft-public-sample-data/

# Connect through local DB Client (Datagrip, DBeaver, Kopf, Cerebro)
# - <bastion-name>
# - <front-name>
$./aws-tunnel-db.sh "elastic"
$./aws-tunnel-db.sh "rds"
```

#### SSH tricks

##### Live tail multiple remote files

With [multitail](https://www.vanheusden.com/multitail/)

```bash
multitail -l 'ssh <user>@<node1> tail -f /path/to/file.log"' -l 'ssh <user>@<node2> "tail -f /path/to/file.log"'
```

##### Difference of two remote files

```bash
diff <(ssh <user>@<node1> 'cat /path/to/file.conf') <(ssh <user>@<node2> 'cat /path/to/file.conf')
```

See: http://xmodulo.com/how-to-diff-remote-files-over-ssh.html

#### JIRA Functions

```bash
jira worklogadd XXX-72 1
jira comment XXX-72 "Hello this is done."
```

#### Crontab tricks

Trigger a check in [Healthchecks.io](https://healthchecks.io/checks/).

```
$ crontab -l
PATH=/path/to/.nvm/versions/node/v8.0/bin
MAILTO="you.name@domain.com"
0 17 * * 1-5 jira worklogadd XXX-20 6 <subject> && curl -fsS --retry 3 https://hchk.io/<uuid> > /dev/null
```

#### Programming

...

#### Docker Setup

```bash
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker michel
```

```bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```

##### RocksDB ldb

```bash
docker pull arschles/rocksdb-ldb
docker run -v $PWD:/pwd -w /pwd arschles/rocksdb-ldb /rocksdb/tools/ldb --db=. scan
```

##### Monitoring

```sh
$ crontab -l
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/home/michel/.local/bin/:/home/michel/Scripts/monitoring

0 9,13,18 * * 1-5 healthchecks.sh
0 9,13 * * 1-5 wakeup.sh
```

#### References

- https://github.com/agarrharr/awesome-cli-apps
- https://github.com/alebcay/awesome-shell
- [The 4-hour workweek](https://www.goodreads.com/book/show/368593.The_4_Hour_Workweek)
- [Common CRON mistakes](http://www.alleft.com/sysadmin/common-cron-mistakes/)
- [Slack API - Attaching content and links to message](https://api.slack.com/docs/message-attachments)
- Bash stuff : [crontab guru](https://crontab.guru), [SO #869589](https://stackoverflow.com/questions/869589)
- [SO #3004811](https://stackoverflow.com/questions/3004811), [SE #230673](https://unix.stackexchange.com/questions/230673)

#### TODO

- [ ] Add unit tests using [bats](https://github.com/sstephenson/bats)
- [ ] Add more stuff
