library(tidyverse)
install.packages(c("nycflights13", "gapminder", "Lahman"))

mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)

nrow(mpg)   #234
ncol(mpg)   #11
names(mpg)

# 4 Make a scatterplot of hwy vs cyl.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))

# 5 What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
#> Warning: Using size for a discrete variable is not advised.

# Left
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = year))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = year, size = cty))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = year, size = year))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = model, size = model, shape = model))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = year, stroke = cty))

head(mpg)

glimpse(mpg)
#> Rows: 234
#> Columns: 11
#> $ manufacturer <chr> "audi", "audi", "audi", "audi", "audi", "audi", "audi", …
#> $ model        <chr> "a4", "a4", "a4", "a4", "a4", "a4", "a4", "a4 quattro", …
#> $ displ        <dbl> 1.8, 1.8, 2.0, 2.0, 2.8, 2.8, 3.1, 1.8, 1.8, 2.0, 2.0, 2…
#> $ year         <int> 1999, 1999, 2008, 2008, 1999, 1999, 2008, 1999, 1999, 20…
#> $ cyl          <int> 4, 4, 4, 4, 6, 6, 6, 4, 4, 4, 4, 6, 6, 6, 6, 6, 6, 8, 8,…
#> $ trans        <chr> "auto(l5)", "manual(m5)", "manual(m6)", "auto(av)", "aut…
#> $ drv          <chr> "f", "f", "f", "f", "f", "f", "f", "4", "4", "4", "4", "…
#> $ cty          <int> 18, 21, 20, 21, 16, 18, 18, 18, 16, 20, 19, 15, 17, 17, …
#> $ hwy          <int> 29, 29, 31, 30, 26, 26, 27, 26, 25, 28, 27, 25, 25, 25, …
#> $ fl           <chr> "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "p", "…
#> $ class        <chr> "compact", "compact", "compact", "compact", "compact", "…

count(mpg, drv, class)
#> # A tibble: 12 x 3
#>   drv   class          n
#>   <chr> <chr>      <int>
#> 1 4     compact       12
#> 2 4     midsize        3
#> 3 4     pickup        33
#> 4 4     subcompact     4
#> 5 4     suv           51
#> 6 f     compact       35
#> # … with 6 more rows

ggplot(mpg, aes(x = class, y = drv)) +
  geom_count()

mpg %>%
  count(class, drv) %>%
  ggplot(aes(x = class, y = drv)) +
  geom_tile(mapping = aes(fill = n))

mpg %>%
  count(class, drv) %>%
  complete(class, drv, fill = list(n = 0)) %>%
  ggplot(aes(x = class, y = drv)) +
  geom_tile(mapping = aes(fill = n))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

my_data = mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cty)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv ~ cyl)


##############################
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

##############################
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

#############################
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class,  ncol = 2)
#############################
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(~ class)
#############################
# left
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#############################
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
#############################
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
#############################
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
#############################
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )
#############################
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
############ same as above #################
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()
############################
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()
############################
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()
############################
# 3.6.1.
### 1. geom_line, geom_boxplot(), geom_histogram(), geom_area()
### 2.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
geom_point() +
  geom_smooth(se = FALSE)
### 3. this parameter shows legend
### 4. se - is displaying confidence intervals around the line graph
### 5. will look the same
### 6.1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se=FALSE)

### 6.2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se=FALSE, mapping = aes(group = drv))

### 6.3
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(se=FALSE, mapping = aes(group = drv))

### 6.4
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(se=FALSE)

### 6.5
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(se=FALSE, mapping = aes(linetype = drv))

### 6.6
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(mapping = aes(color = drv))
  #geom_smooth(se=FALSE, mapping = aes(linetype = drv))


############## 3.7. Statistical transformations ###########################
my_diamonds = diamonds

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))


demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

# 3.7.1
### 1. Use to override the default connection between geom_histogram()/geom_freqpoly() and stat_bin()
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary"
  )

ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.min = min,
    fun.max = max,
    fun = median
  )
### 5.
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))


ggplot(data = diamonds) +
  geom_bar(aes(x = cut, y = ..count.. / sum(..count..), fill = color))

##### 3.8
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, colour = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) +
  geom_bar(fill = NA, position = "identity")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

# 3.8.1 What is the problem with this plot? How could you improve it?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = "jitter")

# 3.8.2 What parameters to geom_jitter() control the amount of jittering?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = position_jitter())

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter(width = 0)

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter(width = 20)

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter(height = 0)

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter(height = 15)


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter(height = 0, width = 0)

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter()

