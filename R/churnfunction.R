# Churnfunction
churnfunction <- function(dataset,custid){
  if (custid %in% dataset[,CustomerId]){
    print("CustomerId is in the Dataset, calculation continues")
  } else {
    print("Error: CustomerId is not in the Dataset")
  }
  glm.fit <- glm(Exited~CreditScore + Gender + Age + Tenure + Balance +
                   NumOfProducts + HasCrCard + IsActiveMember + EstimatedSalary,
                 data = dataset, family = "binomial")
  dataset[,Churnprob := predict(glm.fit,merged_data, type="response")]
  churntoreturn <- dataset[list(CustomerId = custid),list(CustomerId,Churnprob)]
  return(churntoreturn)
}
