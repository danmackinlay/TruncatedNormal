\name{mvNqmc}
\alias{mvNqmc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
truncated multivariate normal cumulative distribution (quasi-Monte Carlo)
}
\description{
 computes an estimator and a deterministic upper bound of the probability \eqn{Pr(l<X<u)},
 where \eqn{X} is a zero-mean multivariate normal vector
 with covariance matrix \eqn{\Sigma}, that is, \eqn{X} is drawn from \eqn{N(0,\Sigma)}
 infinite values for vectors \eqn{u} and \eqn{l} are accepted;
}
\usage{
mvNqmc(l, u, Sig, n)
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
total randomized quasi-Monte Carlo simulation effort; higher values yield more accurate results;
}
}
\details{
\describe{
 \item{Quasi-Monte Carlo version:}{This version uses a Quasi Monte Carlo (QMC) pointset
 of size \code{ceiling(n/12)} and estimates the relative error
 using 12 independent randomized QMC estimators; QMC
 is slower than ordinary Monte Carlo, 
 but is also likely to be more accurate when \eqn{d<50}. For high dimensions, say \eqn{d>50}, you may obtain the same accuracy using
the (typically faster) \code{\link{mvNcdf}}.}
 \item{The non-zero mean case, that is, \eqn{N(\mu,\Sigma)}:}{Suppose you wish to estimate \eqn{p=Pr(l<AX<u)},
 where \eqn{A} is a full rank matrix
  and \eqn{X} drawn from \eqn{N(\mu,\Sigma)}. Then, you simply compute
   \eqn{p=Pr(l-A\mu<AY<u-A\mu)},
                    where \eqn{Y} is drawn from \eqn{N(0,A\Sigma A^\top)}.}
        }
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


\seealso{
See also: \code{\link{mvNcdf}} and \code{\link{mvrandn}}
}
\examples{
d=15;l=1:d;u=l+Inf;
Sig=matrix(rnorm(d^2),d,d)*2;Sig=Sig\%*\%t(Sig)
n=10^3 # size of simulation effort
x=mvNqmc(l,u,Sig,10^4)
print(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ truncated }
\keyword{ normal }
\keyword{ gaussian}
\keyword{ cumulative }
\keyword{ quasi-Monte Carlo}
