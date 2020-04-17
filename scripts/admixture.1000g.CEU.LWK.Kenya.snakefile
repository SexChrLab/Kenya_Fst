import os

configfile: "admixture.1000g.CEU.LWK.Kenya.json"

rule all:
    input:
        expand("{outputdirbase}autos/{autostems}/run{runnum}/{autostems}.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                #atype = config["analysis_type"],
                autostems = config["auto_stems"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}xChr/{xstems}/{xstems}.setMaleHetsMissing.bed",
                outputdirbase = config["output_dir_base"],
                xstems = config["x_stems"]),
        expand("{outputdirbase}xChr/{xstems}/{xstems}.setMaleHetsMissing.bim",
                outputdirbase = config["output_dir_base"],
                xstems = config["x_stems"]),
        expand("{outputdirbase}xChr/{xstems}/{xstems}.setMaleHetsMissing.fam",
                outputdirbase = config["output_dir_base"],
                xstems = config["x_stems"]),
        expand("{outputdirbase}xChr/{xstems}/run{runnum}/{xstems}.setMaleHetsMissing.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                xstems = config["x_stems"],
                runnum = config["runs"],
                kval = config["kvalues"])



rule admixture_autos:
    input:
        bedfile = (config["in_dir"] + "{autostems}.bed")
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "autos/{autostems}/run{runnum}/")
    output:
        outlog = "{outputdirbase}autos/{autostems}/run{runnum}/{autostems}.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """

rule setMaleHetsMissing:
    input:
        bedfile = (config["in_dir"] + "{xstems}.bed"),
        bimfile = (config["in_dir"] + "{xstems}.bim"),
        famfile = (config["in_dir"] + "{xstems}.fam")
    params:
        instem = (config["in_dir"] + "{xstems}"),
        outstem = (config["output_dir_base"] + "xChr/{xstems}/{xstems}.setMaleHetsMissing")
    output:
        obedfile = "{outputdirbase}xChr/{xstems}/{xstems}.setMaleHetsMissing.bed",
        obimfile = "{outputdirbase}xChr/{xstems}/{xstems}.setMaleHetsMissing.bim",
        ofamfile = "{outputdirbase}xChr/{xstems}/{xstems}.setMaleHetsMissing.fam"
    shell:
        "plink --bfile {params.instem} --set-hh-missing --make-bed --out {params.outstem}"

rule admixture_xchr:
    input:
        bedfile = (config["output_dir_base"] + "xChr/{xstems}/{xstems}.setMaleHetsMissing.bed")
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "xChr/{xstems}/run{runnum}/")
    output:
        outlog = "{outputdirbase}xChr/{xstems}/run{runnum}/{xstems}.setMaleHetsMissing.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --haploid="male:23" --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """
