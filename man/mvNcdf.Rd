\name{mvNcdf}
\alias{mvNcdf}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
truncated multivariate normal cumulative distribution
}
\description{
computes an estimator and a deterministic upper bound of the probability \eqn{Pr(l<X<u)},
 where \eqn{X} is a zero-mean multivariate normal vector
 with covariance matrix \eqn{\Sigma}, that is, \eqn{X} is drawn from \eqn{N(0,\Sigma)}
 infinite values for vectors \eqn{u} and \eqn{l} are accepted;
 Monte Carlo method uses sample size \eqn{n};
}
\usage{
mvNcdf(l, u, Sig, n)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{l}{
lower truncation limit
}
  \item{u}{
upper truncation limit
}
  \item{Sig}{
covariance matrix of \eqn{N(0,\Sigma)}
}
  \item{n}{
Monte Carlo simulation effort --- the larger
 the \eqn{n}, the smaller the relative error of the estimator.
}
}
\details{
 Suppose you wish to estimate \eqn{p=Pr(l<AX<u)},
 where \eqn{A} is a full rank matrix
  and \eqn{X} is drawn from \eqn{N(\mu,\Sigma)}, then you simply compute
   \eqn{p=Pr(l-A\mu<AY<u-A\mu)},
                    where \eqn{Y} is drawn from \eqn{N(0, A\Sigma A^\top)}.
}
\value{
 \code{est} with structure
  \item{\code{$prob}}{estimated value of probability \eqn{Pr(l<X<u)}}
  \item{\code{$relErr} }{estimated relative error of estimator} 
  \item{\code{$upbnd} }{ theoretical upper bound on true \eqn{Pr(l<X<u)}} 
  
}
\references{
Z. I. Botev (2015), \emph{The Normal Law Under Linear Restrictions:
 Simulation and Estimation via Minimax Tilting}, submitted to JRSS(B)
}
\author{
Z. I. Botev, email: \email{botev@unsw.edu.au} and web page: \url{http://web.maths.unsw.edu.au/~zdravkobotev/}
}

\note{
For small dimensions, say \eqn{d<50}, better accuracy may be obtained by using 
the (usually slower) quasi-Monte Carlo version  \code{\link{mvNqmc}} of this algorithm.  
}

\seealso{
See also: \code{\link{mvNqmc}} and \code{\link{mvrandn}}
}
\examples{
d=15;l=1:d;u=l+Inf;
Sig=matrix(rnorm(d^2),d,d)*2;Sig=Sig\%*\%t(Sig)
n=10^3 # size of simulation effort
x=mvNcdf(l,u,Sig,10^4) # compute the probability 
print(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ truncated }
\keyword{ normal }
\keyword{ gaussian}
\keyword{ cumulative }
