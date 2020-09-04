import os

# Environment: genetic_diff_kenya
# Environment: kenya_fst_pipeline

configfile: "analyses.pipeline.json"

# made list comprehensions here so that each wildcard in the file name repeats
# the number of times the Fst calculations to be done. This way I dont have to
# manually make these lists. These are used in the Fst step
rpstm = [config["kenya_array_file_stem_name"] for i in config["fst_groups_1"]]
rpchrs = [config["autosomes"] for i in config["fst_groups_1"]]
rpgeno = [config["geno_filters"] for i in config["fst_groups_1"]]
rphwe = [config["HWE_filters"] for i in config["fst_groups_1"]]
rpldw = [config["LDwindow"] for i in config["fst_groups_1"]]
rplds = [config["LDstep"] for i in config["fst_groups_1"]]
rpldr = [config["LDr2"] for i in config["fst_groups_1"]]


rule all:
    input:
        expand(os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.F_miss_VS_DNA.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.N_miss_VS_DNA.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.F_missing_per_site.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.F_missing_per_ind.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "02_init_QC/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.relatedsRm.IBD-0.18.genome"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bed"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bim"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pass01-03.pca.results.pdf"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.map"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.ped"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"), stm=config["kenya_array_file_stem_name"], chrs=config["xchromosome"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped"), stm=config["kenya_array_file_stem_name"], chrs=config["xchromosome"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly.setMaleHetsMissing.geno{geno}.hwe{hwe}.map"), stm=config["kenya_array_file_stem_name"], chrs=config["ychromosome"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly.setMaleHetsMissing.geno{geno}.hwe{hwe}.ped"), stm=config["kenya_array_file_stem_name"], chrs=config["ychromosome"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.map"), stm=config["kenya_array_file_stem_name"], chrs=config["mtDNA"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ped"), stm=config["kenya_array_file_stem_name"], chrs=config["mtDNA"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.01.pdf"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.02.pdf"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.01.pdf"), stm=config["kenya_array_file_stem_name"], chrs=config["xchromosome"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.02.pdf"), stm=config["kenya_array_file_stem_name"], chrs=config["xchromosome"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/02_admixture/01_autosomes/run_{runnum}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.log.{kval}.out"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"], runnum=config["runs"], kval=config["kvalues"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/vcf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.vcf"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/frqs/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{all_combos}.frq"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"], all_combos=config["all_combos"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/fst", "{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{fst_groups_1}-{fst_groups_2}.Fst.table.txt"), zip, stm=rpstm, chrs=rpchrs, geno=rpgeno, hwe=rphwe, ldw=rpldw, lds=rplds, ldr=rpldr, fst_groups_1=config["fst_groups_1"], fst_groups_2=config["fst_groups_2"]),
        os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/results", "all.results.Fst.table.txt"),
        expand(os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/all_combos", "{combo1}_{combo2}.distances.txt"), zip, combo1=config["geo_dist_1"], combo2=config["geo_dist_2"]),
        expand(os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/all_combos", "{combo1}_{combo2}.distances.averaged.txt"), zip, combo1=config["geo_dist_1"], combo2=config["geo_dist_2"]),
        os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/merged", "all.distances.averaged.txt"),
        expand(os.path.join(config["scratchdir"], "06_main_figures/figure_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.figure.01.pdf"), stm=config["kenya_array_file_stem_name"], chrs=config["autosomes"], geno=config["geno_filters"], hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        os.path.join(config["scratchdir"], "06_main_figures/figure_02/figure.02.pdf"),
        os.path.join(config["scratchdir"], "06_main_figures/figure_03/figure.03.pdf")



#-------------------------------------------------------------------------------
#-------------------------------------------------------
# Perform initial site filtering and processing steps #
#-------------------------------------------------------
# Step 1. Remove sites that are on chromosome 0. These are sites with either no
# valid mapping for the probe or with more than 1 best-scoring mapping for the
# probe.
rule removeChr0:
    input:
        plkmap = os.path.join(config["kenya_array_file_dir"], "{stm}.map"),
        plkped = os.path.join(config["kenya_array_file_dir"], "{stm}.ped")
    params:
        plkstm = os.path.join(config["kenya_array_file_dir"], "{stm}"),
        plkoutstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/01_rmChr0/{stm}.noChr0")
    output:
        plkoutmap = os.path.join(config["scratchdir"], "01_init_filter_and_process/01_rmChr0/{stm}.noChr0.map"),
        plkoutoed = os.path.join(config["scratchdir"], "01_init_filter_and_process/01_rmChr0/{stm}.noChr0.ped")
    shell:
        "plink --file {params.plkstm} --not-chr 0 --recode --out {params.plkoutstm}"


# Step 2. Remove sites are are marked as insertions or deletions. For this paper,
# we are only interested in analyzing snps.
rule removeINDLES:
    input:
        plkinmap = os.path.join(config["scratchdir"], "01_init_filter_and_process/01_rmChr0/{stm}.noChr0.map"),
        plkinped = os.path.join(config["scratchdir"], "01_init_filter_and_process/01_rmChr0/{stm}.noChr0.ped")
    params:
        plkinstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/01_rmChr0/{stm}.noChr0"),
        plkoutstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS.fam")
    shell:
        "plink --file {params.plkinstm} --snps-only just-acgt --make-bed --out {params.plkoutstm}"


# Step 3. There are duplicated sites in our array file. These are sites that
# either had the same chromosome, position and allele codes (these were merged)
# or had the same chromosome and positions, but different allele codes (these
# were removed).
rule DupSitesDiffAlleles:
    input:
        plkinbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS.bed"),
        plkinbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS.bim"),
        plkinfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS.fam")
    params:
        plkstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS"),
        baddupssort = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos"),
        srmptpth = config["srptdir"],
        baddupPos = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.chrPos.txt")
    output:
        baddupIDs = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.IDs.txt")
    shell:
        """
        cut -f1,4 -d$'\\t' {input.plkinbim} | sort | uniq -d | sort -k1n > {params.baddupssort}
        python {params.srmptpth}match_chr_pos_full.py --badpos {params.baddupssort} --mapbim {input.plkinbim} --out {params.baddupPos}
        python {params.srmptpth}match_chr_pos_get_IDs.py --badpos {params.baddupPos} --mapbim {input.plkinbim} --out {output.baddupIDs}
        """


rule RemoveMissMatchDups:
    input:
        baddupIDs = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.IDs.txt")
    params:
        plkinstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/02_noINDELS/{stm}.noChr0.noINDELS"),
        plkoutstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.fam")
    shell:
        "plink --bfile {params.plkinstm} --exclude {input.baddupIDs} --make-bed --out {params.plkoutstm}"


rule MergeMatchDups:
    input:
        plkinbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bed"),
        plkinbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bim"),
        plkinfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.fam")
    params:
        plkstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites"),
        plkoutstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam")
    shell:
        "plink --bfile {params.plkstm} --bmerge {params.plkstm} --merge-equal-pos --make-bed --out {params.plkoutstm}"


# Step 4. Add reported sex information from the metadata file.
# To perform sex checks we first want to add the self reported sex information
# to the plink file so that we can compare self reported sex with the genetic
# results and so that we can remove samples with discrepencies between self
# reported sex and the chromosome complement we are observing.
rule addSelfReportSexInfo:
    input:
        plkinbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"),
        plkinbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"),
        plkinfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam")
    params:
        sexinfo = config["sex_info_file"],
        plkstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups"),
        plkstmout = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    shell:
        "plink --bfile {params.plkstm} --update-sex {params.sexinfo} --make-bed --out {params.plkstmout}"



#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------
# Perform initial quality control steps and additional sample filtering #
#-------------------------------------------------------------------------
# 1. Number of missing sites per individual
# Now that we have performed the initial sites filtering, lets look at the number
# of missing sites per individual. This will give us a sense of what geno filter
# to use downstream.
rule CountMissingData:
    input:
        plkoutbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    params:
        plkstm = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate"),
        imissstmout = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing"),
        imissfl = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.imiss"),
        lmissfl = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.lmiss"),
        imisstabo = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.imiss.tab.txt"),
        lmisstabo = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.lmiss.tab.txt"),
        plotout = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing"),
        srmptpth = config["srptdir"],
        dnainfo = config["DNA_concentrations"]
    output:
        plot1 = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.F_miss_VS_DNA.pdf"),
        plot2 = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.N_miss_VS_DNA.pdf"),
        plot3 = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.F_missing_per_site.pdf"),
        plot4 = os.path.join(config["scratchdir"], "02_init_QC/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.missing.F_missing_per_ind.pdf")
    shell:
        """
        plink --bfile {params.plkstm} --missing --out {params.imissstmout}
        python {params.srmptpth}fix_plink_missing_output.py	--imissfl {params.imissfl} --lmissfl {params.lmissfl} --imissout {params.imisstabo} --lmissout {params.lmisstabo}
        Rscript {params.srmptpth}plot_num_site_miss_DNA_conc.R {params.dnainfo} {params.imisstabo} {params.lmisstabo} {params.plotout}
        """


# 2. Sex checks
# 2.a Perform sex checks based on Y chromosome data and X chromosome inbreeding
# coefficient (F)
rule sexCheck:
    input:
        plkinbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    params:
        sexinfo = config["sex_info_file"],
        instm = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate"),
        outstm = os.path.join(config["scratchdir"], "02_init_QC/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount"),
        outfile = os.path.join(config["scratchdir"], "02_init_QC/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck"),
        srmptpth = config["srptdir"]
    output:
        outfiletab = os.path.join(config["scratchdir"], "02_init_QC/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt")
    shell:
        """
        plink --bfile {params.instm} --check-sex ycount --out {params.outstm}
        python {params.srmptpth}fix_plink_ycount.py --infile {params.outfile} --out {output.outfiletab}
        """

# 2.b Plot F vs Y counts.
# We will remove samples based on the output plot. We expect females to cluter
# at the lower left of the plot and males at the upper right. Any sample that
# doesn't cluster there will be removed from subsequent analyses.
rule plotSexCheck:
    input:
        infile = os.path.join(config["scratchdir"], "02_init_QC/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt")
    params:
        srmptpth = config["srptdir"]
    output:
        outfile = os.path.join(config["scratchdir"], "02_init_QC/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.pdf")
    shell:
        "Rscript {params.srmptpth}plotFvsYcounts.R {input.infile} {output.outfile}"

# 2.c Remove samples with sex discrepencies.
# Also at this point I am removing the control samples.
rule rmSexDiscrepenciesIndvs:
    input:
        plkinbed = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    params:
        samples = config["sex_descrepencies_file"],
        instm = os.path.join(config["scratchdir"], "01_init_filter_and_process/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate"),
        outstm = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.fam")
    shell:
        "plink --bfile {params.instm} --remove {params.samples} --make-bed --out {params.outstm}"

# 3. Perform IBD analysis to identify and remove related samples
# Do autosomes, geno 0.05, hwe filter, LD filter
# 3.a Run IBD analysis
# I have already performed this analysis previously so I already have a list of
# the related samples I will remove. This rule has all these steps here
rule IBD:
    input:
        plkinbed = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.bed"),
        plkinbim = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.bim"),
        plkinfam = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.fam")
    params:
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldr = "{ldr}",
        plkstm1 = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01"),
        plkstmout1 = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}"),
        pruneoutstm = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}_sites"),
        pruneout = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}_sites.prune.out"),
        plkstmout2 = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}"),
        Inds = config["related_indv_file"],
        srmptpth = config["srptdir"],
        ibdoutstm = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.IBD-0.18"),
        outfile = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.IBD-0.18.genome"),
        outfiletab = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.IBD-0.18.genome.tab.txt"),
        ibdoutstm2 = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.relatedsRm.IBD-0.18")

    output:
        ibdout2 = os.path.join(config["scratchdir"], "02_init_QC/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.relatedsRm.IBD-0.18.genome")
    shell:
        #plink --bfile {params.plkstmout2} --remove {params.sexdisrInds} --genome --chr 1-22 --min 0.18 --out {params.ibdoutstm}
        """
        plink --bfile {params.plkstm1} --geno {params.genofilter} --hwe {params.hwefilter} --make-bed --out {params.plkstmout1}
        plink --bfile {params.plkstmout1} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldr} --out {params.pruneoutstm}
        plink --bfile {params.plkstmout1} --exclude {params.pruneout} --make-bed --out {params.plkstmout2}
        plink --bfile {params.plkstmout2} --genome --chr 1-22 --min 0.18 --out {params.ibdoutstm}
        python {params.srmptpth}fix_plink_IBD.py --infile {params.outfile} --out {params.outfiletab}
        plink --bfile {params.plkstmout2} --remove {params.Inds} --genome --chr 1-22 --min 0.18 --out {params.ibdoutstm2}
        """

# 3.b remove related samples for downstream analyses
rule rmRelatedSamples:
    input:
        plkinbed = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.bed"),
        plkinbim = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.bim"),
        plkinfam = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.fam")
    params:
        samples = config["related_indv_file"],
        instm = os.path.join(config["scratchdir"], "03_sample_filtering/01_rm_sex_discrepencies/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01"),
        outstm = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.fam")
    shell:
        "plink --bfile {params.instm} --remove {params.samples} --make-bed --out {params.outstm}"



#-------------------------------------------------------------------------------
#------------------------------------------------------------
# Perform PCA to identify any additional samples to remove #
#------------------------------------------------------------
# This will be 3 iterations of autosomal PCA. Need to potentially make an R
# script to plot the results
# Filtering to be done on the autosomes: (1) Separate chromosomes,
# (2) Remove missing data (95% call rate), (3) hwe Filter

# Step 1. filter autosomal data for PCA #
# Step 1.a geno and hwe filter
rule prep_files_pca_pass_01:
    input:
        plkinbed = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bed"),
        plkinbim = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bim"),
        plkinfam = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.fam")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldrval = "{ldr}",
        instem = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls"),
        stem1 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}"),
        stem3 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}"),
        inprunestem = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}_sites"),
        inprune = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}_sites.prune.out"),
        outstem = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}")
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkoutped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    shell:
        """
        plink --bfile {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --geno {params.genofilter} --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --hwe {params.hwefilter} --recode --out {params.stem3}
        plink --file {params.stem3} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.inprunestem}
        plink --file {params.stem3} --exclude {params.inprune} --recode --out {params.outstem}
        """

