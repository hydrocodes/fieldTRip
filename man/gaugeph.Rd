\name{gaugeph}
\alias{gaugeph}
\title{gaugeph: Synthetic rating curve in an ephemeral stream section}
\usage{
gaugeph(data, L, S, n)
}
\description{
Estimation of a synthetic rating curve equation (discharge vs stage) in an ephemeral stream section and plots.
}
\arguments{
data: A dataframe containing a topographical section: Section id, distance to stream initial bankfull in m (L), section depth in m (H)

L: A numeric value: Total stream width in m

S: A numeric value: Stream reach slope in m/m

n: A numeric value: Manning roughness coefficient
}
\examples{
gaugeph(data, L, S=0.005, n=0.035)
}