# 3.8.4
ggplot(data = mpg, aes(x = drv, y = hwy, colour = class)) +
  geom_boxplot()

ggplot(data = mpg, aes(x = drv, y = hwy, colour = class)) +
  geom_boxplot(position = "identity")

#############################
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()


bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

# 3.9.1 Turn a stacked bar chart into a pie chart using coord_polar().
task1 <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, colour = cut))

task1 + coord_polar()

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar()


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline() +
  coord_fixed()

p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
p + coord_fixed(ratio = 1)
p + coord_fixed(ratio = 5)
p + coord_fixed(ratio = 1/5)
p + coord_fixed(xlim = c(15, 30))

if (require("maps")) {
  nz <- map_data("nz")
  # Prepare a map of NZ
  nzmap <- ggplot(nz, aes(x = long, y = lat, group = group)) +
    geom_polygon(fill = "white", colour = "black")

  # Plot it in cartesian coordinates
  nzmap
}

if (require("maps")) {
  nzmap + coord_map()
}

if (require("maps")) {
  # With the aspect ratio approximation
  nzmap + coord_quickmap()
}


########## chapter 4 #################
my_variable <- 10
my_variable
#> Error in eval(expr, envir, enclos): object 'my_varıable' not found


library(tidyverse)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)

############ chapter 5 ###########################
library(nycflights13)
library(tidyverse)

filter(flights, month == 1, day == 1)
jan1 <- filter(flights, month == 1, day == 1)

filter(flights, month == 11 | month == 12)

nov_dec <- filter(flights, month %in% c(11, 12))

##### both are the same #####
filter(flights, !(arr_delay > 120 | dep_delay > 120))

filter(flights, arr_delay <= 120, dep_delay <= 120)
############################
# 5.2.4.1 Find all flights that
# 1. Had an arrival delay of two or more hours
arr2hrslate = filter(flights, arr_delay > 120)
# 5.2.4.1 Find all flights that
# 2. Flew to Houston (IAH or HOU)
flightIAH_HOU <- filter(flights, dest == 'IAH' | dest == 'HOU')
# 5.2.4.1 Find all flights that
# 3. Were operated by United, American, or Delta
airlines <- filter(flights, carrier %in% c("UA", "AA", "DL"))
# 5.2.4.1 Find all flights that
# 4. Departed in summer (July, August, and September)
summer <- filter(flights, month %in% c(7,8,9))
# 5.2.4.1 Find all flights that
# 5. Arrived more than two hours late, but didn’t leave late
arr_late_dep_onTime <- filter(flights, dep_delay == 0 & arr_delay > 120)
# 5.2.4.1 Find all flights that
# 6. Were delayed by at least an hour, but made up over 30 minutes in flight
delay_madeup <- filter(flights, dep_delay > 60 & (dep_delay - arr_delay > 30))
# 5.2.4.1 Find all flights that
# 7. Departed between midnight and 6am (inclusive)
dep_00_6am <- filter(flights, !between(dep_time, 600, 2400))          ### it doesn't include border values due to NOT operator
dep_00_6am2 <- filter(flights, dep_time <= 600 | dep_time == 2400)    ###
dep_00_6am3 <- filter(flights, dep_time %% 2400 <= 600)
## 5.2.4.2 - Ok
missing <- filter(flights, is.na(dep_time))
summary(flights$dep_time)

##############  5.3  ######################
arrange(flights, year, month, day)

arrange(flights, desc(dep_delay))

df <- tibble(x = c(5, 2, NA))
arrange(df, x)

arrange(df, desc(x))

### 5.3.1. #########
#1. How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
arrange(flights, dep_time) %>%
  tail()

arrange(flights, desc(dep_time))

arrange(flights, desc(is.na(dep_time)), dep_time)

#2.Sort flights to find the most delayed flights. Find the flights that left earliest.
delayed_sorted <- arrange(flights, desc(dep_delay))
delayed_sorted
earliest_sorted <- arrange(flights, dep_delay)
earliest_sorted

#3. Sort flights to find the fastest (highest speed) flights.
speed <- flights$distance / flights$air_time
fastest <- arrange(flights, desc(distance / air_time))
fastest2 <- arrange(flights, desc(speed))

#4. Which flights travelled the farthest? Which travelled the shortest?
farthest <- arrange(flights, desc(distance))
shortest <- arrange(flights, distance)

########## 5.4. ######################
# Select columns by name
select(flights, year, month, day)
# Select all columns between year and day (inclusive)
select(flights, year:day)
# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

rename(flights, tail_num = tailnum)

select(flights, time_hour, air_time, everything())