# Step 2. Run PCA pass 1 #
# Step 2.a Make par file
rule make_par_pass01:
    input:
        plinkmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    params:
        srmptpth = config["srptdir"],
        fixped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}_editColumn6.ped"),
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    output:
        par = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.par")
    shell:
        """
        awk '{{$6 = "1"; print}}' {input.plinkped} > {params.fixped}
        python {params.srmptpth}make_par.py --map {input.plinkmap} --ped {params.fixped} --evec {params.evec} --eval {params.eval} --par {output.par}
        """


# Step 2.b Run par file
rule run_pca_pass01:
    input:
        par = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.par")
    output:
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    shell:
        "smartpca -p {input.par}"

# Step 2.c Fix evec output
rule fix_evec_pass01:
    input:
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    output:
        fix = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec.fix")
    shell:
        """
        awk '{{if($1 == "\\t" ) {{print $2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t",$13,"\\t"}} else {{print $1,"\\t",$2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t"}}}}' {input.evec} > {output.fix}
        """

# Step 3. Remove outlier samples identified in step 2 #
rule prep_files_pca_pass_02:
    input:
        plinkmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    params:
        instem = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}"),
        outstem = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm"),
        rmfn = os.path.join(config["outlier_dir"], config["outlier_01_fn"])
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.map"),
        plinkoutped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.ped")
    shell:
        "plink --file {params.instem} --remove {params.rmfn} --recode --out {params.outstem}"

