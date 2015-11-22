
shinyUI(
  
  fluidPage(
  
    titlePanel("Price Elasticity of Demand"),
                 
    fluidRow(
      
      wellPanel(
        
        h2('Tafeng dataset'),
        
        h4('This project uses the publicly available Tafeng dataset. The dataset
           contains information about individual transactions for thousands of grocery 
           products. Transactions were recorded for 4 consecutive months.
           Features include product id, customer information, amount and
           sales price. This project used a sub-dataset with the top 5 
           products with most transactions.'),
        
        h2('Total transaction value by product'),
        
        h4("The user must select a product from the product list below, and 
           a plot of total daily sales will be displayed."),
        
        h2("Price elasticity of demand"),
        
        h4('Price elasticity for an individual product is calculated using
           the sales information for that product. The total daily demand and the average
           daily price for each day are first calculated. These data are then used
           in the following regression formulation:'),
        
        h4('log(Q) = k + E*log(P)'),
        
        h4('where Q is the total daily demand, P is the average daily price, E is elasticity
           and k is a constant.')
        
        
      )
      
    ),
    
    fluidRow(
      
      column(4, 
             
             wellPanel(
      

                    h3('Select a product to estimate its price elasticity of demand'),
                    
                    radioButtons("products", label=h3("Product"),
                                      choices = list("Product 1" = "4710265849066",
                                                     "Product 2" = "4710583996008",
                                                     "Product 3" = "4711271000014",
                                                     "Product 4" = "4714981010038",
                                                     "Product 5" = "4719090900065"), 
                                                   selected = "4710265849066")
                                 
                    
                    

            )
        ),
            
        column(8, 
               
               wellPanel(
      
                    h2("Results of Elasticity Analysis"),
                    
                    plotOutput('productsales'),
                    
                    plotOutput('elasticity'),
                    
                    h4("The elasticity for this product is:"),
                    
                    textOutput("elasticityval")
                    
              )
        )
    )

 )
)
