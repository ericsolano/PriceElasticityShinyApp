
#library(UsingR)
library(ggplot2)
library(reshape2)
library(lubridate)
library(sqldf)


##load tafeng dataset
tafeng <- read.csv("tafengtopprods.csv", header = TRUE)
tafeng$productid <- as.factor(tafeng$productid)
tafeng$transdate <- as.Date(tafeng$transdate)

data(galton)

shinyServer(
  function(input, output) {
    ### render bar chart with product sales
    output$productsales <- renderPlot({
      tafengsub <- tafeng[which(tafeng$productid == input$products), ]
      salesbyday <- aggregate(cbind(salesprice) ~ transdate, sum, # nolint: line_length_linter.
          data = tafengsub) # nolint: indentation_linter.
      ggplot(data = salesbyday, aes(x = transdate, y = salesprice)) +
          geom_bar(stat = "identity") + ylab("Total Sales") + ggtitle("Total Daily Sales") # nolint: indentation_linter, line_length_linter.
           # nolint
    })

    ### render plot of log(demand) vs log(price) and regression line
    output$elasticity <- renderPlot({
      tafengsub <- tafeng[which(tafeng$productid == input$products), ]
      demand <- sqldf("select transdate, sum(amount) as Q, avg(salesprice) as P 
                       from tafengsub 
                       group by transdate")
      elastlm <- lm(log(demand$Q) ~ log(demand$P))
      plot(log(demand$P), log(demand$Q), xlab = "log(Average Price)",
                                         ylab= "log(Total Daily Demand)", 
                                         main="Elasticity Regression Line" )
      abline(elastlm)
    })

    ### render text with elasticity results
    output$elasticityval <- renderText({
      tafengsub <- tafeng[which(tafeng$productid == input$products), ]
      demand <- sqldf("select transdate, sum(amount) as Q, avg(salesprice) as P 
                       from tafengsub 
                       group by transdate")
      elastlm <- lm(log(demand$Q) ~ log(demand$P))
                  signif(elastlm$coefficients[2], 3)
    })
  }
)