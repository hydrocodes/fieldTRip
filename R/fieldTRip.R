#' @title prwater
#' @description Potential precipitable water
#' @param ts A numeric value: Surface air temperature (C)
#' @param ps A numeric value: Surface atmospheric pressure (hPa)
#' @param lr A numeric value: Lapse rate (C/100m)
#' @param z0 A numeric value: Ground elevation (m)
#' @param zf A numeric value: Air column elevation (m)
#' @param dz A numeric value: Air column elevation layer interval (m)
#' @return Total and interval potential precipitable water over a 1m2 air column
#' @examples prwater(ts, ps, lr, z0, zf, dz)
#' @export
prwater <- function(ts, ps, lr, z0, zf, dz)
{nro <- (zf-z0)/dz + 1
elev <- c()
temp <- c()
p <- c()
p[1] <- ps
ro <- c()
for (i in 1:nro) {
  elev[i] <- z0+dz*(i-1)
  temp[i] <- ts+lr*dz*(i-1)/100
}
for (i in 1:nro) {
  p[i+1] <- p[i]*((temp[i+1]+273.15)/(temp[i]+273.15))^(9.81/(-287*lr/100))
}
p <- head(p,-1)
ro <- (p*100)/(287*(temp+273.15))
es <- 6.11*exp(17.27*temp/(237.3+temp))
q <- 0.622*es/p
m <- c()
for (i in 1:nro) {
  m[i] <- ((q[i+1]+q[i])/2)*((ro[i+1]+ro[i])/2)*dz
}
m <- head(m,-1)
rp <- sum(m)
barplot(as.matrix(m), col=topo.colors(length(m)),
        xlim=c(0,3), ylim=c(0,rp*1.2),xpd = F, ylab = "mm / 1m2")
legend("bottomright",
       legend=paste(round(m,1),"(",head(elev,-1),")"),
       fill = topo.colors(length(m)), ncol = 3,
       cex = 0.5, title="Precipitable water in mm/1m2 (Elevation in m)")
sprintf("Precipitable water = %f mm/1m2", rp)
}

#' @title nival
#' @description Empirical melting water evolution in a snowpack
#' @param hs A numeric value: Snowpack height (m)
#' @param ds A numeric value: Snowpack density (kg/m3)
#' @param ts A numeric value: Snowpack temperature (C)
#' @param Fn A numeric value: Net energy flux (W/m2)
#' @return Snowpack melting evolution in days during warming, rippening and output phases
#' @examples nival(hs, ds, ts, Fn)
#' @export
nival <- function(hs, ds, ts, Fn)
{ci <- 2102 #heat capacity ice J/Kg.K
 lf <- 0.334 #freezing latent heat MJ/Kg
 hswe <- hs*ds/1000
 FeJ <- Fn*0.0864
 Ucc <- -ci*1000*hswe*(ts)/10^6
 tw <- Ucc/FeJ
 tret <- 3*10^-10*ds^3.23
 hwret <- tret*hs
 Ur <- hwret*1000*lf
 tr <- Ur/FeJ
 Uo <- (hswe-hwret)*1000*lf
 to <- Uo/FeJ
 t <- c(0,tw,tw+tr,tw+tr+to)
 hswep <- c(0,0,0,hswe)
 plot(t,hswep,xlab="days",
     ylab="Melting water (m)", lwd=2)
 segments(t[-length(t)],hswep[-length(hswep)],t[-1L],hswep[-1L],col=c("red","orange","blue"), lwd=5)
mtext(text=c("Warming", "Rippening", "Output"),
      adj=c(0, .5, 1), col=c("red","orange","blue"))

sprintf("Warming = %f days, Rippening = %f days, Output = %f days, Total = %f days, Snow water equivalent = %f m",tw ,tr ,to, tw+tr+to, hswe)
}

#' @title horton
#' @description Adjustment to Horton model of a infiltration test
#' @param data A dataframe containing a point measurement by infiltrometer: time in min (time), accumulated depth in cm (depth)
#' @param i_f A numeric value: Final infiltration capacity in mm/hr
#' @return Horton equation and plot of observed and simulated infiltration
#' @examples horton(data, i_f)
#' @export
horton <- function(data, i_f)
{t <- data$time
l <- data$depth
tc <- t/60
thrc <- tc[-1]
thr <- c()
lmm <- c()
for (i in 2:length(t)) {
  thr[i-1] <- (t[i]-t[i-1])/60
}
for (i in 2:length(l)) {
  lmm[i-1] <- (l[i]-l[i-1])*10
}
inf <- lmm/thr
horton.lm <- lm(log10(inf-i_f) ~ thrc)
y.log.e <- summary(horton.lm )$coefficients[2,1]
log.i_o.i_f <- summary(horton.lm )$coefficients[1,1]
i_o <- 10^log.i_o.i_f + i_f
y <- y.log.e/log10(exp(1))
corr <- cor(log10(inf-i_f),thrc)
sim <- i_f + (i_o-i_f)*exp(y*thrc)
plot(thrc,inf, type="o", col=4, lwd=2, xlab="t (hr)", ylab="i (mm/hr)", main="Horton infiltration model")
lines(thrc,sim, type="l", col=2, lty=2, xlab="t (hr)", ylab="i (mm/hr)")
legend("topright", legend = c("Observed","Simulated"), col = c(4,2),lty = c(1, 2), lwd=c(2,1))
sprintf("Equation: i = %f + %f exp (%ft); Initial infiltration capacity io = %f mm/hr; Recession constant y = %f 1/hr; Correlation coefficient = %f",i_f, i_o-i_f,y, i_o, -y, corr)
}

