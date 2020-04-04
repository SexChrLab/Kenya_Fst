# Environment: genetic_diff_kenya

configfile: "FstKenyaAnalyses.config.json"


# Steps #
# 1. Convert to vcf. This is done for autosoems, X, Y and MT. And for all males
# and females.
# see chr_sex_options_full in config
# plink --bfile <filestem> --recode vcf --out <filestem>convert

# 2. Get allele freq for all populations. This is done for all pops individually.
# Make sure to remove outliers outliers and some instances outliters_Ngibochoros
# for the outliers + Ngibochoros I may make into a separate snakemake file. Or
# it can be a separate rule
# vcftools --vcf <filestem>.convert.vcf --freq --keep <specificpopsamplelist> --exclude <outliers> --out <filestem>.<specificpopsamplelist>

# 3. Run fst script. This is done in pop combos
#python <scriptdir>hudson.fst.py --frq1 <filestem>.<specificpopsamplelist1>.frq --frq2 <filestem>.<specificpopsamplelist2>.frq --p1 <specificpopsamplelist1> --p2 <specificpopsamplelist2> --chr {chr} --sex {sex}
# note, see if i can remove --sex and --chr flag from this script. Chr and sex
# should be found in filestem


rule all:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/vcfs", "{chr_sex_options_full}.convert.vcf"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{all_combos}.frq"), chr_sex_options_full = config["chr_sex_options_full"], all_combos = config["all_combos"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population", "{fst_groups1}-{fst_groups2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_12"], fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan", "{fst_groupsBC1}-{fst_groupsBC2}.Fst.table.txt"), chr_sex_options_full = config["chr_sex_options_full_C12"], fst_groupsBC1 = config["fst_groupsBC1"], fst_groupsBC2 = config["fst_groupsBC2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan", "{fst_groupsCC1}-{fst_groupsCC2}.Fst.table.txt"), chr_sex_options_full = config["chr_sex_options_full_C12"], fst_groupsCC1 = config["fst_groupsCC1"], fst_groupsCC2 = config["fst_groupsCC2"])


# convert all plink files to vcf. This command is the same for all chromosome
# types.
rule convertAllInFilesVCF:
    input:
        fnbed = (lambda wildcards: config[wildcards.chr_sex_options_full]["dir_fn_stem"] + '.bed'),
        fnbim = (lambda wildcards: config[wildcards.chr_sex_options_full]["dir_fn_stem"] + '.bim'),
        fnfam = (lambda wildcards: config[wildcards.chr_sex_options_full]["dir_fn_stem"] + '.fam')
    params:
        #indir = lambda wildcards: config[wildcards.chr_sex_options_full]["dir"],
        plinkstem = (lambda wildcards: config[wildcards.chr_sex_options_full]["dir_fn_stem"]),
        vcfstem = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/vcfs", "{chr_sex_options_full}.convert")
    output:
        vcf = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/vcfs", "{chr_sex_options_full}.convert.vcf")
    shell:
        "plink --bfile {params.plinkstem} --recode vcf --out {params.vcfstem}"



# Get allele frequencies for all samples for each population combination
rule getAlleleFrq:
    input:
        vcf = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/vcfs", "{chr_sex_options_full}.convert.vcf")
    params:
        smplsRm = config["outliers"],
        smplskeepdir = config["keep_dir"],
        smplskeep = "{all_combos}",
        #outstm = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{chr_sex_options_full}.{all_combos}")
        outstm = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{all_combos}")
    output:
        #frq = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{chr_sex_options_full}.{all_combos}.frq")
        frq = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{all_combos}.frq")
    shell:
        "vcftools --vcf {input.vcf} --freq --keep {params.smplskeepdir}/{params.smplskeep} --remove {params.smplsRm} --out {params.outstm}"


# Fst
rule fstPerPop:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groups1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groups2}.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groups1}",
        p2 = "{fst_groups2}",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population", "{fst_groups1}-{fst_groups2}.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


rule fstBloodClans:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsBC1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsBC2}.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groupsBC1}",
        p2 = "{fst_groupsBC2}",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan", "{fst_groupsBC1}-{fst_groupsBC2}.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


rule fstCultureClans:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsCC1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsCC2}.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groupsCC1}",
        p2 = "{fst_groupsCC2}",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan", "{fst_groupsCC1}-{fst_groupsCC2}.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"
