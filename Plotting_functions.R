library(data.table)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(ggpubr)

atl <- fread("atenolol_icr.csv")

test<-subset(atl, name=='ATL-1')

continuous_scale_plot <- function(data, x, y,color) {
  p <- ggplot(data = {{data}}, aes({{x}}, {{y}}, color={{color}}))+
    geom_point(size=0.4)+ 
    scale_color_viridis_c()+ #for continous values
    #scale_color_viridis_d()+ # for discrete values
    theme(legend.position="bottom", 
          legend.spacing.x = unit(0.5, 'cm'),
          text = element_text(size=18),
          plot.margin=unit(c(1,0.5,0.5,0.5),"cm"),
          legend.title = element_blank(),
          strip.background = element_blank(),
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
          axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0)))+
    scale_x_continuous(breaks = seq(0, 1, 0.2))+
    guides(colour = guide_legend(override.aes = list(size=5)))+
    labs(x="O/C", y="H/C")
  print(p)
}

discrete_scale_plot <- function(data, x, y,color) {
  ggplot(data = {{data}}, aes({{x}}, {{y}}, color={{color}}))+
    geom_point(size=0.4)+ 
    #scale_color_viridis_c()+ #for continous values
    scale_color_viridis_d()+ # for discrete values
    theme(legend.position="bottom", 
          legend.spacing.x = unit(0.5, 'cm'),
          text = element_text(size=18),
          plot.margin=unit(c(1,0.5,0.5,0.5),"cm"),
          legend.title = element_blank(),
          strip.background = element_blank(),
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
          axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0)))+
    scale_x_continuous(breaks = seq(0, 1, 0.2))+
    guides(colour = guide_legend(override.aes = list(size=5)))+
    labs(x="O/C", y="H/C")
}

saturation_plot <- function(data, x, y) {
  ggplot(data = {{data}}, aes({{x}}, {{y}}))+
  geom_point(size=0.4)+
  stat_bin2d( alpha=0.8, bins = 20)+
  scale_fill_continuous(type = "viridis")+
  theme(legend.position="bottom", 
        legend.spacing.x = unit(1, 'cm'),
        text = element_text(size=18),
        plot.margin=unit(c(0.5,0.5,0,0.5),"cm"),
        legend.title = element_blank(),
        strip.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)),
        axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0)))+
  scale_x_continuous(breaks = seq(0, 1, 0.2))+
  guides(colour = guide_legend(override.aes = list(size=5)))+
  labs(x="O/C", y="H/C")
  }

continuous_scale_plot(test, oc, hc, m)#+facet_grid(.~name)
discrete_scale_plot(test, oc, hc, ai_mod_category)#+facet_grid(.~name)
saturation_plot(test, oc, hc)#+facet_grid(.~name)