# Step 4. Run PCA pass 2 #
# Step 4.a Make par file
rule make_par_pass02:
    input:
        plinkmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.map"),
        plinkped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.ped")
    params:
        srmptpth = config["srptdir"],
        fixped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm_editColumn6.ped"),
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.eval")
    output:
        par = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.par")
    shell:
        """
        awk '{{$6 = "1"; print}}' {input.plinkped} > {params.fixped}
        python {params.srmptpth}make_par.py --map {input.plinkmap} --ped {params.fixped} --evec {params.evec} --eval {params.eval} --par {output.par}
        """

# Step 4.b Run par file
rule run_pca_pass02:
    input:
        par = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.par")
    output:
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.eval")
    shell:
        "smartpca -p {input.par}"

# Step 4.c Fix evec output
rule fix_evec_pass02:
    input:
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.eval")
    output:
        fix = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.evec.fix")
    shell:
        """
        awk '{{if($1 == "\\t" ) {{print $2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t",$13,"\\t"}} else {{print $1,"\\t",$2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t"}}}}' {input.evec} > {output.fix}
        """

# Step 5. Remove outlier samples from step 4 #
rule prep_files_pca_pass_03:
    input:
        plinkmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.map"),
        plinkped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.ped")
    params:
        instem = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm"),
        outstem = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm"),
        rmfn = os.path.join(config["outlier_dir"], config["outlier_02_fn"])
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.map"),
        plinkoutped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.ped")
    shell:
        "plink --file {params.instem} --remove {params.rmfn} --recode --out {params.outstem}"

