# Motivation

## What is Shor’s algorithm?

### A quantum algorithm for integer factorization

-   Quantum algorithm

    -   An algorithm that runs on quantum computers

-   Integer factorization

    -   Decomposition of a composite number into smaller non-trivial
        divisors

    -   Example

        -   Given 24 , find its prime factor 
		- 24 = $2^{3}\times 3$.
		- Prime factor is 2, 3


## Why Shor’s algorithm? 

### Faster

-   RSA

    -   Cryptosystem

    -   Widely used for secure data transmission

    -   Principle

        -   Easy to multiply prime numbers $\rightarrow$ Encryption

        -   Impossible to factor prime numbers $\rightarrow$ Decryption

-   Why not classical algorithm?

    -   Trial division

        -   Find if n can be divided by each number in turn that is less
            than n

    -   Too slow

        -   Take $10^{176}$ years to factoring a 400-digit number.

## Why Shor's algorithm?

### Embodiment of human ingenuity

- Math
	- Euclidean algorithm 300 BC
	- Chinese remainder theorem 300-500 AD
	- Euler's theorem 1736
	- Fast Fourier transform(Cooley-Tukey) 1965

- Physics
	- Quantum physics 1900-Now

- Computer science
	- Divide & Conquer algorithm 1946


# Overview

## Overview

### 4 reductions of a complex problem

- Factoring is reduced to finding a nontrivial square root of 1 modulo N
- Computing the order of a random integer modulo N
- Find the period of a periodic superposition
- Found by quantum FFT

### The tricks and secret of Shor's algorithm

- Tricks
	- Number theory
		- Classical computer

- Secret
	- Quantum FFT
		- Quantum algorithm


## What is QFT?

- Fourier transform
- $\downarrow$ In discrete domain
- Discrete Fourier transform
- $\downarrow$ Plus Divide & Conquer algorithm
- Fast Fourier transform
- $\downarrow$  Modification for quantum computer
- Quantum Fourier transform
	- Quantum implementation of FFT 

# Fourier transform

## What is Fourier transform?

### Fourier series & Fourier coeffcients

- In 1807, Fourier astounded some of his contemporaries by asserting that an "arbitrary" function could be expressed as a linear combination of sines and cosines.

- Amazingly, it's true.

- Fourier series.

	- $f(x) = \sum_{k=-\infty}^{\infty} c_{k}sinkx+\sum_{k=-\infty}^{\infty} c_{k}' coskx$
 
	- Apply Euler's identity $e^{ix}=cosx+isinx$

	- $f(x)=\sum_{-\infty}^{\infty} c_{k}e^{ikx}$

	- $c_{k} = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(x)e^{-ikx} dx$
		- $c_{k}$ is called the $k^{th}$ Fourier coefficient of $f(x)$

## Does it work?

### Two vital questions

- Question: Given any reasonable function $f(x)$ on $\left[-\pi,\pi\right]$, with Fourier coefficients defined above, is it true that $$f(x) = \sum_{k=-\infty}^{\infty}c_{k}e^{ikx}?$$

	- Yes

- Question: Are two functions with the same Fourier coefficients necessarily equal?
	- Yes

## The idea behind Fourier Transform

### Analysis & Synthesis
	
- Net force & Components force 
	
\centerline{\includegraphics[width=1.3in]{b.eps}}

- Fourier basis 

\begin{tabular}{ccc}
  $\hat{\tmmathbf{v}}^1 = \frac{1}{\sqrt{N}} \left(\begin{array}{c}
    1\\
    1\\
    1\\
    \vdots\\
    1
  \end{array}\right)$, & $\hat{\tmmathbf{v}}^2 = \frac{1}{\sqrt{N}}
  \left(\begin{array}{c}
    1\\
    \zeta^2\\
    \zeta^3\\
    \vdots\\
    \zeta^{N - 1}
  \end{array}\right)$, & $\hat{\tmmathbf{v}}^3 = \frac{1}{\sqrt{N}}
  \left(\begin{array}{c}
    1\\
    \zeta^{2 \cdot 2}\\
    \zeta^{3 \cdot 2}\\
    \vdots\\
    \zeta^{( N - 1) \cdot 2}
  \end{array}\right)$,
\end{tabular}

# Discrete Fourier transform 

## Discrete Fourier transform 

### What if we do not know $F$?

- Example: Given audio signals, continuous signals are sampled at discrete time intervals

- Question: Given sample points, how to find Fourier coefficients?

### Consequence of sampling 

- Aliasing

\centerline{\includegraphics[width=3in]{aaa.png}}	 

## Discrete Fourier transform 

### Consequence of Aliasing

- We are allowed to represent $f(x)$ by a finite linear combination, which agrees on the sample points

$$f(x)\sim p(x)$$
$$f(x) = c_{0}+c_{1}e^{ix}+c_{2}e^{2ix}+\ldots+c_{n-1}e^{(n-1)ix}=\sum_{k=0}^{n-1}c_{k}e^{ikx}$$
$$\mathbf{f} = c_{0}\mathbf{\omega_{0}}+c_{1}\mathbf{\omega_{1}}+ \ldots + c_{n-1}\mathbf{\omega_{n-1}}$$
$$\mathbf{\omega_{k}}=(e^{ikx_{0}},e^{ikx_{1}},\ldots,e^{ikx_{n-1}})^{T}$$
$$\mathbf{\omega_{k}} = (1,\zeta_{n}^{k},\zeta_{n}^{2k},\ldots,\zeta_{n}^{(n-1)k})^{T}$$

