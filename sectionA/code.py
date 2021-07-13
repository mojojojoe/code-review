#!/bin/env python
""" Option 1: Python
# Student Question
# Hi there,
# I'm having a bit of an issue with figuring out how to exactly implement the class
# methods so that I may call them outside of the class when trying to create a new
# SMS object.
# Thanks,
# Student

# An SMS Simulation class SMSMessage(object):
"""
from array import *


class SMSMessage:
    def __init__(self,seen,message,cell_num):
        self.isSeen = seen
        self.msg = message
        self.cell_num = cell_num
        
    def mark_as_read():
        isSeen = True
        
    def send():
        pass #do some network stuff here

    def read():
        print(msg)
        mark_as_read()

    def receive():
        pass # do some other network stuff here
    

class SMSMessageList:
    """ A class to manipulate and contain SMSMessage objects
    """
    def __init__(self):
        idx = 0
        self.sms_store = [] #length 0
                
    def add(self,sms):
        count = 0;

        def plus1(count):
            count + 1

        count = self.get_count() # equals 0 if empty
        sms_store[plus1(count)]  = sms #idx of 1 if empty

    def get_count(self):
        len(self.sms_store)

    def get_message(idx):
        """ Returns a message """
        return sms_store[idx] #
    
    def get_unread_messages():
        idx = get_count() # 1 or 0?
        while idx > 0:
            msg = self.get_message(idx)
            if msg.isSeen:
                pass
            else:
                return msg
            
    def remove(idx):#fix up this function
        """ returns the sms_store sans 1 message
        """
        self.sms_store[idx] # use some function of a vector object to remove the indexed entry 

        # unused #
    def destroy():
        if length(self.sms_store) == 0:
            self.sms_store = []
            self.choice = ""
        

#Notes:
# 1. Format the code
# 2. variables are mixed in style between camel toe and underscore
# 2.b try to simplify the names
# 3. Cleaned up the logic
# 4. Separated the classes in two distinct classes according to the logic and a final class to run the app,
# 5. Create an entry point for the program

class App:
    def __init__(self):
        self.choice = "quit"
        sms_list = SMSMessageList()
        sms_list.add(SMSMessage(False, "Hello", "0798653452"))
        sms_list.add(SMSMessage(False, "WYD", "0845673864"))
        sms_list.add(SMSMessage(False, "How are you?", "0631873298"))
        
    def main():
        while choice != "quit":
            choice = raw_input("What would you like to do? (read/send/quit)")
            if userChoice == "read":
                # Place your logic here
                while sms_list:
                    sms_list.get_unread_messages()
            elif userChoice == "send": #
                cell_number = raw_input("Please type in the cell phone number") # needs a validity check
                message = raw_input("Please type in your message")
                msg = SMSMessage(False, message,cell_number)
                sms_list.add(msg)
                msg.send()
            elif userChoice == "quit":
                print("Goodbye")
            else:
                print("Error: pleases make sure you type in one of: read, send or quit")

        sms_list.destroy()
        
a = App()

