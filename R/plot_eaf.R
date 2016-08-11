#' plot_eaf Function
#'
#' This function uses ggplot2 package to plot the turn taking patterns that are present in ELAN files. It demands that you have already created an object that contains the ELAN corpus with the function read.eaf, or with some other means extracted the start and end times of the utterances.
#' @param session The name of the session you want to plot.
#' @param corpus Used language corpus as a data frame.
#' @keywords ELAN linguistics
#' @export
#' @examples
#' open_eaf(5)

plot_eaf <- function(session = "kpv_udo20130806ButyrevaNK-5-cuttings_in_the_trees", corpus = kpv.corpus){

sessiontoplot <- corpus %>% filter(grepl(session, Session_name, ignore.case = TRUE)) %>% distinct(Session_name, Orth, Time_start, Time_end)

distinct <- sessiontoplot %>% distinct(Session_name)

if (nrow(distinct) < 1) {
        print("Your selection does not match any session! Please be more exact. / Тэнад бӧрйӧм оз сет неӧти сессиясӧ! Гиж стӧчаджыка.")
}

if (nrow(distinct) > 1) {
        print("Your selection returns more than one session! Please be more exact. / Тэнад бӧрйӧм сетас ӧтикысь унджык сессиясӧ! Гиж стӧчаджыка.")
}

# size = (Orth_count / (Ref_length / 1000))

else {
ggplot(sessiontoplot, aes(colour = Speaker)) +
        geom_segment(aes(x = Time_start, xend = Time_end, y = Speaker, yend = Speaker, size = 50)) +
        xlab("Duration") +
        ggtitle(sessiontoplot$Session_name) +
        theme_bw()}
}