## Notation 

- Notation $\zeta_{m} = \sqrt[m]{1}$
	- Fact $\zeta_{m}=\zeta_{n}^{2}$, when $n = 2m$
	- Example $\zeta_{4}=\zeta_{8}^{2}$

\centerline{\includegraphics[width=2.25in]{bbb.png}}


# Fast Fourier transform

## Fast Fourier transform

### Mathematical approach

\begin{align*}
 c_{k}& =  \sum_{n=0}^{n-1} \zeta_{N}^{-nk}f_{n} \\
  & =  \sum_{n=0}^{N/2-1} \zeta_{N}^{2nk}f_{2n} + \sum_{n=0}^{N/2-1} \zeta_{N}^{k(2n+1)} f_{2n+1} \\
 & =  \sum_{n=0}^{N/2-1} \zeta_{N}^{2nk}f_{2n} + \zeta_{N}^{k}\sum_{n=0}^{N/2-1} \zeta_{N}^{2nk} f_{2n+1} \\
& = \sum_{n=0}^{N/2-1} \zeta_{N/2}^{nk}f_{2n} + \zeta_{N}^{k}\sum_{n=0}^{N/2-1} \zeta_{N/2}^{nk} f_{2n+1}
\end{align*}

## Fast Fourier transform

### Visualization

\centerline{\includegraphics[width=3in]{c.png}}


## Fast Fourier transform

### Divide & Conquer

\centerline{\includegraphics[width=3in]{cc.png}}

# Quantum Fourier transofm

## Qubits, superposition, measurement

### Qubits & Superposition

- Ordinary bits
	- Electron
	- Ground state & excited state, 0 & 1 

- Quantum bits
	- $|0 \rangle$, $|1 \rangle$
- Superposition
	- $\alpha |0 \rangle + \beta |1 \rangle$
- Measurement
	- Goal: determine which state
	- Outcome: 0 or 1
	- Disturbs the system

## QFT?

### QFT is quantum version of FFT

### Why QFT?

- Extremely fast

### What's the differences?

- FFT input: $2^{m}$-dimensional complex-valued vector 

- QFT input: A superposition of $log2^{m}$ qbits

- FFT method: Multiply DFT matrix

- QFT method: Perform quantum operations

- FFT output: $2^{m}$-dimensional complex-valued vector

- QFT output A random m-bit number $j$, from the probability distribution $Pr\left[j\right]=\left[\beta_{j}\right]^{2}$

## QFT?

### Why there are differences?

- A short answer: The mysterious principle of quantum world

- A longer answer: The way the data is represented physically

	- Qbits
	- Superposition
	- Measurement

## Speed comparison

### Big O notation

\centerline{\includegraphics[width=4in]{g.png}}



## Speed comparison

\begin{figure}[h]
  \includegraphics{thesis-8.eps}
\end{figure}


## But how does a random number help?

### Periodicity

- Input a periodical vector

- Output multiples of period

- Example

	- Input 100-dimensional vector with period 5.
		- 1,3,5,2,4,1,3,5....5,2,4
	- Output 15, 20
		- $GCD(15,20)=5$

# Shor's algorithm

## Shor's algorithm step by step

- Step 1. Choose a random positive integer $m$. Use Euclidean algorithm to compute common divisor $gcd(m,N)$ of $m$ and $N$. If greatest common divisor $gcd(m.N)\neq 1$,then we have found a non-trivial factor of $N$. If, one the other hand, $gcd(m,N) =1$, then proceed to step 2.

- Step 2(quantum part). Find the unknown period $P$.

- Step 3. If $P$ is an odd integer, then go to step 1. If $P$ is even, then proceed to Step 4.

- Step 4. $(m^{p/2}-1)(m^{p/2}+1)=m^{p}-1=0 \bmod{N}$
	- If $m^{p/2}+1=0 \bmod{N}$, then go to step 1. If $m^{p/2}+1\neq 0 \bmod{N}$, then proceed to step 5.

- Step 5 Use the Euclidean algorithm to compute $d=gcd(m^{p/2}-1,N)$. 

## Quantum part in detail

\centerline{\includegraphics[width=3in]{gg.png}}


# Example

## A Working example

- Given $N=91(=7*13)$. Choose $Q=2^{14}=16384$.

- Step 1. Choose a random positive integer $m=3$. Since $gcd(91,3)=1$, we proceed to step 2 to find the period of the function $f$ given by $f(a)=3^{a}\bmod{91}$.
	
	- Unknown to us, $f$ has period 6.

- Step 2. We get period 6 from the quantum part of the Shor's algorithm

- Step 3. Since 6 is an even number, we proceed to Step 4.

- Step 4. Since $3^{P/2}=3^{3}=27\neq 0 \bmod{91}$, we go to Step 5.

- Step 5. With the Euclidean algorithm, we compute$$gcd(3^{p/2}-1,91)=gcd(3^{3}-1,91)=gcd(26,91)=13$$

- Exit. Output a non-trivial factor of $N=91$, namely 13.

## A Working example
\centerline{\includegraphics[width=3in]{ggg.png}}

## A Working example
\centerline{\includegraphics[width=3.2in]{ggggg.png}}



# Q & A

## Q & A

### Q & A

\centerline{\includegraphics[width=3.8in]{d.jpg}}

