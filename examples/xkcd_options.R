
# change colors
xkcd(x = 1:10, y = exp(1:10)) %>%
  xkcd_options(dataColors = "blue")

# more classic
xkcd(x = 1:10, y = exp(1:10)) %>%
  xkcd_options(unxkcdify = TRUE)


# Timeserie
dat <- data.frame(
  time = Sys.Date() + 1:10,
  value = exp(1:10)
)
xkcd(x = ~time, y = ~value, data = dat, type = "scatter") %>%
  xkcd_options(timeFormat = "YYYY-MM-DD", showLine = TRUE)


# Pie chart
dat <- data.frame(
  x = c("sketchy", "cartoony", "hand-drawn"),
  y = runif(3, 10, 90)
)
xkcd(x = ~x, y = ~y, data = dat, type = "pie") %>%
  xkcd_options(innerRadius = 0)

