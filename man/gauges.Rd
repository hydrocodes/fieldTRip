\name{gauges}
\alias{gauges}
\title{gauges: Stream gauge by Sectional velocity method}
\usage{
gauges(data, L)
}
\description{
Estimation of streamflow by Sectional velocity method for a currentmeter gauging. Streamflow, area, mean velocity gauged and plots
}
\arguments{
data: A dataframe containing a currentmeter gauging: Section id, distance to stream initial shore in m (L), section depth in m (H), mean velocity in m/s (V)

L: A numeric value: Total stream width in m
}
\examples{
gauges(data, L)
}
