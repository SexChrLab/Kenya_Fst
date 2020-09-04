import os

configfile: "admixture.test.json"

rule all:
    input:
        expand("{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], autostem = config["auto_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], autostem = config["auto_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], autostem = config["auto_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos/run{runnum}/{autostem}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                autostem = config["auto_stem"],
                runnum = config["runs"],
                kval = config["kvalues"])


rule rm_outliers_autos:
    input:
        infilebed = (config["auto_in_dir"] + config["auto_stem"] + ".map"),
        infilebim = (config["auto_in_dir"] + config["auto_stem"] + ".ped")
    params:
        removel = (config["outlier_dir"] + "{rmlist}" + ".all.txt"),
        instm = os.path.join(config["auto_in_dir"], config["auto_stem"]),
        outstm = (config["output_dir_base"] + "{rmlist}/autos/" + config["auto_stem"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.fam"
    shell:
        "plink --file {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule admixture_autos:
    input:
        bedfile = "{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/autos/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/autos/run{runnum}/{autostem}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """
