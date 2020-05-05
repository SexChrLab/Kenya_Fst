import os

configfile: "initialQCKenyaPipeline.json"

rule all:
    input:
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.map"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/01_rmChr0/{stm}.noChr0.ped"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bed"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.bim"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/02_noINDELS/{stm}.noChr0.noINDELS.fam"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.bim.dupChrPos.missMatchDupSites.IDs.txt"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bed"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.bim"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.fam"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bed"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.bim"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/03_dupVars/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_miss_VS_DNA.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.N_miss_VS_DNA.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_missing_per_site.pdf"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/01_missing/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.missing.F_missing_per_ind.pdf"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bed"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.bim"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/04_updateSex/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.fam"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.tab.txt"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/02_sexChecks/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.Xfco-yCount.sexcheck.pdf"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam"), stm=config["kenya_array_file_stem_name"]),
        expand(os.path.join(config["scratchdir"], "00_QC_initial/03_IBD/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.geno_{geno}.HWE_{hwe}.LD_{ldw}-{lds}-{ldr}.relatedsRm.IBD-0.18.genome"),
                stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"],
                hwe=config["HWE_filters"], ldw=config["LDwindow"], lds=config["LDstep"],
                ldr=config["LDr2"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam"), stm=config["kenya_array_file_stem_name"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.bed"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.bim"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.fam"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.bed"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.bim"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.fam"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.bed"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.bim"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.fam"), chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.bed"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.bim"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.fam"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.fam"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bed"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bim"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        #expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.fam"), chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"), chrs=config["ychromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"), chrs=config["ychromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.fam"), chrs=config["ychromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bed"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bim"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.fam"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.MALES.fam"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bed"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bim"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.FEMALES.fam"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),

        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bed"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bim"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.fam"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bed"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bim"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.fam"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bed"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bim"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.fam"),
                chrs=config["autosomes"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bed"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bim"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.fam"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bed"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bim"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.fam"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bed"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bim"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.fam"),
                chrs=config["xchromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"],
                ldw=config["LDwindow"], lds=config["LDstep"],ldr=config["LDr2"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"), chrs=config["ychromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"), chrs=config["ychromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.fam"), chrs=config["ychromosome"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bed"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bim"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"]),
        expand(os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.fam"), chrs=config["mtDNA"], stm=config["kenya_array_file_stem_name"], geno=config["geno_filters"], hwe=config["HWE_filters"])



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
# Make 4 separate rules for filtering the autosomes, x chromosome, y chromosome,
# and mtDNA. I will make separate rules because filtering will be different for
# each chromosome.
# note: do not do LD filtering yet. I will do LD filter for each set (all, males,
# and females). This will be done prior to fst and pca analyses.

# Autosomes steps:
# (1) Separate chromosomes, (2) Remove missing data (95% call rate), (3) hwe Filter
rule filterAutosomes:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        stem1 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}"),
        stem3 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL"),
        stem4 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES"),
        stem5 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES")
    output:
        plinkoutbeda = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.bed"),
        plinkoutbima = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.bim"),
        plinkoutfama = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.fam"),
        plinkoutbedm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.bed"),
        plinkoutbimm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.bim"),
        plinkoutfamm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.fam"),
        plinkoutbedf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.bed"),
        plinkoutbimf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.bim"),
        plinkoutfamf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.fam")
    shell:
        """
        plink --bfile {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --geno {params.genofilter} --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --hwe {params.hwefilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --filter-males --make-bed --out {params.stem4}
        plink --bfile {params.stem3} --filter-females --make-bed --out {params.stem5}
        """
# X chr steps:
# (1) Separate chromosomes, (2) Remove male heterozygous sites (set as missing),
# (3) Remove missing data (95% call rate), (4) HWE filter
rule filterXChromosome:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        stem1 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL"),
        stem5 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES"),
        stem6 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES")
    output:
        plinkoutbeda = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.bed"),
        plinkoutbima = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.bim"),
        plinkoutfama = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.fam"),
        plinkoutbedm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"),
        plinkoutbimm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"),
        plinkoutfamm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.fam"),
        plinkoutbedf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bed"),
        plinkoutbimf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bim"),
        plinkoutfamf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.fam")
    shell:
        """
        plink --bfile {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-hh-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --make-bed --out {params.stem4}
        plink --bfile {params.stem4} --filter-males --make-bed --out {params.stem5}
        plink --bfile {params.stem4} --filter-females --make-bed --out {params.stem6}
        """

# Y chr steps:
# (1) Separate chromosomes and keep only males, (2) Remove male heterozygous
# sites (set as missing), (3) Remove missing data (95% call rate), (4) HWE filter
rule filterYChromosome:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        stem1 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES"),
    output:
        plinkoutbed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"),
        plinkoutbim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"),
        plinkoutfam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.fam")
    shell:
        """
        plink --bfile {params.instem} --chr {params.chroms} --filter-males --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-hh-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --make-bed --out {params.stem4}
        """

# mtDNA steps:
# (1) Separate chromosomes, (2) Remove any heterozygous sites (set as missing),
# (3) Remove missing data (95% call rate), (4) HWE filter
rule filterMtDNA:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.fam")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm"),
        stem1 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL"),
        stem5 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.MALES"),
        stem6 = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.FEMALES")
    output:
        plinkoutbed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bed"),
        plinkoutbim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bim"),
        plinkoutfam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.fam"),
        plinkoutbedm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"),
        plinkoutbimm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"),
        plinkoutfamm = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.MALES.fam"),
        plinkoutbedf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bed"),
        plinkoutbimf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bim"),
        plinkoutfamf = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.FEMALES.fam")
    shell:
        """
        plink --bfile {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-mixed-mt-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --make-bed --out {params.stem4}
        plink --bfile {params.stem4} --filter-males --make-bed --out {params.stem5}
        plink --bfile {params.stem4} --filter-females --make-bed --out {params.stem6}
        """
