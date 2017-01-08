#!/usr/bin/python
#-*- coding: utf-8 -*-

import os 
from gi.repository import Gtk
 
#Criando a Classe do Programa
class REMDApp(object):
    def __init__(self):
    #Agora como eu havia dito vamos utilizar uma função da classe Gtk.Builder 
    #para carregar o arquivo XML gerado pelo Glade.
     
        
        
        builder = Gtk.Builder() #Primeiramente criamos uma instância da classe
        builder.add_from_file("remdwizard.glade") #Função para carregar o arquivo
     
    #Agora nós podemos acessar os widgets do arquivo XML, caso você tenha
    #alterado o nome de algum widget e não seguiu o tutorial exatamente como
    #eu fiz, preste atenção e utilize o nome que você definiu.
    #Caso não se lembre os nomes abra o arquivo XML no glade novamente e veja
    #os nomes na ávore de widgets do lado direito.
    #Utilizaremos a função get_object passando como parâmetro o nome do widget.
     
    #Obtendo o widget window1 nossa janela principal
        self.window = builder.get_object("window1")
        self.maskCA = builder.get_object("maskCA")
        self.maskBB = builder.get_object("maskBB")
        self.range_from = builder.get_object("range_from")
        self.range_to = builder.get_object("range_to")
        self.num_atoms = builder.get_object("num_atoms")
        self.combobox1 = builder.get_object("combobox1")
        self.job_id = builder.get_object("job_id")
        self.protein_sequence = builder.get_object("protein_sequence")
        self.seed = builder.get_object("seed")
        self.ref_structure = builder.get_object("ref_structure")
        self.lower_temp = builder.get_object("lower_temp")
        self.higher_temp = builder.get_object("higher_temp")
        self.num_atoms = builder.get_object("num_atoms")	
        self.time_001 = builder.get_object("time_001")
        self.time_002 = builder.get_object("time_002")
        self.time_003 = builder.get_object("time_003")
        self.time_004 = builder.get_object("time_004")                
        self.time_005 = builder.get_object("time_005")     
        self.time_006 = builder.get_object("time_006") 
        self.time_007 = builder.get_object("time_007") 
        self.time_008 = builder.get_object("time_008") 
        self.time_009 = builder.get_object("time_009")       
        self.time_010 = builder.get_object("time_010")
        self.cut_001 = builder.get_object("cut_001")
        self.cut_002 = builder.get_object("cut_002")
        self.cut_003 = builder.get_object("cut_003")
        self.cut_004 = builder.get_object("cut_004")                
        self.cut_005 = builder.get_object("cut_005")     
        self.cut_006 = builder.get_object("cut_006") 
        self.cut_007 = builder.get_object("cut_007") 
        self.cut_008 = builder.get_object("cut_008") 
        self.cut_009 = builder.get_object("cut_009")       
        self.cut_010 = builder.get_object("cut_010")
        self.ne_001 = builder.get_object("ne_001")
        self.ne_002 = builder.get_object("ne_002")
        self.ne_003 = builder.get_object("ne_003")
        self.ne_004 = builder.get_object("ne_004")                
        self.ne_005 = builder.get_object("ne_005")     
        self.ne_006 = builder.get_object("ne_006") 
        self.ne_007 = builder.get_object("ne_007") 
        self.ne_008 = builder.get_object("ne_008") 
        self.ne_009 = builder.get_object("ne_009")       
        self.ne_010 = builder.get_object("ne_010")         
        self.num_processes = builder.get_object("num_processes")
        self.machinefile_name = builder.get_object("machinefile_name")	
        self.output_folder = builder.get_object("output_folder")
        self.switch_001 = builder.get_object("switch_001")      
        self.switch_002 = builder.get_object("switch_002") 
        self.switch_003 = builder.get_object("switch_003")
        self.switch_004 = builder.get_object("switch_004")
        self.switch_005 = builder.get_object("switch_005")
        self.switch_006 = builder.get_object("switch_006")
        self.switch_007 = builder.get_object("switch_007")
        self.switch_008 = builder.get_object("switch_008")
        self.switch_009 = builder.get_object("switch_009")
        self.switch_010 = builder.get_object("switch_010")
        self.switch_011 = builder.get_object("switch_011")      
        self.switch_012 = builder.get_object("switch_012") 
        self.switch_013 = builder.get_object("switch_013")
        self.switch_014 = builder.get_object("switch_014")
        self.switch_015 = builder.get_object("switch_015")
        self.switch_016 = builder.get_object("switch_016")
        self.switch_017 = builder.get_object("switch_017") #radius of gyration
        self.switch_018 = builder.get_object("switch_018") #funneling events
        self.switch_019 = builder.get_object("switch_019")
        self.switch_020 = builder.get_object("switch_020")
        self.switch_021 = builder.get_object("switch_021") #potential energy
        self.switch_temp_generator =  builder.get_object("switch_temp_generator")
        self.time_010 = builder.get_object("time_010")
        self.co_001 = builder.get_object("co_001")
        self.co_002 = builder.get_object("co_002")
        self.co_003 = builder.get_object("co_003")
        self.co_004 = builder.get_object("co_004")                
        self.co_005 = builder.get_object("co_005")     
        self.co_006 = builder.get_object("co_006") 
        self.co_007 = builder.get_object("co_007") 
        self.co_008 = builder.get_object("co_008") 
        self.co_009 = builder.get_object("co_009")       
        self.co_010 = builder.get_object("co_010")
        self.number_of_smalls = builder.get_object("number_of_smalls")

	
	#Obtendo o widget about_dialog (janelinha com as informações do programa)
        self.about = builder.get_object("aboutdialog1")
        
        self.error1 = builder.get_object("messagedialog1")
        self.error2 = builder.get_object("messagedialog2")
        self.error3 = builder.get_object("messagedialog3")
         
    #Exibindo a janela do programa
        self.window.show()
     
    #Agora nós iremos conectar os sinais que definimos para cada widget no 
    #Glade Para isso usamos a função connect_signals(). Se você definiu o nome
    #de algum sinal de um modo diferente dos que eu utilizei preste atenção
    #nessa parte e substitua pelo nome que você definiu.
     
        builder.connect_signals({"gtk_main_quit": Gtk.main_quit,
                            #Sinal da janela principal, conectada a função
                            #do gtk que fecha o nosso programa
                         "on_generate_button_clicked": self.generate_inputs,
                       #  "on_ref_structure_file_set"?
                            #Sinal do botão ao ser clicado, o valor é uma 
                            #função que vamos criar mais a frente no código.
                        ###     "on_text_entry_activate": self.invert_url,
                            #Sinal da área de texto ao ser pressionado a tecla
                            #enter, perceba que utilizamos a mesma função que
                            #utilizamos no valor do botão, ou seja se o usuário
                            #clicar no botao ou apertar enter a URL será 
                            #invertida pois os sinais chamam a mesma função de
                            #inversão.
                          "on_generate_temperaturesfile_clicked": self.generate_temperatures,
                          "on_compute_button_clicked": self.compute_an,
                          "on_about_activate": self.about_window,
                            #Sinal do Item Sobre do Menu Ajuda, a função será 
                            #criado ainda.                            
                                })
	

