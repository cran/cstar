\name{cstarme}
\alias{cstarme}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute cstar for simulated marginal effects
}
\description{
cstarme computes the minimum actionable effect size of a simulated marginal effect under a kinked linear loss function with user-specified degree of loss.
}
\usage{
cstarme(sims, r)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sims}{
A vector of simulated marginal effects.  See Details.
}
  \item{r}{
The degree of loss aversion; must be a non-negative number. This parameter maps to gamma in Esarey and Danneman (2014).  
}
}
\details{
sims can be any vector of simulated marginal effects.  For example, the change in predicted probability of an outcome as we change the level of a predictor in a logistic regression model.  
}
\value{
A vector of expected values for the utility of acting on the evidence encapsulated by the simulated marginal effects, given the researcher's stated level of loss aversion.
}
\references{
Esarey and Danneman (2014).  A Quantitative Method for Substantive Robustness Assessment.  Political Science Research and Methods.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
# create some logit data
x <- rnorm(50)
xb <- .5 + 2*x
pry <- exp(xb) / (1 + exp(xb))
y <- rbinom(50, 1, pry)

plot(x, y)

# run logistic regression
mod <- glm(y~x, family=binomial(link="logit"))

# extract variance-covariance matrix
VCV <- vcov(mod)

# simulate intercept and B1 from multivariate normal
require(MASS)
simulated_betas <- mvrnorm(n=50, mu=coefficients(mod), Sigma=VCV)

# calculate pr(y=1) for each simulated pair of (intercept, B1);
# do so at x=0 and x=2
pry_x0 <- apply(simulated_betas, 1, function(x){
  exp(x[1] + 0*x[2]) / (1 + exp(x[1] + 0*x[2]))
  })
pry_x2 <- apply(simulated_betas, 1, function(x){
  exp(x[1] + 2*x[2]) / (1 + exp(x[1] + 2*x[2]))
})

# compute the simulated change in predicted probability
simulated_marginal_effects <- pry_x2 - pry_x0

# estimate the expected utility of accepting evidence
cstarme(simulated_marginal_effects, 2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ sustantive significance }
\keyword{ regression }% __ONLY ONE__ keyword per line
