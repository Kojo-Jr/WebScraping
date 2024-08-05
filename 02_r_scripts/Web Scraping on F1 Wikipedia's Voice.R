# Web Scraping
# A REAL APPLICATION OF WEB SCRAPING IN R

# Get Link
link <- "https://en.wikipedia.org/wiki/List_of_Formula_One_drivers"
print(link)

# Parse HTML Content and get the attributes
page <- read_html(link)
print(page)


# Searching in the HTML code we find that the table is a table element with the sortable attribute:
drivers_F1 <- html_element(page, "table.sortable") %>% html_table()
head(drivers_F1)
tail(drivers_F1)

# Structure of the dataset
str(drivers_F1)

# Select Variables of interest
drivers_F1 <- drivers_F1[c(1:4, 7:9)]
print(drivers_F1)

# Remove the last
drivers_F1 <- drivers_F1[-nrow(drivers_F1),]
print(drivers_F1)

# Extract only number of victories(without years)
drivers_F1$`Drivers' Championships` <- substr(drivers_F1$`Drivers' Championships`,
                                              start = 1, stop = 1
)
drivers_F1


# With this code, we actually extract only the first character since we start at 1 
# and stop at 1. At the moment, the maximum number of championships won by a driver is 7 (Lewis Hamilton & Michael Schumacher), 
# so it is fine to extract only the first digit.


# Analyse the code 
write.csv(drivers_F1, "F1_drivers.csv", row.names = FALSE)
