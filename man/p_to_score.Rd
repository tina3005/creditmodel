% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_training.R
\name{p_to_score}
\alias{p_to_score}
\title{prob to socre}
\usage{
p_to_score(p, PDO = 20, base = 600, ratio = 1)
}
\arguments{
\item{p}{Probability.}

\item{PDO}{Point-to-Double Odds.}

\item{base}{Base Point.}

\item{ratio}{The corresponding odds when the score is base.}
}
\value{
new prob.
}
\description{
\code{p_to_score} is for transforming probability to score.
}
\seealso{
\code{\link{training_model}}, \code{\link{pred_score}}
}
