#!/usr/bin/perl -w

use strict;
use Getopt::Long;

# read in a text file with tab delimited association data.
# first two columns are marker and target respectively.
# markers have geneSymbol_EntrezGeneID_ENSG
# targets have geneSymbol_ENSG
# read in HINT, BioGRID and STRING PI/FI data sets
# for STRING, use ENSP as a key (I have a look up table)
# for BioGRID, use gene symbols (cols 8 and 9) as key
# for HINT, use gene symbols (cols 5 and 6) as key

# variables needed:
my $assoc_file;
my $hint_file;
my $biogrid_file;
my $string_file;
my $ensp_lookup;
my $out_file;
my $args = scalar(@ARGV);
my $help;

my $result = GetOptions (
  "assoc_file=s" => \$assoc_file,
  "hint_file=s" => \$hint_file,
  "biogrid_file=s" => \$biogrid_file, 
  "string_file=s" => \$string_file,
  "ensp_lookup=s" => \$ensp_lookup, 
  "out_file=s" => \$out_file,
  "help" => \$help,
  );

# print usage message if requested or no args supplied
if(defined($help) || !$args) {
  &usage;
  exit(0);
}

# read in the BioGRID data
# 103	6416	2318	112315	108607	-	-	MAP2K4	FLNC	JNKK|JNKK1|MAPKK4|MEK4|MKK4|PRKMK4|SAPKK-1|SAPKK1|SEK1|SERK1|SKK1	ABP-280|ABP280A|ABPA|ABPL|FLN2|MFM5|MPD4	Two-hybrid	physical	Marti A (1997)	9006895	9606	9606	Low Throughput	-	-	-	-	-	BIOGRID
# 117	84665	88	124185	106603	-	-	MYPN	ACTN2	CMD1DD|CMH22|MYOP|RCM4	CMD1AA	Two-hybrid	physical	Bang ML (2001)	11309420	9606	9606	Low Throughput	-	-	-	-	-	BIOGRID
#
my %bgrid;
open BGRID, "< $biogrid_file" or die "Can't read from $biogrid_file: $!\n";
while(<BGRID>){
  my @bgrid = split(/\t/);
  my $key_rev = $bgrid[7] . "_" . $bgrid[8];
  my $key_fwd = $bgrid[8] . "_" . $bgrid[7];
  if(exists($bgrid{$key_fwd})){
    print "BioGRID hash already has $key_fwd... skipping\n";
  }
  else{
    $bgrid{$key_fwd} = 1;
  }
  if(exists($bgrid{$key_rev})){
    print "BioGRID hash already has $key_rev... skipping\n";
  }
  else{
    $bgrid{$key_rev} = 1;
  }
}
close BGRID;

# read in the HINT data
# Uniprot_A       Uniprot_B       Alt_A   Alt_B   Gene_A  Gene_B  pmid:method:quality
# A0A024R5S0      O75553          1600    A0A024R5S0      DAB1    25416956:1112:HT|25416956:0397:HT|25416956:1356:HT
# A0A024R5S0      P25788          5684    A0A024R5S0      PSMA3   25416956:1112:HT|25416956:0397:HT|25416956:1356:HT
#
my %hint;
open HINT, "< $hint_file" or die "Can't read from $hint_file: $!\n";
while(<HINT>){
  my @hint = split(/\t/);
  my $key_rev = $hint[4] . "_" . $hint[5];
  my $key_fwd = $hint[5] . "_" . $hint[4];
  if(exists($hint{$key_fwd})){
    print "HINT hash already has $key_fwd... skipping\n";
  }
  else{
    $hint{$key_fwd} = 1;
  }
  if(exists($hint{$key_rev})){
    print "HINT hash already has $key_rev... skipping\n";
  }
  else{
    $hint{$key_rev} = 1;
  }
}
close HINT;

# >>> ADD THE STRING DB STUFF HERE
# >>> NEED TO GET A LOOKUP TO CONVERT 
# >>> ENSP IDS TO GENE SYMBOLS FOR HASH KEY

