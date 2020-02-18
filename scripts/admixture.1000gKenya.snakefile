import os

configfile: "admixture.1000gKenya.json"

rule all:
    input:
        expand("{outputdirbase}autos/{autostems}/run{runnum}/{autostems}.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                #atype = config["analysis_type"],
                autostems = config["auto_stems"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}xChr/{xstems}/run{runnum}/{xstems}.log.{kval}.out",
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


rule admixture_xchr:
    input:
        bedfile = (config["in_dir"] + "{xstems}.bed")
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "xChr/{xstems}/run{runnum}/")
    output:
        outlog = "{outputdirbase}xChr/{xstems}/run{runnum}/{xstems}.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """
