import scanpy as sc
import os
import vaeda
from cellbender.remove_background.downstream import load_anndata_from_input_and_output
from glob import glob
paths=glob('/data/cellranger/*')
for n in paths:
    print(n)
    if os.path.isfile(f'{n}/doublet_filtered.h5ad'):
        print(f'{n} done! Skipping.')
        continue
    adata = load_anndata_from_input_and_output(
        input_file=f'{n}/raw_feature_bc_matrix.h5',
        output_file=f'{n}/cellbender/cellbender.h5',
        input_layer_key='raw'
    )
    adata=adata[adata.obs['cell_probability'] > 0.5]
    adata.var_names_make_unique()
    adata.X = adata.layers["cellbender"].copy()
    adata.var["mt"] = adata.var_names.str.startswith("mt-")
    sc.pp.calculate_qc_metrics(
        adata, qc_vars=["mt"], inplace=True, log1p=True
    )
    adata = vaeda.vaeda(adata, seed=42)
    adata.write_h5ad(f'{n}/doublet_filtered.h5ad')
    print(f'Done processing {n}. Saved to {n}/doublet_filtered.h5ad')
