library(palmerpenguins)
library(ggplot2)

# Make a scatterplot
ggplot(penguins) + 
  aes(x=bill_length_mm, 
      y=bill_depth_mm, 
      color = species) + 
  geom_point() +
  xlab("Bill Length (mm)") +
  ylab("Bill Depth (mm)") +
  ggtitle("Penguins Bill Dimensions") +
  theme_dark()

# See code examples at http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

# Look at flipper_length_mm
# for Palmer Penguins
# Histogram with density curve
# Use y=..density..
# Overlay with transparent density plot
ggplot(penguins, 
       aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2,
                 colour="black", 
                 fill="white") +
  geom_density(alpha=.2, 
               fill="#FF6666") +
  facet_wrap(vars(species))

library(patchwork)

# save each plot as an object
p1 <- ggplot(penguins, 
             aes(x=bill_length_mm, 
                 y=bill_depth_mm, 
                 color = species)) +
  geom_point()  

p2 <- ggplot(penguins, 
             aes(x=species, 
                 y=bill_length_mm)) + 
  geom_boxplot() + 
  xlab("Species") +   
  ylab("Bill Depth (mm)")

p3 <- 
  ggplot(penguins, 
         aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2, colour="black", 
                 fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  facet_wrap(vars(species))

# arrange plots as you like
(p1 | p2) / p3

