update_databraryr <- function(pkg = "NYU-Databrary/databraryr@development") {
  assertthat::is.string(pkg)
  pak::pkg_install(pkg = "NYU-Databrary/databraryr@development")
}