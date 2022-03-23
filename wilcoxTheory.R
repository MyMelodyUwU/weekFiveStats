#'wilcox.test(x, ...)
# Default S3 method:
wilcox.test(x, y = NULL,
            alternative = c("two.sided", "less", "greater"),
            mu = 0, paired = FALSE, exact = NULL, correct = TRUE,
            conf.int = FALSE, conf.level = 0.95, ...)
# S3 method for class 'formula'
wilcox.test(formula, data, subset, na.action, ...)
