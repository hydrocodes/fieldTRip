\name{gaugeph}
\alias{gaugeph}
\title{gaugeph: Empirical rating curve in a ephemeral stream section}
\usage{
gaugeph(data, L, S, n)
}
\description{
Estimation of the empirical rating curve equation in a ephemeral stream section and plots.
}
\arguments{
data: A dataframe containing a topographical section: Section id, distance to stream initial shore in m (L), section depth in m (H)

L: A numeric value: Total stream width in m

S: A numeric value: Stream reach slope in m/m

n: A numeric value: Manning roughness coefficient
}
\examples{
gaugeph(data, L, S=0.005, n=0.035)
}
