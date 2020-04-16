# Environment: genetic_diff_kenya

configfile: "FstPermutations.config.2.json"

# Number of permutations to calculate Fst for
totnumperm = 1000
numperm = list(range(1, (totnumperm+1)))


rule all:
    input:
        expand(os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs/{sex}/", "{combos_short}.permutation_{permutenum}.frq"), permutenum = numperm, chr_sex_options = config["chr_sex_options"], combos_short = config["combos_short"], sex = config["sex"]),
        expand(os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/fst/{sex}", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt"), permutenum = numperm, chr_sex_options = config["chr_sex_options"], fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"], sex = config["sex"]),
        expand(os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/all_separated/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt"), permutenum = numperm, fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"], sex = config["sex"]),
        expand(os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt"), fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"], sex = config["sex"])
        #expand(os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr23.setMaleHetsMissing.geno0.05.hwe1e-50.ALL.LD_50-10-0.2", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt"), fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"]),
        #expand(os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr26.setHetsMissing.geno0.05.hwe1e-50.ALL", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt"), fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"])


# Get allele frequencies for all samples for each population combination
# Testing with just the male permutations
rule getAlleleFrq:
    input:
        vcf = os.path.join(config["out_dir"], "05_fst_new/{chr_sex_options}/vcfs", "{chr_sex_options}.convert.vcf"),
    params:
        smplsRm = config["outliers"],
        permn = "{permutenum}",
        keep = os.path.join(config["keep_dir"], "{combos_short}", "{combos_short}.permutations.males.{permutenum}.txt"),
        outstm = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs/{sex}/", "{combos_short}.permutation_{permutenum}")
    output:
        frq = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs/{sex}/", "{combos_short}.permutation_{permutenum}.frq")
    shell:
        "vcftools --vcf {input.vcf} --freq --keep {params.keep} --remove {params.smplsRm} --out {params.outstm}"


# Fst
rule FstCalculation:
    input:
        #expand(os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs", "{combos_short}.permutation_{permutenum}.frq"), permutenum = numperm, chr_sex_options = config["chr_sex_options"], combos_short = config["combos_short"])
        frq1 = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs/{sex}/", "{fst_groups1}.permutation_{permutenum}.frq"),
        frq2 = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs/{sex}/", "{fst_groups2}.permutation_{permutenum}.frq")
    params:
        scrpt = config["scripts_dir"] + "/hudson.fst.py",
        p1 = "{fst_groups1}",
        p2 = "{fst_groups2}.permutation_{permutenum}",
        frq1 = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs/{sex}/", "{fst_groups1}.permutation_{permutenum}.frq"),
        frq2 = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/frqs/{sex}/", "{fst_groups2}.permutation_{permutenum}.frq"),
        outdir = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/fst/{sex}/")
    output:
        os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/{chr_sex_options}/fst/{sex}/", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {params.frq1} --frq2 {params.frq2} --p1 {params.p1} --p2 {params.p2} --dir {params.outdir}"


# Add a move command to move all results files to one common directory
rule cpresults1:
    input:
        expand(os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/fst/{sex}/", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt"), permutenum = numperm, fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"], sex = config["sex"])
    params:
        cmndir = os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/all_separated/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/"),
        fn = os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/fst/{sex}/", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt")
    output:
        os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/all_separated/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt")
    shell:
        "cp {params.fn} {output}"


# Merge all permutations into 1 table
rule mergeFstResults1:
    input:
        expand(os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/all_separated/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt"), permutenum = numperm, fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"], sex = config["sex"])
    params:
        indir = os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/all_separated/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}")
    output:
        os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt")
    shell:
        """
        cat {params.indir}*.Fst.table.txt > {output};
        sed -i 's/.all.relatedsRemoved//g' {output}
        """


'''# Merge all permutations into 1 table
rule mergeFstResults1:
    input:
        expand(os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/fst", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt"), permutenum = numperm, fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"])
    output:
        os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt")
    shell:
        """
        cat {input} > {output};
        sed -i 's/.all.relatedsRemoved.permutations//g' {output}
        """

rule mergeFstResults2:
    input:
        expand(os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/chr23.setMaleHetsMissing.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/fst", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt"), permutenum = numperm, fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"])
    output:
        os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr23.setMaleHetsMissing.geno0.05.hwe1e-50.ALL.LD_50-10-0.2", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt")
    shell:
        """
        cat {input} > {output};
        sed -i 's/.all.relatedsRemoved.permutations//g' {output}
        """

rule mergeFstResults3:
    input:
        expand(os.path.join(config["out_dir"], "06_fst_permutations/p_{permutenum}/chr26.setHetsMissing.geno0.05.hwe1e-50.ALL/fst", "{fst_groups1}-{fst_groups2}.permutation_{permutenum}.Fst.table.txt"), permutenum = numperm, fst_groups1 = config["fst_groups1"], fst_groups2 = config["fst_groups2"])
    output:
        os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr26.setHetsMissing.geno0.05.hwe1e-50.ALL", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt")
    shell:
        """
        cat {input} > {output};
        sed -i 's/.all.relatedsRemoved.permutations//g' {output}
        """
'''