# Step 6. Run PCA pass 3. This is the final PCA (not obvious outliers) #
# Step 6.a Make par file
rule make_par_pass03:
    input:
        plinkmap = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.map"),
        plinkped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.ped")
    params:
        srmptpth = config["srptdir"],
        fixped = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm_editColumn6.ped"),
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.eval")
    output:
        par = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.par")
    shell:
        """
        awk '{{$6 = "1"; print}}' {input.plinkped} > {params.fixped}
        python {params.srmptpth}make_par.py --map {input.plinkmap} --ped {params.fixped} --evec {params.evec} --eval {params.eval} --par {output.par}
        """

# Step 6.b Run par file
rule run_pca_pass03:
    input:
        par = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.par")
    output:
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.eval")
    shell:
        "smartpca -p {input.par}"

# Step 6.c Fix evec output
rule fix_evec_pass03:
    input:
        evec = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.evec"),
        eval = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.eval")
    output:
        fix = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.evec.fix")
    shell:
        """
        awk '{{if($1 == "\\t" ) {{print $2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t",$13,"\\t"}} else {{print $1,"\\t",$2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t"}}}}' {input.evec} > {output.fix}
        """

# Step 7. Plot results - All pcas on 1 plot colored by ethnolinguistic group  #
rule plot_pca_outlier_results:
    input:
        evec1 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec.fix"),
        eval1 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval"),
        evec2 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.evec.fix"),
        eval2 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm.eval"),
        evec3 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.evec.fix"),
        eval3 = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm.eval")
    params:
        sampleinfo = config["sample_info_fn"],
        srmptpth = config["srptdir"],
        pass1path = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}"),
        pass2path = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_02/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers01Rm"),
        pass3path = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/pass_03/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.outliers02Rm")
    output:
        r = os.path.join(config["scratchdir"], "02_init_QC/04_outlier_identification_pca/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pass01-03.pca.results.pdf")
    shell:
        "Rscript {params.srmptpth}plot_pca_outlier_analysis.R {params.sampleinfo} {params.pass1path} {params.pass2path} {params.pass3path} {output.r}"



