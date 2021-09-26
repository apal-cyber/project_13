#!/bin/bash

echo "Input date: "
read D
echo "Input time: "
read T
echo | grep  "$T" ${D}_Dealer_schedule | awk '{print $1, $2, $5, $6 }'
