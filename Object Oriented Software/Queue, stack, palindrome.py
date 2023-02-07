#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 22 13:51:16 2022

@author: madeline
"""
#W13 Q2: queue, stack, palindrome

stack=[] 
queue=[]
text_original = input("Please Enter a line of text: ")  
text = text_original.lower()   
print ("Original text is", text_original)
print ("The original given text in lowercase is", text)
n = len(text)
textStack = textQueue=""

#checking pallindrome using stack
for i in range(0,n,1):
 stack.append(text[i])

for i in range(0,n,1):
#pop each element add concat it with the remaining element in normal order
 textStack += stack.pop() 

if(textStack == text):
 print ("The text is Pallindrome checked by Stack")
else :
 print ("The text is not pallindrome checked by stack")


#checking pallindrome using queue
for i in range(0,n,1):
 queue.append(text[i])

for i in range(0,n,1):
#dequeue each element add concat it with the remaining element in reverse order
 textQueue = queue.pop(0)+textQueue
 
if(textQueue == text):
 print ("The text is Pallindrome checked by Queue")
else :
 print ("The text is not pallindrome checked by queue")
 
 