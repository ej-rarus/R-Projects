# 필요한 패키지 설치 (최초 1회만 실행)
# install.packages("ggplot2")    # 데이터 시각화
# install.packages("dplyr")      # 데이터 처리
# install.packages("showtext")   # 한글 폰트
# install.packages("plotly")     # 인터랙티브 그래프

# 패키지 불러오기
library(ggplot2)
library(dplyr)
library(showtext)
library(plotly)

# 한글 폰트 자동 적용
showtext_auto()

# 자동차 이름을 rowname에서 컬럼으로 옮기기
mtcars$car <- rownames(mtcars)

# 데이터 확인
print("기본 데이터셋: mtcars")
print(head(mtcars))

# ------------------------------------------------
# 🌟 예제 1: 마력(hp)과 연비(mpg)의 관계 - 산점도
# ------------------------------------------------

p1 <- ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "#4a90e2", size = 3) +
  labs(
    title = "마력과 연비의 관계",
    x = "마력(hp)",
    y = "연비(mpg)"
  )
print(p1)

# ------------------------------------------------
# 🌟 예제 2: 기어 수(gear)별 평균 연비 - 막대그래프
# ------------------------------------------------

gear_summary <- mtcars %>%
  group_by(gear) %>%
  summarise(mean_mpg = mean(mpg))

p2 <- ggplot(gear_summary, aes(x = factor(gear), y = mean_mpg)) +
  geom_col(fill = "coral") +
  labs(
    title = "기어별 평균 연비",
    x = "기어 수",
    y = "평균 연비"
  )
print(p2)

# ------------------------------------------------
# 🌟 예제 3: 실린더 수(cyl)별 연비 분포 - 박스플롯
# ------------------------------------------------

p3 <- ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "실린더 수에 따른 연비 분포",
    x = "실린더 수",
    y = "연비"
  )
print(p3)

# ------------------------------------------------
# 🌟 예제 4: 기어와 실린더 수에 따른 자동차 분포 (산포도)
# ------------------------------------------------

p4 <- ggplot(mtcars, aes(x = factor(gear), y = factor(cyl))) +
  geom_jitter(width = 0.2, height = 0.2, size = 4, color = "#4a90e2") +
  labs(
    title = "기어와 실린더 수 조합에 따른 자동차 분포",
    x = "기어 수",
    y = "실린더 수"
  )
print(p4)

# ------------------------------------------------
# 🌟 예제 5: 마우스 오버 인터랙티브 시각화 (plotly)
# ------------------------------------------------

# 인터랙티브를 위한 설명 텍스트 붙이기
p5_plotly <- ggplot(mtcars, aes(x = factor(gear), y = factor(cyl),
                                text = paste("차명:", car,
                                             "<br>기어:", gear,
                                             "<br>실린더:", cyl))) +
  geom_jitter(width = 0.2, height = 0.2, size = 4, color = "#4a90e2") +
  labs(
    title = "기어/실린더 조합에 따른 자동차 분포 (마우스 오버)",
    x = "기어 수",
    y = "실린더 수"
  ) +
  theme_minimal()

interactive_plot <- ggplotly(p5_plotly, tooltip = "text")
interactive_plot  # Viewer에 표시되게 출력
