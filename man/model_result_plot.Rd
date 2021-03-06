% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_visualization.R
\name{model_result_plot}
\alias{model_result_plot}
\alias{perf_table}
\alias{ks_plot}
\alias{lift_plot}
\alias{roc_plot}
\alias{score_distribution_plot}
\title{model result plots
\code{model_result_plot} is a wrapper of following:
\code{perf_table} is for generating a model performance table.
\code{ks_plot} is for K-S.
\code{roc_plot} is for ROC.
\code{lift_plot} is for Lift Chart.
\code{score_distribution_plot} is for ploting the score distribution.}
\usage{
model_result_plot(train_pred, score, target, test_pred = NULL,
  gtitle = NULL, perf_dir_path = NULL, save_data = FALSE,
  plot_show = TRUE, total = TRUE, g = 10)

perf_table(train_pred, test_pred = NULL, target = NULL, score = NULL,
  g = 10, breaks = NULL, pos_flag = list("1", "1", "Bad", 1),
  total = FALSE)

ks_plot(train_pred, test_pred = NULL, target = NULL, score = NULL,
  gtitle = NULL, breaks = NULL, g = 10)

lift_plot(train_pred, test_pred = NULL, target = NULL, score = NULL,
  gtitle = NULL, breaks = NULL, g = 10)

roc_plot(train_pred, test_pred = NULL, target = NULL, score = NULL,
  gtitle = NULL)

score_distribution_plot(train_pred, test_pred, target, score,
  gtitle = NULL, breaks = NULL, g = 10)
}
\arguments{
\item{train_pred}{A data frame of training with predicted prob or score.}

\item{score}{The name of prob or score variable.}

\item{target}{The name of target variable.}

\item{test_pred}{A data frame of validation with predict prob or score.}

\item{gtitle}{The title of the graph & The name for periodically saved graphic file.}

\item{perf_dir_path}{The path for periodically saved graphic files.}

\item{save_data}{Logical, save results in locally specified folder. Default is FALSE.}

\item{plot_show}{Logical, show model performance in current graphic device. Default is TRUE.}

\item{total}{Whether to summarize the table. default: TRUE.}

\item{g}{Number of breaks for prob or score.}

\item{breaks}{Splitting points of prob or score.}

\item{pos_flag}{The value of positive class of target variable, default: "1".}
}
\description{
model result plots
\code{model_result_plot} is a wrapper of following:
\code{perf_table} is for generating a model performance table.
\code{ks_plot} is for K-S.
\code{roc_plot} is for ROC.
\code{lift_plot} is for Lift Chart.
\code{score_distribution_plot} is for ploting the score distribution.

performance table

ks_plot

lift_plot

roc_plot

score_distribution_plot
}
\examples{
sub = cv_split(UCICreditCard, k = 30)[[1]]
dat = UCICreditCard[sub,]
dat = re_name(dat, "default.payment.next.month", "target")
x_list = c("PAY_0", "LIMIT_BAL", "PAY_AMT5", "PAY_3", "PAY_2")
dat = data_cleansing(dat, target = "target", obs_id = "ID",x_list = x_list,
occur_time = "apply_date", miss_values = list("", -1))
dat = process_nas(dat,default_miss = TRUE)
train_test <- train_test_split(dat, split_type = "OOT", prop = 0.7,
                                occur_time = "apply_date")
dat_train = train_test$train
dat_test = train_test$test
Formula = as.formula(paste("target", paste(x_list, collapse = ' + '), sep = ' ~ '))
set.seed(46)
lr_model = glm(Formula, data = dat_train[, c("target", x_list)], family = binomial(logit))

dat_train$pred_LR = round(predict(lr_model, dat_train[, x_list], type = "response"), 5)
dat_test$pred_LR = round(predict(lr_model, dat_test[, x_list], type = "response"), 5)
# model evaluation
perf_table(train_pred = dat_train, test_pred = dat_test, target = "target", score = "pred_LR")
ks_plot(train_pred = dat_train, test_pred = dat_test, target = "target", score = "pred_LR")
roc_plot(train_pred = dat_train, test_pred = dat_test, target = "target", score = "pred_LR")
#lift_plot(train_pred = dat_train, test_pred = dat_test, target = "target", score = "pred_LR")
#score_distribution_plot(train_pred = dat_train, test_pred = dat_test,
#target = "target", score = "pred_LR")
#model_result_plot(train_pred = dat_train, test_pred = dat_test,
#target = "target", score = "pred_LR")
}
