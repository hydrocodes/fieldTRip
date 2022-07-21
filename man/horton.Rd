\name{horton}
\alias{horton}
\title{horton: Adjustment to Horton model of a infiltration test}
\usage{
horton(data, i_f)
}
\description{
Adjustment to Horton model of a infiltration test. Horton equation and plot of observed and simulated infiltration.
}
\arguments{
data: A dataframe containing a point measurement by infiltrometer: time in min (time), accumulated depth in cm (depth)

i_f: A numeric value: Final infiltration capacity in mm/hr
}
\examples{
horton(data, i_f)
}
