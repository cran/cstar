\name{cstari}
\alias{cstari}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute cstar from published least squares results
}
\description{
cstari computes the minimum actionable effect size under a kinked linear loss function with user-specified degree of risk aversion. It computes this value from a beta, its associated standard error, and the degrees of freedom of a regression, and gamma, e.g. enables researchers to compute this quantity from a table of published results.
}
\usage{
cstari(b, v, degfr, r)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{b}{
The beta of interest from a linear regression model.
}
  \item{v}{
The standard error associated with the beta of interest.}
  \item{degfr}{
The degrees of freedom of the regression.
}
  \item{r}{
The degree of loss aversion; must be a non-negative number. This parameter maps to gamma in Esarey and Danneman (2014).  

}
}

\value{
The expected value for the utility of acting on the evidence encapsulated by the beta and standard error of the estimated regression, given the researcher's stated level of loss aversion.
}
\references{
Esarey and Danneman (2014).  A Quantitative Method for Substantive Robustness Assessment.  Political Science Research and Methods. 
}

\examples{
cstari(2.5, 1, 50, 2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ sustantive significance }
\keyword{ regression }% __ONLY ONE__ keyword per line