#-------------------------------------------------------------------------------
#------------------------------------------
# Perform site filtering on cleaned data #
#------------------------------------------
# Cleaned data is defined in our analysis as having no samples with sex
# discrepencies, no related samples, no outlier samples as identified in the
# previous PCA analysis.
# Autosomes, X chromosome, Y chromosome, and mtDNA will be filtered separately.

# Remove outlier samples identified in PCA
rule rm_pca_outlier_samples:
    input:
        plkinbed = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bed"),
        plkinbim = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.bim"),
        plkinfam = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.fam")
    params:
        instem = os.path.join(config["scratchdir"], "03_sample_filtering/02_rm_related_samples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls"),
        outstem = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers"),
        rmfn = os.path.join(config["outlier_dir"], config["outlier_all_fn"])
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.map"),
        plinkoutped = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.ped")
    shell:
        "plink --bfile {params.instem} --remove {params.rmfn} --recode --out {params.outstem}"

# 1. Autosomes #
# (1) Separate chromosomes, (2) Remove missing data (95% call rate), (3) hwe
# filter, (4) LD prune
rule filter_autosomes:
    input:
        plinkoutmap = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.map"),
        plinkoutped = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.ped")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldrval = "{ldr}",
        instem = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers"),
        stem1 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}"),
        stem3 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}"),
        inprunestem = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}_sites"),
        inprune = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}_sites.prune.out"),
        outstem = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}")
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkoutped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    shell:
        """
        plink --file {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --geno {params.genofilter} --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --hwe {params.hwefilter} --recode --out {params.stem3}
        plink --file {params.stem3} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.inprunestem}
        plink --file {params.stem3} --exclude {params.inprune} --recode --out {params.outstem}
        """

