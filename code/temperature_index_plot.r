library(tidyverse)


read_csv("data/GLB.Ts+dSST.csv", skip = 1, na = "***") %>%
    select(year = Year, t_diff = "J-D") %>%
    ggplot(aes(x = year, y = t_diff)) +
    geom_line(aes(color = "1"), size = 0.5, show.legend = FALSE) +
    geom_point(
        fill = "white",
        aes(color = "1"),
        shape = 21,
        show.legend = TRUE) +
    geom_smooth(
        se = FALSE,
        aes(color = "2"),
        size = 0.5, span = 0.10,
        show.legend = FALSE) +
    scale_x_continuous(breaks = seq(1880, 2023, 20), expand = c(0, 0)) +
    scale_y_continuous(limits = c(-0.5, 1.5), expand = c(0, 0)) +
    scale_color_manual(
        name = NULL,
        breaks = c(1, 2),
        values = c("gray", "black"),
        labels = c("Annual Mean", "Lowess Smoothing"),
        guide = guide_legend(override.aes = list(shape = 15, size = 5))
    ) +
    labs(
        x = "YEAR",
        y = "Temperature Anomoly (C)",
        title = "GOBAL LAND-OCEAN TEMPERATURE INDEX"
    ) +
    theme_light() +
    theme(
        axis.ticks = element_blank(),
        plot.title.position = "plot",
        plot.title = element_text(margin = margin(b = 15),
            color = "Blue", face = "bold"),
        legend.position = c(0.15, 0.9),
        legend.title = element_text(size = 0),
        legend.key.height = unit(10, "pt"),
        legend.margin = margin(0, 0, 0, 0)
    )

ggsave("figures/temperature_index_plot.png", width = 6, height = 4)
