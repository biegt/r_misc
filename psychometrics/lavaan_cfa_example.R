library(lavaan)
library(MPsychoR)
library(semPlot)
library(tidyverse)

data("Rmotivation")

indicator_names <- str_detect(names(Rmotivation), "ext|int")

Rmot <- na.omit(Rmotivation[, indicator_names])

mot_model <- '
extrinsic =~ ext1 + ext2 + ext3 + ext4 + ext5 + ext6 +
             ext7 + ext8 + ext9 + ext10 + ext11 + ext12
intrinsic =~ int1 + int2 + int3 + int4 + int5'

mot_fit <- lavaan::cfa(mot_model, data = Rmot, ordered = names(Rmot))

semPaths(mot_fit, rotation = 4, what = "est", fade = FALSE,
         edge.color = 1, edge.label.cex = 0.7, intercepts = FALSE,
         asize = 2.5, esize = 1, sizeMan = 4.5, mar = c(1, 5, 1.5, 5),
         nCharNodes = 4)