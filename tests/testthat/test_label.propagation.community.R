
context("cluster_label_prop")

test_that("label.probagation.community works", {

  library(igraph)

  g <- make_graph("Zachary")
  set.seed(42)
  lpc <- cluster_label_prop(g)
  expect_that(lpc$modularity, equals(modularity(g, lpc$membership)))
  expect_that(as.vector(membership(lpc)),
              equals(c(1, 1, 2, 1, 3, 3, 3, 1, 2, 2, 3, 1, 1, 1, 2, 2,
                       3, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                       2, 2)))
  expect_that(length(lpc), equals(3))
  expect_that(sizes(lpc),
              equals(structure(c(10L, 19L, 5L), .Dim = 3L, .Dimnames =
                               structure(list(`Community sizes` =
                                              c("1", "2", "3")),
                                         .Names = "Community sizes"),
                               class = "table")))

})
