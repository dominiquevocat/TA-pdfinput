PDFDIR="/opt/splunk/etc/apps/SA-PDFINPUT/bin"

for PDF in "`find $PDFDIR -name "*.tst"`"
do
    #echo $D
    echo ***SPLUNK*** index=main source=\"$PDF\" sourcetype="pdf"
    /opt/splunk/bin/splunk cmd python /opt/splunk/etc/apps/SA-PDFINPUT/bin/pdfinput.py "$PDF"
    mv "$PDF" "$PDF.old"
done
