# 패키지 불러오기
library(ggplot2)
library(dplyr)
library(showtext)
library(plotly)

# 한글 폰트 자동 적용
showtext_auto()

library(plotly)

fig <- plot_geo(lat = c(37.49, 35.5533), lon = c(126.55, 139.7811))
fig <- fig %>% add_lines(color = I("blue"), size = I(2))
fig <- fig %>% layout(
  title = 'PyongYang to Tokyo',
  showlegend = FALSE,
  geo = list(
    resolution = 50,
    showland = TRUE,
    showlakes = TRUE,
    landcolor = toRGB("grey80"),
    countrycolor = toRGB("grey80"),
    lakecolor = toRGB("skyblue"),
    projection = list(type = "equirectangular"),
    coastlinewidth = 1,
    center = list(lat = 36.5, lon = 130),
    lataxis = list(
      range = c(20, 60),
      showgrid = TRUE,
      tickmode = "linear",
      dtick = 10
    ),
    lonaxis = list(
      range = c(110, 160),
      showgrid = TRUE,
      tickmode = "linear",
      dtick = 20
    )
  )
)

fig