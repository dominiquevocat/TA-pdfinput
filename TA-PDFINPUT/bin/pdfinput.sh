PDFDIR="/opt/splunk/etc/apps/SA-PDFINPUT/bin"

for PDF in "`find $PDFDIR -name "*.pdf"`"
do
    #echo $D
    FILESIZE=$(stat -c%s "$PDF")
    echo ***SPLUNK*** index=main source=\"$PDF\" sourcetype="pdf" filesize="$FILESIZE"
    /opt/splunk/bin/splunk cmd python /opt/splunk/etc/apps/SA-PDFINPUT/bin/pdfinput.py "$PDF"
    mv "$PDF" "$PDF.old"
done
