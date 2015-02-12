my.sd <- function(y)
{
    n = length(y)
    result = sqrt((sum(y^2) - n * mean(y)^2) / (n-1))
    return(result)
}

