#' @rdname group_data
#' @export
group_rows <- function(.data) {
  group_data(.data)[[".rows"]]
}

#' Grouping data
#'
#' @family grouping functions
#' @param .data a tibble
#'
#' @return `group_data()` return a tibble with one row per group. The last column, always called `.rows`
#' is a list of integer vectors indicating the rows for each group.
#' If `.data` is a grouped data frame the first columns are the grouping variables.
#' `group_rows()` just returns the list of indices.
#'
#' @examples
#' df <- tibble(x = c(1,1,2,2))
#'
#' # one row
#' group_data(df)
#' group_rows(df)
#'
#' # 2 rows, one for each group
#' group_by(df,x) %>% group_data()
#' group_by(df,x) %>% group_rows()
#'
#' @export
group_data <- function(.data) {
  UseMethod("group_data")
}

#' @export
group_data.data.frame <- function(.data) {
  rows <- list(seq_len(nrow(.data)))
  tibble(.rows := rows)
}

#' @export
group_data.rowwise_df <- function(.data) {
  rows <- as.list(seq_len(nrow(.data)))
  tibble(.rows := rows)
}

#' @export
group_data.grouped_df <- function(.data) {
  group_data_grouped_df(.data)
}