### 5.4.1 Exercises
#1. Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.
#a)
select(flights, dep_time, dep_delay, arr_time, arr_delay)

#b)
select(flights, "dep_time", "dep_delay", "arr_time", "arr_delay")

#c)
select(flights, 4, 6, 7, 9)

#d)
select(flights, all_of(c("dep_time", "dep_delay", "arr_time", "arr_delay")))
select(flights, any_of(c("dep_time", "dep_delay", "arr_time", "arr_delay")))
# This is useful because the names of the variables can be stored in a variable and passed to
variables <- c("dep_time", "dep_delay", "arr_time", "arr_delay")
select(flights, all_of(variables))

# e)
select(flights, starts_with("dep_"), starts_with("arr_"))

#f)
select(flights, matches("^(dep|arr)_(time|delay)$"))

#g)
variables <- c("dep_time", "dep_delay", "arr_time", "arr_delay")
select(flights, !!variables)

#h)
variables <- c("dep_time", "dep_delay", "arr_time", "arr_delay")
select(flights, !!!variables)

#i)
variables <- syms(c("dep_time", "dep_delay", "arr_time", "arr_delay"))
select(flights, !!!variables)

#2. What happens if you include the name of a variable multiple times in a select() call?
select(flights, dep_time, dep_time, dep_delay, arr_time, arr_delay)

#3. What does the any_of() function do? Why might it be helpful in conjunction with this vector?
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))

flights2 <- mutate(flights, vars = 1)
select(flights2, vars)

#4. Does the result of running the following code surprise you? How do the select helpers deal with case by default? How can you change that default?
select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case = FALSE))

############# 5.5 Add new variables with mutate() ##################
flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time
)
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)
####
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)
####
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)
#####
transmute(flights,
          dep_time,
          hour = dep_time %/% 100,
          minute = dep_time %% 100
)

########
(x <- 1:10)
#>  [1]  1  2  3  4  5  6  7  8  9 10
lag(x)
#>  [1] NA  1  2  3  4  5  6  7  8  9
lead(x)
#>  [1]  2  3  4  5  6  7  8  9 10 NA

########
x
#>  [1]  1  2  3  4  5  6  7  8  9 10
cumsum(x)
#>  [1]  1  3  6 10 15 21 28 36 45 55
cummean(x)
#>  [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5
########
y <- c(1, 2, 2, NA, 3, 4)
min_rank(y)
#> [1]  1  2  2 NA  4  5
min_rank(desc(y))
#> [1]  5  3  3 NA  2  1


### 5.5.2 Exercises #################
# 1. Currently dep_time and sched_dep_time are convenient to look at, but hard to compute with because they’re not really continuous numbers. Convert them to a more convenient representation of number of minutes since midnight.
flights_times <- mutate(
  flights,
  dep_time_mins = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
  sched_dep_time_mins = (sched_dep_time %/% 100 * 60 +
                           sched_dep_time %% 100) %% 1440
)

# view only relevant columns
select(flights_times,
       dep_time,
       dep_time_mins,
       sched_dep_time,
       sched_dep_time_mins)

# 2. Compare air_time with arr_time - dep_time. What do you expect to see? What do you see? What do you need to do to fix it?
calc_air_time <- mutate(flights,
          dep_time_mins = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
          arr_time_mins = (arr_time %/% 100 * 60 + arr_time %% 100) %% 1440,
          air_time_calc = arr_time_mins - dep_time_mins,
          diff = air_time - air_time_calc
            )

select(calc_air_time,
       dep_time,
       dep_time_mins,
       arr_time_mins,
       arr_time,
       air_time_calc,
       diff
       )

# 3. Compare dep_time, sched_dep_time, and dep_delay. How would you expect those three numbers to be related?

flights_deptime <-
  mutate(
    flights,
    dep_time_min = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
    sched_dep_time_min = (sched_dep_time %/% 100 * 60 +
                            sched_dep_time %% 100) %% 1440,
    dep_delay_diff = dep_delay - dep_time_min + sched_dep_time_min
  )

overnight_delay <- filter(flights_deptime, dep_delay_diff != 0)

ggplot(
  filter(flights_deptime, dep_delay_diff > 0),
  aes(y = sched_dep_time_min, x = dep_delay_diff)
) +
  geom_point()

# 4. Find the 10 most delayed flights using a ranking function. How do you want to handle ties? Carefully read the documentation for min_rank().

delayed <- select(arrange(flights, desc(dep_delay)), dep_delay)

ranked <- min_rank(delayed)
row_number(delayed)

rankme <- tibble(x = c(10, 5, 1, 5, 5))

