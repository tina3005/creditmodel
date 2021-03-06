% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/variable_selection.R
\name{lasso_filter}
\alias{lasso_filter}
\title{Variable selection by LASSO}
\usage{
lasso_filter(dat_train, dat_test = NULL, target = NULL,
  x_list = NULL, pos_flag = NULL, ex_cols = NULL,
  sim_sign = "negtive", best_lambda = "lambda.auc",
  save_data = FALSE, plot.it = TRUE, seed = 46, file_name = NULL,
  dir_path = tempdir(), note = FALSE)
}
\arguments{
\item{dat_train}{A data.frame with independent variables and target variable.}

\item{dat_test}{A data.frame of test data. Default is NULL.}

\item{target}{The name of target variable.}

\item{x_list}{Names of independent variables.}

\item{pos_flag}{The value of positive class of target variable, default: "1".}

\item{ex_cols}{A list of excluded variables. Regular expressions can also be used to match variable names. Default is NULL.}

\item{sim_sign}{The coefficients of all variables should be all negetive or positive, after turning to woe. Default is "negetive" for pos_flag is "1".}

\item{best_lambda}{Metheds of best lambda stardards using to filter variables by LASSO. There are 3 methods: ("lambda.auc", "lambda.ks", "lambda.sim_sign") . Default is  "lambda.auc".}

\item{save_data}{Logical, save results in locally specified folder. Default is FALSE}

\item{plot.it}{Logical, shrinkage plot. Default is TRUE.}

\item{seed}{Random number seed. Default is 46.}

\item{file_name}{The name for periodically saved results files. Default is "Feature_selected_LASSO".}

\item{dir_path}{The path for periodically saved results files. Default is "./variable".}

\item{note}{Logical, outputs info. Default is FALSE.}
}
\value{
A list of filtered x variables by lasso.
}
\description{
\code{lasso_filter} filter variables by lasso.
}
\examples{
 sub = cv_split(UCICreditCard, k = 40)[[1]]
 dat = UCICreditCard[sub,]
 dat = re_name(dat, "default.payment.next.month", "target")
 dat_train = data_cleansing(dat, target = "target", obs_id = "ID", occur_time = "apply_date",
  miss_values = list("", -1))
 dat_train = process_nas(dat_train, default_miss = TRUE)
 #get breaks of all predictive variables
 x_list = c("PAY_0", "LIMIT_BAL", "PAY_AMT5", "EDUCATION", "PAY_3", "PAY_2")
 breaks_list <- get_breaks_all(dat = dat_train, target = "target",
                                x_list = x_list, occur_time = "apply_date", ex_cols = "ID",
  save_data = FALSE, note = FALSE)
 #woe transform
 train_woe = woe_trans_all(dat = dat_train,
                            target = "target",
                            breaks_list = breaks_list,
                            woe_name = FALSE)
 lasso_filter(dat_train = train_woe, 
         target = "target", x_list = x_list,
       save_data = FALSE, plot.it = FALSE)
}
