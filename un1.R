

acc_names <- uyt40_sindex_checkdiff$accession
for(i in 1:length(acc_names)){
  barplot_checkdiff <- uyt40_sindex_checkdiff %>%
    filter(accession == acc_names[i]) %>% 
    select(-c(rtwt, mcmds, mcmdi)) %>%
    select(accession,fyld,dyld,dm,shtwt,everything()) %>%
    pivot_longer(-c(accession,rank,sindex), names_to = "traits", values_to = "values") %>%
    
    # group_by(traits) %>%
    # top_frac(.1,sindex) %>%
    #ungroup() %>%
    
    # mutate(traits = fct_reorder(traits, values)) %>%
    ggplot(aes(fct_inorder(traits), values)) +
    geom_col(aes(fill = values), stat = "identity", color=alpha("black",.3)) +
    # facet_grid( vars(fct_inorder(traits)), vars(accession), scales = "free", space = "free") +
    # geom_hline(aes(yintercept = 0, alpha = 0.1, color="blue")) +
    geom_text(aes(label= round(values,2)), position = position_stack(vjust = 0.5), size = 7) +
    # geom_text(aes(label=round(values, 2)), vjust=0) +
    scale_fill_gradient2(low = "red", mid = "white", high = "darkgreen", midpoint= 0) +
    scale_y_continuous(limits = c(-60,60), labels = function(x) paste0(x, "%")) +
    # facet_wrap(~accession, ncol = 1, strip.position = "right", scales = "free") +
    labs(x = "Traits", y = "Percentage Difference", title =  acc_names[i]) +
    theme_bw(base_size=24)
barplot_checkdiff
  ggsave(barplot_checkdiff, filename = paste0("images/plots/barplots/",acc_names[i], ".jpg"), height = 5, width = 15)
  # dev.off()
}

list_of_plots <- list.files(path = "images/plots/barplots/")
list_of_plots

get_plot <- function(genotype){
  # list_gen <- c()
  plot <- ""
  for(i in 1:length(list_of_plots)){
    if(stringr::str_detect(list_of_plots[[i]], regex(genotype)) == TRUE){
      plot <- list_of_plots[i]
    }
  }
  return(plot)
}

genotypes <- get_genotypes()
i <- 1
cat("\n")
for(i in 1:length(genotypes)){
  j <- 1
  get_images(genotypes[[i]], "rep1")
  if(!length(get_images(genotypes[[i]], "rep1")) < 1 || !length(get_images(genotypes[[i]], "rep2")) < 1 || 
     !length(get_plot(genotypes[[i]])) < 1){
    rep1_images <- get_images(genotypes[[i]], "rep1")
    rep2_images <- get_images(genotypes[[i]], "rep2")
    cat("\n")
    cat("### ", genotypes[[i]])
    cat("\n")
    df <- table_chunk(genotypes[[i]])
    print(kable(df, align = "l", caption = ""))
    cat("<br> \n")
    plot_image <- get_plot(genotype = genotypes[[i]])
    plot.path <- paste0("images/plots/barplots/",plot_image)
    cat("![](",plot.path,") <br>")
    cat("<center>",genotypes[[i]], "Against check mean </center> <br> <br>")
    cat("\n")
    if(!length(get_images(genotypes[[i]], "rep1")) < 1) {
      for(j in 1:length(rep1_images)){
        cat("\n")
        plot
        image.path <- paste0("images/photos/",rep1_images[[1]])
        cat("![](",image.path,") <br>")
        cat("<center> REP 1 </center>")
      }
    }
    if(!length(get_images(genotypes[[i]], "rep2")) < 1){
      for(j in 1:length(rep2_images)){
        image.path2 <- paste0("images/photos/",rep2_images[[1]])
        cat("![](",image.path2,") <br>")
        cat("<center> REP 2 </center> <br> <br>")
        cat("\n")
      }
    }
  }
}

# 
# barplot_checkdiff <- uyt40_sindex_checkdiff %>%
#   filter(accession == y) %>% 
#   select(-c(rtwt)) %>%
#   select(accession,fyld,dyld,dm,shtwt,everything()) %>%
#   pivot_longer(-c(accession,rank,sindex), names_to = "traits", values_to = "values") %>%
#   
#   # group_by(traits) %>%
#   # top_frac(.1,sindex) %>%
#   #ungroup() %>%
#   
#   # mutate(traits = fct_reorder(traits, values)) %>%
#   ggplot(aes(fct_inorder(traits), values)) +
#   geom_col(aes(fill = values), stat = "identity", color=alpha("black",.3)) +
#   # facet_grid( vars(fct_inorder(traits)), vars(accession), scales = "free", space = "free") +
#   # geom_hline(aes(yintercept = 0, alpha = 0.1, color="blue")) +
#   geom_text(aes(label= round(values,2)), position = position_stack(vjust = 0.5)) +
#   # geom_text(aes(label=round(values, 2)), vjust=0) +
#   scale_fill_gradient2(low = "red", mid = "white", high = "darkgreen", midpoint= 0) +
#   scale_y_continuous(labels = function(x) paste0(x, "%")) +
#   # facet_wrap(~accession, ncol = 1, strip.position = "right", scales = "free") +
#   labs(x = "Traits", y = "Percentage Difference", title = y) +
#   theme_bw()
# 
# ggsave(barplot_checkdiff, filename = paste0(y, ".jpg"), height = 5, width = 15)
# 
# 
# barplot_checkdiff
# # theme(strip.text.x = element_text(size = 8))