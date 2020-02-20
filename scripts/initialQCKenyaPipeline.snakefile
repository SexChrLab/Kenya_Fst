import os

configfile: "initialQCKenyaPipeline.json"

rule all:
    input:
        expand(os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.map"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.ped"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bed"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bim"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.IDs.txt"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bed"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bim"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_miss_VS_DNA.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.N_miss_VS_DNA.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_missing_per_site.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_missing_per_ind.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.relatedsRm.IBD-0.18.genome"),
                stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"],
                hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"],
                ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam"), stm=config["kenya_array_file_stem_name"]),


# Perform initial site filtering steps.
rule removeChr0:
    input:
        plkmap = os.path.join(config["kenya_array_file_dir"], "{stm}.map"),
        plkped = os.path.join(config["kenya_array_file_dir"], "{stm}.ped")
    params:
        plkstm = os.path.join(config["kenya_array_file_dir"], "{stm}"),
        plkoutstm = os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0")
    output:
        plkoutmap = os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.map"),
        plkoutoed = os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.ped")
    shell:
        "plink --file {params.plkstm} --not-chr 0 --recode --out {params.plkoutstm}"


rule removeINDLES:
    input:
        plkinmap = os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.map"),
        plkinped = os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.ped")
    params:
        plkinstm = os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0"),
        plkoutstm = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.fam")
    shell:
        "plink --file {params.plkinstm} --snps-only just-acgt --make-bed --out {params.plkoutstm}"


rule DupSitesDiffAlleles:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.fam")
    params:
        plkstm = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS"),
        baddupssort = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos"),
        srmptpth = config["srptdir"],
        baddupPos = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.chrPos.txt")
    output:
        baddupIDs = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.IDs.txt")
    shell:
        """
        cut -f1,4 -d$'\\t' {input.plkinbim} | sort | uniq -d | sort -k1n > {params.baddupssort}
        python {params.srmptpth}match_chr_pos_full.py --badpos {params.baddupssort} --mapbim {input.plkinbim} --out {params.baddupPos}
        python {params.srmptpth}match_chr_pos_get_IDs.py --badpos {params.baddupPos} --mapbim {input.plkinbim} --out {output.baddupIDs}
        """


rule RemoveMissMatchDups:
    input:
        baddupIDs = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.IDs.txt")
    params:
        plkinstm = os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS"),
        plkoutstm = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.fam")
    shell:
        "plink --bfile {params.plkinstm} --exclude {input.baddupIDs} --make-bed --out {params.plkoutstm}"


rule MergeMatchDups:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.fam")
    params:
        plkstm = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites"),
        plkoutstm = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam")
    shell:
        "plink --bfile {params.plkstm} --bmerge {params.plkstm} --merge-equal-pos --make-bed --out {params.plkoutstm}"


# Now that we have performed the initial sites filtering, lets look at the number
# of missing sites per individual. This will give us a sense of what geno filter
# to use downstream.
rule CountMissingData:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam")
    params:
        plkstm = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups"),
        imissstmout = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing"),
        imissfl = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.imiss"),
        lmissfl = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.lmiss"),
        imisstabo = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.imiss.tab.txt"),
        lmisstabo = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.lmiss.tab.txt"),
        plotout = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing"),
        srmptpth = config["srptdir"],
        dnainfo = config["DNA_concentrations"]
    output:
        plot1 = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_miss_VS_DNA.pdf"),
        plot2 = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.N_miss_VS_DNA.pdf"),
        plot3 = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_missing_per_site.pdf"),
        plot4 = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_missing_per_ind.pdf")
    shell:
        """
        plink --bfile {params.plkstm} --missing --out {params.imissstmout}
        python {params.srmptpth}fix_plink_missing_output.py	--imissfl {params.imissfl} --lmissfl {params.lmissfl} --imissout {params.imisstabo} --lmissout {params.lmisstabo}
        Rscript {params.srmptpth}plot_num_site_miss_DNA_conc.R {params.dnainfo} {params.imisstabo} {params.lmisstabo} {params.plotout}
        """


# Perform sex checks based on Y chromosome data and X chromosome inbreeding
# coefficient (F)
# We first want to add the self reported sex information to the plink file so that
# we can compare self reported sex with the genetic results and so that we can
# remove samples with discrepencies between self reported sex and the chromosome
# complement we are observing.
rule addSelfReportSexInfo:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam")
    params:
        sexinfo = config["sex_info_file"],
        plkstm = os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups"),
        plkstmout = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    shell:
        "plink --bfile {params.plkstm} --update-sex {params.sexinfo} --make-bed --out {params.plkstmout}"


rule sexCheck:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    params:
        sexinfo = config["sex_info_file"],
        instm = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate"),
        outstm = os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount"),
        outfile = os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck"),
        srmptpth = config["srptdir"]
    output:
        outfiletab = os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt")
    shell:
        """
        plink --bfile {params.instm} --check-sex ycount --out {params.outstm}
        python {params.srmptpth}fix_plink_ycount.py --infile {params.outfile} --out {output.outfiletab}
        """

# Plot F vs Y counts
rule plotSexCheck:
    input:
        infile = os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt")
    params:
        srmptpth = config["srptdir"]
    output:
        outfile = os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.pdf")
    shell:
        "Rscript {params.srmptpth}plotFvsYcounts.R {input.infile} {output.outfile}"

