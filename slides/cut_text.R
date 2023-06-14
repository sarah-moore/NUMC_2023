# Technical Stuff

Technical Stuff: 
  
  - [R](https://rstudio-education.github.io/hopr/starting.html) and [RStudio](https://www.rstudio.com/products/rstudio/)

- [Github](github.com)

- [\LaTeX](https://www.latex-project.org/get/) and [Overleaf](https://www.overleaf.com/login)

\pause 

Other programming platforms that you might want to acquaint yourself with, but won't be covered here are: 

- [Python](https://www.python.org/about/gettingstarted/) (via [Pycharm](https://www.jetbrains.com/pycharm/))

- [STATA](https://www.stata.com/). 

\tiny The debate regarding R versus STATA is long and drawn out throughout various disciplines, for our purposes R is open source (i.e. FREE) and thus much more accessible for long-term use.

# Necessary and Sufficient Conditions 

Consider an outcome $D$ with three possible input variables, $A,B,C$. 

::: {.block}
## Sufficient

Something that occurs \textit{also} when our outcome variable $D$ occurs.

- Consider it as an *if* statement: $D$ is true if $A$ *and* $B$ are true. 
:::

::: {.block}
## Necessary

Something that occurs \textit{always} when our outcome variable occurs. Every time $D$ is true, $A$ and $B$ are true.

- Consider it as an *only if* statement: $D$ is true if and only if $A$ *and* $B$ are. 
:::

# Logic

Consider the following elements: A,B,C that may be associated with an outcome, D. Suppose we're considering that A and B imply D ($A \wedge B \rightarrow D$). 

\begin{block}{Converse}
The converse changes a necessary statement to a sufficient one, or vice versa. (not always logically true). Ex: Converse of $A \wedge B \rightarrow D$ is $D \rightarrow A \wedge B$ (trade places of elements; not always true). 
\end{block}

\begin{block}{Contrapositive} The contrapositive flips arrow \textit{and} negates items. Ex: Contrapositive of $A \wedge B \rightarrow D$ is $\neg A \vee \neg B \leftarrow \neg D$. (Always true)

\end{block}
