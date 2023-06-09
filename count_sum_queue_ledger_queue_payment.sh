#!/bin/bash

sqlplus 'LOENA/LOENA#exa82bsd2021'@'(DESCRIPTION=(FAILOVER=on)(LOAD_BALANCE =off)(CONNECT_TIMEOUT=2)(RETRY_COUNT=2)(RETRY_DELAY=2)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=exa82absdp-scan1)(PORT=1521))(ADDRESS=(PROTOCOL=TCP)(HOST=exa82atbsp-scan1)(PORT=1521)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=haloena)))' << EOF

select count(*) as QUEUE_LEDGER0 from queue_ledger0;
select count(*) as QUEUE_LEDGER1 from queue_ledger1;
select count(*) as QUEUE_LEDGER2 from queue_ledger2;
select count(*) as QUEUE_LEDGER3 from queue_ledger3;
select count(*) as QUEUE_LEDGER4 from queue_ledger4;
select count(*) as QUEUE_LEDGER5 from queue_ledger5;
select count(*) as QUEUE_LEDGER6 from queue_ledger6;
select count(*) as QUEUE_LEDGER7 from queue_ledger7;
select count(*) as QUEUE_LEDGER8 from queue_ledger8;
select count(*) as QUEUE_LEDGER9 from queue_ledger9;
select count(*) as QUEUE_PAYMENT0 from queue_payment0;
select count(*) as QUEUE_PAYMENT1 from queue_payment1;
select count(*) as QUEUE_PAYMENT2 from queue_payment2;
select count(*) as QUEUE_PAYMENT3 from queue_payment3;
select count(*) as QUEUE_PAYMENT4 from queue_payment4;
select count(*) as QUEUE_PAYMENT5 from queue_payment5;
select count(*) as QUEUE_PAYMENT6 from queue_payment6;
select count(*) as QUEUE_PAYMENT7 from queue_payment7;
select count(*) as QUEUE_PAYMENT8 from queue_payment8;
select count(*) as QUEUE_PAYMENT9 from queue_payment9;

exit;
EOF
