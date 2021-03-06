% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mvrandt.R
\name{mvrandt}
\alias{mvrandt}
\title{Random number generation from multivariate truncated Student distribution}
\usage{
mvrandt(l, u, Sig, df, n)
}
\arguments{
\item{l}{lower bound for truncation (infinite values allowed)}

\item{u}{upper bound for truncation}

\item{Sig}{Covariance matrix}

\item{df}{degrees of freedom}

\item{n}{sample size}
}
\value{
a \code{d} by \code{n} matrix
}
\description{
Random number generation from multivariate truncated Student distribution
}
\examples{
\dontrun{
d <- 60L; n <- 1e3;
Sig <- 0.9 * matrix(1, d, d) + 0.1 * diag(d);
l <- (1:d)/d * 4; u <- l+2; df <- 10;
X <- mvrandt(l,u,Sig,df,n)
stopifnot(all.equal(sum(X>l), d*n))
stopifnot(all.equal(sum(X<u), d*n))
}
}
\references{
Z. I. Botev and P. L'Ecuyer (2015), Efficient probability estimation
and simulation of the truncated multivariate Student-t distribution,
Proceedings of the 2015 Winter Simulation Conference, pp. 380-391,
}
\author{
\code{Matlab} code by Zdravko Botev, \code{R} port by Leo Belzile
}
