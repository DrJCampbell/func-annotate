# func-annotate
Add functional anotations from BioGRID, HINT and STRING to association tables in Intercell

== How to use this script ==
An example command is included in the run_annotation.sh script in the repository. This will extract functional interaction information from the BioGRID, HINT and STRING data files and add it to the example association test results table in the test_assocs file.

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

== How to update the annotation data ==
Each folder containing annotation data has the neccessary scripts to recreate and update the annotation data files. It is likely that these will break in the future as the annotation projects evolve there files so you may need to modify at some point. Use the included annotation files as a guide for how the data should look.




