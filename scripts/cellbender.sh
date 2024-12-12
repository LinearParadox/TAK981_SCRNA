for n in cellranger/*
do
    if [ "$n" == "cellranger/cd40-1" ]; then
    continue
    fi
    if [ "$n" == "cellranger/cd40-2" ]; then
        mkdir $n/cellbender
        cellbender remove-background \
    		--cuda \
    		--input ${n}/raw_feature_bc_matrix.h5 \
    		--output ${n}/cellbender/cellbender.h5 \
            --learning-rate 0.00005
            --estimator-multiple-cpu
    else
    	mkdir $n/cellbender
    	cellbender remove-background \
    		--cuda \
    		--input ${n}/raw_feature_bc_matrix.h5 \
    		--output ${n}/cellbender/cellbender.h5
            --estimator-multiple-cpu
    fi
done
