getwd()

list_of_images <- list.files(path = "images", pattern = ".jpg")

selected_value <- "IMG_20220524_181152.jpg"
View(data.frame(list_of_images))

 for(i in list_of_images){
  if(i == selected_value){
    print("Found the selected value")
  }
 }


## install.packages("plotly")
## install.packages("ggplot2")

install.packages("ggplotly")


library(plotly)
library(ggplot2)
install.packages("funmodelling")


crays
p <- plot(crays, aes(x = Size.mm, y = Weight.g, colour = Sex)) + geom_point() + theme_bw() + 
  scale_colour_brewer(palette = "Dark2") + xlab("Length(mm)") + ylab("Weight (g)")

ggplotly(p)
mtcars
crayfish
