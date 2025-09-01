'''
Wk8.py
ENTD220
8/23/25
DESC: Answers for this week's final assignment.

This is my work.
'''

'''
1.) This course has taught me a ton of valuable skills not only pertaining to Python programming, but critical problem solving skills. For example, the weekly updates to the calculator program have forced me to use critical thinking skills in order to debug my code so that it runs correctly. I have also gained knowledge of the core fundamentals of Python, such as package management and modules.
'''

'''
2.) All assignments, from the beginning of the course to now, have been incredibly relevant and useful to both personal and professional goals.

Personal: One of my main current hobbies/passions is programming; I love learning about how to build different applications with code and learning about how I can also use code to understand and control my own computer system. In fact, before I learned other languages other than HTML/CSS, I planned to initially learn Python first due to it flexibility and easy-to-understand syntax. I ended up learning Javascaript instead because I was creating webpages. But as I developed more and gained more knowledge on creating programs and scripts, Python was a prominent language that I began to recognize more because of its popularity. I then decided that I wanted to learn how to use Python as well, and this course was a major contributor to all of my knowledge on this coding language. I'm able to build simple programs now with less help from guides because of my gained knowledge.

Professional: Python is, according to TIOBE software development, is the most popular programming language as of August 2025. As its popularity continues to grow, so does its favorability among others. A unique thing about Python is that it's a type of language that is widely used from beginner developers to experts. My knowledge of Python is sure to make me a more attractive candidate to future job employers, as it shows that I know the basics of programming at the very least.
'''

'''
3.) From all programming online courses that I have taken so far, I would say that this course has proved to me to be the most challenging. Each week, we added something new to our programs, though all topics are relevant to one another. I think this course has provided a vast amount of learning resources; my main struggles were getting my code to run exactly as instructed. If my code worked, there was always one thing that it was still not doing correctly, and I would have to sift through the errors, research and find a solution for the issues. This took a significant amount of time, dedication and effort from myself as well as challenging my patience. However, I knew very well that this was all going to happen when I applied for this course and that things are only going to become more difficult as I gain more experience. The fact that I'm always challenged in some way makes programming appeal to me even more because of how there is always something to learn and how I'm always kept on my toes.
'''

'''
4.) Questions for #4 are listed below:

    5.) Python is both a programming language and a tool for programming because of the way that it can be used to build as well as create simple scripts and commands. It's a very popular choice for many programmers due to its versatility, clear organization, simple syntax and wide usage. Python's other key features include: free and open-source, dynamic, provides GUI support, lightweight, object-oriented and interpreted (GeeksforGeeks,2025).

    6.) Global and local variables differ a lot from each other; global variables can be assessed from any function, object, class, statement, etc., while local variables can only be assessed from the function, object or statement from which it's created in. An example is provided below:
'''
in_1=input('Enter an integer:  ')  
in_2=input('Enter another integer:  ')

# Both in_1 and in_2 are GLOBAL variables; they aren't within any functions or statements and stand on their own

def sum(x,y):
    res=x+y     # This is a LOCAL variable; it sits within a function and can't be assessed from anywhere but the sum() function
    return res

'''
    7.) Example of three Python variables:
'''
var=print('Hi there.')
var2=print('Hello again.')
var3=print('Goodbye.')

'''
    8.) Here are three different data types in Python:
        **Integers: Integers include any number without decimal points. Some examples are 1, 25 and 150. This DOES NOT include floats or fractions.

        **Strings: Strings are any character besides integers or floats, and can include letters, words (as long as they aren't reserved keywords) and symbols. Some examples are: 'Red', 'W', and '!'. It's important to also note that strings MUST be enclosed in quotes, or the interpreter will print an error.

        **Booleans: Booleans are comparison values that declare something as either TRUE or FALSE. They are commonly used with conditional statements. Booleans can also be integers or floats; 0 represents a 'False' boolean, while any number above 0 is declared as 'True'.
'''

'''
    9.) Here is a sample conditional statement:
'''

userInput=input('Do you like dogs or cats better?')

if(userInput=="Dogs"):
    print('Eh theyre fine I guess.')
elif(userInput=="Cats"):
    print('Cats are my bbs :)')
else:
    print('Please enter a string.')

'''
10.) Lists, tuples and dictionaries are all forms of data structures in Python used to store, access and manage different values. 
'''
myList=['gon','killua','kurapika','leorio'] # This is a list

myTuple=('gon','killua','kurapika','leorio') # This is a tuple

myDict={'gon':405,'killua':99,'kurapika':404,'leorio':403,} # This is a dictionary

