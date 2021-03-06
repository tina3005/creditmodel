% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_cleansing.R
\name{data_cleansing}
\alias{data_cleansing}
\title{Data Cleaning}
\usage{
data_cleansing(dat, target = NULL, obs_id = NULL, occur_time = NULL,
  x_list = NULL, pos_flag = NULL, miss_values = NULL,
  ex_cols = NULL, low_var = TRUE, outlier_proc = TRUE,
  missing_proc = TRUE, merge_cat = TRUE, trans_log = FALSE,
  one_hot = FALSE, p = 0.001, m = 20, lvp = 0.999, nr = 0.999,
  cor_dif = 0.01, parallel = FALSE, note = FALSE,
  save_data = FALSE, file_name = NULL, dir_path = tempdir())
}
\arguments{
\item{dat}{A data frame with x and target.}

\item{target}{The name of target variable.}

\item{obs_id}{The name of ID of observations.Default is NULL.}

\item{occur_time}{The name of occur time of observations.Default is NULL.}

\item{x_list}{A list of x variables.}

\item{pos_flag}{The value of positive class of target variable, default: "1".}

\item{miss_values}{Other extreme value might be used to represent missing values, e.g: -9999, -9998. These miss_values will be encoded to -1 or "Missing".}

\item{ex_cols}{A list of excluded variables. Default is NULL.}

\item{low_var}{Logical, delete low variance variables or not. Default is TRUE.}

\item{outlier_proc}{Logical, process outliers or not. Default is TRUE.}

\item{missing_proc}{Logical, process nas or not. Default is TRUE.}

\item{merge_cat}{merge categories of character variables that  is more than m.}

\item{trans_log}{Logical, Logarithmic transformation. Default is FALSE.}

\item{one_hot}{Logical. If TRUE, one-hot_encoding  of category variables. Default is FASLE.}

\item{p}{The minimum percent of samples in a category to merge.}

\item{m}{The minimum number of categories.}

\item{lvp}{The maximum percent of unique values (including NAs).}

\item{nr}{The maximum percent of NAs.}

\item{cor_dif}{The correlation coefficient difference with the target of logarithm transformed variable and original variable.}

\item{parallel}{Logical, parallel computing or not. Default is FALSE.}

\item{note}{Logical. Outputs info. Default is TRUE.}

\item{save_data}{Logical, save the result or not. Default is FALSE.}

\item{file_name}{The name for periodically saved data file. Default is NULL.}

\item{dir_path}{The path for periodically saved data file. Default is tempdir().}
}
\value{
A preprocessed data.frame
}
\description{
The \code{data_cleansing} function is a simpler wrapper for data cleaning functions, such as
delete variables that values are all NAs;
checking dat and target format.
delete low variance variables
replace null or NULL or blank with NA;
encode variables which NAs &  miss value rate is more than 95% as 1,0 ;
encode variables which unique value  rate is  more than 95% as 1,0;
merge categories of character variables that  is more than 10;
transfer time variables to dateformation;
remove duplicated observations;
process outliers;
process NAs.
}
\examples{
#data cleaning
dat_cl <- data_cleansing(dat = UCICreditCard[1:2000,],
                       target = "default.payment.next.month",
                       x_list = NULL,
                       obs_id = "ID",
                       occur_time = "apply_date",
                       ex_cols = c("PAY_6|BILL_"),
                       outlier_proc = TRUE,
                       missing_proc = TRUE,
                      one_hot = FALSE,
                       low_var = TRUE,
                       save_data = FALSE)

}
\seealso{
\code{\link{remove_duplicated}},
\code{\link{null_blank_na}},
\code{\link{entry_rate_na}},
\code{\link{low_variance_filter}},
\code{\link{process_nas}},
\code{\link{process_outliers}}
}
