import sys
from remd_temperature import get_temperatures
if len(sys.argv) > 0:
	if (sys.argv[1]) == "--help":
		print "---------------------------------------------------------"
		print "COMMAND: python get_temperatures.py Np Pdes Tlow Thigh > temperatures.dat"
		print "---------------------------------------------------------"		
		print "where: \n"
		print "Exchange probability: Pdes,"
		print "Lower temperature limit: Tlow,"
		print "Number of water molecules: Nw,"
		print "Number of protein atoms: Np,"
		print "Hydrogens in protein: Hff, Values: 0 (All H), 1 (Polar H),"
		print "Simulation type: Alg, Values: 0 (NPT), 1 (NVT),"
		print "Tolerance: Tol,"
		print "Upper temperature limit: Thigh,"
		print "Constraints in water: WC, Values: 0 (Fully flexible), 2 (Flexible Angle), 3 (Rigid)"
		print "Constraints in the protein: PC, Values: 0 (Fully flexible), 1 (Bonds to hydrogens only), 2 (All bonds)"
		print "Virtual sites in protein: Vs, Values: 0 (None), 1(Virtual hydrogen)"
		print "---------------------------------------------------------"	
		quit() 
	params = {'Np': sys.argv[1], 'Pdes':sys.argv[2], 'Tlow':sys.argv[3], 'Thigh':sys.argv[4], 'Hff': 0, 'WC': 3, 'Alg': 0, 'PC': 0 }
	print "\n".join([str(x) for x in get_temperatures(params)])




# python teste.py 200 > temperatures.dat

