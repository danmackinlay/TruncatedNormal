\name{mvrandn}
\alias{mvrandn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
truncated multivariate normal generator
}
\description{
simulates \eqn{n} \bold{identically and independently 
 distributed}  random vectors 
 from the \eqn{d}-dimensional \eqn{N(0,\Sigma)} distribution (zero-mean normal
 with covariance \eqn{\Sigma}) conditional on \eqn{l<X<u};
 infinite values for \eqn{l} and \eqn{u} are accepted;
}
\usage{
mvrandn(l, u, Sig, n)
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
Covariance matrix of \eqn{N(0,\Sigma)}
}
  \item{n}{
number of simulated vectors
}
}
\details{
\describe{
\item{Bivariate normal:}{Suppose we wish to simulate a bivariate \eqn{X} from \eqn{N(\mu,\Sigma)}, conditional on 
\eqn{X_1-X_2<-6}.
We can recast this as the problem of simulation of \eqn{Y} from \eqn{N(0,A\Sigma A^\top)} (for an appropriate
matrix \eqn{A}) conditional on \eqn{l-A\mu < Y < u-A\mu} and then setting \eqn{X=\mu+A^{-1}Y}.
 See the example code below.}
 \item{Exact posterior simulation for Probit regression:}{Consider the
Bayesian Probit Regression model applied to the \code{\link{lupus}} dataset. 
Let the prior for the regression coefficients \eqn{\beta} be \eqn{N(0,\nu^2 I)}. Then, to simulate from the Bayesian
 posterior exactly, we first simulate
\eqn{Z} from \eqn{N(0,\Sigma)}, where  \eqn{\Sigma=I+\nu^2 X X^\top,}
conditional on \eqn{Z\ge 0}. Then, we simulate the posterior regression coefficients, \eqn{\beta}, of the Probit regression
by drawing \eqn{(\beta|Z)} from \eqn{N(C X^\top Z,C)}, where \eqn{C^{-1}=I/\nu^2+X^\top X}.
See the example code below.}
}
}
\value{output is a \eqn{d} by \eqn{n} array storing the random vectors, \eqn{X}, drawn from \eqn{N(0,\Sigma)}, conditional on
 \eqn{l<X<u};
}
\references{
Z. I. Botev (2015), \emph{The Normal Law Under Linear Restrictions:
 Simulation and Estimation via Minimax Tilting}, submitted to JRSS(B)
}
\author{
Z. I. Botev, email: \email{botev@unsw.edu.au} and web page: \url{http://web.maths.unsw.edu.au/~zdravkobotev/}
}
\note{
Algorithm may not work or be very inefficient if \eqn{\Sigma} is close to being rank deficient.
}

\seealso{
See also: \code{\link{mvNqmc}} and \code{\link{mvNcdf}}
}

\examples{
# Bivariate example.

Sig=matrix(c(1,0.9,0.9,1),2,2);mu=c(-3,0);l=c(-Inf,-Inf);u=c(-6,Inf);A=matrix(c(1,0,-1,1),2,2);
 n=10^3; # number of sampled vectors
 Y=mvrandn(l-A\%*\%mu,u-A\%*\%mu,A\%*\%Sig\%*\%t(A),n); 
 X=rep(mu,n)+solve(A,diag(2))\%*\%Y; # now apply the inverse map as explained above
 plot(X[1,],X[2,]) # provide a scatterplot of exactly simulated points

# Exact Bayesian Posterior Simulation Example.

data("lupus"); # load lupus data
Y = lupus[,1]; # response data
X = lupus[,-1]  # construct design matrix
m=dim(X)[1]; d=dim(X)[2]; # dimensions of problem
X=diag(2*Y-1)\%*\%X; # incorporate response into design matrix
nu=sqrt(10000); # prior scale parameter
C=solve(diag(d)/nu^2+t(X)\%*\%X);
L=t(chol(t(C))); # lower Cholesky decomposition
Sig=diag(m)+nu^2*X\%*\%t(X); # this is covariance of Z given beta
l=rep(0,m);u=rep(Inf,m);
est=mvNcdf(l,u,Sig,10^3); # estimate acceptance probability of Crude Monte Carlo
print(est$upbnd/est$prob) # estimate the reciprocal of acceptance probability
n=10^4 # number of iid variables
z=mvrandn(l,u,Sig,n); # sample exactly from auxiliary distribution 
beta=L\%*\%matrix(rnorm(d*n),d,n)+C\%*\%t(X)\%*\%z; # simulate beta given Z and plot boxplots of marginals
boxplot(t(beta)) # plot the boxplots of the marginal distribution of the coefficients in beta
print(rowMeans(beta)) # output the posterior means
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ truncated }
\keyword{ normal }
\keyword{ gaussian}
\keyword{ generator }
\keyword{ perfect sampling}
