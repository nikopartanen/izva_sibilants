#' add_gloss Function adds prettily formatted glosses to HTML output, and hopefully will do the same to LaTeX one day too
#'
#' This function needs to know about the content you want on different lines
#' @param phrase This is the utterance or example
#' @param gloss This is the gloss, please see Leipzig.js documentation for formatting info
#' @param translation This is the translation line
#' @param citation This is still being worked on, but one should be able to give citation info also automatically
#' @keywords ELAN
#' @export
#' @examples
#' sib_tier_cyr2ipa(eaf_file = "test.eaf", participant = "JAI-M-1939", linguistic_type = "sib")

add_gloss <- function(phrase, gloss, translation, citation){
        
        shiny::HTML(paste0('
<link rel="stylesheet" href="libs/leipzig.css">
        <div data-gloss style="border-top:0px solid; border-bottom:0px solid;">
                <p>', phrase,'</p>
                <p>', gloss,'</p>
                <p>', translation, '</p>
                <!-- JavaScript -->
        </div>
        <script src="libs/leipzig.js"></script>
        <script>
                document.addEventListener(\'DOMContentLoaded\', function() {
                Leipzig().gloss();
        });
</script>'))
}
