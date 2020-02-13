import os

configfile: "admixture.json"

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
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/xChr/{xstem}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], xstem = config["x_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr/{xstem}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], xstem = config["x_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr/{xstem}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], xstem = config["x_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8/{chr8stem}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], chr8stem = config["chr8_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8/{chr8stem}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], chr8stem = config["chr8_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8/{chr8stem}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], chr8stem = config["chr8_stem"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr/run{runnum}/{xstem}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                xstem = config["x_stem"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/chr8/run{runnum}/{chr8stem}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                chr8stem = config["chr8_stem"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/autos_females/{autostemf}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], autostemf = config["auto_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos_females/{autostemf}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], autostemf = config["auto_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos_females/{autostemf}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], autostemf = config["auto_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos_females/run{runnum}/{autostemf}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                autostemf = config["auto_stem_f"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/xChr_females/{xstemf}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], xstemf = config["x_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr_females/{xstemf}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], xstemf = config["x_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr_females/{xstemf}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], xstemf = config["x_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8_females/{chr8stemf}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], chr8stemf = config["chr8_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8_females/{chr8stemf}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], chr8stemf = config["chr8_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8_females/{chr8stemf}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], chr8stemf = config["chr8_stem_f"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr_females/run{runnum}/{xstemf}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                xstemf = config["x_stem_f"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/chr8_females/run{runnum}/{chr8stemf}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                chr8stemf = config["chr8_stem_f"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/autos_males/{autostemm}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], autostemm = config["auto_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos_males/{autostemm}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], autostemm = config["auto_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos_males/{autostemm}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], autostemm = config["auto_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/autos_males/run{runnum}/{autostemm}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                autostemm = config["auto_stem_m"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/xChr_males/{xstemm}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], xstemm = config["x_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr_males/{xstemm}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], xstemm = config["x_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr_males/{xstemm}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], xstemm = config["x_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8_males/{chr8stemm}.{rmlist}.Removed.bed", outputdirbase = config["output_dir_base"], chr8stemm = config["chr8_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8_males/{chr8stemm}.{rmlist}.Removed.bim", outputdirbase = config["output_dir_base"], chr8stemm = config["chr8_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/chr8_males/{chr8stemm}.{rmlist}.Removed.fam", outputdirbase = config["output_dir_base"], chr8stemm = config["chr8_stem_m"], rmlist = config["outlier_list"]),
        expand("{outputdirbase}{rmlist}/xChr_males/run{runnum}/{xstemm}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                xstemm = config["x_stem_m"],
                runnum = config["runs"],
                kval = config["kvalues"]),
        expand("{outputdirbase}{rmlist}/chr8_males/run{runnum}/{chr8stemm}.{rmlist}.Removed.log.{kval}.out",
                outputdirbase = config["output_dir_base"],
                rmlist = config["outlier_list"],
                chr8stemm = config["chr8_stem_m"],
                runnum = config["runs"],
                kval = config["kvalues"])




rule rm_outliers_autos:
    input:
        infilebed = (config["auto_in_dir"] + config["auto_stem"] + ".bed"),
        infilebim = (config["auto_in_dir"] + config["auto_stem"] + ".bim"),
        infilefam = (config["auto_in_dir"] + config["auto_stem"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["auto_in_dir"], config["auto_stem"]),
        outstm = (config["output_dir_base"] + "{rmlist}/autos/" + config["auto_stem"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/autos/{autostem}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule rm_outliers_x:
    input:
        infilebed = (config["x_in_dir"] + config["x_stem"] + ".bed"),
        infilebim = (config["x_in_dir"] + config["x_stem"] + ".bim"),
        infilefam = (config["x_in_dir"] + config["x_stem"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["x_in_dir"], config["x_stem"]),
        outstm = (config["output_dir_base"] + "{rmlist}/xChr/" + config["x_stem"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/xChr/{xstem}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/xChr/{xstem}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/xChr/{xstem}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule rm_outliers_chr8:
    input:
        infilebed = (config["chr8_in_dir"] + config["chr8_stem"] + ".bed"),
        infilebim = (config["chr8_in_dir"] + config["chr8_stem"] + ".bim"),
        infilefam = (config["chr8_in_dir"] + config["chr8_stem"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["chr8_in_dir"], config["chr8_stem"]),
        outstm = (config["output_dir_base"] + "{rmlist}/chr8/" + config["chr8_stem"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/chr8/{chr8stem}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/chr8/{chr8stem}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/chr8/{chr8stem}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


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


rule admixture_x:
    input:
        bedfile = "{outputdirbase}{rmlist}/xChr/{xstem}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/xChr/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/xChr/run{runnum}/{xstem}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --haploid="male:23" --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """


rule admixture_chr8:
    input:
        bedfile = "{outputdirbase}{rmlist}/chr8/{chr8stem}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/chr8/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/chr8/run{runnum}/{chr8stem}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """

#####################
# Females only steps
rule rm_outliers_autos_f:
    input:
        infilebed = (config["auto_in_dir"] + config["auto_stem_f"] + ".bed"),
        infilebim = (config["auto_in_dir"] + config["auto_stem_f"] + ".bim"),
        infilefam = (config["auto_in_dir"] + config["auto_stem_f"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["auto_in_dir"], config["auto_stem_f"]),
        outstm = (config["output_dir_base"] + "{rmlist}/autos_females/" + config["auto_stem_f"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/autos_females/{autostemf}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/autos_females/{autostemf}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/autos_females/{autostemf}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule rm_outliers_x_f:
    input:
        infilebed = (config["x_in_dir"] + config["x_stem_f"] + ".bed"),
        infilebim = (config["x_in_dir"] + config["x_stem_f"] + ".bim"),
        infilefam = (config["x_in_dir"] + config["x_stem_f"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["x_in_dir"], config["x_stem_f"]),
        outstm = (config["output_dir_base"] + "{rmlist}/xChr_females/" + config["x_stem_f"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/xChr_females/{xstemf}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/xChr_females/{xstemf}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/xChr_females/{xstemf}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule rm_outliers_chr8_f:
    input:
        infilebed = (config["chr8_in_dir"] + config["chr8_stem_f"] + ".bed"),
        infilebim = (config["chr8_in_dir"] + config["chr8_stem_f"] + ".bim"),
        infilefam = (config["chr8_in_dir"] + config["chr8_stem_f"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["chr8_in_dir"], config["chr8_stem_f"]),
        outstm = (config["output_dir_base"] + "{rmlist}/chr8_females/" + config["chr8_stem_f"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/chr8_females/{chr8stemf}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/chr8_females/{chr8stemf}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/chr8_females/{chr8stemf}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule admixture_autos_f:
    input:
        bedfile = "{outputdirbase}{rmlist}/autos_females/{autostemf}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/autos_females/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/autos_females/run{runnum}/{autostemf}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """

rule admixture_x_f:
    input:
        bedfile = "{outputdirbase}{rmlist}/xChr_females/{xstemf}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/xChr_females/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/xChr_females/run{runnum}/{xstemf}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --haploid="male:23" --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """


rule admixture_chr8_f:
    input:
        bedfile = "{outputdirbase}{rmlist}/chr8_females/{chr8stemf}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/chr8_females/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/chr8_females/run{runnum}/{chr8stemf}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """

#####################
# Males only steps
rule rm_outliers_autos_m:
    input:
        infilebed = (config["auto_in_dir"] + config["auto_stem_m"] + ".bed"),
        infilebim = (config["auto_in_dir"] + config["auto_stem_m"] + ".bim"),
        infilefam = (config["auto_in_dir"] + config["auto_stem_m"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["auto_in_dir"], config["auto_stem_m"]),
        outstm = (config["output_dir_base"] + "{rmlist}/autos_males/" + config["auto_stem_m"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/autos_males/{autostemm}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/autos_males/{autostemm}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/autos_males/{autostemm}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule rm_outliers_x_m:
    input:
        infilebed = (config["x_in_dir"] + config["x_stem_m"] + ".bed"),
        infilebim = (config["x_in_dir"] + config["x_stem_m"] + ".bim"),
        infilefam = (config["x_in_dir"] + config["x_stem_m"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["x_in_dir"], config["x_stem_m"]),
        outstm = (config["output_dir_base"] + "{rmlist}/xChr_males/" + config["x_stem_m"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/xChr_males/{xstemm}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/xChr_males/{xstemm}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/xChr_males/{xstemm}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule rm_outliers_chr8_m:
    input:
        infilebed = (config["chr8_in_dir"] + config["chr8_stem_m"] + ".bed"),
        infilebim = (config["chr8_in_dir"] + config["chr8_stem_m"] + ".bim"),
        infilefam = (config["chr8_in_dir"] + config["chr8_stem_m"] +".fam")
    params:
        removel = (config["outlier_dir"] + "{rmlist}"),
        instm = os.path.join(config["chr8_in_dir"], config["chr8_stem_m"]),
        outstm = (config["output_dir_base"] + "{rmlist}/chr8_males/" + config["chr8_stem_m"] + ".{rmlist}.Removed")
    output:
        plinkbed = "{outputdirbase}{rmlist}/chr8_males/{chr8stemm}.{rmlist}.Removed.bed",
        plinkbim = "{outputdirbase}{rmlist}/chr8_males/{chr8stemm}.{rmlist}.Removed.bim",
        plinkfam = "{outputdirbase}{rmlist}/chr8_males/{chr8stemm}.{rmlist}.Removed.fam"
    shell:
        "plink --bfile {params.instm} --remove {params.removel} --make-bed --out {params.outstm}"


rule admixture_autos_m:
    input:
        bedfile = "{outputdirbase}{rmlist}/autos_males/{autostemm}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/autos_males/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/autos_males/run{runnum}/{autostemm}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """

rule admixture_x_m:
    input:
        bedfile = "{outputdirbase}{rmlist}/xChr_males/{xstemm}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/xChr_males/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/xChr_males/run{runnum}/{xstemm}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --haploid="male:23" --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """


rule admixture_chr8_m:
    input:
        bedfile = "{outputdirbase}{rmlist}/chr8_males/{chr8stemm}.{rmlist}.Removed.bed"
    params:
        kval = "{kval}",
        outpath = os.path.join(config["output_dir_base"], "{rmlist}/chr8_males/run{runnum}/")
    output:
        outlog = "{outputdirbase}{rmlist}/chr8_males/run{runnum}/{chr8stemm}.{rmlist}.Removed.log.{kval}.out"
    shell:
        """
        cd {params.outpath}
        admixture -s time --cv {input.bedfile} {params.kval} | tee {output.outlog}
        """
