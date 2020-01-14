heatclick <- function(data_set,image) {
  p = ggplot(data_set, aes(x = ppx,  y = ppy)) + 
    annotation_custom(rasterGrob(image, width = unit(1,"npc"), 
                                 height = unit(1,"npc")), -Inf, Inf, -Inf, Inf) +
    stat_density2d(aes(x = ppx, y = ppy, 
                       fill = ..level.., alpha = ..level..), size= 10, bins= 50, geom='polygon') + 
    scale_fill_gradient(low = "blue", high = "red") + 
    scale_alpha_continuous(range=c(0.1,0.2)) +
    theme_minimal() +
    ylim(-350, 350) +
    xlim(-350, 350) +
    theme(text = element_text(size = 10)) + theme(legend.position="none") +
    labs(x = 'x_coord', y = 'y_coord') + geom_point(aes(x= start_x, y= start_y)) + theme(legend.position="none")
  print(p)
  return(p)
}