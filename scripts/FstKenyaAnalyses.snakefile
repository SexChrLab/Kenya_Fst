# Environment: genetic_diff_kenya

configfile: "FstKenyaAnalyses.config.json"


rule all:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/vcfs", "{chr_sex_options_full}.convert.vcf"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{all_combos}.frq"), chr_sex_options_full = config["chr_sex_options_full"], all_combos = config["all_combos"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population", "{fst_groups1}-{fst_groups2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_12"], fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan", "{fst_groupsBC1}-{fst_groupsBC2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_C12"], fst_groupsBC1 = config["fst_groupsBC1"], fst_groupsBC2 = config["fst_groupsBC2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan", "{fst_groupsCC1}-{fst_groupsCC2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_C12"], fst_groupsCC1 = config["fst_groupsCC1"], fst_groupsCC2 = config["fst_groupsCC2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_territorial_section", "{fst_groupsBTS1}-{fst_groupsBTS2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_TS12"], fst_groupsBTS1 = config["fst_groupsBTS1"], fst_groupsBTS2 = config["fst_groupsBTS2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_territorial_section", "{fst_groupsCTS1}-{fst_groupsCTS2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_TS12"], fst_groupsCTS1 = config["fst_groupsCTS1"], fst_groupsCTS2 = config["fst_groupsCTS2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs_ngibochoros_removed", "{all_combos}.NgibochorosRemoved.frq"), chr_sex_options_full = config["chr_sex_options_full"], all_combos = config["turkana_combos"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_turkanaPop12"], fst_groups1 = config["fst_groups1_turkana"], fst_groups2 = config["fst_groups2_turkana"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_turkanaC12"], fst_groups1 = config["fst_groups_turkanaBC1"], fst_groups2 = config["fst_groups_turkanaBC2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_turkanaC12"], fst_groups1 = config["fst_groups_tutkanaCC1"], fst_groups2 = config["fst_groups_turkanaCC2"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population", "{chr_sex_options_full}.per.population.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan", "{chr_sex_options_full}.per.blood_clan.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan", "{chr_sex_options_full}.per.culture_clan.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_territorial_section", "{chr_sex_options_full}.per.blood_territorial_section.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_territorial_section", "{chr_sex_options_full}.per.culture_territorial_section.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population_ngibochoros_removed", "{chr_sex_options_full}.per.population_ngibochoros_removed.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan_ngibochoros_removed", "{chr_sex_options_full}.per.blood_clan_ngibochoros_removed.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"]),
        expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan_ngibochoros_removed", "{chr_sex_options_full}.per.culture_clan_ngibochoros_removed.Fst.results.txt"), chr_sex_options_full = config["chr_sex_options_full"])


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


rule fstBloodTS:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsBTS1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsBTS2}.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groupsBTS1}",
        p2 = "{fst_groupsBTS2}",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_territorial_section/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_territorial_section", "{fst_groupsBTS1}-{fst_groupsBTS2}.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


rule fstCultureTS:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsCTS1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groupsCTS2}.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groupsCTS1}",
        p2 = "{fst_groupsCTS2}",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_territorial_section/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_territorial_section", "{fst_groupsCTS1}-{fst_groupsCTS2}.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


# Get allele frequencies for Turkana excluding Ngibochoros
rule getAlleleFrqTurkanaNoNgibochoros:
    input:
        vcf = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/vcfs", "{chr_sex_options_full}.convert.vcf")
    params:
        smplsRm = config["outliersNgibochoros"],
        smplskeepdir = config["keep_dir"],
        smplskeep = "{all_combos}",
        outstm = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs_ngibochoros_removed", "{all_combos}.NgibochorosRemoved")
    output:
        frq = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs_ngibochoros_removed", "{all_combos}.NgibochorosRemoved.frq")
    shell:
        "vcftools --vcf {input.vcf} --freq --keep {params.smplskeepdir}/{params.smplskeep} --remove {params.smplsRm} --out {params.outstm}"

# Fst - re claculate for combos with Turkana. Do not need to re-do TS Fst
rule fstPerPopNgibochorosRemoved:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groups1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs_ngibochoros_removed", "{fst_groups2}.NgibochorosRemoved.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groups1}",
        p2 = "{fst_groups2}.NgibochorosRemoved",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population_ngibochoros_removed/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


rule fstBloodClansNgibochorosRemoved:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groups1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs_ngibochoros_removed", "{fst_groups2}.NgibochorosRemoved.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groups1}",
        p2 = "{fst_groups2}.NgibochorosRemoved",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan_ngibochoros_removed/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


