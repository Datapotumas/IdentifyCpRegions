# IdentifyCpRegions
## Script Description     
This shell script identifies the boundaries of LSC, IRb, SSC, and IRa regions in chloroplast genomes by using self-comparison to locate repetitive regions. It can process multiple samples. 

## Usage Instructions
(1) Ensure that the blastn_m0_v+.sh script is available in ~/codes/cmd_shell/.
(2) Place all .fna files in the specified INPUT_DIR.
(3) Run the script to perform BLASTN comparisons and generate region files for each input genome.
