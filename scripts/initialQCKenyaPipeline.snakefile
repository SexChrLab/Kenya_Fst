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
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.imiss.tab.txt"), stm=config["kenya_array_file_stem_name"]),
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
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.bed"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.bim"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.fam"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.bed"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.bim"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.fam"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.bed"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.bim"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.fam"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.bed"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.bim"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.fam"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bed"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bim"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.fam"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount.sexcheck.tab.txt"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount.sexcheck.pdf"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount.sexcheck.pdf"), stm=config["kenya_array_file_stem_name"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        ##expand(os.path.join(config["scratchdir"], "QC_01_Inds/06_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.smplsRmvd.relatedsRm.IBD-0.18.genome"), stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"], maf=config["MAF_filters"], ldw=config["LDwindow"], lds=config["LDstep"], ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Ychr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Ychr.geno_{geno_02}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Ychr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Ychr.geno_{geno_02}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Ychr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Ychr.geno_{geno_02}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Xchr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_{geno_02}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Xchr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_{geno_02}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Xchr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_{geno_02}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/All_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.All.mtDNA.geno_{geno_02}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/All_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.All.mtDNA.geno_{geno_02}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        ##expand(os.path.join(config["scratchdir"], "plink_files/06_geno/All_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.All.mtDNA.geno_{geno_02}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"]),
        ##expand(os.path.join(config["scratchdir"], "results/fst/01_popFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.FST.FIGURES.pdf"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"]),
        ##expand(os.path.join(config["scratchdir"], "results/fst/01_popFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.Fst.RESULTS.txt"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}.map"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"], chr=config["chromosomes"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.ped"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"], chr=config["chromosomes"]),
        ##expand(os.path.join(config["scratchdir"], "results/pca/01_popPCA/pars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.par"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"], chr=config["chromosomes"]),
        ##expand(os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.evec"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"], chr=config["chromosomes"]),
        ##expand(os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.eval"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"], chr=config["chromosomes"]),
        ##expand(os.path.join(config["scratchdir"], "results/pca/01_popPCA/out/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.chr{chr}_editColumn6.PCA.FIX.eval"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], pop_combo=config["pop_combos"], chr=config["chromosomes"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        ##expand(os.path.join(config["scratchdir"], "results/fst/02_cultureClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.FST.FIGURES.pdf"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        ##expand(os.path.join(config["scratchdir"], "results/fst/02_cultureClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.Fst.RESULTS.txt"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bed"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bim"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        #expand(os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.fam"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        ##expand(os.path.join(config["scratchdir"], "results/fst/03_bloodClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.FST.FIGURES.pdf"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),
        ##expand(os.path.join(config["scratchdir"], "results/fst/03_bloodClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.Fst.RESULTS.txt"), stm=config["kenya_array_file_stem_name"], geno_02=config["geno_filters_postQC"], hwe_02=config["HWE_filters_postQC"], maf_02=config["MAF_filters_postQC"], ldw_02=config["LDwindow_postQC"], lds_02=config["LDstep_postQC"], ldr_02=config["LDr2_postQC"], clan_combo=config["clan_combos"]),

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
        srmptpth = config["srptdir"]
    output:
        imisstabo = os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.imiss.tab.txt")
    shell:
        """
        plink --bfile {params.plkstm} --missing --out {params.imissstmout}
        python {params.srmptpth}fix_plink_missing_output.py	--infile {params.imissfl} --out {output.imisstabo}
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
        #plkoutbed = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.bed"),
        #plkoutbim = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.bim"),
        #plkoutfam = os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.fam"),
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
# This starts the filtering for IBD and Sex Checks
# Separate this rule for autosomes and y chromsome (males only...should have a
# sample list somewher for males only --- the update sex file just grab males)
# Or probably dont want to implement a geno filter on Y just for now
'''
rule CallRateFilter:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam")
    params:
        genofilter = "{geno}",
        plkstm = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups"),
        plkstmout = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.fam")
    shell:
        "plink --bfile {params.plkstm} --geno {params.genofilter} --make-bed --out {params.plkstmout}"
rule hweFilter:
    input:
        plkinbed = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.fam")
    params:
        hwefilter = "{hwe}",
        plkstm = os.path.join(config["scratchdir"], "QC_01_Inds/01_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}"),
        plkstmout = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.fam")
    shell:
        "plink --bfile {params.plkstm} --hwe {params.hwefilter} --make-bed --out {params.plkstmout}"
rule mafFilter:
    input:
        plkinbed = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.fam")
    params:
        maffilter = "{maf}",
        plkstm = os.path.join(config["scratchdir"], "QC_01_Inds/02_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}"),
        plkstmout = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.fam")
    shell:
        "plink --bfile {params.plkstm} --maf {params.maffilter} --make-bed --out {params.plkstmout}"
rule ldFilter:
    input:
        plkinbed = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.fam")
    params:
        plkstm = os.path.join(config["scratchdir"], "QC_01_Inds/03_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}"),
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldr = "{ldr}",
        pruneoutstm = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}_sites"),
        pruneout = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}_sites.prune.out"),
        plkstmout = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.fam")
    shell:
        """
        plink --bfile {params.plkstm} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldr} --out {params.pruneoutstm}
        plink --bfile {params.plkstm} --exclude {params.pruneout} --make-bed --out {params.plkstmout}
        """
rule addSexInfo:
    input:
        plkinbed = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.fam")
    params:
        sexinfo = config["sex_info_file"],
        plkstm = os.path.join(config["scratchdir"], "QC_01_Inds/04_ldPrune/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}"),
        plkstmout = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.fam")
    shell:
        "plink --bfile {params.plkstm} --update-sex {params.sexinfo} --make-bed --out {params.plkstmout}"
# sex check. Fix tabs
"""rule sexCheck:
    input:
        plkinbed = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.fam")
    params:
        instm = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate"),
        outstm = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount"),
        outfile = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount.sexcheck"),
        srmptpth = config["srptdir"]
    output:
        outfiletab = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount.sexcheck.tab.txt")
    shell:

        plink --bfile {params.instm} --check-sex ycount --out {params.outstm}
        python {params.srmptpth}fix_plink_ycount.py --infile {params.outfile} --out {output.outfiletab}
