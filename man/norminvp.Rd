\name{norminvp}
\alias{norminvp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
normal quantile function with precision
}
\description{
computes with tail-precision the quantile function
of the standard normal distribution at \eqn{0\le p\le 1},
 and truncated to the interval \eqn{[l,u]};
 Infinite values for vectors \eqn{l} and \eqn{u} are accepted;
}
\usage{
norminvp(p, l, u)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p}{
  quantile  at \eqn{0\le p\le 1}
}
  \item{l}{
lower truncation limit
}
  \item{u}{
upper truncation limit
}
}
\details{
Suppose we wish to simulate a random variable \eqn{Z} drawn from \eqn{N(\mu,\sigma^2)} and
 conditional on \eqn{l<Z<u} using the inverse transform method.
 To achieve this, first compute
 \code{X=norminvp(runif(1),(l-mu)/sig,(u-mu)/sig)} and then set
\code{Z=mu+sig*X}
}
\value{
A real number -- the quantile value of the truncated normal distribution.
}
\references{
Z. I. Botev (2015), \emph{The Normal Law Under Linear Restrictions:
 Simulation and Estimation via Minimax Tilting}, submitted to JRSS(B)
}
\author{
Z. I. Botev, email: \email{botev@unsw.edu.au} and web page: \url{http://web.maths.unsw.edu.au/~zdravkobotev/}
}
\note{
If you wish to simulate truncated normal variables fast, use \code{\link{trandn}}.
Using \code{norminvp}  is advisable only when needed, for example, 
in quasi-Monte Carlo or antithetic sampling, where the inverse transform method
is unavoidable. 
}
\seealso{
 See Also as \code{\link{trandn}}
}
\examples{
d=150;l=1:d;u=l+Inf;
x=norminvp(runif(d),l,u) # simulate via inverse transform method
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{truncated}
\keyword{normal}
\keyword{gaussian}
\keyword{quantile}