#Criando as funções que eu especifiquei como valor no dicionário dos Sinais
        #AQUI FAREI OS TESTES PARA VER SE AS INPUTS ESTAO CORRETAS!!! UHU        
        # COLOCOU UMA ESTRUTURA DE REFERENCIA? SE NAO, DAR ERRO
        #print var_ref_structure
    def generate_inputs(self, widget):
		var_cut_001 = self.cut_001.get_text()
		var_cut_002 = self.cut_002.get_text()
		var_cut_003 = self.cut_003.get_text()
		var_cut_004 = self.cut_004.get_text()
		var_cut_005 = self.cut_005.get_text()
		var_cut_006 = self.cut_006.get_text()
		var_cut_007 = self.cut_007.get_text()
		var_cut_008 = self.cut_008.get_text()
		var_cut_009 = self.cut_009.get_text()
		var_cut_010 = self.cut_010.get_text()
		var_ne_001 = self.ne_001.get_text()
		var_ne_002 = self.ne_002.get_text()
		var_ne_003 = self.ne_003.get_text()
		var_ne_004 = self.ne_004.get_text()
		var_ne_005 = self.ne_005.get_text()
		var_ne_006 = self.ne_006.get_text()
		var_ne_007 = self.ne_007.get_text()
		var_ne_008 = self.ne_008.get_text()
		var_ne_009 = self.ne_009.get_text()
		var_ne_010 = self.ne_010.get_text()
		var_switch_001 = self.switch_001.get_active()
		var_switch_002 = self.switch_002.get_active()
		var_switch_003 = self.switch_003.get_active()
		var_switch_004 = self.switch_004.get_active()
		var_switch_005 = self.switch_005.get_active()
		var_switch_006 = self.switch_006.get_active()
		var_switch_007 = self.switch_007.get_active()
		var_switch_008 = self.switch_008.get_active()
		var_switch_009 = self.switch_009.get_active()
		var_switch_010 = self.switch_010.get_active()
		var_switch_011 = self.switch_011.get_active()
		var_switch_012 = self.switch_012.get_active()
		var_switch_013 = self.switch_013.get_active()
		var_switch_014 = self.switch_014.get_active()
		var_switch_015 = self.switch_015.get_active()
		var_switch_016 = self.switch_016.get_active()
		var_switch_017 = self.switch_017.get_active()
		var_switch_018 = self.switch_018.get_active()
		var_switch_019 = self.switch_019.get_active()
		var_switch_020 = self.switch_020.get_active()
		list_cuts = ["var_cut_001","var_cut_002","var_cut_003","var_cut_004","var_cut_005","var_cut_006","var_cut_007","var_cut_008","var_cut_009","var_cut_010"]
		list_nes = ["var_ne_001","var_ne_002","var_ne_003","var_ne_004","var_ne_005","var_ne_006","var_ne_007","var_ne_008","var_ne_009","var_ne_010"]
		var_number_of_smalls = self.number_of_smalls.get_text()
		var_number_of_smalls = int(var_number_of_smalls)
		list_switches = ["var_switch_001","var_switch_002","var_switch_003","var_switch_004","var_switch_005","var_switch_006","var_switch_007","var_switch_008","var_switch_009","var_switch_010"]
        
   
		var_ref_structure = self.ref_structure.get_filename()
		if var_ref_structure == None :
			print "ERROR #1: No reference file."
			self.error1_window()
		else:
			test = 0
			for a in range(0,10): #para cada cutoff id, sendo que cutoff id seria i+1
				if eval(list_switches[a])==1 :
					#print "Cut-off ON"			
					if float(eval(list_cuts[a])) < 5.0 :
						test_numexchg_sm = float(eval(list_nes[a])) % var_number_of_smalls
						#print test_numexchg_sm
						if test_numexchg_sm == 0:
							test = 0
						else:
							test = 1
			if test == True :
				print "ERROR #2: REMD with dt=0.001 problem - numexchg_small = numexchg / number_of_smalls - Please choose number_of_smalls carefully in order to get integer values for numexchg_small"
				self.error2_window()
			else:
				self.generate_inputs_go()
		
			
        ### self.error1_window
       
        							 
