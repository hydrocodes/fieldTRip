\name{nival}
\alias{nival}
\title{nival: Melting water evolution in a snowpack}
\usage{
nival(hs, ds, ts, Fn)
}
\description{
Snowpack melting evolution in days during warming, rippening and output phases.
}
\arguments{
hs: A numeric value: Snowpack height (m)

ds: A numeric value: Snowpack density (kg/m3)

ts: A numeric value: Snowpack temperature (C)

Fn: A numeric value: Net energy flux (W/m2)
}
\examples{
nival(hs, ds, ts, Fn=125)
}
