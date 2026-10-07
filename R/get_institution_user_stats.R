get_institution_user_stats <- function(inst_id = 12) {
  assertthat::is.number(inst_id)
  assertthat::assert_that(inst_id > 0)
  
  inst_ais <- databraryr::list_institution_affiliates(institution_id = inst_id)
  
  purrr::map(inst_ais$user_id, ~ as.data.frame(databraryr::get_user_statistics(user_id = .x))) |>
    purrr::list_rbind()
}