# Remove individuals with sex descrepencies. Also at this point I am removing
# control samples and the two samples without meta data (A68 and 457). 457 was
# one of the samples with a sex discrepency.
rule rmSexDiscrepenciesIndvs:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    params:
        samples = config["sex_descrepencies_file"],
        instm = os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate"),
        outstm = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam")
    shell:
        "plink --bfile {params.instm} --remove {params.samples} --make-bed --out {params.outstm}"

# IBD (on the file with sex descrepencies removed)
# Do autosomes, geno 0.05, hwe filter, LD filter
rule IBD:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam")
    params:
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldr = "{ldr}",
        plkstm1 = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd"),
        plkstmout1 = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}"),
        pruneoutstm = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}_sites"),
        pruneout = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}_sites.prune.out"),
        plkstmout2 = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}"),
        sexdisrInds = config["sex_descrepencies_file"],
        Inds = config["sex_descrepencies_related_indv_file"],
        srmptpth = config["srptdir"],
        ibdoutstm = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.IBD-0.18"),
        outfile = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.IBD-0.18.genome"),
        outfiletab = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.IBD-0.18.genome.tab.txt"),
        ibdoutstm2 = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.relatedsRm.IBD-0.18")

    output:
        ibdout2 = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.relatedsRm.IBD-0.18.genome")
    shell:
        """
        plink --bfile {params.plkstm1} --geno {params.genofilter} --hwe {params.hwefilter} --make-bed --out {params.plkstmout1}
        plink --bfile {params.plkstmout1} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldr} --out {params.pruneoutstm}
        plink --bfile {params.plkstmout1} --exclude {params.pruneout} --make-bed --out {params.plkstmout2}
        plink --bfile {params.plkstmout2} --remove {params.sexdisrInds} --genome --chr 1-22 --min 0.18 --out {params.ibdoutstm}
        python {params.srmptpth}fix_plink_IBD.py --infile {params.outfile} --out {params.outfiletab}
        plink --bfile {params.plkstmout2} --remove {params.Inds} --genome --chr 1-22 --min 0.18 --out {params.ibdoutstm2}
        """


# Next rule, now that IBD is complete, is to remove the related individuals
rule rmRelatedSamples:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam")
    params:
        samples = config["related_indv_file"],
        instm = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd"),
        outstm = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    shell:
        "plink --bfile {params.instm} --remove {params.samples} --make-bed --out {params.outstm}"



################################################################################
# old
'''
# PCA for on population level
# Steps: 1) convert to map/ped, 2) edit ped file, 3) make par file, 4) run pca,
# 5) fix eigenvector file, 6) plot results
# Step 1 and 2. convert to map/ped and edit ped
rule pcaMakeMapPed:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.fam")
    params:
        chroms = "{chr}",
        instm = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}"),
        outstm = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}"),
    output:
        plkoutmap = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}.map"),
        plkoutped = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.ped")
    shell:
        """
        plink --bfile {params.instm} --chr {params.chroms} --recode --out {params.outstm}
        awk '{{$6 = "1"; print}}' {params.outstm}.ped > {output.plkoutped}
        """
#### step 2. edit ped file
#rule pcaEditPed:
#    input:
#        plkinmap = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}.map"),
#        plkinped = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}.ped")
#    output:
#        plkoutped = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.ped")
#    shell:
#        """
#        awk '{{$6 = "1"; print}}' {input.plkinped} > {output.plkoutped}
#        """
#### ERROR above AmbiguousRuleException:

# Step 3. Make par file
rule makePar:
    input:
        plkinmap = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}.map"),
        plkinped = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.ped")
    params:
        srmptpth = config["srptdir"],
        evec = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.evec"),
        eval = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.eval"),
        outlier = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.log")
    output:
        par = os.path.join(config["scratchdir"], "results/pca/01_popPCA/pars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.par")
    shell:
        "python {params.srmptpth}make_par.py --map {input.plkinmap} --ped {input.plkinped} --evec {params.evec} --eval {params.eval} --log {params.outlier} --par {output.par}"
#        """
#        echo 'genotypename: {input.plkinped}' > {output.par}
#        echo 'snpname: {input.plkinmap}' >> {output.par}
#        echo 'evecoutname: {params.evec}' >> {output.par}
#        echo 'evaloutname: {params.eval}' >> {output.par}
#        echo 'altnormstyle: NO' >> {output.par}
#        echo 'familynames: NO' >> {output.par}
#        echo 'numchrom: 23' >> {output.par}
#        echo 'noxdata: NO' >> {output.par}
#        echo 'outlieroutname: {params.outlier}' >> {output.par}"
#        """
# echo "numoutlieriter: 0" >> {output.par} # removed this, I want to see the outliers

# Step 4. run pca
rule runPCA:
    input:
        par = os.path.join(config["scratchdir"], "results/pca/01_popPCA/pars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.par")
    output:
        evec = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.evec"),
        eval = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.eval")
        #outlier = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.log")
    shell:
        "smartpca -p {input.par}"

# Step 5. Fix evec output
rule fixEvecOut:
    input:
        evec = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.evec"),
        eval = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.eval")
    output:
        fix = os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.FIX.eval")
    shell:
        """
        awk '{{if($1 == "\\t" ) {{print $2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t",$13,"\\t"}} else {{print $1,"\\t",$2,"\\t",$3,"\\t",$4,"\\t",$5,"\\t",$6,"\\t",$7,"\\t",$8,"\\t",$9,"\\t",$10,"\\t",$11,"\\t",$12,"\\t"}}}}' {input.evec} > {output.fix}
        """

'''
