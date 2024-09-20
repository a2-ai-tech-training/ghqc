#' check_if_qc_file_untracked
#'
#' found in error_copy_for_ghqc.R
#'
#' @param qc_file_path path to qc file to be checked for tracking
#'
#' @return boolean if qc file is untracked
#' @export
#'
#' @examples untracked_file <- check_if_qc_file_untracked(qc_file_path)
check_if_qc_file_untracked <- function(qc_file_path) {
  status <- processx::run("git", c("status", "-u"))$stdout
  lines <- strsplit(status, "\n")[[1]]
  untracked_start <- grep("Untracked files:", lines)

  if (length(untracked_start) > 0) {
    # lines in "Untracked files" section
    untracked_lines <- lines[(untracked_start + 1):length(lines)]

    # check if the qc_file_path is in untracked_lines
    return(any(grepl(qc_file_path, untracked_lines)))
  }

  # if "Untracked files" not found, return false
  return(FALSE)
}