#Criando as funções que eu especifiquei como valor no dicionário dos Sinais
    def generate_inputs_go(self):
        var_num_atoms = self.num_atoms.get_text()
        var_job_id = self.job_id.get_text()
        var_protein_sequence = self.protein_sequence.get_text()
        var_seed = self.seed.get_text()
        var_ref_structure = self.ref_structure.get_filename()
        var_lower_temp = self.lower_temp.get_text()
        var_higher_temp = self.higher_temp.get_text()
        var_num_atoms = self.num_atoms.get_text()
        var_time_001 = self.time_001.get_text()
        var_time_002 = self.time_002.get_text()
        var_time_003 = self.time_003.get_text()
        var_time_004 = self.time_004.get_text()                
        var_time_005 = self.time_005.get_text()     
        var_time_006 = self.time_006.get_text() 
        var_time_007 = self.time_007.get_text() 
        var_time_008 = self.time_008.get_text() 
        var_time_009 = self.time_009.get_text()       
        var_time_010 = self.time_010.get_text()
        var_cut_001 = self.cut_001.get_text()
        var_cut_002 = self.cut_002.get_text()
        var_cut_003 = self.cut_003.get_text()
        var_cut_004 = self.cut_004.get_text()                
        var_cut_005 = self.cut_005.get_text()     
        var_cut_006 = self.cut_006.get_text() 
        var_cut_007 = self.cut_007.get_text() 
        var_cut_008 = self.cut_008.get_text() 
        var_cut_009 = self.cut_009.get_text()       
        var_cut_010 = self.cut_010.get_text()
        var_ne_001 = self.ne_001.get_text()
        var_ne_002 = self.ne_002.get_text()
        var_ne_003 = self.ne_003.get_text()
        var_ne_004 = self.ne_004.get_text()                
        var_ne_005 = self.ne_005.get_text()     
        var_ne_006 = self.ne_006.get_text() 
        var_ne_007 = self.ne_007.get_text() 
        var_ne_008 = self.ne_008.get_text() 
        var_ne_009 = self.ne_009.get_text()       
        var_ne_010 = self.ne_010.get_text()             
        var_num_processes = self.num_processes.get_text()
        var_machinefile_name = self.machinefile_name.get_text()
        var_output_folder = self.output_folder.get_text()
        var_switch_001 = self.switch_001.get_active()
        var_switch_002 = self.switch_002.get_active()
        var_switch_003 = self.switch_003.get_active()
        var_switch_004 = self.switch_004.get_active()
        var_switch_005 = self.switch_005.get_active()
        var_switch_006 = self.switch_006.get_active()
        var_switch_007 = self.switch_007.get_active()
        var_switch_008 = self.switch_008.get_active()
        var_switch_009 = self.switch_009.get_active()
        var_switch_010 = self.switch_010.get_active()
        var_switch_011 = self.switch_011.get_active()
        var_switch_012 = self.switch_012.get_active()
        var_switch_013 = self.switch_013.get_active()
        var_switch_014 = self.switch_014.get_active()
        var_switch_015 = self.switch_015.get_active()
        var_switch_016 = self.switch_016.get_active()
        var_switch_017 = self.switch_017.get_active()
        var_switch_018 = self.switch_018.get_active()
        var_switch_019 = self.switch_019.get_active()
        var_switch_020 = self.switch_020.get_active()
        var_co_001 = self.co_001.get_text()
        var_co_002 = self.co_002.get_text()
        var_co_003 = self.co_003.get_text()
        var_co_004 = self.co_004.get_text()                
        var_co_005 = self.co_005.get_text()     
        var_co_006 = self.co_006.get_text() 
        var_co_007 = self.co_007.get_text() 
        var_co_008 = self.co_008.get_text() 
        var_co_009 = self.co_009.get_text()       
        var_co_010 = self.co_010.get_text()
        var_number_of_smalls = self.number_of_smalls.get_text()
        var_number_of_smalls = int(var_number_of_smalls)
        var_combobox1 = self.combobox1.get_active()
        #print var_combobox1
        var_simulation_type = var_combobox1
        #var_simulation_type = 2

        
        list_times = ["var_time_001","var_time_002","var_time_003","var_time_004","var_time_005","var_time_006","var_time_007","var_time_008","var_time_009","var_time_010"]
        
        list_cuts = ["var_cut_001","var_cut_002","var_cut_003","var_cut_004","var_cut_005","var_cut_006","var_cut_007","var_cut_008","var_cut_009","var_cut_010"]
        
        list_switches = ["var_switch_001","var_switch_002","var_switch_003","var_switch_004","var_switch_005","var_switch_006","var_switch_007","var_switch_008","var_switch_009","var_switch_010"]
        
        list_nes = ["var_ne_001","var_ne_002","var_ne_003","var_ne_004","var_ne_005","var_ne_006","var_ne_007","var_ne_008","var_ne_009","var_ne_010"]


        var_get_temperatures = self.switch_temp_generator.get_active()
        print var_get_temperatures
        if var_get_temperatures==True :
			self.generate_temperatures2()

        os.system("mkdir " + var_output_folder)
        #os.system("pwd")
        os.chdir(var_output_folder)
        os.system("cp ../src/clear_mdins.sh " + var_output_folder + "/clear_mdins.sh")
        os.system("chmod 777 clear_mdins.sh")
        os.system("./clear_mdins.sh")
        os.system("rm clear_mdins.sh")
        ## AQUI POSSO COLOCAR UM ARQUIVO clear.sh para tirar os .mdin que estao la (senao pode acontecer de gerar setup_remd.x errado (com mais linhas
        # que deveria)
        #os.system("pwd")
        os.system("cp ../src/mini_00.in " + var_output_folder + "/mini_00.in")
        os.system("cp ../src/remd_first.mdin " + var_output_folder + "/remd_first.mdin")
        os.system("cp ../src/remd_small_cut.mdin " + var_output_folder + "/remd_small_cut.mdin")
        os.system("cp ../src/remd_cut.mdin " + var_output_folder + "/remd_cut.mdin")	
        os.system("cp ../src/get_from_tra.x " + var_output_folder + "/get_from_tra.x")	
        os.system("cp ../src/remove_heatoms.py " + var_output_folder + "/remove_heatoms.py")	
        os.system("cp ../src/EF.py " + var_output_folder + "/EF.py")	
        os.system("cp ../src/compute_energies.py " + var_output_folder + "/compute_energies.py")	
        if int(var_simulation_type) >= 2: #nao eh ctremd nem remd
			os.system("cp ../src/verify_end.py " + var_output_folder + "/verify_end.py")
			os.system("cp ../src/set_end.py " + var_output_folder + "/set_end.py")	
       # print "cp ../src/remd_cut.mdin " + var_output_folder + "/remd_cut.mdin"		
        
        
        

        
        
        for i in range(0,10): #para cada cutoff id, sendo que cutoff id seria i+1
			#print i
			if eval(list_switches[i])==1 :
				#print "Cut-off ON"			
				if float(eval(list_cuts[i])) > 5.0 :
					#print "maior"
					#aqui vou gerar 1 .mdin só (para cada um dos valores de cutoff)
					if i == 0: 	# se eh o primeiro cutoff de todos!
						#print "primeiro, com cutoff > 5.0"
						dt = 0.002
						numexchg = float(eval(list_nes[i]))
						if var_simulation_type >= 2: #nao eh ctremd nem remd
							nstlim = float(eval(list_times[i])) / (dt)
						else:
							nstlim = float(eval(list_times[i])) / ( float(eval(list_nes[i])) * dt)
						cutoff = float(eval(list_cuts[i]))
						numexchg_sm = numexchg
						mdin_create_first(dt, numexchg, numexchg_sm, nstlim, cutoff, var_simulation_type, var_number_of_smalls)
					else: # se nao eh o primeiro cutoff de todos, mas eh alto (>5.0)
						dt = 0.002
						numexchg = float(eval(list_nes[i]))
						if var_simulation_type >= 2: #nao eh ctremd nem remd
							nstlim = float(eval(list_times[i])) / (dt)
						else:
							nstlim = float(eval(list_times[i])) / ( float(eval(list_nes[i])) * dt)
						cutoff = float(eval(list_cuts[i]))
						numexchg_sm = numexchg
						mdin_create_others(dt, numexchg, numexchg_sm, nstlim, cutoff, (i+1), var_simulation_type, var_number_of_smalls) #i+1 eh o cutoff_id
		
				else: ## cutoff <= 5.0	 					
					#print "menor ou igual a 5.0"
					if float(eval(list_cuts[i])) < 5.0 : #aqui vou gerar varios por causa do cutoff(amber no cluster a 4.0 e 4.5)
						#se for de [4.0 a 5.0)
						if i == 0: # se eh o primeiro cutoff de todos!				
							#print "primeiro"
							
							dt = 0.001
							numexchg_sm = float(eval(list_nes[i])) / var_number_of_smalls
							numexchg = float(eval(list_nes[i]))
							if var_simulation_type >= 2: #nao eh ctremd nem remd
								nstlim = float(eval(list_times[i])) / (dt * var_number_of_smalls)
							else:
								nstlim = float(eval(list_times[i])) / ( float(eval(list_nes[i])) * dt)
							cutoff = float(eval(list_cuts[i]))
							mdin_create_first(dt, numexchg, numexchg_sm, nstlim, cutoff, var_simulation_type, var_number_of_smalls)
						else: # se nao for o primeiro cutoff de todos, mas for um cutoff baixo de 4 a 4.99 
							dt = 0.001
							numexchg_sm = float(eval(list_nes[i])) / var_number_of_smalls
							numexchg = float(eval(list_nes[i]))
							if var_simulation_type >= 2: #nao eh ctremd nem remd
								nstlim = float(eval(list_times[i])) / (dt * var_number_of_smalls)
							else:
								nstlim = float(eval(list_times[i])) / ( float(eval(list_nes[i])) * dt)
							cutoff = float(eval(list_cuts[i]))
							mdin_create_others(dt, numexchg, numexchg_sm, nstlim, cutoff, (i+1), var_simulation_type, var_number_of_smalls) #i+1 eh cutoff_id	
							
					if float(eval(list_cuts[i])) >= 5.0 :  #se for cutoff 5.0
						if i == 0: # se eh o primeiro cutoff de todos!						
							#print "primeiro!"
							dt = 0.001 #continua dt baixo mas o rgbmax vai a 10.0 
							numexchg = float(eval(list_nes[i]))
							if var_simulation_type >= 2: #nao eh ctremd nem remd
								nstlim = float(eval(list_times[i])) / (dt)
							else:
								nstlim = float(eval(list_times[i])) / ( float(eval(list_nes[i])) * dt)
							cutoff = float(eval(list_cuts[i]))
							numexchg_sm = numexchg
							mdin_create_first(dt, numexchg, numexchg_sm, nstlim, cutoff, var_simulation_type, var_number_of_smalls)
						else: #se 5.0 nao eh primeiro cutoff 
							dt = 0.001 #continua dt baixo mas o rgbmax vai a 10.0 
							numexchg = float(eval(list_nes[i]))
							if var_simulation_type >= 2: #nao eh ctremd nem remd
								nstlim = float(eval(list_times[i])) / (dt)
							else:
								nstlim = float(eval(list_times[i])) / ( float(eval(list_nes[i])) * dt)
							cutoff = float(eval(list_cuts[i]))
							numexchg_sm = numexchg
							mdin_create_others(dt, numexchg, numexchg_sm, nstlim, cutoff, (i+1), var_simulation_type, var_number_of_smalls)#i+1 eh cutoff_id
																				
			else :
				cutttt = 0
				#print "Cut-off OFF"
		

        os.system("rm remd_first.mdin")
        os.system("rm remd_small_cut.mdin")
        os.system("rm remd_cut.mdin")
        os.system("mkdir MD")
        os.system("mv *.* MD/")
        os.system("mkdir LEAP")
       #os.system("pwd")
       #os.system("pwd")
       #os.system("pwd")
       #os.system("pwd")
       #os.system("pwd")


        #os.system("pwd")
        os.chdir("../src/")
        #var_reference_structure = "/home/lipinski/Dropbox/gtk_remd/1unc.pdb"
        print "Generating queue.sh ........"
        #print var_ref_structure
        os.system("./create_queue.sh " + var_output_folder + " temperatures.dat " + var_num_processes + " " + var_job_id + " " + var_ref_structure + " " + str(var_simulation_type) + " " + var_machinefile_name)
        print "queue.sh generated!"
        print "Generating setup_remd_allinputs.x ........"
        os.system("./create_setup.sh " + var_output_folder + " temperatures.dat " + var_job_id + " " + var_seed + " " + str(var_simulation_type) + " " +  var_num_processes + " " + var_machinefile_name)
        print "setup_remd_allinputs.x generated!"
	 #  ./create_setup.sh /home/lipinski/Dropbox/gtk_remd/outputs temperatures.dat 1UNC 77777
     #  ./create_queue.sh /home/lipinski/Dropbox/gtk_remd/outputs temperatures.dat 18 1UNC 1UNC.pdb
        os.system("chmod 777 " + var_output_folder + "/MD/setup_remd_allinputs.x")
        os.system("chmod 777 " + var_output_folder + "/MD/queue.sh")
        #os.system("pwd")
        os.chdir("..")
        print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
        self.create_leap()
        print "Finished - Inputs Successfully Generated!"
        print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
        print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
        #os.system("pwd")
        
           
        
    
    def compute_an(self, widget):
		var_combobox1 = self.combobox1.get_active()
		radgyr = self.switch_017.get_active()
		funev = self.switch_018.get_active()
		poten = self.switch_021.get_active()
		RMSD = self.switch_014.get_active()
		GDT = self.switch_015.get_active()
		QCS = self.switch_016.get_active()
		var_job_id = self.job_id.get_text()
		var_simulation_type = var_combobox1
		ca = self.maskCA.get_active()
		bb = self.maskBB.get_active()
		start = self.range_from.get_text() 
		end = self.range_to.get_text()
		skip = 0
		xyzText = []
		
		
		if ca == False and bb == False:
			print "There is something wrong with the masks!"
			self.error3_window()
			skip = 1
		if start == "" or end == "":
			print "There is something wrong with the range!"
			self.error3_window()
			skip = 1
		#print ca
		#print bb
		#print start
		#print end
		

		if skip == 0 :

			line = "chmod 777 *.x \n"
			xyzText.append(line)

			if var_simulation_type >= 2: #nao eh ctremd nem remd
				line = "#./analyze_all_temps.x job_id ../LEAP/" + var_job_id + "_Pfirst.pdb   NAO NECESSARIO - NO REMD \n"
				xyzText.append(line)
			else:
				line = "./analyze_all_temps.x job_id ../LEAP/" + var_job_id + "_Pfirst.pdb\n"
				xyzText.append(line)
			
			
			line = "./generate_pdb_total.x job_id ../LEAP/" + var_job_id + "_Pfirst.pdb \n"
			xyzText.append(line)
			
			#print var_simulation_type	
			os.system("pwd")
			os.chdir("src/")
			var_output_folder = self.output_folder.get_text()
			os.system("./create_analyze_all_temps.sh " + var_output_folder + " temperatures.dat")
			os.system("chmod 777 " + var_output_folder + "/MD/analyze_all_temps.x")
			os.system("pwd")
			os.system("./create_generate_pdb.sh " + var_output_folder + " temperatures.dat " + str(var_simulation_type) + " " + var_job_id )
			os.system("chmod 777 " + var_output_folder + "/MD/generate_pdb_total.x")

				
				

				
			
			#print RMSD
			#print GDT
			if RMSD == True or radgyr == True:
				RMSD = int(RMSD)
				radgyr = int(radgyr)
				#print "inside"
				os.system("./create_rmsd_from_traj.sh " + var_output_folder + " temperatures.dat " + str(var_simulation_type) + " " +  str(ca) + " " + str(bb) + " " + str(start) + " " + str(end) + " " + str(RMSD) + " " + str(radgyr))
				os.system("chmod 777 " + var_output_folder + "/MD/rmsd_from_traj.x")
				
				line = "./rmsd_from_traj.x job_id ../LEAP/" + var_job_id + "_Pfirst.pdb \n"
				xyzText.append(line)
			if GDT == True:
				#print "inside2"
				os.system("./create_gdt_from_traj.sh " + var_output_folder + " temperatures.dat " + str(var_simulation_type) + " " + var_job_id)
				os.system("chmod 777 " + var_output_folder + "/MD/gdt_from_traj.x")
				line = "#./gdt_from_traj.x \n"
				xyzText.append(line)
			if poten == True:
				os.system("./create_compute_energies.sh " + var_output_folder + " temperatures.dat " + str(var_simulation_type))
				os.system("chmod 777 " + var_output_folder + "/MD/compute_energies.x")
				line = "./compute_energies.x \n"
				xyzText.append(line)
			os.chdir("..")
			out = var_output_folder + "/MD/queue-end.sh"
			output = open(out, "w")
			output.writelines(xyzText)
			output.close
			os.system("chmod 777 " + out)
			print out + " file generated!"
	
	
    def generate_temperatures2(self):
		var_output_folder = self.output_folder.get_text()
		os.system("mkdir " + var_output_folder)
		os.chdir(var_output_folder)
		var_lower_temp = self.lower_temp.get_text()
		var_higher_temp = self.higher_temp.get_text()
		var_num_atoms = self.num_atoms.get_text()
		Pdes = "0.30"
		print "Computing Temperatures File .......... -"
		os.system("python ../src/get_temperatures.py "+ var_num_atoms + " " + Pdes + " " + var_lower_temp + " " + var_higher_temp + " > temperatures.dat")
		print "Temperatures File Generated!"
		
    def generate_temperatures(self, widget):
		var_output_folder = self.output_folder.get_text()
		os.system("mkdir " + var_output_folder)
		os.chdir(var_output_folder)
		var_lower_temp = self.lower_temp.get_text()
		var_higher_temp = self.higher_temp.get_text()
		var_num_atoms = self.num_atoms.get_text()
		Pdes = "0.30"
		print "Computing Temperatures File .........."
		#estou na pasta setada como output
		os.system("python ../src/get_temperatures.py "+ var_num_atoms + " " + Pdes + " " + var_lower_temp + " " + var_higher_temp + " > temperatures.dat")
		print "Temperatures File Generated!!"
		os.chdir("..")
   	

    def create_leap(self):
		var_job_id = self.job_id.get_text()
		var_protein_sequence = self.protein_sequence.get_text()
		var_output_folder = self.output_folder.get_text()
		# one_letter["SER"] will now return "S"
		one_letter ={'VAL':'V', 'ILE':'I', 'LEU':'L', 'GLU':'E', 'GLN':'Q', \
		'ASP':'D', 'ASN':'N', 'HIS':'H', 'TRP':'W', 'PHE':'F', 'TYR':'Y',    \
		'ARG':'R', 'LYS':'K', 'SER':'S', 'THR':'T', 'MET':'M', 'ALA':'A',    \
		'GLY':'G', 'PRO':'P', 'CYS':'C'}
		three_letter = dict([[v,k] for k,v in one_letter.items()])
		three_letter ={'V':'VAL', 'I':'ILE', 'L':'LEU', 'E':'GLU', 'Q':'GLN', \
		'D':'ASP', 'N':'ASN', 'H':'HIS', 'W':'TRP', 'F':'PHE', 'Y':'TYR',    \
		'R':'ARG', 'K':'LYS', 'S':'SER', 'T':'THR', 'M':'MET', 'A':'ALA',    \
		'G':'GLY', 'P':'PRO', 'C':'CYS'}
		
		
		seq3 = ""
		
		i = 0
		for char in var_protein_sequence:
			value = three_letter[char]
			if i==0:
				value = "N" + value
			if i==(len(var_protein_sequence)-1):
				value = "C" + value
			seq3 = seq3 + " " + value
			i = i + 1
		
		print "leap.in generated for sequence: " + seq3
		
		leapin = ''
		line = "source leaprc.ff12SB" + '\n'
		leapin += line
		line = "Extended = sequence {" + seq3 + "}" + '\n'
		leapin += line
		#line = var_job_id + "_P = loadPdbUsingSeq ../" +  var_job_id + "-Hs_Ext.pdb seq" + '\n'
		#leapin += line
		line = "SaveAmberParm Extended job_id.prmtop job_id.inpcrd" + '\n'
		leapin += line
		line = "SavePdb Extended " + var_job_id + "_extended.pdb" + '\n'
		leapin += line
		line = "quit" + '\n'
		leapin += line
		#print leapin
		
		out = open('leap.in', 'w')
		out.write(leapin)
		out.close()
		#os.system("cp leap.in " + var_output_folder + "/MD/leap.in" )
		os.system("mv leap.in " + var_output_folder + "/LEAP/leap.in" )
		print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
		
		
		
		
		
	
    def error1_window(self):
        """Função para exibir ERRO"""
         
        #Executando a Janela ERRO1

        self.error1.run()
        self.error1.destroy()
         
        #Ativando a opção fechar da Janela Sobre
        #self.error1.hide()	
		
    def error2_window(self):
        """Função para exibir ERRO"""
         
        #Executando a Janela ERRO1

        self.error2.run()
        self.error2.destroy()
         
        #Ativando a opção fechar da Janela Sobre
        #self.error1.hide()		
        
    def error3_window(self):
        """Função para exibir ERRO"""
         
        #Executando a Janela ERRO1

        self.error3.run()
        self.error3.destroy()
         
        #Ativando a opção fechar da Janela Sobre
        #self.error1.hide()		
	   
   
    def about_window(self, widget):
        """Função para exibir a Janela Sobre do programa"""
         
        #Executando a Janela Sobre
        self.about.run()
         
        #Ativando a opção fechar da Janela Sobre
        self.about.hide()
        
        
  #FUNCAO A SER RODADA PARA CADA CUTOFF 
