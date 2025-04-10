# ============================================================
# script for checking your package on CRAN
# ============================================================

#Liens utiles sur Rhub v2
#https://blog.r-hub.io/2024/04/11/rhub2/
#https://usethis.r-lib.org/articles/git-credentials.html

# install.packages("rhub")

# add the R-hub v2 workflow
rhub::rhub_setup()

# check your setup
rhub::rhub_doctor()

# Get a personal access token (PAT)
usethis::create_github_token()
# on your github repsitory: https://github.com/settings/tokens

# Put your PAT into the local Git credential store
gitcreds::gitcreds_set()

# get R-hub workflow in default branch
# folder .github with /workflows/rhub.yaml (yaml = format de représentation de données)

# at the end, you should get something like this:
# rhub::rhub_doctor()
#✔ Found R package at C:/Users/a.romain.leroux/Documents/package-PFIM-check_CRAN.
#✔ Found git repository at C:/Users/a.romain.leroux/Documents/package-PFIM-check_CRAN.
#✔ Found GitHub PAT.
#✔ Found repository on GitHub at <https://github.com/MrRomainLeroux/package-PFIM-check_CRAN.git>.
#✔ GitHub PAT has the right scopes.
#✔ Found R-hub workflow in default branch, and it is active.
#→ WOOT! You are ready to run rhub::rhub_check() on this package.

