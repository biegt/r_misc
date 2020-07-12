# List of old packages
old_packages <- installed.packages(lib.loc = "C:/Users/BiegT/Documents/R/R-3.6.2/library")
head(old_packages[, 1])

# list of new packages
new_packages <- installed.packages()
missing_df <- as.data.frame(old_packages[
  !old_packages[, "Package"] %in% new_packages[, "Package"], 
  ])

# Install missing packages
install.packages(missing_df$Package)

# Check if there are still packages missing
missing_df <- as.data.frame(old_packages[
  !old_packages[, 1] %in% installed.packages()[, 1], 
  ])

# # Get location of still missing packages
# library(dplyr, warn.conflicts = FALSE)
# on_gh <- function(pkg) {
#   repo = jsonlite::fromJSON(paste0("http://rpkg-api.gepuro.net/rpkg?q=", pkg))
#   repo[basename(repo$pkg_name) == pkg,]
# }
# gh_pkgs <- lapply(c("quanteda.classifiers", "emo"), on_gh) %>% 
#   bind_rows()
# 
# # Install these missing pacakges
# remotes::install_github(gh_pkgs$pkg_name)
# as_tibble(gh_pkgs)