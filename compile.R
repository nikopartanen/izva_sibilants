# devtools::install_github('rstudio/bookdown')
bookdown::render_book(input = "index.rmd", output_format = "bookdown::gitbook", output_dir = "gh-pages")
bookdown::render_book("index.rmd", "bookdown::pdf_book")
