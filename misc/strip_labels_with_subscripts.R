# Code example for using subscripts in strip labels (data can not provided due to legal contraints)
# TODO
  # clean up variable names
  # provide minimal working example

library(tidyverse)
library(scales)

test_plot <- fb_daten %>%
  filter(vorzeitig_beendet == "0") %>%
  mutate(zeitpunkt = fct_recode(as.factor(zeitpunkt),
                                `1` = "2",
                                `2` = "3",
                                `3` = "4",
                                `4` = "5")) %>%
  count(zeitpunkt, uhr_wie_hauef) %>%
  group_by(zeitpunkt) %>%
  mutate(rel = n / sum(n),
         mis_val = ifelse(is.na(uhr_wie_hauef), TRUE, FALSE)) %>%
  ggplot(aes(
    x = as.factor(x = uhr_wie_hauef),
    y = rel,
    fill = mis_val
  )) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = (rel * 100) %>% round(1) %>% paste0("%")), hjust = -0.1, size = 8,
            family = "serif") +
  # using labeller argument and label_bqoute() to create subscripts
  facet_grid(. ~ zeitpunkt, labeller = label_bquote(cols = T[.(zeitpunkt)])) +
  scale_x_discrete(
    labels = c(
      "Never",
      "Tried once",
      "One to three times per month",
      "One to three times per week",
      "Almost everyday",
      "Not specified / missing"
    )
  ) +
  scale_fill_manual(values = c("#454545", "#dbdbdb")) +
  scale_y_continuous(labels = percent_format(accuracy = 1),
                     breaks = c(0, 0.2, 0.4)) +
  labs(y = "\nRelative frequency") +
  coord_flip() +
  theme(axis.title.y = element_blank(),
        legend.position = "none",
        text = element_text(size = 30),
        axis.text.x = element_text(size = 28, color = "black"),
        axis.text.y = element_text(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        strip.background = element_blank(),
        panel.border = element_rect(colour = "black")) +
  expand_limits(y = c(0, 0.58))
