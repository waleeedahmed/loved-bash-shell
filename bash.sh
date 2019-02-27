# Author: Mohammad Waleed Ahmed
# Student ID: s4569298

#!/bin/bash

# Include entire script inside a function
function program
{
  # Display main menu
  echo "-------------"
  echo "Main Menu"
  echo "-------------"
  echo "1) Display user information"
  echo "2) Enter numbers for a sentinel controlled loop"
  echo "3) Print out the sum, highest and the lowest of the entered numbers"
  echo "4) Exit the program"
  echo "-------------"
  echo -n "Please select your option number: "
  read option
  # Response to user input
  case $option in
    # Display sub menu if option 1 selected
    1) echo "-------------"
       echo "Sub Menu"
       echo "-------------"
       echo "1) Print home directory"
       echo "2) Print files and folder in column format" 
       echo "3) Print user ID"
       echo "4) Print login shell type with date and time"
       echo "-------------"
       echo -n "Please select your option number: "
       read subOption
       # Response to user input
       case $subOption in 
         1) echo -n "Your home directory is ";cd; pwd
            # Re-direct to main menu
            program;;
         2) echo -n "Your files and folders are ";
            ls -l
            # Re-direct to main menu
            program;;
         3) echo  "Your user ID is $USER"
            # Re-direct to main menu
            program;;
         4) echo  "Your shell is $SHELL and today is $(date)"
            # Re-direct to main menu
            program;;
         *) # Display error if wrong option selected
            echo "Error! Please enter numbers (1-4)"
            # Re-direct to main menu
            program;;
      esac
      ;;
    2) # Code for sentinel controlled loop
       # Initialize count for array index
       # Initialize number variable
       # Initialize an empty array
       count=0
       number=0
       array=()

       # Function for negative integer handling
       function negative
       {
         # While loop for taking in a negative value if it was entered in the function readValue
         while [ $number -lt 0 ]; do
             echo "Error! Please enter a positive integer: "
             read number
             # Instruction to terminate loop if sentinel value entered
             if [ $number -eq -99 ]; then
                echo "Loop has been terminated"
                break
             fi
             # Instruction to go through the function readValue again if negative value entered
             if [ $number -lt 0 ]; then
                negative
             else
                # Input positive integer into array and increment count
                array[$count]=$number
                let count+=1
             fi
          done
        }
        
        # Function for computing user values
        function readValue
        {
        # While loop for taking in positive integers
        while [ $number -ge 0 ]; do
            echo "Enter a positive integer or enter -99 to terminate loop: "
            read number
            # Terminate loop at sentinel value
            if [ $number -eq -99 ]; then
               echo "Loop has been terminated"
               break
            fi
            # Re-direct to negative function if negative integer entered
            if [ $number -lt 0 ]; then
               negative
            else
               array[$count]=$number
               let count+=1
            fi
        done
        }

        # Execute the readValue function
        readValue
        

        # Display entered integer information
        echo "Integer(s) ${array[@]} have been saved"
        echo "Total count of positive integers entered: ${#array[@]}"
        echo "Press any key...";read

        # Re-direct back to main menu
        program
      ;;
    3) # Compute sum of entered integer values
       total=0

       # Update total with each value in the array
       for value in ${array[@]}; do
          let total+=value
       done

       echo "Sum of all positive integers entered is $total"
       
       # For finding maximum integer
       maxValue=${array[0]}
       # In each iteration update maxValue if a larger value is found
       for i in ${array[@]}; do
           if [[ "$i" -gt "$maxValue" ]]; then
              maxValue="$i"
           fi
       done
  
       # For minimum integer value
       # Sort array in ascending order 
       sortedArray=( $(for i in "${array[@]}"; do echo $i; done | sort -n ) )
       
       # Display max integer value 
       echo "Greatest integer entered is $maxValue"

       # Display first (minimum) value of the sorted array
       echo "Smallest integer entered is ${sortedArray[0]}" 
       echo "Press any key..."; read

       # Re-direct back to main menu
       program
      ;;
    4) # Exit from the Program
       echo "Goodbye!" 
       exit 0;;
    *) # Error validation for incorrect entry 
       echo "Input error! Please enter numbers (1-4)."

       # Re-direction
       program
       ;;
esac
}

# Execute the main function
program
