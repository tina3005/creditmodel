% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_cleansing.R
\name{low_variance_filter}
\alias{low_variance_filter}
\title{Filtering Low Variance Variables}
\usage{
low_variance_filter(dat, lvp = 0.97, note = FALSE)
}
\arguments{
\item{dat}{A data frame with x and target.}

\item{lvp}{The maximum percent of unique values (including NAs).}

\item{note}{Logical.Outputs info.Default is TRUE.}
}
\value{
A data.frame
}
\description{
\code{low_variance_filter} is the function for filtering low variance variables.
}
\examples{
dat = low_variance_filter(lendingclub[1:1000, ], lvp = 0.9)

}
