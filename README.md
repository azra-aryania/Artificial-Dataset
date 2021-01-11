# Artificial-Dataset

The artificial dataset includes four variables. We used a uniform random generator algorithm based on Pearson's correlation coefficients (ρ) ranging in [-1,1] to generate the linear relationship between the variables. The pseudocode of the correlated uniform random generation algorithm is shown as follows:

'
 1:             Generate X∼U(0,1)  

2:             Initialize R as a correlation matrix between the variables  
                
3:             Compute C such that CTC=R   /∗  Compute the Cholesky Decomposition ∗/  

4:             set Y=CTX and normalize its variables separately to a range (0,1)
'

Let explain it with an example. Suppose that we want to generate Y=(Y_1.Y_2.….Y_n) where Y∼U(0,1). Let X=(X_1.X_2.….X_n) where X∼U(0,1) and X_i=(x,y,z) for i=1,…,n. Also, the correlation matrix R for three variables is defined as follows:  

                        [1    ρ_1   ρ_2]
                     R= [ρ_1   1    ρ_3]
                        [ρ_2  ρ_3    1 ]
                     
where ρ_1 is a correlation coefficient between x and y, ρ_2 is a correlation coefficient between x and z, and ρ_3 is a correlation coefficient between y and z.

In Pearson's correlation, ρ=-1 indicates a perfect negative linear relationship between two variables, ρ<0 indicates a negative relationship, ρ=0 indicates no linear relationship between two variables, ρ>0 indicates a positive relationship, and ρ=1 shows a perfect positive linear relationship between the variables. We initialized each of the considered coefficients to 10 different values to cover all possible correlations between the variables, as shown in the below Table.
|  Strength of Relationship        |         Coefficient(ρ)      |       |
|--------------------------------- |:---------------------------:|------:|
|                                  |   *Positive*  |  *Negative* |
| Weak                             |     0.3       |    -0.3     |
| Medium                           |     0.5       |    -0.5     |
| No Relationship                  |      0        |      0      |
| Strong                           |     0.75      |    -0.75    |
| Perfect                          |      1        |      -1     |

After producing X and R, we compute C, such that CTC=R. We can use the Cholesky decomposition of R to find such a matrix C, as explained in the following. 

*The Cholesky Decomposition of a Symmetric Positive-Definite Matrix*

In linear algebra, any symmetric positive definite matrix, M, can be written as:  

                                      M=U^T DU
where U is an upper triangular matrix, and D is a diagonal matrix with positive diagonal elements. Therefore, for each symmetric positive definite matrix R, we can write:   

                                      R=U^T DU=(U^T √D)(√D U)=(√D U)^T (√D U)
Which yields C=(√D U) that satisfies CTC=R.  
As mentioned in the pseudocode in line (4), Y=CTX, and then normalization of its variables to a range [0,1] produces our artificial dataset (matrix Y).

