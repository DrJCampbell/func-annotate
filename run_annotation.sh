#!/bin/bash

IN='./test_assocs/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v2_150806.txt'
OUT='./test_assocs/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v2_150806_FIanno.txt'
perl ./annotate_associations.pl \
--assoc_file ${IN} \
--biogrid_file ./BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
--hint_file ./HINTv3/HomoSapiens_binary_hq.txt \
--string_file ./STRING_v10/9606.protein.links.v10_score700plus.txt \
--ensp_lookup ./STRING_v10/ensp_to_gene_symbol_lookup.txt \
--out_file ${OUT}




