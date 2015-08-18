


setwd("/Users/jamesc/Dropbox/functional_physical_interaction_data/STRING_v10/")

string <- read.table(
	file="9606.protein.links.v10.txt",
	sep=" ",
	header=TRUE,
	stringsAsFactors=FALSE
	)

hist(string$combined_score)

# use those interaction partners with combined scores >= 700 for annotation

write.table(
	string[which(string$combined_score >= 700),],
	file="9606.protein.links.v10_score700plus.txt",
	col.names=TRUE,
	row.names=FALSE,
	sep="\t",
	quote=FALSE
	)



