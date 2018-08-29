### Bash scripts

Power tools to automate stuff at work as a backend engineer or as a data engineer.

From my experience working with AWS, Git, Slack, JIRA, Confluence.

Focuses on minimalism and productivity.

#### CLI Tools

- [franz](https://github.com/meetfranz/franz)
- [postman](https://www.getpostman.com)
- [httpie](https://httpie.org)
- [jq](https://stedolan.github.io/jq/)
- [git-standup](https://github.com/kamranahmedse/git-standup)
- [slack-cli](https://github.com/candrholdings/slack-cli)
- [jira-cmd](https://github.com/germanrcuriel/jira-cmd)
- [ncdu](https://dev.yorhel.nl/ncdu)
- [ncdu-s3](https://github.com/EverythingMe/ncdu-s3)
- [puppeteer](https://github.com/GoogleChrome/puppeteer)
- [ngrok](https://ngrok.com)

#### Slack automation

...

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

#### References

- https://github.com/agarrharr/awesome-cli-apps
- https://github.com/alebcay/awesome-shell
- [The 4-hour workweek](https://www.goodreads.com/book/show/368593.The_4_Hour_Workweek)
- [Common CRON mistakes](http://www.alleft.com/sysadmin/common-cron-mistakes/)

#### TODO

- [ ] Add unit tests using [bats](https://github.com/sstephenson/bats)
- [ ] Add more stuff