def mdin_create_first(dt, numexchg, numexchg_sm, nstlim, cutoff, simulation_type, number_of_smalls):
	numexchg_sm = int(numexchg_sm)
	nstlim = int(nstlim)
	print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	print "Creating first .mdin"
	print "dt: %.3f" % dt
	print "numexchg total: %d" % numexchg
	print "numexchg for each small: %d" % numexchg_sm
	print "nstlim: %d" % nstlim
	print "cutoff: %d" % cutoff
	
	if cutoff < 5.0 :
		rgbmax=6.0
		print "rgbmax: %d" % rgbmax
		#terei smalls
		
		for x in range(1,(number_of_smalls + 1)):
			#print x
			os.system("cp ../src/remd_first.mdin remd_001_small_" + str('{:03}'.format(x)) + ".mdin")
			os.system("chmod 777 get_from_tra.x")
			
			entrada =  "remd_001_small_" + str('{:03}'.format(x)) + ".mdin"
			print entrada + " created"
			if x == 1:
				#o primeirissimo
				irest = 0
				ntx = 1
				#print "sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada
				os.system("sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NSTLIM\"/\""+str(nstlim)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_CUTOFF\"/\""+str(cutoff)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_RGBMAX\"/\""+str(rgbmax)+"\"/ "+ entrada)
				if simulation_type >= 2: #nao eh ctremd nem remd
					os.system("sed -i s/\"numexchg=VALUE_NE,\"/\"""\"/ "+ entrada)				
				os.system("sed -i s/\"VALUE_NE\"/\""+str(numexchg_sm)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_IREST\"/\""+str(irest)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NTX\"/\""+str(ntx)+"\"/ "+ entrada)
			else:
				#os outros 19
				irest = 1
				ntx = 5
				os.system("sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NSTLIM\"/\""+str(nstlim)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_CUTOFF\"/\""+str(cutoff)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_RGBMAX\"/\""+str(rgbmax)+"\"/ "+ entrada)
				if simulation_type >= 2: #nao eh ctremd nem remd
					os.system("sed -i s/\"numexchg=VALUE_NE,\"/\"""\"/ "+ entrada)				
				os.system("sed -i s/\"VALUE_NE\"/\""+str(numexchg_sm)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_IREST\"/\""+str(irest)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NTX\"/\""+str(ntx)+"\"/ "+ entrada)			
	else: # se cutoff >= 5.0:
		rgbmax=10.0 #dt deve estar correto (0.001 para 5.0 e 0.002 para o resto)
		print "rgbmax: %d" % rgbmax
		#nao terei smalls
		os.system("cp ../src/remd_first.mdin remd_001.mdin")
		entrada =  "remd_001.mdin"
		print entrada + " created"
		#o primeirissimo
		irest = 0
		ntx = 1
		#print "sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada
		os.system("sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_NSTLIM\"/\""+str(nstlim)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_CUTOFF\"/\""+str(cutoff)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_RGBMAX\"/\""+str(rgbmax)+"\"/ "+ entrada)
		if simulation_type >= 2: #nao eh ctremd nem remd
			os.system("sed -i s/\"numexchg=VALUE_NE,\"/\"""\"/ "+ entrada)				
		os.system("sed -i s/\"VALUE_NE\"/\""+str(numexchg_sm)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_IREST\"/\""+str(irest)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_NTX\"/\""+str(ntx)+"\"/ "+ entrada)
	print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"		
