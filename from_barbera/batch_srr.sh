#!/bin/bash

for i in $(ls); do
		cd $i && srr_munch.sh && cd ..
		echo "Processed SRA list for: $i"
done

#srr_munch.sh
#cd ../Liu_2019 && srr_munch.sh
#cd ../Zhou_2019 && srr_munch.sh

#srr_munch.sh $(find $(pwd) -maxdepth 3 | grep "SRR_Acc_List")
