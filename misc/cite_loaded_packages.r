# function by MS Berends to create a reference list for all R packages loaded in a session (optionally a reference for RStudio can be added, as well)

citations <- function(includeURL = TRUE, includeRStudio = TRUE) {
    if(includeRStudio == TRUE) {
        ref.rstudio <- RStudio.Version()$citation
        if(includeURL == FALSE) {
            ref.rstudio$url <- NULL;
        }
        print(ref.rstudio, style = 'text')
        cat('\n')
    }

    cit.list <- c('base', names(sessionInfo()$otherPkgs))
    for(i in 1:length(cit.list)) {
        ref <- citation(cit.list[i])
        if(includeURL == FALSE) {
            ref$url <- NULL;
        }
        print(ref, style = 'text')
        cat('\n')
    }
}
