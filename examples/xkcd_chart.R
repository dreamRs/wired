# Basic usage

xkcd_chart(
  config = list(
    title = "Sine & Cosine",
    data = list(
      labels = as.character(seq_len(10)),
      datasets = list(
        list(
          label = "Sine",
          data = sin(seq_len(10))
        ),
        list(
          label = "Cosine",
          data = cos(seq_len(10))
        )
      )
    ),
    options = list(
      dataColors = c("red", "blue")
    )
  ),
  type = "line"
)