# 2. X chromosome #
# (1) Separate chromosomes, (2) Remove male heterozygous sites (set as missing),
# (3) Remove missing data (95% call rate), (4) HWE filter, (5) LD prune
rule filter_xChr:
    input:
        plinkoutmap = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.map"),
        plinkoutped = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.ped")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldrval = "{ldr}",
        instem = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers"),
        stem1 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}"),
        inprunestem = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}_sites"),
        inprune = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}_sites.prune.out"),
        outstem = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}")
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkoutped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    shell:
        """
        plink --file {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-hh-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --recode --out {params.stem4}
        plink --file {params.stem4} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.inprunestem}
        plink --file {params.stem4} --exclude {params.inprune} --recode --out {params.outstem}
        """

# 3. Y chromosome #
# (1) Separate chromosomes and keep only males, (2) Remove male heterozygous
# sites (set as missing), (3) Remove missing data (95% call rate), (4) HWE filter
rule filter_yChr:
    input:
        plinkoutmap = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.map"),
        plinkoutped = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.ped")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers"),
        stem1 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly"),
        stem2 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly.setMaleHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly.setMaleHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly.setMaleHetsMissing.geno{geno}.hwe{hwe}")
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly.setMaleHetsMissing.geno{geno}.hwe{hwe}.map"),
        plinkoutped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/03_yChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.malesOnly.setMaleHetsMissing.geno{geno}.hwe{hwe}.ped")
    shell:
        """
        plink --file {params.instem} --chr {params.chroms} --filter-males --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-hh-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --recode --out {params.stem4}
        """

# 4. mtDNA #
# (1) Separate chromosomes and keep only males, (2) Remove male heterozygous
# sites (set as missing), (3) Remove missing data (95% call rate), (4) HWE filter
rule filter_mtDNA:
    input:
        plinkoutmap = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.map"),
        plinkoutped = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers.ped")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "03_sample_filtering/03_rm_pca_outliers/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.noRelatedSmpls.noPCAoutliers"),
        stem1 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}")
    output:
        plinkoutmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.map"),
        plinkoutped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/04_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ped")
    shell:
        """
        plink --file {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-mixed-mt-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --recode --out {params.stem4}
        """



#-------------------------------------------------------------------------------
#--------------------------------
# Perform main analysis 1 - PCA #
#--------------------------------
# The next rules in this section will be for performing PCA and plotting results
# for the the autosomes and X chromosome

# 1. Autosomes #
rule make_par_autosomes:
    input:
        plinkmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    params:
        srmptpth = config["srptdir"],
        fixped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}_editColumn6.ped"),
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    output:
        par = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.par")
    shell:
        """
        awk '{{$6 = "1"; print}}' {input.plinkped} > {params.fixped}
        python {params.srmptpth}make_par.py --map {input.plinkmap} --ped {params.fixped} --evec {params.evec} --eval {params.eval} --par {output.par}
        """

# Run par file
rule run_pca_autosomes:
    input:
        par = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.par")
    output:
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    shell:
        "smartpca -p {input.par}"

# Fix evec output
rule fix_evec_autosomes:
    input:
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    output:
        fix = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec.fix")
    shell:
        """
        awk '{{if($1 == "\\t" ) {{print $2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t",$13,"\\t"}} else {{print $1,"\\t",$2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t"}}}}' {input.evec} > {output.fix}
        """

# Plot results #
rule plot_pca_autosomes:
    input:
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec.fix"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    params:
        sampleinfo = config["sample_info_fn"],
        srmptpth = config["srptdir"],
        pcapath = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}"),
    output:
        r1 = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.01.pdf"),
        r2 = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.02.pdf")
    shell:
        "Rscript {params.srmptpth}plot_pca_general.R {params.sampleinfo} {params.pcapath} {params.pcapath}"


# 2. X chromosome #
rule make_par_xChr:
    input:
        plinkmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    params:
        srmptpth = config["srptdir"],
        fixped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}_editColumn6.ped"),
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    output:
        par = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.par")
    shell:
        """
        awk '{{$6 = "1"; print}}' {input.plinkped} > {params.fixped}
        python {params.srmptpth}make_par.py --map {input.plinkmap} --ped {params.fixped} --evec {params.evec} --eval {params.eval} --par {output.par}
        """

# Run par file
rule run_pca_xChr:
    input:
        par = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.par")
    output:
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    shell:
        "smartpca -p {input.par}"