# LD filtering (x and autosomes only)
rule LDfilterAutos:
    input:
        autoin1bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.bed"),
        autoin1bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.bim"),
        autoin1fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.fam"),
        autoin2bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.bed"),
        autoin2bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.bim"),
        autoin2fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.fam"),
        autoin3bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.bed"),
        autoin3bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.bim"),
        autoin3fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.fam")
    params:
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldrval = "{ldr}",
        autoin1stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL"),
        autoin2stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES"),
        autoin3stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES"),
        autoin1prunestem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL_sites"),
        autoin2prunestem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES_sites"),
        autoin3prunestem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES_sites"),
        autoin1prune = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL_sites.prune.out"),
        autoin2prune = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES_sites.prune.out"),
        autoin3prune = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES_sites.prune.out"),
        autoout1stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}"),
        autoout2stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}"),
        autoout3stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}")
    output:
        autoout1bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bed"),
        autoout1bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bim"),
        autoout1fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.fam"),
        autoout2bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bed"),
        autoout2bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bim"),
        autoout2fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.fam"),
        autoout3bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bed"),
        autoout3bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bim"),
        autoout3fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.fam")
    shell:
        """
        plink --bfile {params.autoin1stem} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.autoin1prunestem}
        plink --bfile {params.autoin1stem} --exclude {params.autoin1prune} --make-bed --out {params.autoout1stem}

        plink --bfile {params.autoin2stem} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.autoin2prunestem}
        plink --bfile {params.autoin2stem} --exclude {params.autoin2prune} --make-bed --out {params.autoout2stem}

        plink --bfile {params.autoin3stem} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.autoin3prunestem}
        plink --bfile {params.autoin3stem} --exclude {params.autoin3prune} --make-bed --out {params.autoout3stem}
        """