def mdin_create_others(dt, numexchg, numexchg_sm, nstlim, cutoff, cutoff_id, simulation_type, number_of_smalls): 
	numexchg_sm = int(numexchg_sm)
	numexchg = int(numexchg)
	nstlim = int(nstlim)
	print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
	print "Creating remaining .mdins"
	print "dt: %.3f" % dt
	print "numexchg total: %d" % numexchg
	print "nstlim: %d" % nstlim
	print "cutoff: %d" % cutoff
	print "cutoff ID: %d" % cutoff_id
	
	if cutoff < 5.0 :
		rgbmax=6.0
		print "rgbmax: %d" % rgbmax
		print "numexchg for each small: %d" % numexchg_sm
		#terei smalls
		for x in range(1,(number_of_smalls + 1)):
			#print x #ARRUMAR ESSE 001!!
			os.system("cp ../src/remd_cut.mdin remd_" + str('{:03}'.format(cutoff_id)) + "_small_" + str('{:03}'.format(x)) + ".mdin")
			entrada =  "remd_" + str('{:03}'.format(cutoff_id)) + "_small_" + str('{:03}'.format(x)) + ".mdin"
			print entrada + " created"
			if x == 1:
				#o primeiro dessa leva (msm coisa que os outros 19)
				irest = 1
				ntx = 5
				#print "sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada
				os.system("sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NSTLIM\"/\""+str(nstlim)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_CUTOFF\"/\""+str(cutoff)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_RGBMAX\"/\""+str(rgbmax)+"\"/ "+ entrada)	
				if simulation_type >= 2: #nao eh ctremd nem remd
					os.system("sed -i s/\"numexchg=VALUE_NE,\"/\"""\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NE\"/\""+str(numexchg_sm)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_IREST\"/\""+str(irest)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NTX\"/\""+str(ntx)+"\"/ "+ entrada)
			else:
				#os outros 19
				irest = 1
				ntx = 5
				os.system("sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NSTLIM\"/\""+str(nstlim)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_CUTOFF\"/\""+str(cutoff)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_RGBMAX\"/\""+str(rgbmax)+"\"/ "+ entrada)
				if simulation_type >= 2: #nao eh ctremd nem remd
					os.system("sed -i s/\"numexchg=VALUE_NE,\"/\"""\"/ "+ entrada)				
				os.system("sed -i s/\"VALUE_NE\"/\""+str(numexchg_sm)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_IREST\"/\""+str(irest)+"\"/ "+ entrada)
				os.system("sed -i s/\"VALUE_NTX\"/\""+str(ntx)+"\"/ "+ entrada)			
	else: # se cutoff >= 5.0:
		rgbmax=10.0 #dt deve estar correto (0.001 para 5.0 e 0.002 para o resto)
		print "rgbmax: %d" % rgbmax
		#nao terei smalls
		os.system("cp ../src/remd_cut.mdin remd_" + str('{:03}'.format(cutoff_id)) + ".mdin")
		entrada =  "remd_" + str('{:03}'.format(cutoff_id)) + ".mdin"
		print entrada + " created"
		print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
		irest = 0
		ntx = 1
		#print "sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada
		os.system("sed -i s/\"VALUE_DT\"/\""+str(dt)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_NSTLIM\"/\""+str(nstlim)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_CUTOFF\"/\""+str(cutoff)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_RGBMAX\"/\""+str(rgbmax)+"\"/ "+ entrada)
		if simulation_type >= 2: #nao eh ctremd nem remd
			os.system("sed -i s/\"numexchg=VALUE_NE,\"/\"""\"/ "+ entrada)				
		os.system("sed -i s/\"VALUE_NE\"/\""+str(numexchg_sm)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_IREST\"/\""+str(irest)+"\"/ "+ entrada)
		os.system("sed -i s/\"VALUE_NTX\"/\""+str(ntx)+"\"/ "+ entrada)
			

	
	    
if __name__ == "__main__":
    #Criando uma instância do Programa
    app = REMDApp()
     
    #Função do GTK que deixa a janela principal do nosso programa em loop para
    #que ela permanceça em execução, sendo encerrada apenas ao chamar a função
    #Gtk.main_quit que está configurado no sinal gtk_main_quit, referente ao  
    #botão fechar do programa
    Gtk.main() 

    
    
    
    
