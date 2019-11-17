
# With vectors
xkcd(x = 1:10, y = exp(1:10))

# With a data.frame and formulas
dat <- data.frame(
  x = c(1:10, 1:10),
  y = c(exp(1:10), (1:10)^4),
  group = rep(c("exp", "power4"), each = 10)
)

xkcd(x = ~x, y = ~y, group = ~group, data = dat)



# Scatter plot
xkcd(
  x = ~Sepal.Length,
  y = ~Sepal.Width,
  data = iris,
  type = "scatter"
)

xkcd(
  x = ~Sepal.Length,
  y = ~Sepal.Width,
  group = ~Species,
  data = iris,
  type = "scatter"
)


# Bar chart
dat <- data.frame(
  x = c("sketchy", "cartoony", "hand-drawn"),
  y = runif(3, 10, 90)
)
xkcd(x = ~x, y = ~y, data = dat, type = "bar")


# Pie chart
xkcd(x = ~x, y = ~y, data = dat, type = "pie")


# Radar chart
dat <- data.frame(
  x = rep(c("c", "h", "a", "r", "t"), times = 2),
  y = runif(10, 10, 90),
  group = rep(c("A", "B"), each = 5)
)
xkcd(x = ~x, y = ~y, group = ~group, data = dat, type = "radar")






