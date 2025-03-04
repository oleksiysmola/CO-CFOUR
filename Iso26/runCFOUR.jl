point::Int64 = 2
# jobSplit::Int64 = 9
# numberOfJobs::Int64 = 1000

R::Vector{Float64}=[0.9]                                                              

run(`xclean`)
# run(`./runGenerateCfourScript35.csh $(point) $(ROH) $(ROCL) $(A)`)
# run(`./runGenerateCfourScript37.csh $(point) $(ROH) $(ROCL) $(A)`)
# point += 1

for point in R
    run(`xclean`)
    run(`./RUN_CFOUR.csh $(point)`)
end

# for i in 1:numberOfJobs
#     run(`qsub -e CH3OH_CBS_$(point)-$(point + jobSplit).e -o CH3OH_CBS_$(point)-$(point + jobSplit).o -l h_rt="11:59:00" -l mem=70G -l tmpfs=100G RunMolproJobs.csh $(point) $(point + jobSplit)`)
#     global point = point + jobSplit
#     println(point)
# end