# Fix evec output
rule fix_evec_xChr:
    input:
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    output:
        fix = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec.fix")
    shell:
        """
        awk '{{if($1 == "\\t" ) {{print $2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t",$13,"\\t"}} else {{print $1,"\\t",$2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t"}}}}' {input.evec} > {output.fix}
        """

# Plot results #
rule plot_pca_xChr:
    input:
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec.fix"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    params:
        sampleinfo = config["sample_info_fn"],
        srmptpth = config["srptdir"],
        pcapath = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}"),
    output:
        r1 = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.01.pdf"),
        r2 = os.path.join(config["scratchdir"], "05_analyses/01_pca/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.pca.results.02.pdf")
    shell:
        "Rscript {params.srmptpth}plot_pca_general.R {params.sampleinfo} {params.pcapath} {params.pcapath}"



#-------------------------------------------------------------------------------
#---------------------------------------
# Perform main analysis 2 - ADMIXTURE #
#---------------------------------------
# Autosomes #
# Make plink file binary
rule mk_binary_autosomes:
    input:
        plinkmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        stem = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}")
    output:
        bed = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.bed"),
        bim = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.bim"),
        fam = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.fam")
    shell:
        "plink --file {params.stem} --make-bed --out {params.stem}"

# Run admixture
rule admixture_autosomes:
    input:
        bed = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.bed")
    params:
        kval = "{kval}",
        outpath = os.path.join(config["scratchdir"], "05_analyses/02_admixture/01_autosomes/run_{runnum}/")
    output:
        outlog = os.path.join(config["scratchdir"], "05_analyses/02_admixture/01_autosomes/run_{runnum}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.log.{kval}.out")
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bed} {params.kval} | tee {output.outlog}
        """

# X chromosome #
# Make plink file binary
rule mk_binary_xChr:
    input:
        plinkmap = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        plinkped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        stem = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}")
    output:
        bed = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.bed"),
        bim = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.bim"),
        fam = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.fam")
    shell:
        "plink --file {params.stem} --make-bed --out {params.stem}"

# Run admixture
rule admixture_xChr:
    input:
        bed = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/02_xChr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.bed")
    params:
        kval = "{kval}",
        outpath = os.path.join(config["scratchdir"], "05_analyses/02_admixture/02_xChr/run_{runnum}/")
    output:
        outlog = os.path.join(config["scratchdir"], "05_analyses/02_admixture/02_xChr/run_{runnum}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.log.{kval}.out")
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bed} {params.kval} | tee {output.outlog}
        """


#-------------------------------------------------------------------------------
#---------------------------------
# Perform main analysis 3 - fst #
#---------------------------------
# Autosomes #
# convert plink files to vcf
rule convert_to_VCF_autosomes:
    input:
        map = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.map"),
        ped = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.ped")
    params:
        plinkstem = os.path.join(config["scratchdir"], "04_site_filtering/01_cleaned/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}"),
        vcfstem = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/vcf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert")
    output:
        vcf = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/vcf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.vcf")
    shell:
        "plink --file {params.plinkstem} --recode vcf --out {params.vcfstem}"

# Get allele frequencies for all samples for each population combination
rule get_allele_frq_autosomes:
    input:
        vcf = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/vcf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.vcf")
    params:
        smplskeepdir = config["fst_lists"],
        smplskeep = "{all_combos}",
        outstm = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/frqs/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{all_combos}")
    output:
        frq = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/frqs/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{all_combos}.frq")
    shell:
        "vcftools --vcf {input.vcf} --freq --keep {params.smplskeepdir}{params.smplskeep} --out {params.outstm}"

