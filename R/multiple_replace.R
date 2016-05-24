#' multiple_replace Function
#'
#' This function applies multiple substitution patterns into gsub function
#' @param The path to the text file you want to open

multiple_replace <- function(pattern, replacement, x, ...){
        if (length(pattern)!=length(replacement)){
                stop("Pattern and replacement do not have the same length!")}
        result <- x
        for (i in 1:length(pattern)){
                result <- gsub(pattern[i], replacement[i], result, ...)}
        result
}
