# Algorithms for Big Data course
University of Wrocław, Spring 2022


# Introduction
## Topics of this course

* Streaming (counting, heavy hitters, norm estimation, sampling)
* Dimensionality reduction and sparse linear algebra (e.g. JL, approx matrix mul, compressed sensing)
* Applications (geometry algo, coresets, graph algorithms, ANN, sliding window)

## Motivation
Linear time/space algorithms are not good enough with modern datasets and their volume. Typical problem we are dealing with in this course: here is a stream of data, process it in a small space to compute output X. Usually there is a lower-bound preventing us to do it in a very small space \emph{exactly}. Hence we need to relax our problem to achieve very efficient (in space and time) algorithms.
Examples:
* Think of any recommendation system, where each user has assigned highly dimensional vector of preferences. We want to test similarity/dissimilarity of user profiles.
* Database with approximate index (Approx Membership Queries), to quickly eliminate queries for elements that are not in the DB, except for few false positives.
* Lossy compression of audio or images selects heavy hitters in the frequency domain. How to find them without computing FFT explicitly?
* Count distinct elements in a stream, or maintain statistics in a continuous stream of updates (router + number of unique IP).

## Techniques
* Probabilistic tools  - few probabilistic bounds are good enough 90\% of the time, sometimes we will need to go a little bit deeper (fancy distributions),
* relaxing problem: $1\pm \varepsilon$ approximation and $1-\delta$ correctness guarantee,
* linear algebra,
* trace amounts of combinatorics and ``typical'' Algo & DataStructures - that's why it might be tricky for CS students.