rule LDfilterXChr:
    input:
        xin1bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.bed"),
        xin1bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.bim"),
        xin1fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.fam"),
        xin2bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"),
        xin2bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"),
        xin2fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.fam"),
        xin3bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bed"),
        xin3bim= os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.bim"),
        xin3fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.fam")
    params:
        ldwindow = "{ldw}",
        ldstep = "{lds}",
        ldrval = "{ldr}",
        xin1stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL"),
        xin2stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES"),
        xin3stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES"),
        xin1prunestem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL_sites"),
        xin2prunestem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES_sites"),
        xin3prunestem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES_sites"),
        xin1prune = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL_sites.prune.out"),
        xin2prune = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES_sites.prune.out"),
        xin3prune = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES_sites.prune.out"),
        xout1stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}"),
        xout2stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}"),
        xout3stem = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}")
    output:
        xout1bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bed"),
        xout1bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.bim"),
        xout1fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.ALL.LD_{ldw}-{lds}-{ldr}.fam"),
        xout2bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bed"),
        xout2bim = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.bim"),
        xout2fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/MALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.LD_{ldw}-{lds}-{ldr}.fam"),
        xout3bed = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bed"),
        xout3bim= os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.bim"),
        xout3fam = os.path.join(config["scratchdir"], "01_filtering_new/chr{chrs}/FEMALES/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.relatedsRm.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.FEMALES.LD_{ldw}-{lds}-{ldr}.fam")

    shell:
        """
        plink --bfile {params.xin1stem} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.xin1prunestem}
        plink --bfile {params.xin1stem} --exclude {params.xin1prune} --make-bed --out {params.xout1stem}

        plink --bfile {params.xin2stem} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.xin2prunestem}
        plink --bfile {params.xin2stem} --exclude {params.xin2prune} --make-bed --out {params.xout2stem}

        plink --bfile {params.xin3stem} --indep-pairwise {params.ldwindow} {params.ldstep} {params.ldrval} --out {params.xin3prunestem}
        plink --bfile {params.xin3stem} --exclude {params.xin3prune} --make-bed --out {params.xout3stem}
        """


# Here add site filtering steps for all samples, specifically for mtDNA and the
# Y chromosomes. These will be input for haplogroup.assignments.sh
rule filterYChromosomeAll:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd"),
        stem1 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES"),
    output:
        plinkoutbed = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bed"),
        plinkoutbim = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.bim"),
        plinkoutfam = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setMaleHetsMissing.geno{geno}.hwe{hwe}.MALES.fam")
    shell:
        """
        plink --bfile {params.instem} --chr {params.chroms} --filter-males --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-hh-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --output-chr M --make-bed --out {params.stem4}
        """


rule filterMtDNAAll:
    input:
        plkinbed = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bed"),
        plkinbim = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.bim"),
        plkinfam = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.fam")
    params:
        chroms = "{chrs}",
        genofilter = "{geno}",
        hwefilter = "{hwe}",
        instem = os.path.join(config["scratchdir"], "00_initialPlink/05_RemoveSamples/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd"),
        stem1 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}"),
        stem2 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing"),
        stem3 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}"),
        stem4 = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL"),
    output:
        plinkoutbed = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bed"),
        plinkoutbim = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.bim"),
        plinkoutfam = os.path.join(config["scratchdir"], "01_filtering_new/all_samples/chr{chrs}/ALL/{stm}.noChr0.noINDELS.noMissMatchDupSites.mergeMatchDups.sexUpdate.smplsRmvd.chr{chrs}.setHetsMissing.geno{geno}.hwe{hwe}.ALL.fam"),
    shell:
        """
        plink --bfile {params.instem} --chr {params.chroms} --make-bed --out {params.stem1}
        plink --bfile {params.stem1} --set-mixed-mt-missing --make-bed --out {params.stem2}
        plink --bfile {params.stem2} --geno {params.genofilter} --make-bed --out {params.stem3}
        plink --bfile {params.stem3} --hwe {params.hwefilter} --output-chr M --make-bed --out {params.stem4}
        """
