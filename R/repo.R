#' @export
list_repos <- function(org) {
  repos <- gh::gh("GET /orgs/:org/repos", .api_url = Sys.getenv("GHQC_API_URL"), org = org, .limit = Inf)
  return(lapply(repos, function(repo) repo$name))
}

# repo_up_to_date <- function() {
#   local_status <- gert::git_status()
#   if (length(local_status) > 0) {
#     stop("Local repository has uncommitted changes.")
#   }
# }


