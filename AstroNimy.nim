#version 0.1.0. basic constants/formulas included, but currently very little conversion support. all of the formulas should have SI parameters.
#liscence should also be on git
#released under MIT liscence



import math


##########constants



const
  c = 299792458
  #speed of light
  G = 6.67384e-11
  #gravitional constant
  amc = 1.66053892e-27
  #atomic mass constant
  gearth = 9.80665
  #earth gravity
  me = 9.10938291e-31
  #mass of an electron
  echarge = 4.8033e-10
  #charge of an electron in esu
  Mp = 1.67262178e-27
  #mass of a proton
  planckc = 6.62606957e-34
  #plancks constant
  boltz = 1.3806488e-23
  #boltzmanns constant
  rearth = 6.37814e6
  #earth radius
  mearth = 5.9742e24
  #earth mass
  oearth = 365.24219879
  #orbital period of earth
  roearth = 23.96
  #earths rotational period
  Na = 6.02214179e23
  #Avogadros number
  R = 8.3144621
  #molar gas constant
  F = 9.64870e4
  #faraday constant
  KJ = 483597.898e9
  #josephson constant
  numag = 5.0508e-27
  #nuclear magneton
  shgr = 2.037894764e8
  #shielded helion gyromagnetic ratio
  lj = 9.4605284e15
  #lightyear
  Ds = 1392e6
  #diameter of the sun
  k = 0.01720209895
  #Gaussian gravitational constant
  Ls = 3.939e26
  #luminosity of the sun
  ps = 8.7941433
  #solar parallax
  Ry = 13.595
  #Rydbergs constant
  Ts = 25.38
  #rotational period of the sun
  hubb = 67.8
  #hubble constant possibly inaccurate because difficult to accurately calculate
  Teff = 5777
  #solar effective temperature
  cmbtmp = 2.725
  #cosmic microwave background temperature
  cmbdiamp = 3.355
  #cosmic microwave background dipole amplitude
  rmoon = 1.7374e6
  #radius of the moon
  mmoon = 7.3483e22
  #mass of the moon
  gmoon = 1.62
  #moon surface gravity
  mmercury = 328.5e21
  #mass of mercury
  rmercury = 2440
  #radius of mercury
  omercury = 88
  #orbital period of mercury
  mvenus = 4.867e24
  #mass of venus
  rvenus = 6052
  #radius of venus
  ovenus = 225
  #orbital period of venus
  mmars = 639e21
  #mass of mars
  rmars = 3390
  #radius of mars
  omars = 687
  #orbital period of mars
  mjupiter = 1.898e27
  #mass of jupiter
  rjupiter = 69911
  #radius of jupiter
  ojupiter = 4332.82
  #orbital period of jupiter
  msaturn = 568.3e24
  #mass of saturn
  rsaturn = 58232
  #radius of saturn
  osaturn = 10759
  #orbital period of saturn
  massuranus = 86.81e24
  #mass of uranus
  radiusuranus = 25362
  #radius of uranus
  orbituranus = 30680.3447
  #orbital period of uranus
  mneptune = 102.4e24
  #mass of neptune
  rneptune = 24622
  #radius of neptune
  oneptune = 60264.9628
  #orbital period of neptune
  mpluto = 1.309e22
  #mass of pluto
  rpluto = 1184
  #radius of pluto
  opluto = 90580.0653
  #orbital period of pluto
  masseris = 1.67e22
  #mass of eris
  radiuseris = 1400
  #approximate radius of eris
  orbiteris = 204535.631
  #orbital period of eris
  mceres = 895.8e18
  #mass of ceres
  rceres = 490
  #radius of ceres
  oceres = 1680
  #orbital period of ceres
  secrad = 0.014387752
  #second radiation constant
  stefan = 5.670373e-8
  #stefan constant
  wien = 2.8978e-3
  #wiens constant
  dirac = 1.0545727e-34
  #diracs constant
  ugy = 13.82
  #time elapsed since the big bang, in billions of years
##########equations


proc ctof*(cel: float): float =
  result = (9/5) * cel + 32

#test equation that  will be taken out later


proc ftoc*(farh: float): float =
  result = (5/9) * farh - 32

#see above


proc jtocal*(jol: float): float =
  result = jol * 0.239005736

#crude unit converter



proc stefan_boltzmann_law_flux_calc*(ktemp: float): float =
  result = (stefan)*(ktemp^4)

#stefan boltzmann equation returns rate of energy


proc lum*(ra, temper: float): float =
  result = 4 * PI * (ra^2) * (stefan) * (temper^4)

#for calculating the luminosity


proc schwarzschildr*(mass: float): float =
  result = (2 *(G) * (mass))/(c^2)

#for calculating the schwarzchild radius aka event horizon


proc absmag*(appmag, distance: float): float =
  result = appmag + 5 * (log(10 / distance))

#might not run correctly proceed with caution
#for calculating the absolute magnitude of a star given apparent magnitude and distance as parameters


proc dfrompara*(para: float): float =
  result = 1/para

#for calculating distance from parallax


proc newtongrav*(massone, masstwo, Ra: float): float =
  result = (G * massone * masstwo)/(Ra^2)

#newton gravitational law


proc hubblaw*(dis: float): float =
  result = hubb * dis

#hubbles law to calculate recessional velocity


proc rayjw*(tmpr, wavelength: float): float =
  result = (2*(c)*(boltz)*(tmpr))/(wavelength^4)

#rayleigh jeans equation no one really uses this anymore but might as well include it
