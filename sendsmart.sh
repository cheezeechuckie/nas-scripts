#!/bin/bash
#
# Place this in /bin/
# Call: sh /bin/sendsmart.sh
# Credit: started from tkaiser on omv forum


TempFile=$(mktemp /tmp/${0##*/}.XXXXXX)
trap "rm -f \"${TempFile}\" ; exit 0" 0 1 2 3 15
(
echo "To: your@email.here.com"
echo "Subject: SMART Results for all drives"
echo " "
) > ${TempFile}
for disk in /dev/sd? ; do
        smartctl -a ${disk} >> ${TempFile}
done
sendmail -t < ${TempFile}
exit 0

# -a - all attributes
