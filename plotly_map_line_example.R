library(plotly)
library(showtext)
showtext_auto()

# 📍 평양 → 중간 고도 점 → 도쿄
lat <- c(39.03, 42.0, 35.69)          # 평양 위도, 중간, 도쿄
lon <- c(125.75, 132.0, 139.78)       # 평양 경도, 중간, 도쿄

fig <- plot_geo()

fig <- fig %>%
  add_trace(
    type = "scattergeo",
    mode = "lines",
    lat = lat,
    lon = lon,
    line = list(width = 3, color = "red", dash = "solid"),
    name = "탄도미사일 궤적"
  ) %>%
  add_trace(
    name = "Projectile_1",
    type = "scattergeo",
    mode = "markers+text",
    lat = c(39.03, 35.69),
    lon = c(125.75, 139.78),
    text = c("평양", "도쿄"),
    textposition = "top center",
    marker = list(size = 6, color = "black")
  ) %>%
  layout(
    title = "🌏 평양 → 도쿄 핵미사일 탄도 궤적",
    geo = list(
      projection = list(type = "orthographic"),  # 구형 지구 느낌
      showland = TRUE,
      landcolor = toRGB("gray95"),
      showocean = TRUE,
      oceancolor = toRGB("skyblue"),
      showcountries = TRUE,
      countrycolor = toRGB("gray70"),
      coastlinecolor = toRGB("gray60"),
      center = list(lat = 37, lon = 133),
      lataxis = list(range = c(25, 50)),
      lonaxis = list(range = c(120, 145))
    )
  )

fig