#' @title greenampt
#' @description Adjustment to Green-Ampt model of a infiltration test
#' @param data A dataframe containing a point measurement by infiltrometer: time in min (time), accumulated depth in cm (depth)
#' @return Green-Ampt equation and plot of observed and simulated infiltration
#' @examples greenampt(data)
#' @export
greenampt <- function(data)
{t <- data$time
l <- data$depth
tc <- t/60
thrc <- tc[-1]
thr <- c()
lm <- c()
Finv <- 1/l
Finv <- Finv[-1]
for (i in 2:length(t)) {
  thr[i-1] <- (t[i]-t[i-1])/60
}
for (i in 2:length(l)) {
  lm[i-1] <- (l[i]-l[i-1])
}
f <- lm/thr
ga.lm <- lm(f ~ Finv)
Ks <- summary(ga.lm )$coefficients[1,1]
Sf <- summary(ga.lm )$coefficients[2,1]/Ks
corr <- cor(f,Finv)
sim <- Ks*(Sf*Finv + 1)
plot(thrc,f, type="o", col=4, lwd=2, xlab="t (hr)", ylab="f (cm/hr)", main="Green-Ampt infiltration model")
lines(thrc,sim, type="l", col=2, lty=2)
legend("topright", legend = c("Observed","Simulated"), col = c(4,2),lty = c(1, 2), lwd=c(2,1))
sprintf("Equation: f = %f (%f/F + 1); Saturated hydraulic conductivity Ks = %f cm/hr; Suction-Storage factor = %f cm; Correlation coefficient (f,i/F) = %f",Ks, Sf, Ks, Sf, corr)
}

#' @title gauges
#' @description Stream gauge by Sectional velocity method
#' @param data A dataframe containing a currentmeter gauging: Section id, distance to stream initial shore in m (L), section depth in m (H), mean velocity in m/s (V)
#' @param L A numeric value: Total stream width in m
#' @return Streamflow, area, mean velocity gauged and plots
#' @examples gauges(data, L)
#' @export
gauges <- function(data, L)
{q <- data$H*data$V
 h <- data$H
 n <- length(q)
 Qm <- c()
 Am <- c()
 for (i in 2:n){
 Qm[i] <- (q[i]+q[i-1])*(data$L[i]-data$L[i-1])/2
 Am[i] <- (h[i]+h[i-1])*(data$L[i]-data$L[i-1])/2
 }
Qt <- data$L[1]*q[1]/2 + sum(Qm[!is.na(Qm)]) + (L-data$L[n])*q[n]/2
At <- data$L[1]*h[1]/2 + sum(Am[!is.na(Am)]) + (L-data$L[n])*h[n]/2
x <- c(0, data$L, L)
y <- c(0,-h,0)
qt <- c(0,q,0)
layout(matrix(c(1,2), ncol = 1))
plot(x,qt, type="h", lwd=3, col="red", xlab="Width (m)",ylab="Mean sectional velocity (m2/s)")
points(x,qt, type="p", col="red", pch=17, cex=1.5)
lines(x,qt, col="red", lty=2)
plot(x, y, type="l", lwd=2, xlab="Width (m)", ylab="Depth (m)" )
polygon(x, y, col = "royalblue1")
points(x,y, pch=16)
sprintf("Gauged flow = %f m3/s; Total section area = %f m2; Mean velocity = %f m/s", Qt, At, Qt/At)
}

#' @title gaugeph
#' @description Synthetic rating curve in an ephemeral stream section
#' @param data A dataframe containing a topographical section: Section id, distance to stream initial bankfull in m (L), section depth in m (H)
#' @param L A numeric value: Total stream width in m
#' @param S A numeric value: Stream reach slope in m/m
#' @param n A numeric value: Manning roughness coefficient
#' @return Synthetic rating curve equation, area and plots
#' @examples gaugeph(data, L, S, n)
#' @export
gaugeph <- function(data, L, S, n)
{h <- data$H
nr <- length(h)
Am <- c()
wp <- c()
for (i in 2:nr){
  Am[i] <- (h[i]+h[i-1])*(data$L[i]-data$L[i-1])/2
  wp[i-1] <- sqrt((abs(h[i-1]-h[i]))^2+(data$L[i-1]-data$L[i])^2)
}
At <- data$L[1]*h[1]/2 + sum(Am[!is.na(Am)]) + (L-data$L[nr])*h[nr]/2
wpt <- sum(wp) + sqrt(h[1]^2+data$L[1]^2) + sqrt(h[nr]^2+(L-data$L[nr])^2)
hm <- At/L
x <- c(0, data$L, L)
y <- c(0,-h,0)
hx <- max(h)
hp <- c(hm/5,2*hm/5,3*hm/5,4*hm/5,hm)
Qp <- (L*hp)*(L*hp/(L+2*hp))^(2/3)*S^0.5/n
reg <- lm (log (Qp) ~ log (hp*hx/hm))
a <- suppressWarnings(exp(summary(reg)$coefficients[1,1]))
b <- suppressWarnings(summary(reg)$coefficients[2,1])
x1 <- rev(x)
y1 <- rep(-hx,nr+2)
layout(matrix(c(1,2), ncol = 2), widths = c(2, 1))
plot(c(x,x1), c(y,y1), type="l", xlab="Width (m)", lwd=2, ylab="Depth (m)", col = "peru", main="Ephemeral stream section")
polygon(c(x,x1), c(y,y1), col = "peru", border=NA)
points(x,y, pch=16)
plot(hp*hx/hm,Qp, type="o", lwd=3, col="blue", xlab="Stage (m)",ylab="Discharge (m3/s)")
sprintf("Rating curve: Discharge = %f*Stage^%f; Full section area = %f m2; Sectional length = %f m", a, b, At, wpt)
}
