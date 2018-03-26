\name{trandn}
\alias{trandn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 fast truncated normal generator
}
\description{
 efficient state-of-the-art generator of a vector of \code{length(l)=length(u)}
from the standard multivariate normal distribution,
 truncated over the region \eqn{[l,u]};
 infinite values for \code{u} and \code{l} are accepted;
}
\usage{
trandn(l,u)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{l}{
lower truncation limit
}
  \item{u}{
upper truncation limit
}
}
\details{
 If you wish to simulate a random variable
 \eqn{Z} drawn from \eqn{N(\mu,\sigma^2)}
 conditional on \eqn{l<Z<u}, then first simulate
 \code{X=trandn((l-mu)/sig,(u-mu)/sig)} and set \code{Z=mu+sig*X};
}
\value{
random variable(s) drawn from the truncated normal distribution
}
\references{
Z. I. Botev (2015), \emph{The Normal Law Under Linear Restrictions:
 Simulation and Estimation via Minimax Tilting}, submitted to JRSS(B)
}
\author{
Z. I. Botev, email: \email{botev@unsw.edu.au} and web page: \url{http://web.maths.unsw.edu.au/~zdravkobotev/}
}
\note{
Use \code{\link{norminvp}} for the (slower) inverse transform method of simulating truncated normal variables.
}
\seealso{
See also: \code{\link{norminvp}}
}
\examples{
d=150;l=1:d;u=l+Inf;
x=trandn(l,u)
print(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{truncated }
\keyword{normal}
\keyword{univariate}



