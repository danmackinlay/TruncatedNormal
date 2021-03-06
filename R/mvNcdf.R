#' Truncated multivariate normal cumulative distribution
#' 
#' 
#' Computes an estimate and a deterministic upper bound of the probability Pr\eqn{(l<X<u)},
#' where \eqn{X} is a zero-mean multivariate normal vector 
#' with covariance matrix \eqn{\Sigma}, that is, \eqn{X} is drawn from \eqn{N(0,\Sigma)}.
#' Infinite values for vectors \eqn{u} and \eqn{l} are accepted. 
#' The Monte Carlo method uses sample size \eqn{n}; 
#' the larger \eqn{n}, the smaller the relative error of the estimator.
#' 
#' @param l lower truncation limit
#' @param u upper truncation limit
#' @param Sig covariance matrix of \eqn{N(0,\Sigma)}
#' @param n number of Monte Carlo simulations
#' @details Suppose you wish to estimate Pr\eqn{(l<AX<u)},
#'  where \eqn{A} is a full rank matrix
#'  and \eqn{X} is drawn from \eqn{N(\mu,\Sigma)}, then you simply compute
#'  Pr\eqn{(l-A\mu<AY<u-A\mu)},
#'  where \eqn{Y} is drawn from \eqn{N(0, A\Sigma A^\top)}.
#' @return  a list with components
#' \itemize{
#' \item{\code{prob}: }{estimated value of probability Pr\eqn{(l<X<u)}}
#' \item{\code{relErr}: }{estimated relative error of estimator} 
#' \item{\code{upbnd}: }{ theoretical upper bound on true Pr\eqn{(l<X<u)}} 
#' }  
#' @author Zdravko I. Botev
#' @export
#' @references Z. I. Botev (2017), \emph{The Normal Law Under Linear Restrictions:
#' Simulation and Estimation via Minimax Tilting}, Journal of the Royal
#' Statistical Society, Series B, \bold{79} (1), pp. 1--24.
#' 
#' @note For small dimensions, say \eqn{d<50}, better accuracy may be obtained by using 
#' the (usually slower) quasi-Monte Carlo version  \code{\link{mvNqmc}} of this algorithm.  
#' @seealso \code{\link{mvNqmc}}, \code{\link{mvrandn}}
#' @examples
#' d <- 15; l <- 1:d; u <- rep(Inf, d);
#' Sig <- matrix(rnorm(d^2), d, d)*2; Sig=Sig %*% t(Sig)
#' mvNcdf(l, u, Sig, 1e4) # compute the probability 
mvNcdf <-  function(l,u,Sig,n){
    d=length(l); # basic input check
    if  (length(u)!=d|d!=sqrt(length(Sig))|any(l>u)){
      stop('l, u, and Sig have to match in dimension with u>l')
    }
    # Cholesky decomposition of matrix
    out=cholperm( Sig, l, u ); L=out$L; l=out$l; u=out$u; D=diag(L);
    if (any(D<1e-10)){
      warning('Method may fail as covariance matrix is singular!')
    }
    L=L/D;u=u/D;l=l/D; # rescale
    L=L-diag(d); # remove diagonal
    # find optimal tilting parameter via non-linear equation solver
    xmu<-nleq(l,u,L) # nonlinear equation solver 
    #soln<-nleqslv(rnorm(2*d-2),gradpsi,jac=NULL,L,l,u,method = c("Broyden"))
    #xmu<-soln$x;
    x=xmu[1:(d-1)];mu=xmu[d:(2*d-2)]; # assign saddlepoint x* and mu*
    est=mvnpr(n,L,l,u,mu);
    # compute psi star
    est$upbnd=exp(psy(x,L,l,u,mu));
    return(est)
  }
