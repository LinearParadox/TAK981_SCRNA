mkdir cellranger/ctrl-2/cellbender
cellbender remove-background \
    	--cuda \
    	--input  cellranger/ctrl-2/raw_feature_bc_matrix.h5 \
    	--output cellranger/ctrl-2/cellbender/cellbender.h5 \
        --learning-rate 0.00001
mkdir cellranger/tak-1/cellbender
cellbender remove-background \
    	--cuda \
    	--input cellranger/tak-1/raw_feature_bc_matrix.h5 \
    	--output cellranger/tak-1/cellbender/cellbender.h5 \
        --epochs 200 \
        --learning-rate 0.00001
mkdir cellranger/tak-2/cellbender
cellbender remove-background \
    	--cuda \
    	--input /cellranger/tak-2/raw_feature_bc_matrix.h5 \
    	--output /cellranger/tak-2/cellbender/cellbender.h5 \
        --epochs 200 \
        --learning-rate 0.00001