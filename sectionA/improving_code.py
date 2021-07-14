#!/usr/bin/env python

class SMSMessage():
    """ A class whose object holds an SMS message
    and whose functions work on that message """
    
    def __init__(self,message_text,from_number):
        self.seen = False # new messages are always marked unseen
        self.text = message_text
        self.cell_num = from_number

    def __str__():
        pass
        
    def mark_as_read(self):
        self.seen = True

    def show(self):
        print(self.text)
        self.mark_as_read()
                
    def receive():
        pass # do some network stuff here

    def send():
        pass # do some other network stuff here

        
class SMSMessageList():
    """ A class which holds the SMSMessage objects 
    in a list and functions which act on this list """
    def __init__(self):
        self.idx = 0
        self.SMS_store = []
        self.user_choice = "" # this is here because it was in the copied from the students code

    def add(self,sms):
        """Add a message to the message list"""
        self.SMS_store.append(sms)
    
    def get_count(self):
        """ Get the length of the list """
        return len(self.SMS_store)
        
    def get_message(self,idx):# needs fixing ####################
        """ Returns a message """
        return self.SMS_store[idx] #
    
    def get_unread_messages(self):
        for msg in self.SMS_store:
            if msg.seen:
                pass
            else:
                msg.show()

    def remove():
        pass

 
class App():
    def __init__(self):
        pass

    def __str__():
        pass
    
    def main():
        sms_list = SMSMessageList
        no_1 = SMSMessage("Hello","0798653452")
        no_2 = SMSMessage("WYD", "0845673864")
        no_3 = SMSMessage("How are you?", "0631873298")
        sms_list.add(no_1)
        sms_list.add(no_2)
        sms_list.add(no_3)

        sms_list.get_unread_messages()
        
    def read_messages(self):
        self.sms_list.get_unread_messages()
        
        
app = App
app.main()


    
# if user_choice == read:
#     self.has_been_read = True

# no_1 = SMSMessage(False, "Hello", "0798653452")
# no_2 = SMSMessage(False, "WYD", "0845673864")
# no_3 = SMSMessage(False, "How are you?", "0631873298")


# while user_choice != "quit":
#     user_choice = raw_input("What would you like to do -
# read/send/quit?")
#     if user_choice == "read":

#     elif user_choice == "send": #
#         #Place your logic here
#     elif user_choice == "quit":
#         print("Goodbye")
#     else:
#         print("Oops - incorrect input")
