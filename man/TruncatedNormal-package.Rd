\name{TruncatedNormal-package}
\alias{TruncatedNormal-package}
\alias{TruncatedNormal}
\alias{cases}
\alias{cholperm}
\alias{gradpsi}
\alias{lnNpr}
\alias{mvnpr}
\alias{mvnprqmc}
\alias{mvnrnd}
\alias{newton}
\alias{nleq}
\alias{normq}
\alias{ntail}
\alias{Phinv}
\alias{psy}
\alias{qfun}
\alias{tn}
\alias{trnd}
\docType{package}
\title{
 Truncated Normal Distribution Toolbox
}
\description{
The routines include:
\itemize{
\item generator of \bold{independent and identically distributed} random vectors from the truncated univariate and multivariate distributions;
\item (Quasi-) Monte Carlo estimator and a \bold{deterministic upper bound}  of the cumulative distribution function of the multivariate normal;
\item algorithm for the accurate computation of the quantile function of the normal distribution in the extremes of its tails.
}
}
\details{
\tabular{ll}{
Package: \tab Truncated Normal\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-11-08\cr
License: \tab GPL-3\cr
}
\describe{
 \item{\code{\link{mvNcdf}(l,u,Sig,n)}}{uses a Monte Carlo sample of size \eqn{n} to estimate the cumulative
 distribution function, \eqn{Pr( l < X < u)}, of the \eqn{d}-dimensional
 multivariate normal with zero-mean and covariance \eqn{\Sigma}, that is,
 \eqn{X} has \eqn{N(0,\Sigma)} distribution;}
\item{\code{\link{mvNqmc}(l,u,Sig,n)}}{ provides a Quasi Monte Carlo algorithm for medium dimensions
 (say, \eqn{d<50}), in addition to the faster Monte Carlo algorithm in \code{\link{mvNcdf}};}
\item{\code{\link{mvrandn}(l,u,Sig,n)}}{ 
simulates \eqn{n} \bold{identically and independently distributed} random vectors \eqn{X} from \eqn{N(0,\Sigma)}, conditional on \eqn{l<X<u};}
\item{\code{\link{norminvp}(p,l,u)}}{ computes the quantile function at \eqn{0\le p\le 1} of the univariate \eqn{N(0,1)} distribution
 truncated to \eqn{[l,u]}, and with high precision in the tails;}
\item{\code{\link{trandn}(l,u)}}{ is a fast random number generator from the univariate \eqn{N(0,1)}
 distribution truncated to \eqn{[l,u]}.}
}
}
\author{
Z. I. Botev, email: \email{botev@unsw.edu.au} and web page: \url{http://web.maths.unsw.edu.au/~zdravkobotev/}
}
\references{
\itemize{
\item Z. I. Botev (2015), \emph{The Normal Law Under Linear Restrictions:
 Simulation and Estimation via Minimax Tilting}, submitted to JRSS(B)
 \item Z. I. Botev and P. L'Ecuyer (2015), \emph{Efficient Estimation 
 and Simulation of the Truncated Multivariate Student-t Distribution}, Proceedings of the 2015 Winter Simulation Conference,
   Huntington Beach, CA, USA
 \item Gibson G. J., Glasbey C. A., Elston D. A. (1994),
  \emph{Monte Carlo evaluation of multivariate normal integrals and sensitivity to variate ordering}, 
  In: Advances in Numerical Methods and Applications, pages 120--126
 }
}

\keyword{ truncated }
\keyword{ normal }
\keyword{ Gaussian }
\keyword{ generator }
\keyword{ generation }
\keyword{ sampling }
\keyword{ cumulative }
\keyword{ simulation}
\keyword{ quantile}
\keyword{ perfect sampling}
\keyword{ upper bound}
\seealso{ Matlab toolbox: 
\url{http://web.maths.unsw.edu.au/~zdravkobotev/}
}
\examples{
trandn(4,5) # generate a variable from the truncated normal on [4,5]
}
