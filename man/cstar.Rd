\name{cstar}
\alias{cstar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute cstar from least squares results
}
\description{
cstar computes the minimum actionable effect size under a kinked linear loss function with user-specified degree of risk aversion.
}
\usage{
cstar(regobject, r)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{regobject}{
Results from a run of a linear regression model, e.g. from the lm() command.
}
  \item{r}{
The degree of loss aversion; must be a non-negative number. This parameter maps to gamma in Esarey and Danneman (2014).  
}
}

\value{
A vector of expected values for the utility of acting on the evidence encapsulated by the betas and standard errors of the estimated regression, given the researcher's stated level of loss aversion.
}
\references{
Esarey and Danneman (2014).  A Quantitative Method for Substantive Robustness Assessment.  Political Science Research and Methods.
}

\examples{
# generate synthetic OLS data
x <- rnorm(50)
error <- rnorm(50)
y <- 1 + 1.5*x + error

# estimate model
OLSmodel <- lm(y~x)

# obtain expected utility of acting on validity of beta,
# conditional on a loss-aversion factor of 2
cstar(OLSmodel, 2)

# examine the sensitivity to choice of loss-aversion factor
loss_aversion_values <- c(1, 2, 3, 4)
eu <- NULL
for(i in loss_aversion_values){
  eu <- c(eu, cstar(OLSmodel, i)[2])
  }
plot(loss_aversion_values, eu)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ sustantive significance }
\keyword{ regression }% __ONLY ONE__ keyword per line
