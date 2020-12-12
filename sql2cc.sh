#!/usr/bin/env bash

# References
# - https://stackoverflow.com/questions/26568952/

# Possible improvements (for the moment, keep it simple with basic replaces)
# - https://unix.stackexchange.com/questions/416656/
# - https://stackoverflow.com/questions/28795479/

sed 's/)$/) extends DlRecord/
     s/CREATE TABLE/case class/
		 s/ IDENTITY(1,1)//
		 s/ \[smalldatetime\] NOT NULL/: Timestamp/
		 s/ \[smalldatetime\] NULL/: Option\[Timestamp\]/
		 s/ \[datetime\] NOT NULL/: Timestamp/
		 s/ \[datetime\] NULL/: Option\[Timestamp\]/
		 s/ \[char\].* NOT NULL/: String/g
		 s/ \[char\].* NULL/: Option\[String\]/g
		 s/ \[varchar\].* NOT NULL/: String/g
		 s/ \[varchar\].* NULL/: Option\[String\]/g
		 s/ \[nvarchar\].* NOT NULL/: String/g
		 s/ \[nvarchar\].* NULL/: Option\[String\]/g
		 s/ \[text\] NOT NULL/: String/
		 s/ \[text\] NULL/: Option\[String\]/
		 s/ \[ntext\] NOT NULL/: String/
		 s/ \[ntext\] NULL/: Option\[String\]/
		 s/ \[int\] NOT NULL/: Int/
		 s/ \[int\] NULL/: Option\[Int\]/
		 s/ \[smallint\] NOT NULL/: Short/
		 s/ \[smallint\] NULL/: Option\[Short\]/
		 s/ \[tinyint\] NOT NULL/: Short/
		 s/ \[tinyint\] NULL/: Option\[Short\]/
		 s/ \[tinyint\] NOT NULL/: Short/
		 s/ \[bigint\] NOT NULL/: Long/
		 s/ \[bigint\] NULL/: Option\[Long\]/
		 s/ \[bit\] NOT NULL/: Boolean/
		 s/ \[bit\] NULL/: Option\[Boolean\]/
		 s/\[[a-z]*\]\.//gi
		 s/_ARCHIVES/Archives/
		 s/\](/Record (/
		 s/\[//
		 s/\]//
		 s/    /\t/' "$1"