rule fstCultureClansNgibochorosRemoved:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs", "{fst_groups1}.frq"),
        frq2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/frqs_ngibochoros_removed", "{fst_groups2}.NgibochorosRemoved.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groups1}",
        p2 = "{fst_groups2}.NgibochorosRemoved",
        outdir = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan_ngibochoros_removed/")
    output:
        os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


rule mergeFstResults:
    input:
        r1 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population", "{fst_groups1}-{fst_groups2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_12"], fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"]),
        r2 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan", "{fst_groupsBC1}-{fst_groupsBC2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_C12"], fst_groupsBC1 = config["fst_groupsBC1"], fst_groupsBC2 = config["fst_groupsBC2"]),
        r3 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan", "{fst_groupsCC1}-{fst_groupsCC2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_C12"], fst_groupsCC1 = config["fst_groupsCC1"], fst_groupsCC2 = config["fst_groupsCC2"]),
        r4 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_territorial_section", "{fst_groupsBTS1}-{fst_groupsBTS2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_TS12"], fst_groupsBTS1 = config["fst_groupsBTS1"], fst_groupsBTS2 = config["fst_groupsBTS2"]),
        r5 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_territorial_section", "{fst_groupsCTS1}-{fst_groupsCTS2}.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_TS12"], fst_groupsCTS1 = config["fst_groupsCTS1"], fst_groupsCTS2 = config["fst_groupsCTS2"]),
        r6 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_turkanaPop12"], fst_groups1 = config["fst_groups1_turkana"], fst_groups2 = config["fst_groups2_turkana"]),
        r7 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_turkanaC12"], fst_groups1 = config["fst_groups_turkanaBC1"], fst_groups2 = config["fst_groups_turkanaBC2"]),
        r8 = expand(os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan_ngibochoros_removed", "{fst_groups1}-{fst_groups2}.NgibochorosRemoved.Fst.table.txt"), zip, chr_sex_options_full = config["chr_sex_options_full_turkanaC12"], fst_groups1 = config["fst_groups_tutkanaCC1"], fst_groups2 = config["fst_groups_turkanaCC2"])
    params:
        pathrslt1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population/"),
        pathrslt2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan/"),
        pathrslt3 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan/"),
        pathrslt4 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_territorial_section/"),
        pathrslt5 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_territorial_section/"),
        pathrslt6 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population_ngibochoros_removed/"),
        pathrslt7 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan_ngibochoros_removed/"),
        pathrslt8 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan_ngibochoros_removed/")
    output:
        o1 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population", "{chr_sex_options_full}.per.population.Fst.results.txt"),
        o2 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan", "{chr_sex_options_full}.per.blood_clan.Fst.results.txt"),
        o3 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan", "{chr_sex_options_full}.per.culture_clan.Fst.results.txt"),
        o4 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_territorial_section", "{chr_sex_options_full}.per.blood_territorial_section.Fst.results.txt"),
        o5 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_territorial_section", "{chr_sex_options_full}.per.culture_territorial_section.Fst.results.txt"),
        o6 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/population_ngibochoros_removed", "{chr_sex_options_full}.per.population_ngibochoros_removed.Fst.results.txt"),
        o7 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/blood_clan_ngibochoros_removed", "{chr_sex_options_full}.per.blood_clan_ngibochoros_removed.Fst.results.txt"),
        o8 = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options_full}/fst/culture_clan_ngibochoros_removed", "{chr_sex_options_full}.per.culture_clan_ngibochoros_removed.Fst.results.txt")
    shell:
        """
        cat {params.pathrslt1}*.txt > {output.o1};
        sed -i 's/.all.relatedsRemoved//g' {output.o1};
        cat {params.pathrslt2}*.txt > {output.o2};
        sed -i 's/.all.relatedsRemoved//g' {output.o2};
        cat {params.pathrslt3}*.txt > {output.o3};
        sed -i 's/.all.relatedsRemoved//g' {output.o3};
        cat {params.pathrslt4}*.txt > {output.o4};
        sed -i 's/.all.relatedsRemoved//g' {output.o4};
        cat {params.pathrslt5}*.txt > {output.o5};
        sed -i 's/.all.relatedsRemoved//g' {output.o5};
        cat {params.pathrslt6}*.txt > {output.o6};
        sed -i 's/.all.relatedsRemoved//g' {output.o6};
        cat {params.pathrslt7}*.txt > {output.o7};
        sed -i 's/.all.relatedsRemoved//g' {output.o7};
        cat {params.pathrslt8}*.txt > {output.o8};
        sed -i 's/.all.relatedsRemoved//g' {output.o8}
        """