# make a hash of ENSP -> GeneSymbols to convert String IDs
# Ensembl Protein ID	Ensembl Gene ID	Associated Gene Name
# ENSP00000371003	ENSG00000015171	ZMYND11
# ENSP00000452959	ENSG00000015171	ZMYND11
my %ensp_to_symbol;
open ENSP, "< $ensp_lookup" or die "Can't read from $ensp_lookup: $!\n";
while(<ENSP>){
  my $line = $_;
  chomp($line);
  my @fields = split(/\t/, $line);
  $ensp_to_symbol{$fields[0]} = $fields[2];
}
close ENSP;

# make a hash of string interactions (translate ENSP -> symbol)
# protein1	protein2	combined_score
# 9606.ENSP00000000233	9606.ENSP00000158762	849
# 9606.ENSP00000000233	9606.ENSP00000225567	733
my %string;
open STRING, "< $string_file" or die "Can't read from $string_file: $!\n";
while(<STRING>){
  my $line = $_;
  if($line =~ /^protein1/){
    next; # skip header
  }
  my @fields = split(/\t/, $line);
  $fields[0] =~ s/9606\.//;
  $fields[1] =~ s/9606\.//;
  if(!exists($ensp_to_symbol{$fields[0]})){
    print "$fields[0] bot found in the lookup table\n";
    next;
  }
  if(!exists($ensp_to_symbol{$fields[1]})){
    print "$fields[1] bot found in the lookup table\n";
    next;
  }
  my $key_fwd =  $ensp_to_symbol{$fields[0]} . "_" .  $ensp_to_symbol{$fields[1]};
  my $key_rev =  $ensp_to_symbol{$fields[1]} . "_" .  $ensp_to_symbol{$fields[0]};
  if(exists($string{$key_fwd})){
    print "STRING hash already has $key_fwd... skipping\n";
  }
  else{
    $string{$key_fwd} = 1;
  }
  if(exists($string{$key_rev})){
    print "STRING hash already has $key_rev... skipping\n";
  }
  else{
    $string{$key_rev} = 1;
  }
}
close STRING;


# read the associations and annotate with the hashes
#
open ASSOCS, "< $assoc_file" or die "Can't read file $assoc_file: $!\n";
open OUT, "> $out_file" or die "Can't write file to $out_file: $!\n";

while(<ASSOCS>){
  my $assoc_line = $_;
  chomp($assoc_line);
  my @assoc_bits = split(/\t/, $assoc_line);
  my @marker = split(/_/, $assoc_bits[0]);
  my @target = split(/_/, $assoc_bits[1]);
  my $gene_symbols_key = $marker[0] . "_" . $target[0];
  
  
  # write the original association file line
  # before appending [0/1] for the FI databases.
  print OUT "$assoc_line";
  
  # add BioGRID annotations
  if(exists($bgrid{$gene_symbols_key})){
    print OUT "\t1";
  }
  else{
    print OUT "\t0";
  }
  
  # add HINT annotations
  if(exists($hint{$gene_symbols_key})){
    print OUT "\t1";
  }
  else{
    print OUT "\t0";
  }
  
  # add STRING annotations
  if(exists($string{$gene_symbols_key})){
    print OUT "\t1";
  }
  else{
    print OUT "\t0";
  }
  
  # end the association line with a newline
  print OUT "\n";

}

close ASSOCS;
close OUT;




sub usage() {
        my $usage =<<END;

annotate_associations.pl
Usage: annotate_associations.pl [options]

Options
--help          Display this message and quit
--assoc_file    Path to associations file [required]
--hint_file     Path to HINT file [required]
--biogrid_file  Path to BioGRID file [required]
--string_file   Path to STRING file [required]
--ensp_lookup   Path to ENSP -> gene symbol lookup file [required]
--out_file      Output file name [optional]

Updated: 12th Aug 2015 by jamesc\@icr.ac.uk

END
        print $usage;
}
