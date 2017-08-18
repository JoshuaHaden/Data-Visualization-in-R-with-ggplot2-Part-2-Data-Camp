###Chapter 2 Coordinates and Facets

# Basic ggplot() command, coded for you
p <- ggplot(mtcars, aes(x = wt, y = hp, col = am)) + geom_point() + geom_smooth()

# Add scale_x_continuous
p + 
  scale_x_continuous(limits = c(3, 6), expand = c(0, 0))

# Add coord_cartesion: the proper way to zoom in:
p +
  coord_cartesian(xlim = c(3, 6))

###Aspect Ratio
# Complete basic scatter plot function
base.plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_jitter() +
  geom_smooth(method = "lm", se = F)

# Plot base.plot: default aspect ratio
base.plot

# Fix aspect ratio (1:1) of base.plot
base.plot + coord_equal()
# or
base.plot + coord_fixed()

###Pie Charts
# Create stacked bar plot: thin.bar
thin.bar <- ggplot(mtcars, aes(x = 1, fill = cyl)) +
  geom_bar()

# Convert thin.bar to pie chart
thin.bar +
  coord_polar(theta = "y")

# Create stacked bar plot: wide.bar
wide.bar <- ggplot(mtcars, aes(x = 1, fill = cyl)) +
  geom_bar(width = 1)

# Convert wide.bar to pie chart
wide.bar +
  coord_polar(theta = "y")

###Facets: The Basics
# Basic scatter plot:
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Separate rows according to transmission type, am
p +
  facet_grid(am ~ .)

# Separate columns according to cylinders, cyl
p +
  facet_grid(. ~ cyl)

# Separate by both columns and rows 
p +
  facet_grid(am ~ cyl)

###Many Variables
# Code to create the cyl_am col and myCol vector
mtcars$cyl_am <- paste(mtcars$cyl, mtcars$am, sep = "_")
myCol <- rbind(brewer.pal(9, "Blues")[c(3,6,8)],
               brewer.pal(9, "Reds")[c(3,6,8)])

# Basic scatter plot, add color scale:
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am)) +
  geom_point() +
  scale_color_manual(values = myCol)

# Facet according on rows and columns.
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am)) +
  geom_point() +
  scale_color_manual(values = myCol) +
  facet_grid(gear ~ vs)

# Add more variables
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am, size = disp)) +
  geom_point() +
  scale_color_manual(values = myCol) +
  facet_grid(gear ~ vs)

###Dropping Levels
# Basic scatter plot
# mamsleep in Data Camp's workspace
# See Ch2 Mamsleep Plot 1
ggplot(mamsleep, aes(x = time, y = name, col = sleep)) +
  geom_point()

# Facet rows accoding to vore
# See Ch2 Mamsleep Plot 2
ggplot(mamsleep, aes(x = time, y = name, col = sleep)) +
  geom_point() +
  facet_grid(vore ~ .)

# Specify scale and space arguments to free up rows
# See Ch2 Mamsleep Plot 3
ggplot(mamsleep, aes(x = time, y = name, col = sleep)) +
  geom_point() +
  facet_grid(vore ~ ., scale = "free_y", space = "free_y")

