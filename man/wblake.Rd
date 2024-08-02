\name{wblake}
\alias{wblake}
\title{wblake: A simple lake water balance}
\usage{
wblake(A, P, E, Qi, Qo, R,  K, L, H, dt)
}
\description{
Estimation of the water volume change in a lake through a simple water balance. Plot a scheme of fluxes in the lake.
}
\arguments{
A A numeric value: Area of the lake (km2)
P A numeric value: Precipitation during the time dt (mm)
E A numeric value: Evapotranspiration (mm/hr)
Qi A numeric value: Input flow (lt/s)
Qo A numeric value: Output flow (lt/s)
R A numeric value: Runoff during the time dt (mm)
K A numeric value: Mean saturated hydraulic conductivity of the bottom of the lake (mm/hr)
L A numeric value: Mean sediment layer width of the bottom of the lake (m)
H A numeric value: Groundwater head in m (+ to the lake; - from the lake)
dt A numeric value: Period of time analyzed (hr)
}
\examples{
wblake(A=0.5, P=0, E=0.4, Qi=23, Qo=1, R=0, K=5, L=2, H=-1, dt=1)
}