rankme <- mutate(
  rankme,
  x_row_number = row_number(x),
  x_min_rank = min_rank(x),
  x_dense_rank = dense_rank(x)
)
rankme <- arrange(rankme, x)

# all 3 are equally the same since first 10 flights have no ties
flights_delayed <- mutate(
  flights,
  dep_delay_min_rank = min_rank(desc(dep_delay)),
  dep_delay_row_number = row_number(desc(dep_delay)),
  dep_delay_dense_rank = dense_rank(desc(dep_delay))
)

flights_delayed <- filter(
  flights_delayed,!(
    dep_delay_min_rank > 10 | dep_delay_row_number > 10 |
      dep_delay_dense_rank > 10
  )
)

flights_delayed <- arrange(flights_delayed, dep_delay_min_rank)
print(
  select(
    flights_delayed,
    month,
    day,
    carrier,
    flight,
    dep_delay,
    dep_delay_min_rank,
    dep_delay_row_number,
    dep_delay_dense_rank
  ),
  n = Inf
)

# 5. What does 1:3 + 1:10 return? Why?
1:3 + 1:10

########### 5.6 Grouped summaries with summarise() ###############
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

####
by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
#> `summarise()` ungrouping output (override with `.groups` argument)
delay <- filter(delay, count > 20, dest != "HNL")

# It looks like delays increase with distance up to ~750 miles
# and then decrease. Maybe as flights get longer there's more
# ability to make up delays in the air?
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'

### alternative ###
delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  filter(count > 20, dest != "HNL")
#############
flights %>%
  group_by(year, month, day) %>%
  summarise(mean = mean(dep_delay, na.rm = TRUE))

############
not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(mean = mean(dep_delay))

############  5.6.3 Counts #################
delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay)
  )
#> `summarise()` ungrouping output (override with `.groups` argument)

ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)

################

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )
#> `summarise()` ungrouping output (override with `.groups` argument)

ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)


delays %>%
  filter(n > 25) %>%
  ggplot(mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)

###############
# Convert to a tibble so it prints nicely
batting <- as_tibble(Lahman::Batting)

batters <- batting %>%
  group_by(playerID) %>%
  summarise(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )
#> `summarise()` ungrouping output (override with `.groups` argument)

batters %>%
  filter(ab > 100) %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point() +
  geom_smooth(se = FALSE)
#> `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

batters %>%
  arrange(desc(ba))


#### 5.6.4 Useful summary functions########

not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    avg_delay1 = mean(arr_delay),
    avg_delay2 = mean(arr_delay[arr_delay > 0]) # the average positive delay
  )


# Why is distance to some destinations more variable than to others?
not_cancelled %>%
  group_by(dest) %>%
  summarise(distance_sd = sd(distance)) %>%
  arrange(desc(distance_sd))

# When do the first and last flights leave each day?
not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    first = min(dep_time),
    last = max(dep_time)
  )

# For example, we can find the first and last departure for each day:
not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    first_dep = first(dep_time),
    last_dep = last(dep_time)
  )

# Filtering gives you all variables, with each observation in a separate row:
ranked <- not_cancelled %>%
  group_by(year, month, day) %>%
  mutate(r = min_rank(desc(dep_time))) %>%
  filter(r %in% range(r))

# Which destinations have the most carriers?
mostcar <- not_cancelled %>%
  group_by(dest) %>%
  summarise(carriers = n_distinct(carrier)) %>%
  arrange(desc(carriers))

# Counts are so useful that dplyr provides a simple helper if all you want is a count:
  not_cancelled %>%
  count(dest)

# You can optionally provide a weight variable. For example, you could use this to “count” (sum) the total number of miles a plane flew:
  flew <- not_cancelled %>%
    count(tailnum, wt = distance)

