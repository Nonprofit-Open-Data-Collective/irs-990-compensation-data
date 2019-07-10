# GINAP - GIven Name mAPper


From: [https://www.galbithink.org/names/ginap.htm](https://www.galbithink.org/names/ginap.htm)

This name standardization code **(GINAP, a GIven Name mAPper)** concerns English-language personal given names, as well as some Latin forms of common English given names. GINAP groups together names that either sound the same, have the same public meaning, or changed only in the recording process (spelling errors, recording errors, etc.). It corrects the sex indicator errors for common, sex-unambiguous names. It also maps common generic names (Mr, Mrs, infant, baby, etc.) and single letter names to the null code represented by a period (".").

GINAP is offered on an open source basis under the GNU General Public License. Scholars are encouraged to modify and expand the code. But please indicate clearly in citing and distributing a new code the source version you used and any changes that you made. This information is important for duplicating and comparing results, and for progressively improving the quality of the code.

For other information and sources relating to the analysis of the distribution of given names, see the Given Names Frequency Project.

Procedure for running GINAP:

Create new fields gname and sex in a relational database in which named persons constitute the records. Original name and sex fields should not be deleted or overwritten, but should be retained to prevent loss of information. The new fields gname and sex are defined as follows:

gname: a text field derived from a person’s given name written in the standard 26 letter modern English alphabet. If the given name has more than eight letters, gname consists only of the first eight letters. If the given name includes a space, period, hyphen or other non-alphabetical characters, gname includes only the letters preceding the first such character. The first letter of gname is a capital letter; any subsequent letters are small letters.

sex: an integer indicating the person’s sex (1=female, 2=male). If no sex indicator is available, code all records with 2. This code has been chosen because medieval records primarily consist of male names, and hence sex correction codes for medieval names in GINAP focus on male-to-female corrections.

Open in a text editor the current version of GINAP (1.1) (version 1.0 is here) and delete the GNU General Public License header (and the data field headers if your database cannot read them). Save the result as temporary file ginap-m.txt.

Import the comma-delimited text file ginap-m.txt into your database into a table named ginap. Note that the layout of fields in ginap is sex-o, sex-s, gname-o, gname-s. The name standardization maps the fields sex-o and gname-o ("originals") into sex-s and gname-s ("standardized forms").

Join the fields sex-o and gname-o in the table ginap to the sex and gname fields in your records. Run a query that updates the sex and gname fields in the matching records to sex-s and gname-s, respectively.

Note: In counting records for calculating name popularities, null records (coded to a period (".")) should be excluded.

---

# GINAP-version-1.0.csv

Copied from the original version here: [https://www.galbithink.org/names/ginap.txt](https://www.galbithink.org/names/ginap.txt)

GINAP, Version 1.0 - name standardization code for English-language 
personal given names, as well as some Latin forms of common English 
given names

This code is a free software program; you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published 
by the Free Software Foundation; either version 2 of the License, 
or (at your option) any later version.  For a copy of the GNU
Public License, 
see http://www.opensource.org/licenses/gpl-license.html

This code is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
General Public License for more details.

The author of Version 1.0 is Douglas Galbi.  He can be contacted by 
e-mail at zeitgeist98@iname.com or by paper mail at 1307 N. Ode St., 
Apt. 435, Arlington, VA 22209.  For details on running this code,
see http://www.galbithink.org/names/ginap.html  


---

# GINAP-version-2.0.csv

We have extended the original GINAP given name standardization file as follows:

