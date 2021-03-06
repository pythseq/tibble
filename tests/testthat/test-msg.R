context("msg")

test_that("error class", {
  expect_equal(tibble_error_class("boo"), c("tibble_error_boo", "tibble_error"))
})

test_that("aborting with class", {
  expect_error(abort(error_enframe_value_null()), class = tibble_error_class("enframe_value_null"))
})

test_that("error messages", {
  expect_known_tibble_error_output(
    error_enframe_value_null(),

    error_enframe_has_dim(Titanic),

    error_need_scalar_column_index(),

    error_na_column_index(1:3),

    error_unsupported_column_index(),

    error_large_column_index(3, 4:5),
    error_large_column_index(3, 5),
    error_large_column_index(1, 4:5),
    error_large_column_index(1, 5),

    error_small_column_index(3, -(4:5)),
    error_small_column_index(3, -5),
    error_small_column_index(1, -(4:5)),
    error_small_column_index(1, -5),

    error_unknown_column_names("a"),
    error_unknown_column_names(c("b", "c")),
    error_unknown_column_names(LETTERS),

    error_existing_column_names("a"),
    error_existing_column_names(c("b", "c")),
    error_existing_column_names(LETTERS),

    error_assign_columns_non_na_only(),

    error_assign_columns_non_missing_only(),

    error_new_columns_at_end_only(5, 7:8),
    error_new_columns_at_end_only(5, 7),
    error_new_columns_at_end_only(1, 7:8),
    error_new_columns_at_end_only(1, 7),

    error_duplicate_column_subscript_for_assignment(c(1, 1)),
    error_duplicate_column_subscript_for_assignment(c(1, 1, 2, 2)),

    error_assign_rows_non_na_only(),

    error_new_rows_at_end_only(5, 7:8),
    error_new_rows_at_end_only(5, 7),
    error_new_rows_at_end_only(1, 7:8),
    error_new_rows_at_end_only(1, 7),

    error_duplicate_row_subscript_for_assignment(c(1, 1)),
    error_duplicate_row_subscript_for_assignment(c(1, 1, 2, 2)),

    error_add_rows_to_grouped_df(),

    error_inconsistent_new_rows("a"),
    error_inconsistent_new_rows(letters[2:3]),
    error_inconsistent_new_rows(LETTERS),

    error_names_must_be_non_null(repair = TRUE),
    error_names_must_be_non_null(repair = FALSE),

    error_names_must_have_length(length = 5, n = 3),

    error_column_must_be_named(1, repair = TRUE),
    error_column_must_be_named(2:3, repair = TRUE),
    error_column_must_be_named(seq_along(letters), repair = TRUE),
    error_column_must_be_named(4:6, repair = FALSE),

    error_column_must_not_be_dot_dot("a", repair = FALSE),
    error_column_must_not_be_dot_dot(letters[2:3], repair = TRUE),
    error_column_must_not_be_dot_dot(LETTERS, repair = TRUE),

    error_column_names_must_be_unique("a", repair = FALSE),
    error_column_names_must_be_unique(letters[2:3], repair = TRUE),
    error_column_names_must_be_unique(LETTERS, repair = TRUE),

    error_column_names_must_be_syntactic("a", repair = FALSE),
    error_column_names_must_be_syntactic(letters[2:3], repair = TRUE),
    error_column_names_must_be_syntactic(LETTERS, repair = TRUE),

    error_column_must_be_vector("a", 3, "environment"),
    error_column_must_be_vector("", 3, "environment"),
    error_column_must_be_vector(letters[2:3], 3:4, c("name", "NULL")),
    error_column_must_be_vector(c("", "", LETTERS), 1:28, c("QQ", "VV", letters)),

    error_inconsistent_cols(
      10,
      letters[1:3],
      c(4, 4, 3),
      "Requested with `uvw` argument"
    ),
    error_inconsistent_cols(
      10,
      letters[1:3],
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ),
    error_inconsistent_cols(
      NULL,
      letters[1:3],
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ),
    error_inconsistent_cols(
      10,
      1:3,
      c(4, 4, 3),
      "Requested with `uvw` argument"
    ),
    error_inconsistent_cols(
      10,
      1:3,
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ),
    error_inconsistent_cols(
      NULL,
      1:3,
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ),

    error_inconsistent_new_cols(10, data.frame(a = 1:2)),
    error_inconsistent_new_cols(1, data.frame(a = 1:3, b = 2:4)),

    error_duplicate_new_cols("a"),
    error_duplicate_new_cols(letters[2:3]),
    error_duplicate_new_cols(LETTERS),

    error_both_before_after(),

    error_already_has_rownames(),

    error_glimpse_infinite_width(),

    error_tribble_needs_columns(),

    error_tribble_lhs_column_syntax(quote(lhs)),

    error_tribble_rhs_column_syntax(quote(a + b)),

    error_tribble_non_rectangular(5, 17),

    error_frame_matrix_list(2:4),

    error_tibble_row_size_one(3, "foo", 7),

    error_as_tibble_needs_argument(),

    error_new_tibble_must_be_list(),

    error_new_tibble_needs_class(),

    error_new_tibble_needs_nrow()
  )
})