# Calculate Fst
# ethnolinguistic groupp level Fst
rule calculate_fst_autosomes:
    input:
        frq1 = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/frqs/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{fst_groups_1}.frq"),
        frq2 = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/frqs/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{fst_groups_2}.frq")
    params:
        scrpt = config["srptdir"],
        p1 = "{fst_groups_1}",
        p2 = "{fst_groups_2}",
        outdir = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/fst/")
    output:
        os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/fst", "{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{fst_groups_1}-{fst_groups_2}.Fst.table.txt")
    shell:
        "python {params.scrpt}hudson.fst.py --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --out {output}"


# Need to figure out a rule to merge results to the desired groups
# I could just merge all of the results in 1 file and then just use R when plotting
# to plot the specific combos I want
rule merge_fst_results_autosomes:
    input:
        expand(os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/fst", "{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.convert.{fst_groups_1}-{fst_groups_2}.Fst.table.txt"), zip, stm=rpstm, chrs=rpchrs, geno=rpgeno, hwe=rphwe, ldw=rpldw, lds=rplds, ldr=rpldr, fst_groups_1=config["fst_groups_1"], fst_groups_2=config["fst_groups_2"])
    output:
        os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/results", "all.results.Fst.table.txt")
    shell:
        "cat {input} > {output}"

#-------------------------------------------------------------------------------
#-----------------------------------------------------------
# Perform main analysis 4 - Pairwise geographic distances #
#-----------------------------------------------------------
# This will be used for correlation analysis
rule cal_geo_dists:
    input:
        fn1 = os.path.join(config["geo_dis_dir"], "{combo1}.coordinates.txt"),
        fn2 = os.path.join(config["geo_dis_dir"], "{combo2}.coordinates.txt"),
    params:
        scrpt = config["srptdir"],
        p1 = "{combo1}",
        p2 = "{combo2}",
        outdir = os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/all_combos/")
    output:
        outfn1 = os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/all_combos", "{combo1}_{combo2}.distances.txt"),
        outfn2 = os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/all_combos", "{combo1}_{combo2}.distances.averaged.txt")
    shell:
        "python {params.scrpt}calc.geo.dist.py --l1 {input.fn1} --l2 {input.fn2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"

rule merge_geo_dists_results:
    input:
        expand(os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/all_combos/", "{combo1}_{combo2}.distances.averaged.txt"), zip, combo1=config["geo_dist_1"], combo2=config["geo_dist_2"])
    output:
        os.path.join(config["scratchdir"], "05_analyses/04_geo_dists/merged", "all.distances.averaged.txt")
    shell:
        "cat {input} > {output}"

#-------------------------------------------------------------------------------
#--------------------
# Plot main figures #
#--------------------
#-----------
# Figure 1 #
#-----------
# Map, PCA, ADMIXTURE
# Script done
# ___usage___
# Rscript figure.01.R <gps_points_file> <sample_info_file> <pca_path_and_stem_name> <output_path_and_file_name>
rule plot_fig_01:
    input:
        evec = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.evec.fix"),
        eval = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.eval")
    params:
        srmptpth = config["srptdir"],
        sampleinfo = config["sample_info_fn"],
        mappoints = config["map_dis_dir_fn"],
        pcapath = os.path.join(config["scratchdir"], "05_analyses/01_pca/01_autosomes/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}")
    output:
        outpathfn = os.path.join(config["scratchdir"], "06_main_figures/figure_01/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.rmSmpls01.relatedsRm.noPCAoutliers.chr{chrs}.geno{geno}.hwe{hwe}.LD_{ldw}-{lds}-{ldr}.figure.01.pdf")
    shell:
        "Rscript {params.srmptpth}figure.01.R {params.mappoints} {params.sampleinfo} {params.pcapath} {output.outpathfn}"

#-----------
# Figure 2 #
#-----------
# TSs Fst and TSs vs ethnolinguistic group Fst
# ___usage___
# Rscript figure.02.R <fst_results_file> <out file name and path>
rule plot_fig_02:
    input:
        fstr = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/results", "all.results.Fst.table.txt")
    params:
        srmptpth = config["srptdir"]
    output:
        outpathfn = os.path.join(config["scratchdir"], "06_main_figures/figure_02/figure.02.pdf")
    shell:
        "Rscript {params.srmptpth}figure.02.R {input.fstr} {output.outpathfn}"

#-----------
# Figure 3 #
#-----------
# Ethnolinguistic group level Fst
rule plot_fig_03:
    input:
        fstr = os.path.join(config["scratchdir"], "05_analyses/03_fst/01_autosomes/results", "all.results.Fst.table.txt")
    params:
        srmptpth = config["srptdir"]
    output:
        outpathfn = os.path.join(config["scratchdir"], "06_main_figures/figure_03/figure.03.pdf")
    shell:
        "Rscript {params.srmptpth}figure.03.R {input.fstr} {output.outpathfn}"


#-----------
# Figure 4 #
#-----------
# TBD, correlation plot of some sort
