\name{prwater}
\alias{prwater}
\title{prwater: Potential precipitable water}
\usage{
prwater(ts, ps, lr, z0, zf, dz)
}
\description{
Estimation of the total and interval potential precipitable water over a 1 sq-m air column with a given height. Plot of precipitable water by atmospheric height intervals.
}
\arguments{
ts: A numeric value: Surface air temperature (C)

ps: A numeric value: Surface atmospheric pressure (hPa)

lr: A numeric value: Lapse rate (C/100m)

z0: A numeric value: Ground elevation (m)

zf: A numeric value: Air column elevation (m)

dz: A numeric value: Air column elevation layer interval (m)
}
\examples{
prwater(ts, ps, lr=-0.6, z0=3000, zf=10000, dz=500)
}