"""
# for sex check need MAF and LD filter
# TO DO: add LD filter then do sex check (update sex)
# plink --bfile {params.instm} --maf {params.maffilter} --make-bed --out {params.outstm1}
# plink --bfile {params.instm} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldr} --out {params.outstm2}
# plink --bfile {params.instm} --exclude {params.outstm3} --update-sex {params.sexinfo} --make-bed --out {params.outstm4}
rule sexCheck:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    params:
        #maffilter = "{maf}",
        #ldwindow = "{ldw}",
        #ldstep = "{lds}",
        #ldr = "{ldr}",
        sexinfo = config["sex_info_file"],
        instm = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate"),
        #outstm1 = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.maf_{maf}"),
        #outstm2 = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.LD_{ldw}-{lds}-{ldr}_sites"),
        #outstm3 = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.LD_{ldw}-{lds}-{ldr}_sites.prune.out"),
        #outstm4 = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.LD_{ldw}-{lds}-{ldr}.sexUpdate"),
        #outstm5 = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount"),
        outstm = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount"),
        outfile = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck"),
        #outfile = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.LD_{ldw}-{lds}-{ldr}.sexUpdate.Xfco-yCount.sexcheck"),
        srmptpth = config["srptdir"]
    output:
        outfiletab = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt")
    shell:
        """
        plink --bfile {params.instm} --check-sex ycount --out {params.outstm}
        python {params.srmptpth}fix_plink_ycount.py --infile {params.outfile} --out {output.outfiletab}
        """
# Plot F vs Y counts
rule plotSexCheck:
    input:
        infile = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt")
    params:
        srmptpth = config["srptdir"]
    output:
        outfile = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.pdf")
    shell:
        "Rscript {params.srmptpth}plotFvsYcounts.R {input.infile} {output.outfile}"
rule IBD:
    input:
        plkinbed = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.fam")
    params:
        sexdisrInds = config["sex_descrepencies_file"],
        Inds = config["sex_descrepencies_related_indv_file"],
        srmptpth = config["srptdir"],
        plkinstm = os.path.join(config["scratchdir"], "QC_01_Inds/05_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate"),
        ibdoutstm = os.path.join(config["scratchdir"], "QC_01_Inds/06_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.smplsRmvd.IBD-0.18"),
        outfile = os.path.join(config["scratchdir"], "QC_01_Inds/06_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.smplsRmvd.IBD-0.18.genome"),
        outfiletab = os.path.join(config["scratchdir"], "QC_01_Inds/06_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.smplsRmvd.IBD-0.18.genome.tab.txt"),
        ibdoutstm2 = os.path.join(config["scratchdir"], "QC_01_Inds/06_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.smplsRmvd.relatedsRm.IBD-0.18")
    output:
        ibdout2 = os.path.join(config["scratchdir"], "QC_01_Inds/06_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.geno_{geno}.hwe_{hwe}.maf_{maf}.LD_{ldw}-{lds}-{ldr}.sexUpdate.smplsRmvd.relatedsRm.IBD-0.18.genome")
    shell:
        """
        plink --bfile {params.plkinstm} --remove {params.sexdisrInds} --genome --chr 1-22 --min 0.18 --out {params.ibdoutstm}
        python {params.srmptpth}fix_plink_IBD.py --infile {params.outfile} --out {params.outfiletab}
        plink --bfile {params.plkinstm} --remove {params.Inds} --genome --chr 1-22 --min 0.18 --out {params.ibdoutstm2}
        """
# This ends the filtering for IBD and Sex Checks
################################################################################


# Now starting from MergeMatchDups output files because I will need to do all
# sample removals and then site filters.
# Update sex info
rule addSexInfo2:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam")
    params:
        sexinfo = config["sex_info_file"],
        plkstm = os.path.join(config["scratchdir"], "plink_files/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups"),
        plkstmout = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    shell:
        "plink --bfile {params.plkstm} --update-sex {params.sexinfo} --make-bed --out {params.plkstmout}"

# Remove individuals with sex descrepencies. Also at this point I am removing
# control samples and the two samples without meta data (A68 and 457)
rule rmInvds01:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam")
    params:
        samples = config["sex_descrepencies_file"],
        instm = os.path.join(config["scratchdir"], "plink_files/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate"),
        outstm = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam")
    shell:
        "plink --bfile {params.instm} --remove {params.samples} --make-bed --out {params.outstm}"


rule rmInvds02:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam")
    params:
        samples = config["related_indv_file"],
        instm = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd"),
        outstm = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    shell:
        "plink --bfile {params.instm} --remove {params.samples} --make-bed --out {params.outstm}"

# Now we have all individuals we want removed.
# Next steps:
# do all of the site filtering again but on the files with samples removed
# then analyses. But have to do male Y separately
# awk '{ if ($3 == "1") print $0 }' self_reported_sex_info > self_reported_sex_info_Males
rule CallRateFilter_postIndQC_Males_Ychr:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        genofilter = "{geno_02}",
        smplist = config["sex_info_file_males"],
        plkinstm = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        plkoutstm = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Ychr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Ychr.geno_{geno_02}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Ychr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Ychr.geno_{geno_02}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Ychr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Ychr.geno_{geno_02}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Ychr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Ychr.geno_{geno_02}.fam")
    shell:
        "plink --bfile {params.plkinstm} --geno {params.genofilter} --chr 24 --keep {params.smplist} --make-bed --out {params.plkoutstm}"


rule CallRateFilter_postIndQC_Males_Xchr_noPARs:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        genofilter = "{geno_02}",
        smplist = config["sex_info_file_males"],
        plkinstm = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        plkoutstm = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Xchr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_{geno_02}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Xchr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_{geno_02}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Xchr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_{geno_02}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/06_geno/Males_Xchr/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_{geno_02}.fam")
    shell:
        "plink --bfile {params.plkinstm} --geno {params.genofilter} --chr 23 --keep {params.smplist} --make-bed --out {params.plkoutstm}"


rule CallRateFilter_postIndQC_All_mtDNA:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        genofilter = "{geno_02}",
        plkinstm = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        plkoutstm = os.path.join(config["scratchdir"], "plink_files/06_geno/All_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.All.mtDNA.geno_{geno_02}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/06_geno/All_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.All.mtDNA.geno_{geno_02}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/06_geno/All_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.All.mtDNA.geno_{geno_02}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/06_geno/All_mtDNA/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.All.mtDNA.geno_{geno_02}.fam")
    shell:
        "plink --bfile {params.plkinstm} --geno {params.genofilter} --chr 26 --make-bed --out {params.plkoutstm}"


rule CallRateFilter_postIndQC:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        genofilter = "{geno_02}",
        plkinstm = os.path.join(config["scratchdir"], "plink_files/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        plkoutstm = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.fam")
    shell:
        "plink --bfile {params.plkinstm} --geno {params.genofilter} --make-bed --out {params.plkoutstm}"


rule hweFilter_postIndQC:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.fam")
    params:
        hwefilter = "{hwe_02}",
        plkinstm = os.path.join(config["scratchdir"], "plink_files/06_geno/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}"),
        plkoutstm = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.fam")
    shell:
        "plink --bfile {params.plkinstm} --hwe {params.hwefilter} --make-bed --out {params.plkoutstm}"


rule mafFilter_postIndQC:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.fam")
    params:
        maffilter = "{maf_02}",
        plkstm = os.path.join(config["scratchdir"], "plink_files/07_hwe/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}"),
        plkstmout = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.fam")
    shell:
        "plink --bfile {params.plkstm} --maf {params.maffilter} --make-bed --out {params.plkstmout}"


rule ldFilter_postIndQC:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.fam")
    params:
        ldwindow = "{ldw_02}",
        ldstep = "{lds_02}",
        ldr = "{ldr_02}",
        plkinstm = os.path.join(config["scratchdir"], "plink_files/08_maf/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}"),
        pruneoutstm = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}_sites"),
        pruneout = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}_sites.prune.out"),
        plkoutstm = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.fam")
    shell:
        """
        plink --bfile {params.plkinstm} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldr} --out {params.pruneoutstm}
        plink --bfile {params.plkinstm} --exclude {params.pruneout} --make-bed --out {params.plkoutstm}
        """

# For the X chromosome in males there are heterozygous sites. I do not want to
# analyze these sites because males should not have het sits on the X chromsome
# Tentitive solution is to just remove these sites from all individuals
# cut -f3 melissa_wilson.raw.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.Males.Xchr.noPARs.geno_0.hh | sort | uniq > /home/amtarave/projects/genetic_diff_northern_kenya/male_Xchr_het_site_IDs.txt
rule Rm_male_X_het_sites:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.fam")
    params:
        sitesfl = config["male_X_het_sites"],
        stmin = os.path.join(config["scratchdir"], "plink_files/09_LD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}"),
        stmout = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.fam")
    shell:
        "plink --bfile {params.stmin} --exclude {params.sitesfl} --make-bed --out {params.stmout}"


# Fst on auto and X - all done with the full plink files. I have plink keep files,
# r script list files, and and R script that just does calculations
# without additional filters.
# Step 1 get input plink files
rule subsetPlinksPops:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.fam")
    params:
        kfil = "{pop_combo}",
        kfildir = config["plink_keep_lists_pops_dir"],
        instm = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets"),
        outstm = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.fam")
    shell:
        "plink --bfile {params.instm} --keep {params.kfildir}{params.kfil}_KEEP_LIST --make-bed --out {params.outstm}"
# step 2, use output from step 1 as input for step 2
rule runFstPops:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/11_popCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.fam")
    params:
        rfil = "{pop_combo}",
        rfildir = config["r_list_dir"],
        srmptpth = config["srptdir"],
        plinkdir = os.path.join(config["scratchdir"], "plink_files/11_popCombos/"),
        plinkstm = "{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}",
        rsltdir = os.path.join(config["scratchdir"], "results/fst/01_popFst/")
    output:
        figfile = os.path.join(config["scratchdir"], "results/fst/01_popFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.FST.FIGURES.pdf"),
        resfil = os.path.join(config["scratchdir"], "results/fst/01_popFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{pop_combo}.Fst.RESULTS.txt")
    shell:
        "Rscript {params.srmptpth}Fst_Analysis_SNPrelate_NEW.R  {params.rfildir}{params.rfil} {params.plinkdir} {params.plinkstm} {params.rsltdir}"

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

# Cultural clan affiliation Fst
rule subsetPlinksCultureClan:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.fam")
    params:
        kfil = "{clan_combo}",
        kfildir = config["plink_keep_lists_Cultclans_dir"],
        instm = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets"),
        outstm = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.fam")
    shell:
        "plink --bfile {params.instm} --keep {params.kfildir}{params.kfil}_KEEP_LIST_major_clans_culture --make-bed --out {params.outstm}"

rule runFstCultureClan:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.fam")
    params:
        rfil = "{clan_combo}",
        rfildir = config["r_list_dir_culture_clan"],
        srmptpth = config["srptdir"],
        plinkdir = os.path.join(config["scratchdir"], "plink_files/12_cultureClanCombos/"),
        plinkstm = "{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}",
        rsltdir = os.path.join(config["scratchdir"], "results/fst/02_cultureClanFst/")
    output:
        figfile = os.path.join(config["scratchdir"], "results/fst/02_cultureClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.FST.FIGURES.pdf"),
        resfil = os.path.join(config["scratchdir"], "results/fst/02_cultureClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.Fst.RESULTS.txt")
    shell:
        "Rscript {params.srmptpth}Fst_Analysis_SNPrelate_NEW.R  {params.rfildir}{params.rfil}_major_clans_culture {params.plinkdir} {params.plinkstm} {params.rsltdir}"

rule subsetPlinksBloodClan:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets.fam")
    params:
        kfil = "{clan_combo}",
        kfildir = config["plink_keep_lists_Bloodclans_dir"],
        instm = os.path.join(config["scratchdir"], "plink_files/10_rm_Xchr_Male_Hets/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets"),
        outstm = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}")
    output:
        plkoutbed = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bed"),
        plkoutbim = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bim"),
        plkoutfam = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.fam")
    shell:
        "plink --bfile {params.instm} --keep {params.kfildir}{params.kfil}_KEEP_LIST_major_clans --make-bed --out {params.outstm}"

rule runFstBloodClan:
    input:
        plkinbed = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bed"),
        plkinbim = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.bim"),
        plkinfam = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.fam")
    params:
        rfil = "{clan_combo}",
        rfildir = config["r_list_dir_blood_clan"],
        srmptpth = config["srptdir"],
        plinkdir = os.path.join(config["scratchdir"], "plink_files/13_bloodClanCombos/"),
        plinkstm = "{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}",
        rsltdir = os.path.join(config["scratchdir"], "results/fst/03_bloodClanFst/")
    output:
        figfile = os.path.join(config["scratchdir"], "results/fst/03_bloodClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.FST.FIGURES.pdf"),
        resfil = os.path.join(config["scratchdir"], "results/fst/03_bloodClanFst/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.geno_{geno_02}.hwe_{hwe_02}.maf_{maf_02}.LD_{ldw_02}-{lds_02}-{ldr_02}.rmXMaleHets_{clan_combo}.Fst.RESULTS.txt")
    shell:
        "Rscript {params.srmptpth}Fst_Analysis_SNPrelate_NEW.R  {params.rfildir}{params.rfil}_major_clans {params.plinkdir} {params.plinkstm} {params.rsltdir}"
'''
