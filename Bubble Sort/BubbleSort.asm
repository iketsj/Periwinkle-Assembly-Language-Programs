true equ #-1
false equ #0
numberCount equ #10
placeholderOfNumbersStartAddress equ #32
loopOneIterator	equ gpr24
loopTwoIterator equ gpr25
loopOneLimitHolder equ gpr26
loopTwoLimitHolder equ gpr27
firstNum equ gpr28
secondNum equ gpr29
swapped equ gpr30
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
					
Reinit				numberCount numberCounter
				placeholderOfNumbersStartAddress ref


FirstLoopInit			numberCount plus
				#-1	plus
				plus loopOneLimitHolder
				#0 loopOneIterator
					
FirstLoop			loopOneIterator xor
				#-1 xor
				xor plus
				#1 plus
				loopOneLimitHolder plus
				plus null
				zero and
				status and
				and siz
				#-1 pc
				false swapped
				SecondLoopInit pc
					
				swapped sinz
				#-1 pc

IncrementFirstLoopIterator	loopOneIterator plus
				#1 plus
				plus loopOneIterator
				goto FirstLoop
					
SecondLoopInit			loopOneIterator xor
				#-1 xor
				xor plus
				numberCount plus
				plus loopTwoLimitHolder
				#0 loopTwoIterator
					
SecondLoop			loopTwoIterator xor
				#-1 xor
				xor plus
				#1 plus
				loopTwoLimitHolder plus
				plus null
				zero and
				status and
				and siz
				IncrementFirstLoopIterator pc
		
SwapCheckInit			placeholderOfNumbersStartAddress plus
				loopTwoIterator plus
				plus ref
				def firstNum
				ref plus
				#1 plus
				plus ref
				def secondNum
						
CheckIfNumbersWillBeSwapped	firstNum xor
				#-1 xor
				xor plus
				#1 plus
				secondNum plus
				plus null
				negative and
				status and
				and siz
				Swap pc
				goto IncrementSecondLoopIterator
							
					
Swap				firstNum def
				ref plus
				#-1 plus
				plus ref
				secondNum def
				true swapped
							
							
IncrementSecondLoopIterator	loopTwoIterator plus
				#1 plus
				plus loopTwoIterator
				goto SecondLoop