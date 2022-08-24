

acc_names <- uyt40_sindex_checkdiff$accession
for(i in 1:length(acc_names)){
  barplot_checkdiff <- uyt40_sindex_checkdiff %>%
    filter(accession == acc_names[i]) %>% 
    select(-c(rtwt)) %>%
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
    geom_text(aes(label= round(values,2)), position = position_stack(vjust = 0.5)) +
    # geom_text(aes(label=round(values, 2)), vjust=0) +
    scale_fill_gradient2(low = "red", mid = "white", high = "darkgreen", midpoint= 0) +
    scale_y_continuous(labels = function(x) paste0(x, "%")) +
    # facet_wrap(~accession, ncol = 1, strip.position = "right", scales = "free") +
    labs(x = "Traits", y = "Percentage Difference", title = paste0("<b>",y,"</b>")) +
    theme_bw()

  ggsave(barplot_checkdiff, filename = paste0("images/plots/barplots/",acc_names[i], ".jpg"), height = 5, width = 15)
  # dev.off()
}

barplot_checkdiff <- uyt40_sindex_checkdiff %>%
  filter(accession == y) %>% 
  select(-c(rtwt)) %>%
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
  geom_text(aes(label= round(values,2)), position = position_stack(vjust = 0.5)) +
  # geom_text(aes(label=round(values, 2)), vjust=0) +
  scale_fill_gradient2(low = "red", mid = "white", high = "darkgreen", midpoint= 0) +
  scale_y_continuous(labels = function(x) paste0(x, "%")) +
  # facet_wrap(~accession, ncol = 1, strip.position = "right", scales = "free") +
  labs(x = "Traits", y = "Percentage Difference", title = y) +
  theme_bw()

ggsave(barplot_checkdiff, filename = paste0(y, ".jpg"), height = 5, width = 15)


barplot_checkdiff
# theme(strip.text.x = element_text(size = 8))