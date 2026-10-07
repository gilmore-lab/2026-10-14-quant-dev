play_barplot <- function(data, x_var, text_size = 16) {
  assertthat::assert_that(is.data.frame((data)))
  assertthat::assert_that(is.numeric(text_size) & text_size > 0)
  # x_var is unquoted, so must capture
  x_var_name <- as_label(enquo(x_var))
  assertthat::assert_that(x_var_name %in% names(data))
  
  df <- data |>
    group_by({{x_var}}) |>
    summarise(n_dyads = n()) |>
    mutate(x_sort = fct_reorder({{x_var}}, n_dyads))
  
  df |>
    ggplot() +
    geom_col(aes(x = x_sort, y = n_dyads, fill = x_sort)) +
    geom_text(aes(x = x_sort, y = n_dyads + 40, label = n_dyads), 
              vjust = 0) +
    coord_flip() +
    xlab("") +
    ylab("dyads") +
    theme_classic() +
    theme(legend.position = "none") +
    theme(axis.text = element_text(size = text_size),
          axis.title = element_text(size = text_size))
}