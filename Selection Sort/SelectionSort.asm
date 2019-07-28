numberCount equ #10
placeholderOfNumbersStartAddress equ #32
tempHolder1 equ gpr20
tempHolder2 equ gpr21
addressOfFirstNum equ gpr22
addressOfSecondNum equ gpr23
addressOfMinimum equ gpr24
currentSlot equ gpr25
currentAddressOffset equ gpr26
currentSlotLimitHolder equ gpr27
currentAddressOffsetLimitHolder equ gpr28
firstNum equ gpr29
secondNum equ gpr30
numberCounter equ gpr31

Init				numberCount numberCounter
				placeholderOfNumbersStartAddress ref
									
GetRandomNumber			rng def
				ref plus
				#1 plus
				plus ref
				numberCounter plus
				#-1 plus
				plus numberCounter
				numberCounter siz
				goto GetRandomNumber       
					
Reinit				placeholderOfNumbersStartAddress ref

FirstLoopInit			numberCount plus
				#-1	plus
				plus currentSlotLimitHolder
				#0 currentSlot

FirstLoop			currentSlot xor
				#-1 xor
				xor plus
				#1 plus
				currentSlotLimitHolder plus
				plus null
				zero and
				status and
				and siz
				#-1 pc
               			currentSlot addressOfMinimum
                		SecondLoopInit pc

Swap            		placeholderOfNumbersStartAddress plus
                		addressOfMinimum plus
                		plus addressOfFirstNum
               			placeholderOfNumbersStartAddress plus
                		currentSlot plus
                		plus addressOfSecondNum
                
                		addressOfFirstNum ref
                		def tempHolder1
                		addressOfSecondNum ref
                		def tempHolder2

                		addressOfFirstNum ref
                		tempHolder2 def
                		addressOfSecondNum ref
                		tempHolder1 def

IncrementFirstLoopIterator	currentSlot plus
				#1 plus
				plus currentSlot
				goto FirstLoop

SecondLoopInit			numberCount currentAddressOffsetLimitHolder
				currentSlot plus
                		#1 plus
                		plus currentAddressOffset

SecondLoop          		currentAddressOffset xor
                		#-1 xor
                		xor plus
                		#1 plus
                		currentAddressOffsetLimitHolder plus
                		plus null
                		zero and
                		status and
                		and siz
                		Swap pc

ValueCheckInit       		placeholderOfNumbersStartAddress plus
                		currentAddressOffset plus
                		plus ref
                		def firstNum
                		placeholderOfNumbersStartAddress plus
                		addressOfMinimum plus
                		plus ref
                		def secondNum

CheckIfFirstNumberIsLess 	secondNum xor
                		#-1 xor
                		xor plus
                		#1 plus
                		firstNum plus
                		plus null
                		negative and
                		status and
                		and siz
                		currentAddressOffset addressOfMinimum
                

IncrementSecondLoopIterator	currentAddressOffset plus
				#1 plus
				plus currentAddressOffset
				goto SecondLoop
                