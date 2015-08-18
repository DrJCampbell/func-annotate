#!/bin/bash

#perl ~/Documents/170_functional_physical_interaction_data/annotate_associations.pl \
#--assoc_file ~/Documents/170_functional_physical_interaction_data/test_assocs/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v2_150806.txt \
#--biogrid_file ~/Documents/170_functional_physical_interaction_data/BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
#--hint_file ~/Documents/170_functional_physical_interaction_data/HINTv3/HomoSapiens_binary_hq.txt \
#--string_file ~/Documents/170_functional_physical_interaction_data/STRING_v10/9606.protein.links.v10_score700plus.txt \
#--ensp_lookup ~/Documents/170_functional_physical_interaction_data/STRING_v10/ensp_to_gene_symbol_lookup.txt \
#--out_file ~/Documents/170_functional_physical_interaction_data/test_assocs/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v2_150806_bgrid.txt



IN='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_all_histotypes_ddr_qn_combmuts_v3_150814.txt'
OUT='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_all_histotypes_ddr_qn_combmuts_v3_150814_FIanno.txt'
perl ~/Documents/170_functional_physical_interaction_data/annotate_associations.pl \
--assoc_file ${IN} \
--biogrid_file ~/Documents/170_functional_physical_interaction_data/BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
--hint_file ~/Documents/170_functional_physical_interaction_data/HINTv3/HomoSapiens_binary_hq.txt \
--string_file ~/Documents/170_functional_physical_interaction_data/STRING_v10/9606.protein.links.v10_score700plus.txt \
--ensp_lookup ~/Documents/170_functional_physical_interaction_data/STRING_v10/ensp_to_gene_symbol_lookup.txt \
--out_file ${OUT}

IN='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_all_histotypes_ddr_qn_combmuts_v3_150814_FDR.txt'
OUT='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_all_histotypes_ddr_qn_combmuts_v3_150814_FDR_FIanno.txt'
perl ~/Documents/170_functional_physical_interaction_data/annotate_associations.pl \
--assoc_file ${IN} \
--biogrid_file ~/Documents/170_functional_physical_interaction_data/BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
--hint_file ~/Documents/170_functional_physical_interaction_data/HINTv3/HomoSapiens_binary_hq.txt \
--string_file ~/Documents/170_functional_physical_interaction_data/STRING_v10/9606.protein.links.v10_score700plus.txt \
--ensp_lookup ~/Documents/170_functional_physical_interaction_data/STRING_v10/ensp_to_gene_symbol_lookup.txt \
--out_file ${OUT}


IN='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v3_150814.txt'
OUT='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v3_150814_FIanno.txt'
perl ~/Documents/170_functional_physical_interaction_data/annotate_associations.pl \
--assoc_file ${IN} \
--biogrid_file ~/Documents/170_functional_physical_interaction_data/BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
--hint_file ~/Documents/170_functional_physical_interaction_data/HINTv3/HomoSapiens_binary_hq.txt \
--string_file ~/Documents/170_functional_physical_interaction_data/STRING_v10/9606.protein.links.v10_score700plus.txt \
--ensp_lookup ~/Documents/170_functional_physical_interaction_data/STRING_v10/ensp_to_gene_symbol_lookup.txt \
--out_file ${OUT}

IN='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v3_150814_FDR.txt'
OUT='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_driver_mutations_in_individual_histotypes_ddr_qn_combmuts_v3_150814_FDR_FIanno.txt'
perl ~/Documents/170_functional_physical_interaction_data/annotate_associations.pl \
--assoc_file ${IN} \
--biogrid_file ~/Documents/170_functional_physical_interaction_data/BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
--hint_file ~/Documents/170_functional_physical_interaction_data/HINTv3/HomoSapiens_binary_hq.txt \
--string_file ~/Documents/170_functional_physical_interaction_data/STRING_v10/9606.protein.links.v10_score700plus.txt \
--ensp_lookup ~/Documents/170_functional_physical_interaction_data/STRING_v10/ensp_to_gene_symbol_lookup.txt \
--out_file ${OUT}


IN='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_histotype_ddr_qn_combmuts_v3_150814.txt'
OUT='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_histotype_ddr_qn_combmuts_v3_150814_FIanno.txt'
perl ~/Documents/170_functional_physical_interaction_data/annotate_associations.pl \
--assoc_file ${IN} \
--biogrid_file ~/Documents/170_functional_physical_interaction_data/BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
--hint_file ~/Documents/170_functional_physical_interaction_data/HINTv3/HomoSapiens_binary_hq.txt \
--string_file ~/Documents/170_functional_physical_interaction_data/STRING_v10/9606.protein.links.v10_score700plus.txt \
--ensp_lookup ~/Documents/170_functional_physical_interaction_data/STRING_v10/ensp_to_gene_symbol_lookup.txt \
--out_file ${OUT}


IN='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_histotype_ddr_qn_combmuts_v3_150814_FDR.txt'
OUT='/Users/jamesc/Dropbox/Intercell_ddr/15.qnorm_run_intercell_analysis/dependencies_associated_with_histotype_ddr_qn_combmuts_v3_150814_FDR_FIanno.txt'
perl ~/Documents/170_functional_physical_interaction_data/annotate_associations.pl \
--assoc_file ${IN} \
--biogrid_file ~/Documents/170_functional_physical_interaction_data/BioGRID/BIOGRID-ALL-3.4.127.tab2_human.txt \
--hint_file ~/Documents/170_functional_physical_interaction_data/HINTv3/HomoSapiens_binary_hq.txt \
--string_file ~/Documents/170_functional_physical_interaction_data/STRING_v10/9606.protein.links.v10_score700plus.txt \
--ensp_lookup ~/Documents/170_functional_physical_interaction_data/STRING_v10/ensp_to_gene_symbol_lookup.txt \
--out_file ${OUT}



