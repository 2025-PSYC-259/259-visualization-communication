library(tidyverse)

ds <- tribble(
  ~issue, ~percent_critical, ~N,
  "Inflation", 27, 415,
  "Unemployment", 13, 100,
  "Shortages", 15, 68,
  "Race", 25, 103,
  "Crime", 30, 123, 
  "Govt. Power", 42, 154,
  "Confidence", 53, 266,
  "Watergate", 50, 537,
  "Competence", 30, 322
)

ds <- ds %>% arrange(percent_critical) %>% 
  mutate(labels = paste0(issue, " (N = ",N,")"),
         labels = as.factor(labels),
         labels = fct_reorder(labels, percent_critical, .desc = TRUE),
         )

ds %>% ggplot(aes(y = labels, x = percent_critical)) + geom_col() + 
  ylab("") + xlab("Percent Critical Articles") + xlim(0,60) + 
  theme(axis.ticks.y = element_blank()) +
  theme(text = element_text(size = 14),
        axis.text.x = element_text(size = 14), axis.title.x = element_text(size = 21),
        axis.text.y = element_text(size = 14, color = "black"), axis.title.y = element_text(size = 21),
        panel.background = element_blank(),panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "white"), 
        legend.key = element_rect(fill = "white"))

ds <- ds %>% arrange(percent_critical) %>% 
  mutate(labels = as.factor(issue),
         labels = fct_reorder(labels, percent_critical, .desc = TRUE),
  )

ds %>% ggplot(aes(y = labels, x = percent_critical, fill = N)) + geom_col() + 
  ylab("") + xlab("Percent Critical Articles") + xlim(0,60) + 
  scale_fill_binned(name = "N articles") +
  theme(axis.ticks.y = element_blank()) +
  theme(text = element_text(size = 14),
        axis.text.x = element_text(size = 14), axis.title.x = element_text(size = 21),
        axis.text.y = element_text(size = 14, color = "black"), axis.title.y = element_text(size = 21),
        panel.background = element_blank(),panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "white"), 
        legend.key = element_rect(fill = "white"),
        legend.position = "bottom", legend.key.width = unit(2, "cm"))
