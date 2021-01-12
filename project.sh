#! /bin/bash

. ./data.txt

while [ 1 ]
do
 echo "|***************************************************************|"
 echo "| To Add New User Press 1    		:			|"
 echo "| To Print User Data press 2 		:			|"
 echo "| To Delete User Press 3 		:			|"
 echo "| To Edit User Info Press 4		:			|"
 echo "| To Exit System Press 5		:			|"
 echo "|***************************************************************|"
 
 read -p  "Please Select Your Operation : " number
		if [ $number -eq 1 ]
		then
			read -p "Please Enter your Name : " name 
			if [[	$name = `grep ${name} data.txt | cut -d, -f1`	]]
			then
					echo "Sorry This User is already exsist"
			elif [[	$name != `grep ${name} data.txt | cut -d, -f1`	]]
			then
					echo "Welcome ${name} !"
					read -p "Please Enter your Number phone  : " number
					read -p "Please Enter your Email Adderss ...@gmail.com  : " email
					echo "${name},${number},${email}" >> data.txt
			fi
		fi
		 
		if [ $number -eq 2 ]
		then
			read -p "Please Enter your Name : " name 
			if [[	$name = `grep ${name} data.txt | cut -d, -f1`	]]
			then
					echo "Welcome ${name} : "
					cat data.txt |grep ${name}
			else
					echo "Sorry Your Account Not Found"
			fi
		fi
		
		if [ $number -eq 3 ]
		then
			read -p "Please Enter your Name : " name 
			if [[	$name = `grep ${name} data.txt | cut -d, -f1`	]]
			then
					echo "Delete This User"
					sed -i	/"${name}"/d		./data.txt 
			else
					echo "Sorry Your Account Not Found"
				fi 
		fi
		
		if [ $number -eq 4 ]
		then
			read -p "Please Enter your Name : " name 
			if [[	$name = `grep ${name} data.txt | cut -d, -f1`	]]
			then
					echo "| To Edit Phone Number Press 1			:		|"
					echo "| To Edit Email Address Press 2			:		|"
					echo "| To Exit Without Editing Press 3		:		|"
					read -p  "Please Select Your Operation : " num_edit
					if [ $num_edit -eq 1 ]
					then
							read -p "Please Enter Old Number Phone	:	" old_number 
							read -p "Please Enter New Number Phone	:	" new_number
							if [[	$new_number	-eq	`grep ${old_number} data.txt | cut -d, -f2`	]]
							then
									echo "This Number Already Exsist, Try Again "
									sleep 5
									break
							elif [[	$new_number	-ne	`grep ${old_number} data.txt | cut -d, -f2`	]]
							then
									echo "Your Phone Number is Updated Thank you"
									sed -i "s/$old_number/$new_number/" data.txt 
							fi
					fi
					if [ $num_edit -eq 2 ]
					then
							read -p "Please Enter Old Email Address  :	:	" old_email
							read -p "Please Enter New Email Address : " new_email
							if [[	$new_email = `grep ${old_email} data.txt | cut -d, -f3`	]]
							then
									echo "This Email Address Already Exsist, Try Again "
									sleep 5
									break
							elif [[	$new_email !=  `grep ${old_email} data.txt | cut -d, -f3`	]]
							then
									echo "Your Email Address is Updated Thank you"
									sed -i "s/$old_email/$new_email/" data.txt 
							fi
					fi
		
					if [ $num_edit -eq 3 ]
					then
							echo "Thank you you exit this operation"
							sleep 5
							break
					fi
			else
				echo "Sorry Your Account Not Found"
			fi 
		fi
		
		if [ $number -eq 5 ]
		then
			break
		fi
done

