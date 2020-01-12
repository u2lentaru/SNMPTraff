#!/bin/bash
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.31.1.1.1.6 >>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.31.1.1.1.10 >>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.2.2.1.10>>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.2.2.1.16>>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.31.1.1.1.18 >>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.2.2.1.2>>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.2.2.1.8>>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`
/usr/local/bin/snmpbulkwalk -v 2c -c eut4read 62.181.42.6 .1.3.6.1.2.1.2.2.1.9>>/export/home/u2/MIBS/62.181.42.6/62.181.42.6_`/bin/date "+%Y%m%d%H%M"`

