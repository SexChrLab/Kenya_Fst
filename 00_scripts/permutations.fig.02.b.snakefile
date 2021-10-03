# Environment: kenya_fst_pipeline

configfile: "permutations.fig.02.b.ngiyapakuno_kwatela.config.json" # make sure to chage this for each Fst combo calculation

# Number of permutations to calculate Fst for
totnumperm = 1000
#totnumperm = 2
numperm = list(range(1, (totnumperm+1)))


rule all:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/frqs/{combo_pop}.permutation.{permutenum}.frq"), combo = config["combo"], permutenum = numperm, combo_pop = config["combo_pop"]),

        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/{combo_pop}.permutation_{permutenum}-borana.Fst.table.txt"), combo = config["combo"], permutenum = numperm, combo_pop = config["combo_pop"]),
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/{combo_pop}.permutation_{permutenum}-rendille.Fst.table.txt"), combo = config["combo"], permutenum = numperm, combo_pop = config["combo_pop"]),
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/{combo_pop}.permutation_{permutenum}-samburu.Fst.table.txt"), combo = config["combo"], permutenum = numperm, combo_pop = config["combo_pop"]),

        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/{combo_pop}-borana.permutations.merged.Fst.table.txt"), combo = config["combo"], combo_pop = config["combo_pop"]),
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/{combo_pop}-rendille.permutations.merged.Fst.table.txt"), combo = config["combo"], combo_pop = config["combo_pop"]),
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/{combo_pop}-samburu.permutations.merged.Fst.table.txt"), combo = config["combo"], combo_pop = config["combo_pop"]),

        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/All.permutations.merged.Fst.table.txt"), combo = config["combo"]),
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/All.permutations.merged.Fst.table.txt"), combo = config["combo"]),
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/All.permutations.merged.Fst.table.txt"), combo = config["combo"])


# Get allele frequencies for all permutations for each population in the combination
rule getAlleleFrq:
    input:
        vcf = config["vcf_auto"]
    params:
        permn = "{permutenum}",
        keep = os.path.join(config["keep_dir"], "{combo}/{combo_pop}.permutation.{permutenum}.txt"),
        #outstm = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/permutations_sep/p_{permutenum}/frqs/{combo_pop}.permutation.{permutenum}")
        outstm = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/frqs/{combo_pop}.permutation.{permutenum}")
    output:
        #os.path.join(config["out_dir"], "05_fst_permutations/{combo}/permutations_sep/p_{permutenum}/frqs/{combo_pop}.permutation.{permutenum}.frq")
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/frqs/{combo_pop}.permutation.{permutenum}.frq")
    shell:
        "vcftools --vcf {input.vcf} --freq --keep {params.keep} --out {params.outstm}"


# Fst
# Separate rules for Borana, Samburu, and Rendille
rule FstCalculationBorana:
    input:
        #frq1 = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/permutations_sep/p_{permutenum}/frqs/{combo_pop}.permutation.{permutenum}.frq"),
        frq1 = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/frqs/{combo_pop}.permutation.{permutenum}.frq"),
        frq2 = config["borana_frq"]
    params:
        scrpt = config["scripts_dir"] + "hudson.fst.py",
        p1 = "{combo_pop}.permutation_{permutenum}",
        p2 = "borana",
        #outdir = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/permutations_sep/p_{permutenum}/fst/borana/")
        outdir = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/")
    output:
        #os.path.join(config["out_dir"], "05_fst_permutations/{combo}/permutations_sep/p_{permutenum}/fst/borana/{combo_pop}.permutation_{permutenum}-borana.Fst.table.txt")
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/{combo_pop}.permutation_{permutenum}-borana.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --out {output}"

rule FstCalculationRendille:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/frqs/{combo_pop}.permutation.{permutenum}.frq"),
        frq2 = config["rendille_frq"]
    params:
        scrpt = config["scripts_dir"] + "hudson.fst.py",
        p1 = "{combo_pop}.permutation_{permutenum}",
        p2 = "rendille",
        outdir = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/")
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/{combo_pop}.permutation_{permutenum}-rendille.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --out {output}"

