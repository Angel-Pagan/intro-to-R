


# 1.1: Intro R 

    # Variables are declared with the assignment operator, <-
    x <- 4
    y <- 12

    number <- x+y
    number

# 1.2: R Syntax and Data Structures 

    # Create a numeric vector and store the vector as a variable called 'glengths'
    glengths <- c(4.6, 3000, 50000)
    glengths
    # Create a character vector and store the vector as a variable called 'species'
    species <- c("mouse", "rat", "human")
    species

    #combined vectors
    combined <- c(glengths, species)
    combined

    # Factors are used to represent categorical data
    expression <- c("low", "medium", "high", "low", "medium", "high")
    expression_factor <- factor(expression)
    expression_factor

    # Exercise 

    samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
    samplegroup_factor <- factor(samplegroup)
    samplegroup_factor

    # Data Frames
    df <- data.frame(species, glengths)
    df

    # Exercise 
    titles <- c("The Hobbit", "The Fellowship of the Ring", "The Two Towers", "The Return of the King")
    pages <- c(310, 423, 352, 416)
    favorite_books <- data.frame(titles, pages)
    favorite_books

    # Lists

    list1<- list(species, df, number)
    list1

    #Exercise 
    list2 <- list(species, glengths, number)
    list2

    #Basic Functions
    glengths <- c(glengths, 90)
    glengths <- c(30, glengths)
    glengths

    sqrt(81)
    sqrt(glengths)
    round(3.14159)

    #Exercise 
    mean(glengths)
    test <- c(1, NA, 2, 3, NA, 4)
    mean(test)

    ###User-defined functions
    square_it <- function(x) {
        x_squared <- x^2
        return(x_squared)
    }
    square_it(3)

    #Exercise
    multiply_it <- function(x, y) {
        product <- x*y
        return(product)
    }
    multiply_it(5, 10)

# 1.4: Reading data into R 

    #the read.csv() function is used to read data from a csv file into R
    metadata <- read.csv(file="data/mouse_exp_design.csv")
    metadata

    #Exercise
    proj_summary <- read.table(file="data/project-summary.txt", row.names = 1, header = TRUE)
    proj_summary

    head(metadata)

    #Exercise

    class(glengths)
    class(metadata)

    summary(proj_summary)



# 1.5: Practice Exercises

    temp_conv <- function(temp_f) {
        temp_c <- (temp_f - 32) * 5 / 9
        temp_k <- temp_c + 273.15
        return(temp_k)
    }
    temp_conv(84)

    round(temp_conv(84), 1)

# 2.1: Data Wrangling: Subsetting vectors and factors

        age <- c(15,22,45,52,73,81)
        age
        #if we wanted just the 4th element, we would use the following code:
        age[4]

        age[-4]
        
        age[2:4]
        #or
        age[c(2,3,4)]

        #Exercise

        alphabets <- c("C", "D", "X", "L", "F")
        alphabets[c(1,2,5)]
        alphabets[-3]
        alphabets[5:1]

        #Logical Operators
        age>50

        which(age>50 | age<18)

        age[which(age>50 | age<18)]

        #Factors

        expression[expression=="high"]

        #Exercise 
        #Releveling factors
        expression <- factor(expression, levels=c("low", "medium", "high"))
        str(expression)
        
        #Exercise
        samplegroup <- factor(samplegroup, levels=c("KO", "CTL", "OE"))
        str(samplegroup)

# 2.2: Packages and Libraries
        sessionInfo()
        search()

    #Exercise
        install.packages("tidyverse")

# 2.3: Data wrangling: dataframes, matrices, and lists
    #Dataframes
        # Extract value 'Wt'
            metadata[1,1]

        #extract the value from 1 
            metadata[1,3]

        #Extract the 3rd row 
            metadata[3,]

        #Extract the 3rd column 
            metadata[,3]

        #Extract the 3rd column as a dataframe 
            metadata[,3,drop=FALSE]

        #Dataframe containing the first two columns of metadata
            metadata[,1:2]

        #Dataframe containing the 1st, 3rd, and 6th rows of metadata
            metadata[c(1,3,6),]

        #Extract the celltype column from the first 3 samples
            metadata[c("sample1", "sample2", "sample3") , "celltype"]
            
        # Check column names of metadata data frame
            colnames(metadata)

        # Check row names of metadata data frame
            rownames(metadata)

        #extract a column using the column name
            metadata$genotype

    #Exercises
        #Return a data frame with only the genotype and replicate column values for sample2 and sample8.
            metadata[c("sample2", "sample8"), c("genotype", "replicate")]

        #Return the fourth and ninth values of the replicate column.
            metadata[c(4,9), "replicate"]

        #Extract the replicate column as a data frame.
            metadata[, "replicate", drop=FALSE]

        #Selecting indicies with logical operators
            metadata$celltype=="typeA"

        #returns a vector of logical values
            metadata[metadata$celltype=="typeA",]

        #returns a dataframe with only the rows that meet the condition
            which(metadata$celltype=="typeA")

    #Lists
        list1[[2]]
        class(list1[[2]])

    #Exercise
        #Create a list named random with the following components: metadata, age, list1, samplegroup, and number.
            random <- list(metadata=metadata, age=age, list1=list1, samplegroup=samplegroup, number=number)
            random
        #Extract the samplegroup component.
            random$samplegroup

        #Adding names to lists
        names(list1) <- c("species", "df", "number")
        names(list1)
        list1[["species"]]

    #Exercise
        #Set names for the random list you created in the last exercise.
        names(random) <- c("metadata", "age", "list1", "samplegroup", "number")
        
        #Extract the age
        random$age