'''
Differences:

LISTS: Can hold all data types and holds mutable (non-constant) data. Data found based on index position.

TUPLES: Can hold all data types and holds immutable (constant) data. Data found also based on index position.

DICTIONARIES: Data stored in PAIRS (key and value). Keys (positioned before the value) and values can be of mixed data types, though values cannot duplicate. Immutable.
'''

'''
11.) A function is a reusable code block that is used to carry out a specific task/set of tasks. Here is an example:
'''
color=input('What is your favorite color?')
def answer():
    print('My favorite color is' + color)

answer()  # Will print out 'My favorite color is' with the user's input

'''
12.) Error handling in Python allows for the user to keep track of certain errors that may arise during the program's runtime. You can track any error (e.g ValueError) that could occur in your code. The 'e' built-in variable represents any error that the interpreter may find. Here's an example:
'''

try:  # 'Try' keyword used to set the condition, almost like an 'if' statement
    usr_input=input('Enter the word "frosty".')
    print(usr_input)
except Exception as e: 
    print('Error occurred:  '+ e)
except ValueError:
    print('Please enter the specified value only.')

#  Exceptions print when condition(s) contained in the 'try' block are not met.

else:   # 'Else' executed only if none of the exceptions occur.
    print('User input was validated.')
    exit()

'''
13.) Loops are similar to a function's role; they also carry out a task, but can repeated a specified number of times. For tasks that, for example, require the same thing to be done over and over again, it would be more efficient to use a loop rather than call the same function numerous times. The two types of loops in Python are the 'for' and 'while' loops, shown below:
'''
# 'For' loops repeat for a specific amount of times.
# They're best used for looping through data structures.

my_list=['red','yellow','blue']
for item in my_list:
    print(item)  # Output will print a value on each line

# /////
# 'While' loops repeat infinitely or until conditioned not to.
# They're best used for repeating code in the case of a 
# certain event in the program (e.g. function or value call).

my_set=[2,4,6,8,10,12]
for num in my_set:
    while num>12:
        print(i)
    else:
        print('Done.')  # Output will print the values in the set until 12 is reached.

'''
14.) Similar to my 'while' loop example, 'range()' is a special function used for looping through a group of numbers. It's important to also note that the group is immutable. Example below:
'''
for i in range(20):
    print(i)  # Outputs all integers (including 0) excluding the last number, 20.

'''
15.) To read data from a Python file, first you must import it by using the built-in function 'file=open()'. After importing the file to the program, you can specify how to read the contents with three options: 'r' (read), 'w' (write), or 'r+' (read and write). An example is provided below.
'''
file.open('sample.txt','r')
print(file.read())  # 'file.read()' is another built-in function that will print the contents of the entire document.
file.close()  # closes the file


'''
16.) All answers written in this program (excluding most examples given) were written using a multi-line comment, characterized by three single or double quotes. Single-line comments in Python are written using a hash (#). Using comments in your code is a good practice to use for descriptions on any functions, loops, statements etc. for explanation purposes. It can also be used for testing different parts of the code, since comments will automatically be ignored by the program's interpreter.
'''

'''
17.) The phrase 'Object-oriented programming' is used to describe programming languages, such as Python, that utilize objects, methods and classes to structure a program rather than just a sequenced list of functions.

Classes are used to group similar objects to one another, making objects easier to reference and use. Methods are functions contained within a class, and can also be assigned to different objects. 

Objects are data types derived from a class, and each contain their own attributes. 

Example below.
'''

class student: 
    def __init__(self,name,age,course,grade):
        self.name=name
        self.age=age
        self.course=course
        self.grade=grade

# This is a class representing a student gradebook. 
# 'Self.__' is used to initialize certain properties (the parameters) within the method. 
# '__init__()' is also a commonly used method for creating these attributes based on the class's instance.
# There can be multiple classes and multiple objects that use different classes.


# Creating classes based from the 'student' class        

student_1=student('Jordan',15,'Geometry','C')  # Plugging in the actual data in place of the attributes
student_2=student('Amy',16,'ELA','A-')
student_3=student('Clark',14,'Chemistry','B+')

print(student_1.name,student_1.grade)
print(student_2.name,student_2.grade)

# ///
# Citations for: questions 2 & 5
'''
Author: Paul Jansen
Date: (Not Dated)
Source: TIOBE Index
Availability: https://www.tiobe.com/tiobe-index/
Retrieved: August 25, 2025
'''

'''
Author: (Not listed)
Date: July 12, 2025
Source: Python Features
Availability: https://www.geeksforgeeks.org/python/python-features/
Retrieved: August 25, 2025
'''
