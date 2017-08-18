###Chapter 3 Themes

###Rectangles
# z in is Data Camp's Workspace
# Plot 1: change the plot background color to myPink:
z + 
  theme(plot.background = element_rect(fill = myPink))

# Plot 2: adjust the border to be a black line of size 3
z + 
  theme(plot.background = element_rect(fill = myPink, color = "black", size = 3))

# Plot 3: set panel.background, legend.key, legend.background and strip.background to element_blank()
uniform_panels <- theme(panel.background = element_blank(), 
                        legend.key = element_blank(), 
                        legend.background=element_blank(), 
                        strip.background = element_blank())
z + 
  theme(plot.background = element_rect(fill = myPink, color = "black", size = 3)) +
  uniform_panels

###Lines
# Extend z with theme() function and three arguments
z + 
  theme(panel.grid = element_blank(),
        axis.line = element_line(color = "black"),
        axis.ticks = element_line(color = "black"))

###Text
# Extend z with theme() function and four arguments
z +
  theme(strip.text = element_text(size = 16, color = myRed),
        axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
        axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
        axis.text = element_text(color = "black"))

###Legends
# Move legend by position
z +
  theme(legend.position = c(0.85, 0.85))

# Change direction
z +
  theme(legend.direction = "horizontal")

# Change location by name
z +
  theme(legend.position = "bottom")

# Remove legend entirely
z +
  theme(legend.position = "none")

###Positions
# Increase spacing between facets
library(grid)
z + theme(panel.spacing.x = unit(2, "cm"))

# Add code to remove any excess plot margin space
z + theme(panel.spacing.x = unit(2, "cm"),
          plot.margin = unit(c(0,0,0,0), "cm"))

###Update Themestheme Update
# Theme layer saved as an object, theme_pink
theme_pink <- theme(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "black"),
                    axis.ticks = element_line(color = "black"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")

# Apply theme_pink to z2
# z2 in Data Camp's workspace
z2 + theme_pink

# Change code so that old theme is saved as old
old <- theme_update(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "black"),
                    axis.ticks = element_line(color = "black"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")

# Display the plot z2
z2

# Restore the old plot
theme_set(old)

###Exploring ggthemes
# Load ggthemes package
library(ggthemes)

# Apply theme_tufte
# Set the theme with theme_set
theme_set(theme_tufte())
z2 + 
  # Or apply it in the ggplot command
  theme_tufte()

# Apply theme_tufte, modified
# Set the theme with theme_set
theme_set(theme_tufte() + 
            theme(legend.position = c(0.9, 0.9),
                  legend.title = element_text(face = "italic", size = 12),
                  axis.title = element_text(face = "bold", size = 14)))
z2 + 
  # Or apply it in the ggplot command
  theme_tufte() +
  theme(legend.position = c(0.9, 0.9),
        legend.title = element_text(face = "italic", size = 12),
        axis.title = element_text(face = "bold", size = 14))

