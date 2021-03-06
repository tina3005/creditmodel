# creditmodel1.1.6
**In this version I have:**
* Fixed some potential bugs in `split_bins`, `woe_transfer`

# creditmodel-1.1.5
* Add the function `time_series_proc` for time series data processing.
* Add functions `ranking_percent_proc`,`ranking_percent_dict` are for processing ranking percent variables and generating ranking percent dictionary.
* Change the function name `read_dt` to `read_data` and add and parameter **pattern** for matching files.
* Change the parameter max.depth to max_depth of the function `traing_xgb`,'xgb_params'
* Change the function name `save_dt` to `save_data` and `save_data` also supports multiple data frames.

# creditmodel-1.1.4
* New function log_trans() is for logarithmic transformation
* New function plot_table() make it possible to generate table graph.
* New funciton multi_grid() for arranging list of plots into a grid.

# creditmodel1.1.3
**In this version I have:**

* Fixed additional issues for the *last* version released on CRAN.
* Add new functions `pred_xgb` for using xgboost model to predict new data.
* Provide new functions `get_psi_plots`, `psi_plot` to plot PSI of your data..
* Provide a function `p_to_score` for transforming probability to score.
* Provide a function `multi_left_jion`  for left jion a list of datasets fast.
* Provide a function `read_data`  for loading csv or txt data fast.

# creditmodel1.1.2
**In this version I have:**

* Fixed additional issues for the *last* version released on CRAN.
* Fixed some potential bugs in `xgb_filter`, `feature_selector`, `split_bins`, `ks_table_plot`, `ks_psi_plot`, `ks_value`.
* Add a new function `pred_score` for predicting new data using scorecard.
* Provide new functions `lr_params_search`, `xgb_params_search` for searching the optimal parameters. "random_search","grid_search","local_search" are available.
* Provide new functions `partial_dependence_plot`, `get_partial_dependence_plots`  for generating partial dependence plot.
* Provide new functions `cohort_analysis`, `cohort_table`, `cohort_plot`  for cohort (vintage) analysis and visualization.
* Provide new functions `perf_table`, `roc_plot`, `ks_plot`, `lift_plot`, `psi_plot` for model validation drawings.




# creditmodel1.1.1
**In this version I have:**
* Fixed some potential bugs in `get_names`, `digits_num`

# creditmodel1.1.0

**In this version I have:**

* Add a function `data_exploration`  for data exploration.
* Fixed some potential bugs in `missing_proc`, `outliers_proc` ,`get_names` 
* In `lasso_filter`,  `AUC`&`K-S` is added to select the best lambda. In this way, not only can the set of variables that makes the AUC or K-S maximized be selected, but also the multicollinearity (which is difficult to eliminate by AIC in stepwise regression),  can be minimized. That means instead of stepwise regression, the optimal combination of variables can be selected by lasso to solve the regression problem.
* Visualize the number of variables, `K-S` or `AUC` values corresponding to different lambda.
* Provide new functions``auc_value`  \ `ks_value`,  which can calculate Kolmogorov-Smirnov (K-S)  & AUC of multiple model results quickly.