rule FstCalculationSamburu:
    input:
        frq1 = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/frqs/{combo_pop}.permutation.{permutenum}.frq"),
        frq2 = config["samburu_frq"]
    params:
        scrpt = config["scripts_dir"] + "hudson.fst.py",
        p1 = "{combo_pop}.permutation_{permutenum}",
        p2 = "borana",
        outdir = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/")
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/{combo_pop}.permutation_{permutenum}-samburu.Fst.table.txt")
    shell:
        "python {params.scrpt} --frq1 {input.frq1} --frq2 {input.frq2} --p1 {params.p1} --p2 {params.p2} --out {output}"


# Merge all permutations into 1 table
rule mergeFstResultsBorana:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/{combo_pop}.permutation_{permutenum}-borana.Fst.table.txt"), combo = config["combo"], permutenum = numperm, combo_pop = config["combo_pop"])
    params:
        indir = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/"),
        pop = "{combo_pop}"
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/{combo_pop}-borana.permutations.merged.Fst.table.txt")
    shell:
        """
        cat {params.indir}*{params.pop}*permutation_*.Fst.table.txt > {output}
        """

rule mergeFstResultsRendille:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/{combo_pop}.permutation_{permutenum}-rendille.Fst.table.txt"), combo = config["combo"], permutenum = numperm, combo_pop = config["combo_pop"])
    params:
        indir = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/"),
        pop = "{combo_pop}"
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/{combo_pop}-rendille.permutations.merged.Fst.table.txt")
    shell:
        """
        cat {params.indir}*{params.pop}*permutation_*.Fst.table.txt > {output}
        """

rule mergeFstResultsSamburu:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/{combo_pop}.permutation_{permutenum}-samburu.Fst.table.txt"), combo = config["combo"], permutenum = numperm, combo_pop = config["combo_pop"])
    params:
        indir = os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/"),
        pop = "{combo_pop}"
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/{combo_pop}-samburu.permutations.merged.Fst.table.txt")
    shell:
        """
        cat {params.indir}*{params.pop}*permutation_*.Fst.table.txt > {output}
        """

# Paste mreged results files
rule pasteResultsBorana:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/{combo_pop}-borana.permutations.merged.Fst.table.txt"), combo = config["combo"], combo_pop = config["combo_pop"])
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/borana/All.permutations.merged.Fst.table.txt")
    shell:
        "paste {input} > {output}"

rule pasteResultsRendille:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/{combo_pop}-rendille.permutations.merged.Fst.table.txt"), combo = config["combo"], combo_pop = config["combo_pop"])
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/rendille/All.permutations.merged.Fst.table.txt")
    shell:
        "paste {input} > {output}"

rule pasteResultsSamburu:
    input:
        expand(os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/{combo_pop}-samburu.permutations.merged.Fst.table.txt"), combo = config["combo"], combo_pop = config["combo_pop"])
    output:
        os.path.join(config["out_dir"], "05_fst_permutations/{combo}/fst/samburu/All.permutations.merged.Fst.table.txt")
    shell:
        "paste {input} > {output}"

'''
rule plotFstResults1:
    input:
        fstresult = os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.txt")
    params:
        obfst = config["observed_fst"],
        scripts_dir = config["scripts_dir"],
        fstpath = os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/"),
        fstfnstem = os.path.join("{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results"),
        sex = config["sex"]
    output:
        os.path.join(config["out_dir"], "06_fst_permutations/permutations_merged/chr1-22.geno0.05.hwe1e-50.ALL.LD_50-10-0.2/{sex}/", "{fst_groups1}-{fst_groups2}.permutations_merged.Fst.results.pdf")
    shell:
        "Rscript plotPermutationDistribution.R {params.fstpath} {params.fstfnstem} {params.sex} {params.obfst} {params.fstpath}"
'''