# # How many flights left before 5am? (these usually indicate delayed
  # flights from the previous day)
  not_cancelled %>%
  group_by(year, month, day) %>%
    summarise(n_early = sum(dep_time < 500))

  # What proportion of flights are delayed by more than an hour?
  not_cancelled %>%
    group_by(year, month, day) %>%
    summarise(hour_prop = mean(arr_delay > 60))

  # When you group by multiple variables, each summary peels off one level of the grouping. That makes it easy to progressively roll up a dataset:
  daily <- group_by(flights, year, month, day)
  (per_day   <- summarise(daily, flights = n()))
  (per_month <- summarise(per_day, flights = sum(flights)))
  (per_year  <- summarise(per_month, flights = sum(flights)))

  # 5.6.7 Exercises
    # Brainstorm at least 5 different ways to assess the typical delay characteristics of a group of flights. Consider the following scenarios:
  my_flights <- flights %>%
    filter(!is.na(dep_delay), !is.na(arr_delay))

  my_flights %>%
    select(year, month, day, dep_time) %>%
    group_by(year, month, day) %>%
    mutate(r = min_rank(desc(dep_time))) %>%
    mutate(range_min = range(r)[1],
           range_max = range(r)[2]) %>%
    filter(r %in% range(r))

  flights %>%
    group_by(dest) %>%
    summarise(delay.90 = quantile(arr_delay, 0.90, na.rm = TRUE)) %>%
    arrange(desc(delay.90))

  flights %>%
    group_by(hour) %>%
    summarise(avg_delay = mean(arr_delay, na.rm = TRUE)) %>%
    ggplot(aes(x = hour, y = avg_delay))+
    geom_point()+
    geom_smooth()

  # A flight is 15 minutes early 50% of the time, and 15 minutes late 50% of the time.
  flights %>%
    group_by(flight) %>%
    # filter(!is.na(arr_delay)) %>%  ##Keeping this in would exclude the possibility of canceled
    summarise(
      early.15 = sum(arr_delay <= -15, na.rm = TRUE) / n(),
      late.15 = sum(arr_delay >= 15, na.rm = TRUE) / n(),
      n = n()
    ) %>%
    ungroup() %>%
    filter(early.15 == .5, late.15 == .5)

  # 1.2 A flight is always 10 minutes late.
  flights %>%
    group_by(flight) %>%
    summarise(late.10 = sum(arr_delay >= 10)/n()) %>%
    ungroup() %>%
    filter(late.10 == 1)

# fl94 = subset(flights, flight == 94)

# 1.3 A flight is 30 minutes early 50% of the time, and 30 minutes late 50% of the time.
  flights %>%
    group_by(flight) %>%
    # filter(!is.na(arr_delay)) %>%  ##Keeping this in would exclude the possibility of canceled
    summarise(
      early.15 = sum(arr_delay <= -30, na.rm = TRUE) / n(),
      late.15 = sum(arr_delay >= 30, na.rm = TRUE) / n(),
      n = n()
    ) %>%
    ungroup() %>%
    filter(early.15 == .5, late.15 == .5)

  # 1.4 99% of the time a flight is on time. 1% of the time it’s 2 hours late.
  almostOnTime <-  flights %>%
    group_by(flight) %>%
    summarise(early99 = (sum(arr_delay <= 0, na.rm = TRUE) / n()),
              late1 = (sum(arr_delay >= 120, na.rm = TRUE) / n()),
              n = n()) %>%
    ungroup() %>%
    filter(early99 >= .99, late1 <= .01)

# 2. Come up with another approach that will give you the same output
# as not_cancelled %>% count(dest) and not_cancelled %>% count(tailnum, wt = distance)
# (without using count()).
  # question
  not_cancelled %>% count(dest)

  # answer
  not_cancelled %>%
    group_by(dest) %>%
    summarise(count_dest = n())

  # question
  not_cancelled %>% count(tailnum, wt = distance)

  # answer
  not_cancelled %>%
    group_by(tailnum) %>%
    summarize(sum(distance))

# 3. Our definition of cancelled flights (is.na(dep_delay) | is.na(arr_delay) )
# is slightly suboptimal. Why? Which is the most important column?
  filter(flights, !is.na(dep_delay), is.na(arr_delay)) %>%
    select(dep_time, arr_time, sched_arr_time, dep_delay, arr_delay)

# 4. Look at the number of cancelled flights per day.
# Is there a pattern? Is the proportion of cancelled flights related to the average delay?

  cancelled_per_day <-
    flights %>%
    mutate(cancelled = (is.na(arr_delay) | is.na(dep_delay))) %>%
    group_by(year, month, day) %>%
    summarise(
      cancelled_num = sum(cancelled),
      flights_num = n(),
    )

  ggplot(cancelled_per_day) +
    geom_point(aes(x = flights_num, y = cancelled_num))

  cancelled_and_delays <-
    flights %>%
    mutate(cancelled = (is.na(arr_delay) | is.na(dep_delay))) %>%
    group_by(year, month, day) %>%
    summarise(
      cancelled_prop = mean(cancelled),
      avg_dep_delay = mean(dep_delay, na.rm = TRUE),
      avg_arr_delay = mean(arr_delay, na.rm = TRUE)
    ) %>%
    ungroup()

  ggplot(cancelled_and_delays) +
    geom_point(aes(x = avg_dep_delay, y = cancelled_prop))


  ggplot(cancelled_and_delays) +
    geom_point(aes(x = avg_arr_delay, y = cancelled_prop))
