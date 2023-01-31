png(file="scatterplot_matrices.png")
attach(mtcars)
pairs(~wt+mpg+disp+cyl,data=mtcars,main="Scatter plot Matrix")
dev.off()

