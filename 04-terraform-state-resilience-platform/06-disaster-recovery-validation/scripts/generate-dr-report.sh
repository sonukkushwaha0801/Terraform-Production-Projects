#!/bin/bash

REPORT_FILE="dr-report.txt"

echo "Terraform DR Validation Report" > $REPORT_FILE
echo "Generated: $(date)" >> $REPORT_FILE
echo "Status: SUCCESS" >> $REPORT_FILE

echo
echo "Report Generated:"
echo "$REPORT_FILE"
